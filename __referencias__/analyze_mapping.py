#!/usr/bin/env python3
import pandas as pd
import json
from datetime import datetime

# Ler o arquivo ODS
file_path = '__referencias__/CMASM_Controle de Calibracao 2025.ods'

# Ler a planilha CALIBRACAO
df = pd.read_excel(file_path, sheet_name='CALIBRACAO', engine='odf')

print("="*80)
print(f"PLANILHA: CALIBRACAO")
print(f"Total de registros: {len(df)}")
print("="*80)
print("\n### COLUNAS DO ODS ###\n")

# Listar todas as colunas
for i, col in enumerate(df.columns, 1):
    print(f"{i:2d}. {col}")

print("\n" + "="*80)
print("\n### MAPEAMENTO PARA BANCO DE DADOS ###\n")

# Mapeamento das colunas ODS -> BD
mapping = {
    # Coluna ODS -> Tabela.coluna no banco
    'ELE/MEC': 'equipment.type_category',  # Eletrônico ou Mecânico
    'EQUIPAMENTO': 'equipment.name',
    'MARCA ': 'equipment.manufacturer',
    'MODELO': 'equipment.model',
    'RANGE': 'equipment.measurement_range',
    'UNIDADERANGE': 'equipment.unit',
    'COD INTERNO': 'equipment.internal_code',
    'SERIAL': 'equipment.serial_number',
    'DIVISÃO': 'equipment.division',
    'PS': 'equipment.priority',  # Prioridade/Peso?
    'ENTRADA Oficina  Eletronica': 'calibrations.entry_date',
    'saida para Cali.  Da Oficina  Eletronica': 'calibrations.exit_to_cal_date',
    'RETORNO CAL': 'calibrations.return_from_cal_date',
    'ULTIMA CALIBRAÇÃO': 'calibrations.calibration_date',
    'CICLO CALIBRAÇÃO': 'equipment.calibration_interval_months',
    'PRÓXIMA CALIBRAÇÃO': 'equipment.next_calibration_due_date',
    'VALIDADE CALIBRAÇÃO': 'calibrations.valid_until',
    'CERTIFICADO  ': 'certificates.certificate_number',
    'localizacao': 'equipment.location',
    'COMENTÁRIOS': 'calibrations.notes',
    'CUSTO ESTIMADO': 'calibrations.cost',
    'ORÇAMENTO': 'calibrations.budget_number',
    'PAGAMENTO': 'calibrations.payment_date',
    'LOCAL CALIBRAÇÃO': 'providers.name',  # Laboratório/Provider
}

print("MAPEAMENTO ODS -> BANCO DE DADOS:")
print("-" * 80)
for ods_col, db_field in mapping.items():
    print(f"{ods_col:40s} -> {db_field}")

print("\n" + "="*80)
print("\n### COLUNAS SEM CORRESPONDÊNCIA ###\n")

# Verificar colunas do banco que não têm no ODS
db_equipment_cols = [
    'id', 'organization_id', 'internal_code', 'name', 'manufacturer', 'model',
    'serial_number', 'type', 'category', 'measurement_range', 'resolution',
    'accuracy', 'location', 'status', 'condition_status', 'acquisition_date',
    'warranty_expiration', 'next_calibration_due_date', 'calibration_interval_months',
    'last_maintenance_date', 'notes', 'created_at', 'updated_at'
]

db_calibrations_cols = [
    'id', 'equipment_id', 'laboratory_id', 'calibration_date', 'due_date',
    'certificate_number', 'result', 'status', 'cost', 'notes', 'technician_name',
    'created_at', 'updated_at'
]

print("EQUIPAMENTOS - Campos do BD sem correspondência no ODS:")
print("-" * 80)
mapped_equipment = [v.split('.')[1] for v in mapping.values() if v.startswith('equipment.')]
for col in db_equipment_cols:
    if col not in mapped_equipment and col not in ['id', 'created_at', 'updated_at']:
        print(f"  • {col}")

print("\nCALIBRAÇÕES - Campos do BD sem correspondência no ODS:")
print("-" * 80)
mapped_calibrations = [v.split('.')[1] for v in mapping.values() if v.startswith('calibrations.')]
for col in db_calibrations_cols:
    if col not in mapped_calibrations and col not in ['id', 'created_at', 'updated_at']:
        print(f"  • {col}")

print("\n" + "="*80)
print("\n### AMOSTRA DE DADOS (5 primeiros registros) ###\n")

# Mostrar amostra
sample_cols = ['COD INTERNO', 'EQUIPAMENTO', 'MARCA ', 'MODELO', 'SERIAL', 
               'ULTIMA CALIBRAÇÃO', 'PRÓXIMA CALIBRAÇÃO', 'CERTIFICADO  ']
sample = df[sample_cols].head(5)
print(sample.to_string(index=False))

print("\n" + "="*80)
print("\n### ESTATÍSTICAS ###\n")

print(f"Total de equipamentos: {len(df)}")
print(f"Equipamentos ELE: {len(df[df['ELE/MEC'] == 'ELE'])}")
print(f"Equipamentos MEC: {len(df[df['ELE/MEC'] == 'MEC'])}")
print(f"Com certificado: {df['CERTIFICADO  '].notna().sum()}")
print(f"Com código interno: {df['COD INTERNO'].notna().sum()}")
print(f"Com serial: {df['SERIAL'].notna().sum()}")

print("\n" + "="*80)
