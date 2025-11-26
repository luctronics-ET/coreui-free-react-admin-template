#!/usr/bin/env python3
"""
ODS Import v2 - Corrigido para estrutura real do banco
Mapeia corretamente: equipment (asset_type, category_1), calibrations (notes, valid_until)
"""

import pandas as pd
from datetime import datetime, timedelta
import sys
from pathlib import Path
import subprocess

# Paths
ODS_FILE = Path(__file__).parent.parent / '__referencias__' / 'CMASM_Controle de Calibracao 2025.ods'
SHEET_NAME = 'CALIBRACAO'
SQL_OUTPUT = Path(__file__).parent / 'import_data_v2.sql'
DOCKER_CONTAINER = 'cmms_docker-db-1'
ORGANIZATION_ID = 1  # CMASM


def parse_date(value):
    """Convert date to MySQL format YYYY-MM-DD"""
    if pd.isna(value) or value == '' or str(value).strip() == '':
        return None
    
    if isinstance(value, datetime):
        return value.strftime('%Y-%m-%d')
    
    if isinstance(value, str):
        for fmt in ['%d/%m/%Y', '%d-%m-%Y', '%Y-%m-%d', '%d/%m/%y']:
            try:
                return datetime.strptime(value.strip(), fmt).strftime('%Y-%m-%d')
            except ValueError:
                continue
    
    return None


def parse_interval_to_days(value):
    """Convert calibration interval (months) to days"""
    if pd.isna(value) or value == '':
        return 365  # Default 1 year
    
    if isinstance(value, (int, float)):
        months = int(value)
        return months * 30  # Approximate
    
    if isinstance(value, str):
        value = value.lower().replace('meses', '').replace('m', '').strip()
        try:
            months = int(value)
            return months * 30
        except ValueError:
            return 365
    
    return 365


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
    """Map priority to DB enum"""
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
    if value is None or pd.isna(value):
        return 'NULL'
    
    value = str(value).replace("'", "''").replace('\\', '\\\\')
    return f"'{value}'"


def sql_value(value):
    """Format value for SQL (with quotes if string, NULL if empty)"""
    if value is None or pd.isna(value) or str(value).strip() == '':
        return 'NULL'
    return sql_escape(value)


def generate_import_sql():
    """Generate SQL from ODS file"""
    print(f"📖 Reading {ODS_FILE}...")
    
    try:
        df = pd.read_excel(ODS_FILE, sheet_name=SHEET_NAME, engine='odf')
        print(f"✅ Loaded {len(df)} records from sheet '{SHEET_NAME}'\n")
    except Exception as e:
        print(f"❌ ERROR reading ODS: {e}")
        return None
    
    sql = []
    sql.append("-- CMASM Calibration Data Import v2")
    sql.append("-- Mapped to real database structure")
    sql.append("-- Generated: " + datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    sql.append("")
    sql.append("START TRANSACTION;")
    sql.append("")
    
    stats = {
        'equipment_created': 0,
        'equipment_updated': 0,
        'calibrations': 0,
        'certificates': 0,
        'providers': set(),
        'skipped': 0,
        'errors': []
    }
    
    for idx, row in df.iterrows():
        try:
            # Get internal code (required field)
            internal_code = str(row.get('COD INTERNO', '')).strip()
            if not internal_code or internal_code == 'nan':
                stats['skipped'] += 1
                continue
            
            # Extract equipment data
            category_1 = 'eletrico' if str(row.get('ELE/MEC', '')).strip().upper() == 'ELE' else 'mecanico'
            asset_type = str(row.get('EQUIPAMENTO', 'Unknown')).strip() if not pd.isna(row.get('EQUIPAMENTO')) else 'Unknown'
            manufacturer = sql_value(row.get('MARCA'))
            model = sql_value(row.get('MODELO'))
            measurement_range = sql_value(row.get('RANGE'))
            unit = sql_value(row.get('UNIDADERANGE'))
            serial_number = sql_value(row.get('SERIAL'))
            division = sql_value(row.get('DIVISÃO'))
            priority = map_priority(row.get('PS'))
            location = sql_value(row.get('localizacao'))
            
            # Calculate next calibration date and interval
            last_cal_date = parse_date(row.get('ULTIMA CALIBRAÇÃO'))
            next_cal_date_ods = parse_date(row.get('PRÓXIMA CALIBRAÇÃO'))
            interval_days = parse_interval_to_days(row.get('CICLO CALIBRAÇÃO'))
            
            # If next_cal_date not in ODS, calculate from last_cal_date + interval
            if last_cal_date and not next_cal_date_ods:
                cal_dt = datetime.strptime(last_cal_date, '%Y-%m-%d')
                next_cal_dt = cal_dt + timedelta(days=interval_days)
                next_cal_date = next_cal_dt.strftime('%Y-%m-%d')
            else:
                next_cal_date = next_cal_date_ods
            
            next_cal_sql = f"'{next_cal_date}'" if next_cal_date else 'NULL'
            
            # Insert/Update equipment
            sql.append(f"""-- Equipment: {internal_code} - {asset_type}
INSERT INTO equipment (
    internal_code, manufacturer, model, measurement_range, unit, 
    serial_number, category_1, asset_type, division, priority, 
    location, organization_id, calibration_default_interval_days,
    next_calibration_due_date, is_calibrated, status, 
    created_at, updated_at
) VALUES (
    {sql_escape(internal_code)}, {manufacturer}, {model}, {measurement_range}, {unit},
    {serial_number}, '{category_1}', {sql_escape(asset_type)}, {division}, '{priority}',
    {location}, {ORGANIZATION_ID}, {interval_days},
    {next_cal_sql}, {1 if last_cal_date else 0}, 'active',
    NOW(), NOW()
)
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
    calibration_default_interval_days = {interval_days},
    next_calibration_due_date = {next_cal_sql},
    is_calibrated = {1 if last_cal_date else 0},
    updated_at = NOW();
""")
            
            # Track if this is insert or update (we count both)
            stats['equipment_created'] += 1
            
            # Process calibration if exists
            if last_cal_date:
                # Provider/Laboratory
                laboratory = str(row.get('LOCAL CALIBRAÇÃO', '')).strip() if not pd.isna(row.get('LOCAL CALIBRAÇÃO')) else None
                provider_id_sql = 'NULL'
                
                if laboratory:
                    stats['providers'].add(laboratory)
                    # Insert provider if not exists
                    sql.append(f"""-- Provider: {laboratory}
INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ({sql_escape(laboratory)}, {sql_escape(laboratory)}, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;
""")
                    provider_id_sql = f"(SELECT id FROM providers WHERE name = {sql_escape(laboratory)} LIMIT 1)"
                
                # Calibration data
                valid_until = parse_date(row.get('VALIDADE CALIBRAÇÃO'))
                cost = parse_currency(row.get('CUSTO ESTIMADO'))
                budget_number = sql_value(row.get('ORÇAMENTO'))
                payment_date = parse_date(row.get('PAGAMENTO'))
                entry_date = parse_date(row.get('ENTRADA Oficina'))
                exit_date = parse_date(row.get('saida para Cali'))
                return_date = parse_date(row.get('RETORNO CAL'))
                comments = sql_value(row.get('COMENTÁRIOS'))
                
                # SQL values
                valid_until_sql = f"'{valid_until}'" if valid_until else 'NULL'
                cost_sql = str(cost) if cost else 'NULL'
                payment_date_sql = f"'{payment_date}'" if payment_date else 'NULL'
                entry_date_sql = f"'{entry_date}'" if entry_date else 'NULL'
                exit_date_sql = f"'{exit_date}'" if exit_date else 'NULL'
                return_date_sql = f"'{return_date}'" if return_date else 'NULL'
                
                # Insert calibration
                sql.append(f"""-- Calibration for: {internal_code}
INSERT INTO calibrations (
    equipment_id, provider_id, calibration_date, calibration_type,
    entry_date, exit_to_cal_date, return_from_cal_date,
    cost, status, notes, valid_until, budget_number, payment_date,
    created_at, updated_at
)
SELECT 
    id, {provider_id_sql}, '{last_cal_date}', 'routine',
    {entry_date_sql}, {exit_date_sql}, {return_date_sql},
    {cost_sql}, 'completed', {comments}, {valid_until_sql}, {budget_number}, {payment_date_sql},
    NOW(), NOW()
FROM equipment 
WHERE internal_code = {sql_escape(internal_code)}
LIMIT 1;
""")
                
                stats['calibrations'] += 1
                
                # Certificate if exists
                certificate_number = str(row.get('CERTIFICADO', '')).strip() if not pd.isna(row.get('CERTIFICADO')) else None
                if certificate_number:
                    sql.append(f"""-- Certificate: {certificate_number}
UPDATE calibrations 
SET certificate_id = (
    SELECT id FROM certificates 
    WHERE certificate_number = {sql_escape(certificate_number)}
    LIMIT 1
)
WHERE equipment_id = (SELECT id FROM equipment WHERE internal_code = {sql_escape(internal_code)} LIMIT 1)
AND calibration_date = '{last_cal_date}'
LIMIT 1;
""")
                    stats['certificates'] += 1
                
                # Update equipment's last_calibration_id
                sql.append(f"""-- Update equipment last calibration reference
UPDATE equipment 
SET last_calibration_id = (
    SELECT id FROM calibrations 
    WHERE equipment_id = equipment.id 
    ORDER BY calibration_date DESC 
    LIMIT 1
)
WHERE internal_code = {sql_escape(internal_code)};
""")
            
            sql.append("")  # Blank line between records
            
        except Exception as e:
            error_msg = f"Row {idx+2} ({internal_code if 'internal_code' in locals() else 'unknown'}): {str(e)}"
            stats['errors'].append(error_msg)
            print(f"⚠️  {error_msg}")
    
    sql.append("")
    sql.append("COMMIT;")
    sql.append("")
    sql.append("-- Import Statistics:")
    sql.append(f"-- Equipment processed: {stats['equipment_created']}")
    sql.append(f"-- Calibrations: {stats['calibrations']}")
    sql.append(f"-- Certificates: {stats['certificates']}")
    sql.append(f"-- Providers: {len(stats['providers'])}")
    sql.append(f"-- Skipped (no code): {stats['skipped']}")
    sql.append(f"-- Errors: {len(stats['errors'])}")
    
    # Write SQL file
    try:
        with open(SQL_OUTPUT, 'w', encoding='utf-8') as f:
            f.write('\n'.join(sql))
        print(f"\n📝 SQL Generated: {SQL_OUTPUT}")
    except Exception as e:
        print(f"❌ ERROR writing SQL: {e}")
        return None
    
    # Print statistics
    print(f"\n{'='*50}")
    print(f"📊 Import Statistics:")
    print(f"{'='*50}")
    print(f"  Equipment processed:  {stats['equipment_created']}")
    print(f"  Calibrations:         {stats['calibrations']}")
    print(f"  Certificates:         {stats['certificates']}")
    print(f"  Providers:            {len(stats['providers'])}")
    print(f"  Skipped (no code):    {stats['skipped']}")
    print(f"  Errors:               {len(stats['errors'])}")
    
    if stats['providers']:
        print(f"\n🏢 Providers/Laboratories:")
        for provider in sorted(stats['providers']):
            print(f"  - {provider}")
    
    if stats['errors']:
        print(f"\n❌ Errors:")
        for error in stats['errors'][:10]:  # Show first 10
            print(f"  - {error}")
        if len(stats['errors']) > 10:
            print(f"  ... and {len(stats['errors']) - 10} more errors")
    
    print(f"{'='*50}\n")
    
    return SQL_OUTPUT


def execute_sql(sql_file):
    """Execute SQL via Docker"""
    print(f"🚀 Executing SQL in Docker container '{DOCKER_CONTAINER}'...")
    
    cmd = f"docker exec -i {DOCKER_CONTAINER} mysql -uroot -padmin cmasm_db < {sql_file}"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    
    # Filter out password warnings
    stderr_lines = [line for line in result.stderr.split('\n') if 'Warning' not in line and line.strip()]
    
    if result.returncode != 0 and stderr_lines:
        print(f"❌ SQL Execution Errors:")
        for line in stderr_lines[:20]:  # Show first 20 error lines
            print(f"  {line}")
        return False
    
    print("✅ SQL executed successfully!")
    
    # Verify import
    print("\n🔍 Verifying import...")
    verify_cmd = f"docker exec {DOCKER_CONTAINER} mysql -uroot -padmin cmasm_db -e \"SELECT COUNT(*) as equipment FROM equipment WHERE internal_code LIKE 'CMASM%'; SELECT COUNT(*) as calibrations FROM calibrations WHERE equipment_id IN (SELECT id FROM equipment WHERE internal_code LIKE 'CMASM%'); SELECT COUNT(*) as providers FROM providers WHERE name IS NOT NULL;\" 2>&1 | grep -v Warning"
    
    verify_result = subprocess.run(verify_cmd, shell=True, capture_output=True, text=True)
    print(verify_result.stdout)
    
    return True


def main():
    """Main execution"""
    print("\n" + "="*50)
    print("  CMASM ODS Import v2 - Correct Mapping")
    print("="*50 + "\n")
    
    try:
        # Generate SQL
        sql_file = generate_import_sql()
        if not sql_file:
            print("❌ Failed to generate SQL")
            return 1
        
        # Ask for confirmation
        print("\n⚠️  Ready to import data into database.")
        response = input("Continue? (yes/no): ").strip().lower()
        
        if response not in ['yes', 'y', 'sim', 's']:
            print("❌ Import cancelled by user")
            return 0
        
        # Execute SQL
        if not execute_sql(sql_file):
            print("❌ Import failed")
            return 1
        
        print("\n✅ Import completed successfully!")
        print(f"📊 View imported data at: http://localhost:3001/calibration/ods-view\n")
        
        return 0
        
    except KeyboardInterrupt:
        print("\n\n❌ Import cancelled by user (Ctrl+C)")
        return 1
    except Exception as e:
        print(f"\n❌ FATAL ERROR: {e}")
        import traceback
        traceback.print_exc()
        return 1


if __name__ == '__main__':
    sys.exit(main())
