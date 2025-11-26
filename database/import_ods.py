#!/usr/bin/env python3
"""
ODS Import Service - CMASM Calibration System
Imports equipment and calibration data from ODS spreadsheet to MySQL database

Usage:
    python database/import_ods.py                    # Import from default ODS file
    python database/import_ods.py path/to/file.ods   # Import from specific file
"""

import pandas as pd
import pymysql
from datetime import datetime
import sys
import os
import subprocess
from pathlib import Path

# Database connection via Docker
DOCKER_CONTAINER = 'cmms_docker-db-1'
DB_CONFIG = {
    'user': 'root',
    'password': 'admin',
    'database': 'cmasm_db',
}

def execute_mysql_query(query, params=None, fetch=False):
    """Execute MySQL query via docker exec"""
    if params:
        # Escape parameters for SQL
        escaped_params = []
        for p in params:
            if p is None:
                escaped_params.append('NULL')
            elif isinstance(p, str):
                escaped_params.append(f"'{p.replace(chr(39), chr(39)+chr(39))}'")  # Escape single quotes
            elif isinstance(p, (int, float)):
                escaped_params.append(str(p))
            else:
                escaped_params.append(f"'{str(p)}'")
        
        # Replace %s with actual values
        query_parts = query.split('%s')
        final_query = ''
        for i, part in enumerate(query_parts):
            final_query += part
            if i < len(escaped_params):
                final_query += escaped_params[i]
        query = final_query
    
    cmd = [
        'docker', 'exec', DOCKER_CONTAINER,
        'mysql', f'-u{DB_CONFIG["user"]}', f'-p{DB_CONFIG["password"]}',
        DB_CONFIG['database'], '-e', query
    ]
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode != 0:
        if 'Warning' not in result.stderr:
            raise Exception(f"MySQL error: {result.stderr}")
    
    if fetch:
        lines = result.stdout.strip().split('\n')
        if len(lines) > 1:
            return lines[1:]  # Skip header
    
    return result.stdout

# ODS file path
ODS_FILE = Path(__file__).parent.parent / '__referencias__' / 'CMASM_Controle de Calibracao 2025.ods'
SHEET_NAME = 'CALIBRACAO'


def parse_date(value):
    """Convert various date formats to MySQL DATE format"""
    if pd.isna(value) or value == '' or value == 'NULL':
        return None
    
    if isinstance(value, datetime):
        return value.strftime('%Y-%m-%d')
    
    if isinstance(value, str):
        # Try common Brazilian date formats
        for fmt in ['%d/%m/%Y', '%d-%m-%Y', '%Y-%m-%d', '%d/%m/%y']:
            try:
                return datetime.strptime(value, fmt).strftime('%Y-%m-%d')
            except ValueError:
                continue
    
    return None


def parse_interval(value):
    """Convert calibration interval to integer (months)"""
    if pd.isna(value) or value == '':
        return None
    
    if isinstance(value, (int, float)):
        return int(value)
    
    if isinstance(value, str):
        # Remove "meses", "m", etc.
        value = value.lower().replace('meses', '').replace('m', '').strip()
        try:
            return int(value)
        except ValueError:
            return None
    
    return None


def parse_currency(value):
    """Convert currency string to decimal"""
    if pd.isna(value) or value == '':
        return None
    
    if isinstance(value, (int, float)):
        return float(value)
    
    if isinstance(value, str):
        # Remove R$, currency symbols, dots (thousands separator), convert comma to dot
        value = value.replace('R$', '').replace('.', '').replace(',', '.').strip()
        try:
            return float(value)
        except ValueError:
            return None
    
    return None


def map_priority(value):
    """Map ODS priority to database ENUM"""
    if pd.isna(value) or value == '':
        return 'normal'
    
    value = str(value).lower().strip()
    
    # Map variations to standard values
    priority_map = {
        'critica': 'critica',
        'crítica': 'critica',
        'urgente': 'urgente',
        'alta': 'alta',
        'media': 'media',
        'média': 'media',
        'normal': 'normal',
        'baixa': 'normal',
    }
    
    return priority_map.get(value, 'normal')


# Column mapping: ODS column -> (table, field, conversion_func)
COLUMN_MAPPING = {
    'ELE/MEC': ('equipment', 'type', lambda x: 'ELE' if x == 'ELE' else 'MEC'),
    'EQUIPAMENTO': ('equipment', 'name', str),
    'MARCA': ('equipment', 'manufacturer', str),
    'MODELO': ('equipment', 'model', str),
    'RANGE': ('equipment', 'measurement_range', str),
    'UNIDADERANGE': ('equipment', 'unit', str),
    'COD INTERNO': ('equipment', 'internal_code', str),
    'SERIAL': ('equipment', 'serial_number', str),
    'DIVISÃO': ('equipment', 'division', str),
    'PS': ('equipment', 'priority', lambda x: map_priority(x)),
    'localizacao': ('equipment', 'location', str),
    'ENTRADA Oficina': ('calibration', 'entry_date', parse_date),
    'saida para Cali': ('calibration', 'exit_to_cal_date', parse_date),
    'RETORNO CAL': ('calibration', 'return_from_cal_date', parse_date),
    'ULTIMA CALIBRAÇÃO': ('calibration', 'calibration_date', parse_date),
    'CICLO CALIBRAÇÃO': ('calibration', 'calibration_interval', parse_interval),
    'PRÓXIMA CALIBRAÇÃO': ('calibration', 'next_calibration_date', parse_date),
    'VALIDADE CALIBRAÇÃO': ('calibration', 'valid_until', parse_date),
    'CERTIFICADO': ('certificate', 'certificate_number', str),
    'COMENTÁRIOS': ('calibration', 'comments', str),
    'CUSTO ESTIMADO': ('calibration', 'cost', parse_currency),
    'ORÇAMENTO': ('calibration', 'budget_number', str),
    'PAGAMENTO': ('calibration', 'payment_date', parse_date),
    'LOCAL CALIBRAÇÃO': ('calibration', 'laboratory', str),
}


def get_or_create_provider(cursor, name):
    """Get provider ID or create if doesn't exist"""
    if not name or pd.isna(name):
        return None
    
    name = str(name).strip()
    
    # Check if provider exists
    cursor.execute("SELECT id FROM providers WHERE name = %s", (name,))
    result = cursor.fetchone()
    
    if result:
        return result[0]
    
    # Create new provider
    cursor.execute(
        "INSERT INTO providers (name, type, contact_name, created_at, updated_at) VALUES (%s, %s, %s, NOW(), NOW())",
        (name, 'calibration_lab', name)
    )
    return cursor.lastrowid


def import_ods_to_mysql():
    """Main import function"""
    print(f"Starting ODS import from: {ODS_FILE}")
    
    # Check if file exists
    if not ODS_FILE.exists():
        print(f"ERROR: File not found: {ODS_FILE}")
        return False
    
    # Read ODS file
    print(f"Reading sheet '{SHEET_NAME}'...")
    try:
        df = pd.read_excel(ODS_FILE, sheet_name=SHEET_NAME, engine='odf')
        print(f"Loaded {len(df)} records")
    except Exception as e:
        print(f"ERROR reading ODS file: {e}")
        return False
    
    # Connect to database
    print("Connecting to database...")
    try:
        connection = pymysql.connect(**DB_CONFIG)
        cursor = connection.cursor()
        print("Connected successfully")
    except Exception as e:
        print(f"ERROR connecting to database: {e}")
        return False
    
    # Statistics
    stats = {
        'total': len(df),
        'equipment_created': 0,
        'equipment_updated': 0,
        'calibrations_created': 0,
        'certificates_created': 0,
        'errors': 0
    }
    
    try:
        # Process each row
        for idx, row in df.iterrows():
            try:
                # Extract equipment data
                internal_code = str(row.get('COD INTERNO', '')).strip()
                if not internal_code or internal_code == 'nan':
                    print(f"Row {idx+2}: Skipping - no internal code")
                    stats['errors'] += 1
                    continue
                
                # Prepare equipment data
                equipment_data = {
                    'type': str(row.get('ELE/MEC', 'MEC')).strip() if not pd.isna(row.get('ELE/MEC')) else 'MEC',
                    'name': str(row.get('EQUIPAMENTO', '')).strip() if not pd.isna(row.get('EQUIPAMENTO')) else '',
                    'manufacturer': str(row.get('MARCA', '')).strip() if not pd.isna(row.get('MARCA')) else None,
                    'model': str(row.get('MODELO', '')).strip() if not pd.isna(row.get('MODELO')) else None,
                    'measurement_range': str(row.get('RANGE', '')).strip() if not pd.isna(row.get('RANGE')) else None,
                    'unit': str(row.get('UNIDADERANGE', '')).strip() if not pd.isna(row.get('UNIDADERANGE')) else None,
                    'internal_code': internal_code,
                    'serial_number': str(row.get('SERIAL', '')).strip() if not pd.isna(row.get('SERIAL')) else None,
                    'division': str(row.get('DIVISÃO', '')).strip() if not pd.isna(row.get('DIVISÃO')) else None,
                    'priority': map_priority(row.get('PS')),
                    'location': str(row.get('localizacao', '')).strip() if not pd.isna(row.get('localizacao')) else None,
                }
                
                # Check if equipment exists
                cursor.execute("SELECT id FROM equipment WHERE internal_code = %s", (internal_code,))
                existing = cursor.fetchone()
                
                if existing:
                    equipment_id = existing[0]
                    # Update equipment
                    cursor.execute("""
                        UPDATE equipment SET
                            type = %s, name = %s, manufacturer = %s, model = %s,
                            measurement_range = %s, unit = %s, serial_number = %s,
                            division = %s, priority = %s, location = %s,
                            updated_at = NOW()
                        WHERE id = %s
                    """, (
                        equipment_data['type'], equipment_data['name'], equipment_data['manufacturer'],
                        equipment_data['model'], equipment_data['measurement_range'], equipment_data['unit'],
                        equipment_data['serial_number'], equipment_data['division'], equipment_data['priority'],
                        equipment_data['location'], equipment_id
                    ))
                    stats['equipment_updated'] += 1
                else:
                    # Create equipment
                    cursor.execute("""
                        INSERT INTO equipment (
                            type, name, manufacturer, model, measurement_range, unit,
                            internal_code, serial_number, division, priority, location,
                            status, created_at, updated_at
                        ) VALUES (
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 'active', NOW(), NOW()
                        )
                    """, (
                        equipment_data['type'], equipment_data['name'], equipment_data['manufacturer'],
                        equipment_data['model'], equipment_data['measurement_range'], equipment_data['unit'],
                        equipment_data['internal_code'], equipment_data['serial_number'], equipment_data['division'],
                        equipment_data['priority'], equipment_data['location']
                    ))
                    equipment_id = cursor.lastrowid
                    stats['equipment_created'] += 1
                
                # Check if calibration data exists
                calibration_date = parse_date(row.get('ULTIMA CALIBRAÇÃO'))
                if calibration_date:
                    # Get or create provider for laboratory
                    laboratory = str(row.get('LOCAL CALIBRAÇÃO', '')).strip() if not pd.isna(row.get('LOCAL CALIBRAÇÃO')) else None
                    provider_id = get_or_create_provider(cursor, laboratory) if laboratory else None
                    
                    # Prepare calibration data
                    calibration_data = {
                        'equipment_id': equipment_id,
                        'calibration_date': calibration_date,
                        'next_calibration_date': parse_date(row.get('PRÓXIMA CALIBRAÇÃO')),
                        'calibration_interval': parse_interval(row.get('CICLO CALIBRAÇÃO')),
                        'valid_until': parse_date(row.get('VALIDADE CALIBRAÇÃO')),
                        'cost': parse_currency(row.get('CUSTO ESTIMADO')),
                        'budget_number': str(row.get('ORÇAMENTO', '')).strip() if not pd.isna(row.get('ORÇAMENTO')) else None,
                        'payment_date': parse_date(row.get('PAGAMENTO')),
                        'entry_date': parse_date(row.get('ENTRADA Oficina')),
                        'exit_to_cal_date': parse_date(row.get('saida para Cali')),
                        'return_from_cal_date': parse_date(row.get('RETORNO CAL')),
                        'comments': str(row.get('COMENTÁRIOS', '')).strip() if not pd.isna(row.get('COMENTÁRIOS')) else None,
                        'provider_id': provider_id,
                    }
                    
                    # Create calibration
                    cursor.execute("""
                        INSERT INTO calibrations (
                            equipment_id, calibration_date, next_calibration_date, calibration_interval,
                            valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date,
                            return_from_cal_date, comments, provider_id, status, created_at, updated_at
                        ) VALUES (
                            %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 'completed', NOW(), NOW()
                        )
                    """, (
                        calibration_data['equipment_id'], calibration_data['calibration_date'],
                        calibration_data['next_calibration_date'], calibration_data['calibration_interval'],
                        calibration_data['valid_until'], calibration_data['cost'], calibration_data['budget_number'],
                        calibration_data['payment_date'], calibration_data['entry_date'],
                        calibration_data['exit_to_cal_date'], calibration_data['return_from_cal_date'],
                        calibration_data['comments'], calibration_data['provider_id']
                    ))
                    calibration_id = cursor.lastrowid
                    stats['calibrations_created'] += 1
                    
                    # Create certificate if exists
                    certificate_number = str(row.get('CERTIFICADO', '')).strip() if not pd.isna(row.get('CERTIFICADO')) else None
                    if certificate_number:
                        cursor.execute("""
                            INSERT INTO certificates (
                                calibration_id, certificate_number, issue_date, status,
                                created_at, updated_at
                            ) VALUES (
                                %s, %s, %s, 'active', NOW(), NOW()
                            )
                        """, (calibration_id, certificate_number, calibration_date))
                        stats['certificates_created'] += 1
                
                # Commit every 50 records
                if (idx + 1) % 50 == 0:
                    connection.commit()
                    print(f"Processed {idx+1}/{stats['total']} records...")
            
            except Exception as e:
                print(f"Row {idx+2}: ERROR - {e}")
                stats['errors'] += 1
                continue
        
        # Final commit
        connection.commit()
        print("\n=== IMPORT COMPLETED ===")
        print(f"Total records: {stats['total']}")
        print(f"Equipment created: {stats['equipment_created']}")
        print(f"Equipment updated: {stats['equipment_updated']}")
        print(f"Calibrations created: {stats['calibrations_created']}")
        print(f"Certificates created: {stats['certificates_created']}")
        print(f"Errors: {stats['errors']}")
        
        return stats['errors'] == 0
    
    except Exception as e:
        print(f"\nFATAL ERROR: {e}")
        connection.rollback()
        return False
    
    finally:
        cursor.close()
        connection.close()


if __name__ == '__main__':
    success = import_ods_to_mysql()
    sys.exit(0 if success else 1)
