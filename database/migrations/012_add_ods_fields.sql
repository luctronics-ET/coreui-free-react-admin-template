-- Migration: Adicionar campos novos baseados na planilha ODS CMASM
-- Data: 2025-11-26
-- Descrição: Adiciona campos de unidade, divisão e prioridade em equipment
--            Adiciona campos de controle de fluxo e orçamento em calibrations

USE cmasm_db;

-- ============================================
-- TABELA: equipment
-- ============================================

-- Adicionar coluna measurement_range (faixa de medição)
ALTER TABLE equipment 
ADD COLUMN measurement_range VARCHAR(200) COMMENT 'Faixa de medição do equipamento' 
AFTER model;

-- Adicionar coluna unit (unidade de medição do RANGE)
ALTER TABLE equipment 
ADD COLUMN unit VARCHAR(50) COMMENT 'Unidade de medição (V, A, Bar, etc)' 
AFTER measurement_range;

-- Adicionar coluna division (divisão/seção: MK-46, F-21, etc)
ALTER TABLE equipment 
ADD COLUMN division VARCHAR(50) COMMENT 'Divisão/Seção do equipamento (MK-46, F-21, etc)' 
AFTER location;

-- Adicionar coluna priority_number (prioridade/peso do equipamento numérico)
ALTER TABLE equipment 
ADD COLUMN priority_number INTEGER DEFAULT 0 COMMENT 'Prioridade numérica do equipamento (1, 2, 3, etc)' 
AFTER priority;

-- ============================================
-- TABELA: calibrations
-- ============================================
-- Nota: entry_date, exit_to_cal_date, return_from_cal_date já existem!

-- Adicionar coluna valid_until (data de validade da calibração)
ALTER TABLE calibrations 
ADD COLUMN valid_until DATE COMMENT 'Data de validade da calibração' 
AFTER scheduled_date;

-- Adicionar coluna budget_number (número do orçamento)
ALTER TABLE calibrations 
ADD COLUMN budget_number VARCHAR(100) COMMENT 'Número do orçamento/pregão' 
AFTER cost;

-- Adicionar coluna payment_date (data de pagamento)
ALTER TABLE calibrations 
ADD COLUMN payment_date DATE COMMENT 'Data de pagamento do serviço' 
AFTER budget_number;

-- ============================================
-- ÍNDICES
-- ============================================

-- Índice para facilitar busca por divisão
CREATE INDEX idx_equipment_division ON equipment(division);

-- Índice para facilitar busca por prioridade numérica
CREATE INDEX idx_equipment_priority_number ON equipment(priority_number);

-- Índice para facilitar busca por data de validade
CREATE INDEX idx_calibrations_valid_until ON calibrations(valid_until);

-- Índice para facilitar busca por orçamento
CREATE INDEX idx_calibrations_budget_number ON calibrations(budget_number);

-- ============================================
-- COMENTÁRIOS ADICIONAIS
-- ============================================

ALTER TABLE equipment COMMENT = 'Equipamentos de calibração do CMASM - Atualizado 2025-11-26 com campos ODS';
ALTER TABLE calibrations COMMENT = 'Calibrações dos equipamentos - Atualizado 2025-11-26 com campos ODS';
