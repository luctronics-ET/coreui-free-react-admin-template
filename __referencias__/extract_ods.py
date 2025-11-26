#!/usr/bin/env python3
import pandas as pd
import json

# Ler o arquivo ODS
file_path = '__referencias__/CMASM_Controle de Calibracao 2025.ods'

# Ler todas as planilhas
xls = pd.ExcelFile(file_path, engine='odf')

print("Planilhas disponíveis:", xls.sheet_names)
print("\n" + "="*80 + "\n")

# Ler a primeira planilha (ou a que contém os dados)
for sheet_name in xls.sheet_names:
    print(f"\n### PLANILHA: {sheet_name} ###\n")
    df = pd.read_excel(file_path, sheet_name=sheet_name, engine='odf')
    
    # Mostrar informações
    print(f"Dimensões: {df.shape[0]} linhas x {df.shape[1]} colunas")
    print(f"\nColunas: {list(df.columns)}")
    print(f"\nPrimeiras 10 linhas:\n")
    print(df.head(10).to_string())
    print("\n" + "-"*80 + "\n")
    
    # Salvar em JSON
    output_file = f'__referencias__/{sheet_name.replace(" ", "_").replace("/", "_")}.json'
    df.to_json(output_file, orient='records', indent=2, force_ascii=False)
    print(f"Dados salvos em: {output_file}")
    print("\n" + "="*80 + "\n")
