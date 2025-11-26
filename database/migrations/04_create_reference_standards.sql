-- ============================================================================
-- Tabela: reference_standards
-- Descrição: Padrões de referência rastreáveis
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS reference_standards (
    id VARCHAR(50) PRIMARY KEY COMMENT 'ID alfanumérico do padrão',
    name VARCHAR(100) NOT NULL COMMENT 'Nome do padrão',
    code VARCHAR(50) NOT NULL UNIQUE COMMENT 'Código único do padrão',
    last_calibration_date DATE COMMENT 'Data da última calibração do padrão',
    traceability_chain TEXT COMMENT 'Cadeia de rastreabilidade (ex: RBC → INMETRO → BIPM)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Padrões de referência para rastreabilidade';
