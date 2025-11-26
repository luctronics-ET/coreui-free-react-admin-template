# Mapeamento ODS → Banco de Dados CMASM

## Arquivo Fonte
`CMASM_Controle de Calibracao 2025.ods` - Planilha: **CALIBRACAO**

**Total de registros:** 486 equipamentos

## Mapeamento Completo

### Colunas ODS → Tabelas do Banco de Dados

| # | Coluna ODS | Tabela.Campo BD | Tipo | Observações |
|---|------------|-----------------|------|-------------|
| 1 | ELE/MEC | `equipment.type` ou `equipment.category` | String | ⚠️ Usar para type (ELE/MEC) |
| 2 | EQUIPAMENTO | `equipment.name` | String | ✅ Mapeamento direto |
| 3 | MARCA  | `equipment.manufacturer` | String | ✅ Mapeamento direto |
| 4 | MODELO | `equipment.model` | String | ✅ Mapeamento direto |
| 5 | RANGE | `equipment.measurement_range` | String | ✅ Mapeamento direto |
| 6 | UNIDADERANGE | Novo campo `equipment.unit` | String | ⚠️ ADICIONAR ao BD |
| 7 | COD INTERNO | `equipment.internal_code` | String (UNIQUE) | ✅ Mapeamento direto |
| 8 | SERIAL | `equipment.serial_number` | String | ✅ Mapeamento direto |
| 9 | DIVISÃO | Novo campo `equipment.division` | String | ⚠️ ADICIONAR ao BD (MK-46, F-21, etc) |
| 10 | PS | Novo campo `equipment.priority` | Integer | ⚠️ ADICIONAR ao BD (1, 2, 3) |
| 11 | ENTRADA Oficina Eletronica | Novo campo `calibrations.entry_date` | Date | ⚠️ ADICIONAR ao BD |
| 12 | saida para Cali. Da Oficina Eletronica | Novo campo `calibrations.exit_to_cal_date` | Date | ⚠️ ADICIONAR ao BD |
| 13 | RETORNO CAL | Novo campo `calibrations.return_from_cal_date` | Date | ⚠️ ADICIONAR ao BD |
| 14 | ULTIMA CALIBRAÇÃO | `calibrations.calibration_date` | Date | ✅ Mapeamento direto |
| 15 | CICLO CALIBRAÇÃO | `equipment.calibration_interval_months` | Integer | ✅ Mapeamento direto |
| 16 | PRÓXIMA CALIBRAÇÃO | `equipment.next_calibration_due_date` | Date | ✅ Mapeamento direto |
| 17 | VALIDADE CALIBRAÇÃO | Novo campo `calibrations.valid_until` | Date | ⚠️ ADICIONAR ao BD |
| 18 | CERTIFICADO   | `certificates.certificate_number` | String | ✅ Mapeamento direto |
| 19 | localizacao | `equipment.location` | String | ✅ Mapeamento direto |
| 20 | COMENTÁRIOS | `calibrations.notes` | Text | ✅ Mapeamento direto |
| 21 | CUSTO ESTIMADO | `calibrations.cost` | Decimal | ✅ Mapeamento direto |
| 22 | ORÇAMENTO | Novo campo `calibrations.budget_number` | String | ⚠️ ADICIONAR ao BD |
| 23 | PAGAMENTO | Novo campo `calibrations.payment_date` | Date | ⚠️ ADICIONAR ao BD |
| 24 | LOCAL CALIBRAÇÃO | `providers.name` ou `laboratories.name` | String | ✅ Vincular com provider_id |

## Colunas SEM Correspondência no ODS

### Tabela `equipment` - Campos que precisam de valores padrão:

- `organization_id` → **Usar CMASM como padrão**
- `resolution` → **NULL ou extrair do RANGE**
- `accuracy` → **NULL ou extrair do RANGE**
- `status` → **"active" como padrão**
- `condition_status` → **"operational" como padrão**
- `acquisition_date` → **NULL**
- `warranty_expiration` → **NULL**
- `last_maintenance_date` → **NULL**

### Tabela `calibrations` - Campos que precisam de valores padrão:

- `equipment_id` → **Buscar por internal_code**
- `laboratory_id` → **Buscar/criar por nome em "LOCAL CALIBRAÇÃO"**
- `due_date` → **Usar PRÓXIMA CALIBRAÇÃO**
- `result` → **"approved" se tem CERTIFICADO, "pending" se não**
- `status` → **"approved" se PRÓXIMA CALIBRAÇÃO > hoje, "overdue" se < hoje**
- `technician_name` → **NULL**

## Campos NOVOS Necessários no Banco de Dados

### Tabela `equipment` - ADICIONAR:

```sql
ALTER TABLE equipment ADD COLUMN unit VARCHAR(50);
ALTER TABLE equipment ADD COLUMN division VARCHAR(50);
ALTER TABLE equipment ADD COLUMN priority INTEGER DEFAULT 0;
```

### Tabela `calibrations` - ADICIONAR:

```sql
ALTER TABLE calibrations ADD COLUMN entry_date DATE;
ALTER TABLE calibrations ADD COLUMN exit_to_cal_date DATE;
ALTER TABLE calibrations ADD COLUMN return_from_cal_date DATE;
ALTER TABLE calibrations ADD COLUMN valid_until DATE;
ALTER TABLE calibrations ADD COLUMN budget_number VARCHAR(100);
ALTER TABLE calibrations ADD COLUMN payment_date DATE;
```

## Estatísticas do Arquivo ODS

- **Total de equipamentos:** 486
- **Equipamentos ELE:** 0 (⚠️ coluna vazia, todos são MEC)
- **Equipamentos MEC:** 368
- **Com certificado:** 293 (60,3%)
- **Com código interno:** 477 (98,1%)
- **Com serial:** 441 (90,7%)

## Valores de Exemplo

### Equipamento Típico:
```
COD INTERNO: CMASM-IDE-F21-003
EQUIPAMENTO: DIFFERENTIAL PROBE
MARCA: TESTEC
MODELO: TT-SI 9001
SERIAL: 1805707
DIVISÃO: F-21
PS: 1.0
RANGE: ±1000 V AC 1400 V AC/DC 100 MHz
```

### Calibração Típica:
```
ULTIMA CALIBRAÇÃO: 2024-03-12
PRÓXIMA CALIBRAÇÃO: 2026-03-12
CICLO CALIBRAÇÃO: 24 (meses)
CERTIFICADO: certificado nº 2142016/2024
LOCAL CALIBRAÇÃO: CMS
CUSTO ESTIMADO: 373.83
```

## Regras de Importação

1. **Equipamento único por `internal_code`** (COD INTERNO)
2. **Calibração vinculada ao equipamento** via `equipment_id`
3. **Provider/Laboratory** criado automaticamente se não existir
4. **Certificado** criado vinculado à calibração
5. **Status da calibração** calculado automaticamente:
   - `approved` se tem CERTIFICADO e PRÓXIMA CALIBRAÇÃO > hoje
   - `overdue` se PRÓXIMA CALIBRAÇÃO < hoje
   - `pending` se não tem CERTIFICADO

## Prioridades de Importação

1. ✅ **Alta:** COD INTERNO, EQUIPAMENTO, MARCA, MODELO, SERIAL
2. ✅ **Alta:** ULTIMA CALIBRAÇÃO, PRÓXIMA CALIBRAÇÃO, CICLO CALIBRAÇÃO
3. ⚠️ **Média:** CERTIFICADO, LOCAL CALIBRAÇÃO, CUSTO ESTIMADO
4. ⚠️ **Baixa:** DIVISÃO, PS, localizacao, COMENTÁRIOS
5. ⚠️ **Opcional:** ENTRADA Oficina, saida para Cali, RETORNO CAL, ORÇAMENTO, PAGAMENTO

## Próximos Passos

1. ✅ Criar migrations para adicionar novos campos
2. ✅ Criar página de visualização estilo tabela ODS
3. ✅ Implementar importador ODS → MySQL
4. ✅ Implementar exportador MySQL → ODS
5. ✅ Validações e tratamento de erros
