# Template de Importação ODS/XLSX

## 📋 Formato da Planilha

### Colunas Obrigatórias

| Coluna | Descrição | Exemplo | Obrigatório |
|--------|-----------|---------|-------------|
| **Patrimônio** ou **Código Interno** | Identificador único do equipamento | MULT-001, EQ-123 | ✅ Sim |
| **Equipamento** ou **Descrição** | Nome/tipo do equipamento | Multímetro Digital True RMS | ✅ Sim |

### Colunas Opcionais (Recomendadas)

| Coluna | Descrição | Exemplo | Formato |
|--------|-----------|---------|---------|
| **Fabricante** ou **Marca** | Nome do fabricante | Fluke, Mitutoyo | Texto |
| **Modelo** | Modelo do equipamento | 87V, 500-196-30 | Texto |
| **Nº Série** ou **Serial** | Número de série | 12345678, SN789012 | Texto/Número |
| **Localização** ou **Local** | Onde está o equipamento | Bancada 01 - Lab Eletrônica | Texto |
| **Última Calibração** | Data da última calibração | 15/06/2024 | Data (DD/MM/YYYY) |
| **Próxima Calibração** ou **Vencimento** | Data da próxima calibração | 15/06/2025 | Data (DD/MM/YYYY) |
| **Responsável** | Pessoa responsável | SO João Silva | Texto |
| **Observações** | Notas adicionais | Faixa: 0-1000V, Cat III | Texto |

## 📝 Exemplo Completo

### Planilha ODS/XLSX:

| Patrimônio | Equipamento | Fabricante | Modelo | Nº Série | Localização | Última Calibração | Próxima Calibração | Responsável | Observações |
|------------|-------------|------------|---------|----------|-------------|-------------------|--------------------|-------------|-------------|
| MULT-001 | Multímetro Digital True RMS | Fluke | 87V | 12345678 | Bancada 01 - Lab Eletrônica | 15/06/2024 | 15/06/2025 | SO João Silva | Faixa: 0,1mV a 1000V |
| OSC-001 | Osciloscópio Digital 100MHz | Tektronix | TBS2104 | C012345 | Bancada 03 - Lab Eletrônica | 10/08/2024 | 10/08/2026 | SO João Silva | 4 canais, calibração bienal |
| PAQ-001 | Paquímetro Digital 150mm | Mitutoyo | 500-196-30 | MD201234 | Sala Metrologia - Armário A1 | 08/07/2024 | 08/07/2025 | SO Pedro Santos | Resolução: 0,01mm, RBC |
| TOR-001 | Torquímetro Digital 10-100 N.m | Gedore | DREMOMETER A | GD567890 | Sala Ferramentas - Prat 2 | 03/11/2024 | 03/11/2025 | SO Maria Ferreira | Precisão: ±2% |
| BAL-001 | Balança de Precisão 5kg x 0,01g | Marte | AS 5500C | MT234567 | Sala Metrologia - Bancada Pesagem | 18/02/2024 | 18/02/2025 | SO Carlos Oliveira | Calibração interna automática |

## ⚙️ Regras de Importação

### 1. Reconhecimento de Colunas

O sistema reconhece automaticamente variações dos nomes das colunas:

**Código Interno:**
- ✅ Patrimônio
- ✅ Código
- ✅ Código Interno
- ✅ Cod Interno

**Equipamento:**
- ✅ Equipamento
- ✅ Instrumento
- ✅ Descrição
- ✅ Tipo

**Fabricante:**
- ✅ Fabricante
- ✅ Marca

**Série:**
- ✅ Série
- ✅ Nº Série
- ✅ Número Série
- ✅ Serial
- ✅ N Série
- ✅ NS

**Localização:**
- ✅ Localização
- ✅ Local
- ✅ Setor

**Datas:**
- ✅ Última Calibração / Data Calibração / Dt Calibração
- ✅ Próxima Calibração / Vencimento / Validade

### 2. Formatos de Data Aceitos

O sistema aceita múltiplos formatos:

- **DD/MM/YYYY** → `15/06/2024`
- **DD/MM/YY** → `15/06/24`
- **YYYY-MM-DD** → `2024-06-15`
- **Número Excel** → `45462` (convertido automaticamente)

### 3. Validações

❌ **Linha rejeitada se:**
- Não tem Código Interno E não tem Equipamento
- Linha completamente vazia

✅ **Linha aceita se:**
- Tem Código Interno OU Equipamento (mínimo)
- Outras colunas podem estar vazias

### 4. Campos Automáticos

Quando não informado, o sistema preenche:

| Campo | Valor Padrão |
|-------|-------------|
| Categoria | `eletrico` (muda para `mecanico` se detectar palavras-chave) |
| Prioridade | `normal` (muda para `alta` se contiver "padrão" ou "referência") |
| Status | `active` |
| Intervalo de Calibração | `365 dias` |
| Organização | `CMASM` (detecta automaticamente se mencionar seção) |

## 🎯 Como Importar

### Passo 1: Preparar Planilha

1. Abra LibreOffice Calc ou Excel
2. Crie planilha com as colunas acima
3. Preencha os dados (mínimo: Código + Equipamento)
4. Salve como `.ods` ou `.xlsx`

### Passo 2: Upload no Sistema

1. Acesse o sistema: `/calibration/import-export`
2. Clique em "Escolher arquivo"
3. Selecione seu arquivo `.ods` ou `.xlsx`
4. Aguarde o processamento

### Passo 3: Revisar Preview

1. Sistema mostra preview dos primeiros 10 equipamentos
2. Revise os dados mapeados
3. Veja quantos equipamentos foram encontrados
4. Veja se há erros

### Passo 4: Confirmar Importação

1. Se estiver tudo ok, clique em "Confirmar e Importar"
2. Aguarde a importação
3. Veja mensagem de sucesso

## 📤 Como Exportar

### Exportar Todos os Equipamentos

1. Acesse `/calibration/import-export`
2. Clique em "Exportar para Excel"
3. Arquivo `equipamentos_cmasm_YYYY-MM-DD.xlsx` será baixado

### Formato do Arquivo Exportado

| Coluna | Conteúdo |
|--------|----------|
| Código Interno | internal_code |
| Equipamento | asset_type |
| Fabricante | manufacturer |
| Modelo | model |
| Nº Série | serial_number |
| Localização | location |
| Última Calibração | last_calibration_date |
| Próxima Calibração | next_calibration_due_date |
| Status | status |

## 🔄 Atualização de Dados

### Para Atualizar Equipamentos Existentes:

1. Exporte os dados atuais
2. Edite o arquivo exportado
3. Importe novamente

**IMPORTANTE:** Se o `Código Interno` já existir, o equipamento será **atualizado**, não duplicado.

## 💡 Dicas

### ✅ Boas Práticas

- Use códigos internos únicos e padronizados (ex: MULT-001, OSC-001)
- Mantenha um padrão para nomes de equipamentos
- Preencha o máximo de campos possível
- Use datas no formato DD/MM/YYYY para evitar confusão
- Revise sempre o preview antes de confirmar

### ⚠️ Evite

- Linhas completamente vazias no meio dos dados
- Códigos duplicados
- Caracteres especiais estranhos (use apenas: letras, números, hífen, underline)
- Datas em formato ambíguo (ex: 01/02/2024 → use 01/02/2024 sempre como Dia/Mês/Ano)

## 🆘 Resolução de Problemas

### Problema: "Arquivo processado, mas 0 equipamentos encontrados"

**Solução:**
- Verifique se a planilha tem uma linha de cabeçalho
- Confirme que as colunas têm nomes reconhecíveis
- Certifique-se de que há dados abaixo do cabeçalho

### Problema: "Muitos erros ao importar"

**Solução:**
- Veja a lista de erros detalhados
- Corrija as linhas problemáticas
- Tente novamente

### Problema: "Datas não estão sendo reconhecidas"

**Solução:**
- Use formato DD/MM/YYYY (ex: 15/06/2024)
- Evite texto nas células de data
- Se usar Excel, formate células como "Data"

### Problema: "Equipamento importado na organização errada"

**Solução:**
- No campo "Localização", mencione explicitamente a seção
- Ex: "Seção Eletrônica - Bancada 01" → vai para SEC-ELETRON
- Ex: "Div Manutenção - Sala 3" → vai para DIV-MANUT

## 📁 Arquivos de Exemplo

### Download de Templates

**Template vazio:**
```
template_importacao_equipamentos.ods
template_importacao_equipamentos.xlsx
```

**Template com exemplos:**
```
exemplo_equipamentos_cmasm.ods
exemplo_equipamentos_cmasm.xlsx
```

**Planilha real CMASM:**
```
CMASM_Controle de Calibracao 2025.ods (em __referencias__/)
```

---

**Dúvidas?** Consulte `SISTEMA_COMPLETO.md` ou entre em contato com o administrador do sistema.
