#!/usr/bin/env python3
"""
Script para extrair dados dos arquivos ODS de calibração CMASM
e gerar scripts SQL de seed com dados reais
"""

import subprocess
import sys
import os
import csv
import re
from datetime import datetime

def install_dependencies():
    """Instala dependências necessárias"""
    try:
        import pandas
        print("✓ pandas já instalado")
    except ImportError:
        print("Instalando pandas...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pandas", "openpyxl"])

def convert_ods_to_csv(ods_file, csv_file):
    """Converte ODS para CSV usando LibreOffice"""
    if not os.path.exists(ods_file):
        print(f"ERRO: Arquivo não encontrado: {ods_file}")
        return False
    
    print(f"Convertendo {os.path.basename(ods_file)} para CSV...")
    
    # Criar diretório temporário
    temp_dir = "/tmp/cmasm_data"
    os.makedirs(temp_dir, exist_ok=True)
    
    # Converter com LibreOffice
    cmd = [
        "libreoffice",
        "--headless",
        "--convert-to", "csv",
        "--outdir", temp_dir,
        ods_file
    ]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        
        # Procurar qualquer arquivo CSV criado no diretório
        csv_files = [f for f in os.listdir(temp_dir) if f.endswith('.csv')]
        
        if csv_files:
            # Usar o primeiro CSV encontrado
            generated_csv = os.path.join(temp_dir, csv_files[0])
            print(f"Arquivo CSV encontrado: {csv_files[0]}")
            
            # Copiar para localização desejada
            import shutil
            shutil.copy2(generated_csv, csv_file)
            print(f"✓ Arquivo convertido: {csv_file}")
            return True
        else:
            print(f"ERRO: Nenhum CSV foi gerado em {temp_dir}")
            print(f"Arquivos no diretório: {os.listdir(temp_dir)}")
            print(f"STDOUT: {result.stdout}")
            print(f"STDERR: {result.stderr}")
            return False
            
    except subprocess.TimeoutExpired:
        print("ERRO: Timeout ao converter arquivo")
        return False
    except Exception as e:
        print(f"ERRO: {e}")
        return False

def parse_date(date_str):
    """Converte string de data para formato MySQL"""
    if not date_str or date_str.strip() == '':
        return None
    
    # Remover espaços
    date_str = date_str.strip()
    
    # Formatos comuns
    formats = [
        '%d/%m/%Y',
        '%d/%m/%y',
        '%Y-%m-%d',
        '%d-%m-%Y',
        '%d.%m.%Y',
    ]
    
    for fmt in formats:
        try:
            dt = datetime.strptime(date_str, fmt)
            return dt.strftime('%Y-%m-%d')
        except ValueError:
            continue
    
    return None

def clean_text(text):
    """Limpa texto para SQL"""
    if not text or text.strip() == '':
        return None
    
    text = text.strip()
    # Escapar aspas simples
    text = text.replace("'", "\\'")
    return text

def extract_equipment_data(csv_file):
    """Extrai dados de equipamentos do CSV"""
    equipments = []
    
    try:
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.reader(f)
            rows = list(reader)
            
            # Encontrar header (procurar linha com "Código" ou "Patrimônio")
            header_idx = -1
            for idx, row in enumerate(rows):
                row_text = ' '.join([str(cell).lower() for cell in row])
                if 'patrimonio' in row_text or 'codigo' in row_text or 'equipamento' in row_text:
                    header_idx = idx
                    break
            
            if header_idx == -1:
                print("AVISO: Header não encontrado, usando primeira linha")
                header_idx = 0
            
            headers = [h.strip().lower() for h in rows[header_idx]]
            print(f"\nHeaders encontrados: {headers[:10]}...")
            
            # Mapear colunas
            col_map = {}
            for idx, h in enumerate(headers):
                if 'patrimonio' in h or 'codigo' in h or 'interno' in h:
                    col_map['internal_code'] = idx
                elif 'equipamento' in h or 'instrumento' in h or 'descri' in h:
                    col_map['asset_type'] = idx
                elif 'fabricante' in h or 'marca' in h:
                    col_map['manufacturer'] = idx
                elif 'modelo' in h:
                    col_map['model'] = idx
                elif 'serie' in h or 'serial' in h or 'n°' in h or 'num' in h:
                    col_map['serial_number'] = idx
                elif 'localizacao' in h or 'local' in h or 'setor' in h:
                    col_map['location'] = idx
                elif 'ultima' in h and 'calibra' in h:
                    col_map['last_calibration'] = idx
                elif 'proxima' in h or 'vencimento' in h or 'validade' in h:
                    col_map['next_calibration'] = idx
                elif 'responsavel' in h or 'resp' in h:
                    col_map['responsible'] = idx
            
            print(f"Mapeamento de colunas: {col_map}")
            
            # Processar dados
            for idx in range(header_idx + 1, len(rows)):
                row = rows[idx]
                
                # Pular linhas vazias
                if not any(cell.strip() for cell in row):
                    continue
                
                equipment = {}
                
                # Extrair dados usando mapeamento
                if 'internal_code' in col_map and len(row) > col_map['internal_code']:
                    equipment['internal_code'] = clean_text(row[col_map['internal_code']])
                
                if 'asset_type' in col_map and len(row) > col_map['asset_type']:
                    equipment['asset_type'] = clean_text(row[col_map['asset_type']])
                
                if 'manufacturer' in col_map and len(row) > col_map['manufacturer']:
                    equipment['manufacturer'] = clean_text(row[col_map['manufacturer']])
                
                if 'model' in col_map and len(row) > col_map['model']:
                    equipment['model'] = clean_text(row[col_map['model']])
                
                if 'serial_number' in col_map and len(row) > col_map['serial_number']:
                    equipment['serial_number'] = clean_text(row[col_map['serial_number']])
                
                if 'location' in col_map and len(row) > col_map['location']:
                    equipment['location'] = clean_text(row[col_map['location']])
                
                if 'last_calibration' in col_map and len(row) > col_map['last_calibration']:
                    equipment['last_calibration_date'] = parse_date(row[col_map['last_calibration']])
                
                if 'next_calibration' in col_map and len(row) > col_map['next_calibration']:
                    equipment['next_calibration_date'] = parse_date(row[col_map['next_calibration']])
                
                # Validar se tem dados mínimos
                if equipment.get('internal_code') or equipment.get('asset_type'):
                    equipments.append(equipment)
            
            print(f"\n✓ Extraídos {len(equipments)} equipamentos")
            return equipments
            
    except Exception as e:
        print(f"ERRO ao processar CSV: {e}")
        import traceback
        traceback.print_exc()
        return []

def generate_sql_seed(equipments, output_file):
    """Gera script SQL de seed"""
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("""-- ============================================================================
-- Seed Data: Equipamentos Reais CMASM
-- Fonte: CMASM_Controle de Calibracao 2025.ods
-- Data: """ + datetime.now().strftime('%Y-%m-%d') + """
-- Total: """ + str(len(equipments)) + """ equipamentos
-- ============================================================================

-- Obter IDs de organizações
SET @cmasm_id = (SELECT id FROM organizations WHERE code = 'CMASM' LIMIT 1);
SET @sec_eletron_id = (SELECT id FROM organizations WHERE code = 'SEC-ELETRON' LIMIT 1);
SET @sec_manut_id = (SELECT id FROM organizations WHERE code = 'DIV-MANUT' LIMIT 1);

-- Desabilitar verificação de FK temporariamente
SET FOREIGN_KEY_CHECKS = 0;

""")
        
        for idx, eq in enumerate(equipments, 1):
            # Valores padrão
            internal_code = eq.get('internal_code', f'EQ-{idx:04d}')
            asset_type = eq.get('asset_type', 'Equipamento não especificado')
            manufacturer = eq.get('manufacturer', 'N/A')
            model = eq.get('model', 'N/A')
            serial_number = eq.get('serial_number', 'S/N')
            location = eq.get('location', 'CMASM')
            
            # Determinar categoria baseada no tipo
            category_1 = 'eletrico'
            if asset_type:
                asset_lower = asset_type.lower()
                if any(word in asset_lower for word in ['mecanico', 'torque', 'peso', 'balanca', 'pressao']):
                    category_1 = 'mecanico'
            
            # Organização baseada na localização
            org_id = '@cmasm_id'
            if location and 'eletron' in location.lower():
                org_id = '@sec_eletron_id'
            elif location and ('manut' in location.lower() or 'mec' in location.lower()):
                org_id = '@sec_manut_id'
            
            # Prioridade baseada no tipo
            priority = 'normal'
            if asset_type and any(word in asset_type.lower() for word in ['padrao', 'referencia', 'critico']):
                priority = 'alta'
            
            f.write(f"""
-- Equipamento {idx}: {internal_code}
INSERT INTO equipment (
    internal_code, asset_type, manufacturer, model, serial_number,
    organization_id, location, category_1, priority, status,
    is_calibrated, calibration_default_interval_days
) VALUES (
    '{internal_code}',
    '{asset_type[:100] if asset_type else "Equipamento"}',
    '{manufacturer[:100] if manufacturer else "N/A"}',
    '{model[:100] if model else "N/A"}',
    '{serial_number[:50] if serial_number else "S/N"}',
    {org_id},
    '{location[:100] if location else "CMASM"}',
    '{category_1}',
    '{priority}',
    'active',
    TRUE,
    365
);
""")
            
            # Se tem data de última calibração, criar registro
            if eq.get('last_calibration_date'):
                f.write(f"""
-- Calibração histórica para {internal_code}
SET @equipment_id = LAST_INSERT_ID();
INSERT INTO calibrations (
    equipment_id, calibration_date, calibration_type, status, pass_fail
) VALUES (
    @equipment_id,
    '{eq['last_calibration_date']}',
    'routine',
    'approved',
    TRUE
);
UPDATE equipment SET 
    last_calibration_id = LAST_INSERT_ID(),
    next_calibration_due_date = DATE_ADD('{eq['last_calibration_date']}', INTERVAL 365 DAY)
WHERE id = @equipment_id;
""")
        
        f.write("""
-- Reabilitar verificação de FK
SET FOREIGN_KEY_CHECKS = 1;

-- Verificação
SELECT 
    COUNT(*) as total_equipments,
    COUNT(DISTINCT organization_id) as organizations,
    COUNT(last_calibration_id) as with_calibration,
    SUM(CASE WHEN next_calibration_due_date < CURDATE() THEN 1 ELSE 0 END) as overdue
FROM equipment;

SELECT 'Seed de equipamentos concluído!' as status;
""")
    
    print(f"\n✓ Script SQL gerado: {output_file}")

def main():
    """Função principal"""
    print("=" * 80)
    print("EXTRATOR DE DADOS ODS → SQL SEED")
    print("=" * 80)
    
    # Arquivos
    base_dir = os.path.dirname(os.path.abspath(__file__))
    ods_file = os.path.join(base_dir, "..", "__referencias__", "CMASM_Controle de Calibracao 2025.ods")
    csv_file = "/tmp/cmasm_equipment_data.csv"
    sql_file = os.path.join(base_dir, "seeds", "07_seed_real_equipment.sql")
    
    # 1. Converter ODS para CSV
    if not convert_ods_to_csv(ods_file, csv_file):
        print("\nERRO: Falha ao converter ODS")
        sys.exit(1)
    
    # 2. Extrair dados
    equipments = extract_equipment_data(csv_file)
    
    if not equipments:
        print("\nERRO: Nenhum equipamento extraído")
        sys.exit(1)
    
    # Mostrar amostra
    print("\n" + "=" * 80)
    print("AMOSTRA DOS DADOS EXTRAÍDOS (primeiros 5):")
    print("=" * 80)
    for eq in equipments[:5]:
        print(f"\nCódigo: {eq.get('internal_code', 'N/A')}")
        print(f"Tipo: {eq.get('asset_type', 'N/A')}")
        print(f"Fabricante: {eq.get('manufacturer', 'N/A')}")
        print(f"Modelo: {eq.get('model', 'N/A')}")
        print(f"Série: {eq.get('serial_number', 'N/A')}")
        print(f"Local: {eq.get('location', 'N/A')}")
        print(f"Última calibração: {eq.get('last_calibration_date', 'N/A')}")
        print(f"Próxima calibração: {eq.get('next_calibration_date', 'N/A')}")
    
    # 3. Gerar SQL
    generate_sql_seed(equipments, sql_file)
    
    print("\n" + "=" * 80)
    print(f"✓ PROCESSO CONCLUÍDO!")
    print(f"✓ {len(equipments)} equipamentos processados")
    print(f"✓ Script SQL: {sql_file}")
    print("=" * 80)
    print("\nPara carregar no database:")
    print(f"  mysql -u root -p cmasm_db < {sql_file}")
    print()

if __name__ == "__main__":
    main()
