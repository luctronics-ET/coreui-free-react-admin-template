# 📋 Como Usar o Arquivo ODS Real do CMASM

## 🎯 Objetivo

Este guia mostra como importar os dados reais do arquivo `CMASM_Controle de Calibracao 2025.ods` para o sistema.

## 📁 Localização do Arquivo

```
/home/luciano/coreui-free-react-admin-template/__referencias__/CMASM_Controle de Calibracao 2025.ods
```

## 🚀 Método 1: Interface Web (Recomendado)

### Passo a Passo

1. **Iniciar o sistema**
   ```bash
   cd /home/luciano/coreui-free-react-admin-template
   npm start
   ```

2. **Acessar módulo de importação**
   - Abra o navegador: `http://localhost:3000`
   - Login: `admin` / `Admin@123`
   - Menu lateral → **Calibração** → **Importar/Exportar**
   - Ou acesse diretamente: `http://localhost:3000/#/calibration/import-export`

3. **Fazer upload do arquivo**
   - Clique em "Escolher arquivo"
   - Navegue até `__referencias__/`
   - Selecione `CMASM_Controle de Calibracao 2025.ods`
   - Aguarde o processamento

4. **Revisar preview**
   - Sistema mostra quantos equipamentos foram encontrados
   - Tabela exibe os primeiros 10 equipamentos
   - Verifique se os dados estão corretos
   - Veja se há erros

5. **Confirmar importação**
   - Se estiver tudo OK, clique em **"Confirmar e Importar X Equipamentos"**
   - Aguarde a mensagem de sucesso
   - Pronto! Equipamentos cadastrados

6. **Verificar dados importados**
   - Menu → **Calibração** → **Equipamentos**
   - Veja todos os equipamentos importados
   - Use filtros e busca para encontrar equipamentos específicos

## 🖥️ Método 2: Script Python (Linha de Comando)

### Passo a Passo

1. **Executar o extrator**
   ```bash
   cd /home/luciano/coreui-free-react-admin-template/database
   python3 extract_ods_data.py
   ```

   **Saída esperada:**
   ```
   ================================================================================
   EXTRATOR DE DADOS ODS → SQL SEED
   ================================================================================
   Convertendo CMASM_Controle de Calibracao 2025.ods para CSV...
   ✓ Arquivo convertido: /tmp/cmasm_equipment_data.csv
   
   ✓ Extraídos XX equipamentos
   
   ================================================================================
   AMOSTRA DOS DADOS EXTRAÍDOS (primeiros 5):
   ================================================================================
   
   Código: MULT-001
   Tipo: Multímetro Digital
   Fabricante: Fluke
   ...
   
   ✓ Script SQL gerado: seeds/07_seed_real_equipment.sql
   ================================================================================
   ✓ PROCESSO CONCLUÍDO!
   ✓ XX equipamentos processados
   ✓ Script SQL: /home/luciano/.../seeds/07_seed_real_equipment.sql
   ================================================================================
   ```

2. **Carregar no database**
   ```bash
   mysql -u root -p cmasm_db < seeds/07_seed_real_equipment.sql
   ```

3. **Verificar importação**
   ```bash
   mysql -u root -p cmasm_db -e "SELECT COUNT(*) as total FROM equipment;"
   ```

## 📊 Mapeamento de Colunas

O sistema reconhece automaticamente estas colunas do arquivo ODS:

| Coluna no ODS | Campo no Sistema | Observações |
|---------------|------------------|-------------|
| Patrimônio / Código | `internal_code` | Identificador único |
| Equipamento / Instrumento | `asset_type` | Tipo do equipamento |
| Fabricante / Marca | `manufacturer` | Nome do fabricante |
| Modelo | `model` | Modelo do equipamento |
| Série / N° Série | `serial_number` | Número de série |
| Localização / Local | `location` | Onde está o equipamento |
| Última Calibração | `last_calibration_date` | Data no formato DD/MM/YYYY |
| Próxima Calibração / Vencimento | `next_calibration_due_date` | Data no formato DD/MM/YYYY |
| Responsável | `responsible_officer` | Pessoa responsável |
| Observações / Notas | `observations` | Notas adicionais |

## ⚙️ Ajustes Automáticos

O sistema faz os seguintes ajustes automaticamente:

### 1. Categoria do Equipamento
```
Se nome contém: "torque", "balanca", "paquimetro", "micrometro", "pressao"
→ Categoria = MECÂNICO

Caso contrário:
→ Categoria = ELÉTRICO
```

### 2. Prioridade
```
Se nome contém: "padrao", "referencia", "critico"
→ Prioridade = ALTA

Caso contrário:
→ Prioridade = NORMAL
```

### 3. Organização
```
Se localização contém: "eletron"
→ Organização = Seção Eletrônica

Se localização contém: "manut", "mec"
→ Organização = Divisão Manutenção

Se localização contém: "metal"
→ Organização = Seção Metalurgia

Se localização contém: "maq"
→ Organização = Seção Máquinas

Caso contrário:
→ Organização = CMASM (padrão)
```

### 4. Calibrações Históricas
```
Se tem "Última Calibração":
→ Cria registro de calibração no status "approved"
→ Calcula próxima calibração (+365 dias se não informado)
→ Vincula ao equipamento
```

## 🔍 Validação dos Dados

### Dados Obrigatórios
```
✅ Código Interno OU Equipamento (pelo menos um)
```

### Dados Opcionais (mas recomendados)
```
- Fabricante
- Modelo
- Número de Série
- Localização
- Datas de Calibração
```

### Linhas que Serão Ignoradas
```
❌ Linhas completamente vazias
❌ Linhas sem Código E sem Equipamento
```

## 📝 Exemplo de Estrutura do ODS

```
| Patrimônio | Equipamento           | Fabricante | Modelo  | N° Série | Localização      | Última Cal. | Próxima Cal. |
|------------|-----------------------|------------|---------|----------|------------------|-------------|--------------|
| MULT-001   | Multímetro Digital    | Fluke      | 87V     | 12345678 | Bancada 01 - Lab | 15/06/2024  | 15/06/2025   |
| OSC-001    | Osciloscópio 100MHz   | Tektronix  | TBS2104 | C012345  | Bancada 03       | 10/08/2024  | 10/08/2026   |
| PAQ-001    | Paquímetro Digital    | Mitutoyo   | 500-... | MD20...  | Sala Metrologia  | 08/07/2024  | 08/07/2025   |
```

## ✅ Checklist de Importação

Antes de importar, verifique:

- [ ] Arquivo está em `.ods` ou `.xlsx`
- [ ] Tem linha de cabeçalho com nomes reconhecíveis
- [ ] Tem pelo menos colunas "Patrimônio" ou "Equipamento"
- [ ] Datas estão no formato DD/MM/YYYY (ou similar)
- [ ] Não tem linhas completamente vazias no meio dos dados
- [ ] Códigos internos são únicos (sem duplicatas)

## 🆘 Problemas Comuns

### "0 equipamentos encontrados"

**Causa:** Sistema não encontrou a linha de cabeçalho

**Solução:**
1. Abra o ODS no LibreOffice
2. Certifique-se que a primeira linha tem: "Patrimônio", "Equipamento", etc.
3. Salve e tente novamente

### "Muitos erros ao importar"

**Causa:** Dados incompletos ou formato inválido

**Solução:**
1. Veja a lista de erros detalhados
2. Corrija as linhas problemáticas no ODS
3. Reimporte

### "Datas não reconhecidas"

**Causa:** Formato de data diferente do esperado

**Solução:**
1. Use sempre DD/MM/YYYY (ex: 15/06/2024)
2. No LibreOffice, formate as células como "Data"
3. Salve e reimporte

## 📤 Exportar Dados Atualizados

Depois de importar e fazer alterações:

1. Acesse `/calibration/import-export`
2. Clique em **"Exportar para Excel"**
3. Arquivo será baixado: `equipamentos_cmasm_YYYY-MM-DD.xlsx`
4. Use este arquivo como backup ou para atualizar o ODS original

## 🔄 Atualizar Dados Existentes

Para atualizar equipamentos já cadastrados:

1. Exporte os dados atuais
2. Edite o arquivo exportado
3. Importe novamente

**Regra:** Se o **Código Interno** já existe, o equipamento será **atualizado**, não duplicado.

## 💡 Dicas

### ✅ Boas Práticas

- Mantenha o arquivo ODS organizado e atualizado
- Faça backup antes de grandes importações
- Use o preview para validar os dados
- Exporte periodicamente para ter backups em Excel

### ⚠️ Cuidados

- Não altere códigos internos de equipamentos já cadastrados
- Sempre revise o preview antes de confirmar
- Faça importações em horários de baixo uso
- Teste com poucos equipamentos primeiro

## 📞 Comandos Úteis

```bash
# Ver equipamentos no database
mysql -u root -p cmasm_db -e "SELECT internal_code, asset_type, manufacturer, location FROM equipment LIMIT 10;"

# Contar equipamentos por organização
mysql -u root -p cmasm_db -e "SELECT o.name, COUNT(e.id) FROM equipment e JOIN organizations o ON e.organization_id = o.id GROUP BY o.name;"

# Ver equipamentos com calibração vencida
mysql -u root -p cmasm_db -e "SELECT * FROM v_equipment_calibration_status WHERE calibration_status = 'VENCIDO';"
```

---

## ✨ Resultado Final

Após importar o arquivo ODS, você terá:

✅ Todos os equipamentos do CMASM cadastrados  
✅ Dados completos (fabricante, modelo, série, localização)  
✅ Histórico de calibrações  
✅ Datas de vencimento calculadas  
✅ Organização correta atribuída  
✅ Prioridades definidas  
✅ Pronto para uso no sistema!

---

**Arquivo de Referência:** `__referencias__/CMASM_Controle de Calibracao 2025.ods`  
**Guia Completo:** `GUIA_IMPORTACAO_ODS.md`  
**Sistema:** CMASM - Centro de Mísseis e Armas Submarinas da Marinha
