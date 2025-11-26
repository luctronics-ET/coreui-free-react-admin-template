#!/usr/bin/env python3
"""
ODS Export Service - CMASM Calibration System  
Exports equipment and calibration data from MySQL to ODS spreadsheet
"""

import pandas as pd
from datetime import datetime
import sys
from pathlib import Path
import subprocess

# Configuration
ORGANIZATION_ID = 1  # CMASM
OUTPUT_FILE = Path(__file__).parent.parent / '__referencias__' / f'CMASM_Export_{datetime.now().strftime("%Y%m%d_%H%M%S")}.ods'

def query_database():
    """Query database via docker exec"""
    print("📊 Querying database for CMASM equipment...")
    
    # SQL query with LEFT JOIN to get latest calibration
    query = f"""SELECT 
    e.internal_code,
    e.category_1,
    e.asset_type,
    e.manufacturer,
    e.model,
    e.measurement_range,
    e.unit,
    e.serial_number,
    e.division,
    e.priority,
    e.location,
    e.calibration_default_interval_days,
    e.next_calibration_due_date,
    e.is_calibrated,
    c.calibration_date,
    c.entry_date,
    c.exit_to_cal_date,
    c.return_from_cal_date,
    c.valid_until,
    c.cost,
    c.budget_number,
    c.payment_date,
    c.notes,
    c.certificate_id,
    p.name as provider_name
FROM equipment e
LEFT JOIN (
    SELECT c1.* FROM calibrations c1
    INNER JOIN (
        SELECT equipment_id, MAX(calibration_date) as max_date
        FROM calibrations
        GROUP BY equipment_id
    ) c2 ON c1.equipment_id = c2.equipment_id AND c1.calibration_date = c2.max_date
) c ON e.id = c.equipment_id
LEFT JOIN providers p ON c.provider_id = p.id
WHERE e.organization_id = {ORGANIZATION_ID}
ORDER BY e.internal_code"""
    
    # Write query to temp file
    query_file = '/tmp/export_query.sql'
    with open(query_file, 'w') as f:
        f.write(query + ';')
    
    # Execute query via docker (immediately to avoid Vite overwriting)
    temp_csv = f'/tmp/cmasm_export_{datetime.now().strftime("%Y%m%d%H%M%S")}.csv'
    cmd = f"docker exec -i cmms_docker-db-1 mysql -uroot -padmin --batch cmasm_db < {query_file} > {temp_csv} 2>/dev/null"
    result = subprocess.run(cmd, shell=True)
    
    # Check if file was created
    import os
    if not os.path.exists(temp_csv) or os.path.getsize(temp_csv) < 100:
        print(f"❌ Query execution failed or returned no data")
        return None
    
    # Read CSV
    try:
        df = pd.read_csv(temp_csv, sep='\t', na_values=['NULL', 'None', ''])
        print(f"✅ Retrieved {len(df)} equipment records")
        
        # Clean up temp file
        import os
        try:
            os.remove(temp_csv)
            os.remove(query_file)
        except:
            pass
        
        return df
    except Exception as e:
        print(f"❌ Error reading results: {e}")
        return None

def calculate_status(row):
    """Calculate calibration status"""
    try:
        is_calibrated = row.get('is_calibrated', 0)
        next_cal_date = row.get('next_calibration_due_date')
        certificate_id = row.get('certificate_id')
        
        if pd.isna(is_calibrated) or is_calibrated == 0 or pd.isna(next_cal_date):
            return 'SEM DATA'
        
        next_cal = pd.to_datetime(next_cal_date, errors='coerce')
        if pd.isna(next_cal):
            return 'SEM DATA'
        
        today = pd.Timestamp.now()
        days_until = (next_cal - today).days
        
        if not pd.isna(certificate_id) and days_until > 0:
            if days_until <= 30:
                return 'URGENTE'
            return 'CALIBRADO'
        
        if pd.isna(certificate_id):
            return 'PENDENTE'
        
        if days_until < 0:
            return 'ATRASADO'
        
        if days_until <= 30:
            return 'URGENTE'
        
        return 'CALIBRADO'
    except Exception:
        return 'SEM DATA'

def format_date(value):
    if pd.isna(value):
        return ''
    try:
        dt = pd.to_datetime(value, errors='coerce')
        return '' if pd.isna(dt) else dt.strftime('%d/%m/%Y')
    except:
        return ''

def format_currency(value):
    if pd.isna(value):
        return ''
    try:
        amount = float(value)
        return f"R$ {amount:,.2f}".replace(',', '_').replace('.', ',').replace('_', '.')
    except:
        return ''

def format_priority(value):
    if pd.isna(value):
        return ''
    priority_map = {'critica': 'CRÍTICA', 'urgente': 'URGENTE', 'alta': 'ALTA', 'media': 'MÉDIA', 'normal': 'NORMAL'}
    return priority_map.get(str(value).lower(), str(value).upper())

def format_interval_months(days):
    if pd.isna(days):
        return ''
    try:
        return str(int(int(days) / 30))
    except:
        return ''

def map_category(value):
    if pd.isna(value):
        return 'MEC'
    return 'ELE' if str(value).lower() == 'eletrico' else 'MEC'

def export_to_ods(df):
    print(f"\n📝 Converting {len(df)} records to ODS format...")
    
    ods_data = []
    for idx, row in df.iterrows():
        ods_row = {
            'ELE/MEC': map_category(row.get('category_1')),
            'EQUIPAMENTO': row.get('asset_type', ''),
            'MARCA': row.get('manufacturer', ''),
            'MODELO': row.get('model', ''),
            'RANGE': row.get('measurement_range', ''),
            'UNIDADERANGE': row.get('unit', ''),
            'COD INTERNO': row.get('internal_code', ''),
            'SERIAL': row.get('serial_number', ''),
            'DIVISÃO': row.get('division', ''),
            'PS': format_priority(row.get('priority')),
            'ENTRADA Oficina': format_date(row.get('entry_date')),
            'saida para Cali': format_date(row.get('exit_to_cal_date')),
            'RETORNO CAL': format_date(row.get('return_from_cal_date')),
            'ULTIMA CALIBRAÇÃO': format_date(row.get('calibration_date')),
            'CICLO CALIBRAÇÃO': format_interval_months(row.get('calibration_default_interval_days')),
            'PRÓXIMA CALIBRAÇÃO': format_date(row.get('next_calibration_due_date')),
            'VALIDADE CALIBRAÇÃO': format_date(row.get('valid_until')),
            'CERTIFICADO': str(row.get('certificate_id', '')) if not pd.isna(row.get('certificate_id')) else '',
            'localizacao': row.get('location', ''),
            'COMENTÁRIOS': row.get('notes', ''),
            'CUSTO ESTIMADO': format_currency(row.get('cost')),
            'ORÇAMENTO': row.get('budget_number', ''),
            'PAGAMENTO': format_date(row.get('payment_date')),
            'LOCAL CALIBRAÇÃO': row.get('provider_name', ''),
        }
        ods_data.append(ods_row)
    
    ods_df = pd.DataFrame(ods_data)
    
    print(f"💾 Writing to: {OUTPUT_FILE}")
    
    try:
        OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
        ods_df.to_excel(OUTPUT_FILE, sheet_name='CALIBRACAO', engine='odf', index=False)
        
        file_size = OUTPUT_FILE.stat().st_size / 1024
        
        print(f"✅ Successfully exported")
        print(f"\n📊 Statistics:")
        print(f"  Total: {len(ods_df)}")
        print(f"  Size: {file_size:.1f} KB")
        
        status_counts = {}
        for _, row in df.iterrows():
            stat = calculate_status(row)
            status_counts[stat] = status_counts.get(stat, 0) + 1
        
        if status_counts:
            print(f"\n📈 Status:")
            for status, count in sorted(status_counts.items()):
                print(f"  {status}: {count}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    print("\n" + "="*60)
    print("  CMASM ODS Export")
    print("="*60 + "\n")
    
    try:
        df = query_database()
        if df is None or len(df) == 0:
            print("❌ No data")
            return 1
        
        if not export_to_ods(df):
            print("❌ Export failed")
            return 1
        
        print(f"\n✅ Success!")
        print(f"📂 {OUTPUT_FILE}\n")
        return 0
        
    except KeyboardInterrupt:
        print("\n\n❌ Cancelled")
        return 1
    except Exception as e:
        print(f"\n❌ ERROR: {e}")
        import traceback
        traceback.print_exc()
        return 1

if __name__ == '__main__':
    sys.exit(main())
