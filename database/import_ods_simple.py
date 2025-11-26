#!/usr/bin/env python3
"""
Simplified ODS Import - Generates SQL file from ODS spreadsheet
Then executes it via Docker
"""

import pandas as pd
from datetime import datetime
import sys
from pathlib import Path
import subprocess

# ODS file path
ODS_FILE = Path(__file__).parent.parent / '__referencias__' / 'CMASM_Controle de Calibracao 2025.ods'
SHEET_NAME = 'CALIBRACAO'
SQL_OUTPUT = Path(__file__).parent / 'import_data.sql'


def parse_date(value):
    """Convert date to MySQL format"""
    if pd.isna(value) or value == '':
        return None
    
    if isinstance(value, datetime):
        return value.strftime('%Y-%m-%d')
    
    if isinstance(value, str):
        for fmt in ['%d/%m/%Y', '%d-%m-%Y', '%Y-%m-%d']:
            try:
                return datetime.strptime(value, fmt).strftime('%Y-%m-%d')
            except ValueError:
                continue
    
    return None


def parse_interval(value):
    """Convert interval to months"""
    if pd.isna(value) or value == '':
        return None
    
    if isinstance(value, (int, float)):
        return int(value)
    
    if isinstance(value, str):
        value = value.lower().replace('meses', '').replace('m', '').strip()
        try:
            return int(value)
        except ValueError:
            return None
    
    return None


def parse_currency(value):
    """Convert currency to decimal"""
    if pd.isna(value) or value == '':
        return None
    
    if isinstance(value, (int, float)):
        return float(value)
    
    if isinstance(value, str):
        value = value.replace('R$', '').replace('.', '').replace(',', '.').strip()
        try:
            return float(value)
        except ValueError:
            return None
    
    return None


def map_priority(value):
    """Map priority"""
    if pd.isna(value) or value == '':
        return 'normal'
    
    value = str(value).lower().strip()
    priority_map = {
        'critica': 'critica', 'crítica': 'critica',
        'urgente': 'urgente', 'alta': 'alta',
        'media': 'media', 'média': 'media',
        'normal': 'normal', 'baixa': 'normal',
    }
    
    return priority_map.get(value, 'normal')


def sql_escape(value):
    """Escape SQL string"""
    if value is None:
        return 'NULL'
    
    value = str(value).replace("'", "''").replace('\\', '\\\\')
    return f"'{value}'"


def generate_sql():
    """Generate SQL from ODS"""
    print(f"Reading {ODS_FILE}...")
    
    df = pd.read_excel(ODS_FILE, sheet_name=SHEET_NAME, engine='odf')
    print(f"Loaded {len(df)} records\n")
    
    sql = []
    sql.append("-- CMASM Calibration Data Import")
    sql.append("-- Generated from ODS file\n")
    sql.append("START TRANSACTION;\n")
    
    stats = {'equipment': 0, 'calibrations': 0, 'certificates': 0, 'providers': set(), 'errors': 0}
    
    for idx, row in df.iterrows():
        try:
            internal_code = str(row.get('COD INTERNO', '')).strip()
            if not internal_code or internal_code == 'nan':
                stats['errors'] += 1
                continue
            
            # Equipment data - map ODS columns to actual database structure
            category_1 = 'eletrico' if str(row.get('ELE/MEC', '')).strip().upper() == 'ELE' else 'mecanico'
            asset_type = str(row.get('EQUIPAMENTO', '')).strip() if not pd.isna(row.get('EQUIPAMENTO')) else 'Unknown'
            manufacturer = sql_escape(row.get('MARCA')) if not pd.isna(row.get('MARCA')) else 'NULL'
            model = sql_escape(row.get('MODELO')) if not pd.isna(row.get('MODELO')) else 'NULL'
            measurement_range = sql_escape(row.get('RANGE')) if not pd.isna(row.get('RANGE')) else 'NULL'
            unit = sql_escape(row.get('UNIDADERANGE')) if not pd.isna(row.get('UNIDADERANGE')) else 'NULL'
            serial_number = sql_escape(row.get('SERIAL')) if not pd.isna(row.get('SERIAL')) else 'NULL'
            division = sql_escape(row.get('DIVISÃO')) if not pd.isna(row.get('DIVISÃO')) else 'NULL'
            priority = map_priority(row.get('PS'))
            location = sql_escape(row.get('localizacao')) if not pd.isna(row.get('localizacao')) else 'NULL'
            
            # organization_id = 1 (assuming CMASM)
            org_id = 1
            
            # Insert equipment with ON DUPLICATE KEY UPDATE
            sql.append(f"""
INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ({sql_escape(internal_code)}, {manufacturer}, {model}, {measurement_range}, {unit}, {serial_number}, '{category_1}', {sql_escape(asset_type)}, {division}, '{priority}', {location}, {org_id}, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = {manufacturer},
    model = {model},
    measurement_range = {measurement_range},
    unit = {unit},
    serial_number = {serial_number},
    category_1 = '{category_1}',
    asset_type = {sql_escape(asset_type)},
    division = {division},
    priority = '{priority}',
    location = {location},
    updated_at = NOW();
""")
            
            stats['equipment'] += 1
            
            # Calibration data
            calibration_date = parse_date(row.get('ULTIMA CALIBRAÇÃO'))
            if calibration_date:
                next_cal_date = parse_date(row.get('PRÓXIMA CALIBRAÇÃO'))
                valid_until = parse_date(row.get('VALIDADE CALIBRAÇÃO'))
                interval = parse_interval(row.get('CICLO CALIBRAÇÃO'))
                cost = parse_currency(row.get('CUSTO ESTIMADO'))
                budget_number = sql_escape(row.get('ORÇAMENTO')) if not pd.isna(row.get('ORÇAMENTO')) else 'NULL'
                payment_date = parse_date(row.get('PAGAMENTO'))
                entry_date = parse_date(row.get('ENTRADA Oficina'))
                exit_date = parse_date(row.get('saida para Cali'))
                return_date = parse_date(row.get('RETORNO CAL'))
                comments = sql_escape(row.get('COMENTÁRIOS')) if not pd.isna(row.get('COMENTÁRIOS')) else 'NULL'
                laboratory = str(row.get('LOCAL CALIBRAÇÃO', '')).strip() if not pd.isna(row.get('LOCAL CALIBRAÇÃO')) else None
                
                # Provider (laboratory)
                provider_clause = 'NULL'
                if laboratory:
                    stats['providers'].add(laboratory)
                    sql.append(f"""
INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ({sql_escape(laboratory)}, {sql_escape(laboratory)}, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;
""")
                    provider_clause = f"(SELECT id FROM providers WHERE name = {sql_escape(laboratory)} LIMIT 1)"
                
                # Insert calibration
                next_cal = f"'{next_cal_date}'" if next_cal_date else 'NULL'
                valid = f"'{valid_until}'" if valid_until else 'NULL'
                int_val = str(interval) if interval else 'NULL'
                cost_val = str(cost) if cost else 'NULL'
                pay_date = f"'{payment_date}'" if payment_date else 'NULL'
                ent_date = f"'{entry_date}'" if entry_date else 'NULL'
                ext_date = f"'{exit_date}'" if exit_date else 'NULL'
                ret_date = f"'{return_date}'" if return_date else 'NULL'
                
                sql.append(f"""
INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '{calibration_date}', {next_cal}, {int_val}, {valid}, {cost_val}, {budget_number}, {pay_date}, {ent_date}, {ext_date}, {ret_date}, {comments}, {provider_clause}, 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = {sql_escape(internal_code)};
""")
                
                stats['calibrations'] += 1
                
                # Certificate
                certificate_number = str(row.get('CERTIFICADO', '')).strip() if not pd.isna(row.get('CERTIFICADO')) else None
                if certificate_number:
                    sql.append(f"""
INSERT INTO certificates (calibration_id, certificate_number, issue_date, status, created_at, updated_at)
VALUES (LAST_INSERT_ID(), {sql_escape(certificate_number)}, '{calibration_date}', 'active', NOW(), NOW());
""")
                    stats['certificates'] += 1
        
        except Exception as e:
            print(f"Row {idx+2} ERROR: {e}")
            stats['errors'] += 1
    
    sql.append("\nCOMMIT;")
    
    # Write SQL file
    with open(SQL_OUTPUT, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql))
    
    print(f"\n=== SQL Generated ===")
    print(f"Output: {SQL_OUTPUT}")
    print(f"Equipment: {stats['equipment']}")
    print(f"Calibrations: {stats['calibrations']}")
    print(f"Certificates: {stats['certificates']}")
    print(f"Providers: {len(stats['providers'])}")
    print(f"Errors: {stats['errors']}")
    
    return SQL_OUTPUT


def execute_sql(sql_file):
    """Execute SQL via Docker"""
    print(f"\nExecuting SQL in Docker...")
    
    cmd = f"docker exec -i cmms_docker-db-1 mysql -uroot -padmin cmasm_db < {sql_file}"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    
    if result.returncode != 0 and 'Warning' not in result.stderr:
        print(f"ERROR: {result.stderr}")
        return False
    
    print("✅ Import completed successfully!")
    return True


if __name__ == '__main__':
    try:
        sql_file = generate_sql()
        execute_sql(sql_file)
    except Exception as e:
        print(f"FATAL ERROR: {e}")
        sys.exit(1)
