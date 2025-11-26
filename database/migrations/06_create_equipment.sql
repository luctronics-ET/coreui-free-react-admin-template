-- ============================================================================
-- Tabela: equipment
-- Descrição: Equipamentos e instrumentos de medição
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    internal_code VARCHAR(50) NOT NULL UNIQUE COMMENT 'Código interno CMASM',
    
    -- Informações básicas
    manufacturer VARCHAR(100) COMMENT 'Fabricante (HP, FLUKE, MINIPA, etc)',
    model VARCHAR(100) COMMENT 'Modelo do equipamento',
    serial_number VARCHAR(100) COMMENT 'Número de série',
    
    -- Categorização
    category_1 ENUM('eletrico', 'mecanico') NOT NULL COMMENT 'Categoria principal',
    category_2 VARCHAR(100) COMMENT 'Subcategoria (multimetro_digital, fonte_dc, etc)',
    asset_type VARCHAR(50) NOT NULL COMMENT 'Tipo de ativo',
    classification VARCHAR(50) COMMENT 'Classificação adicional',
    
    -- Características físicas
    weight_grams DECIMAL(10, 2) COMMENT 'Peso em gramas',
    dimensions VARCHAR(50) COMMENT 'Dimensões (ex: 150x80x40mm)',
    accessories TEXT COMMENT 'Lista de acessórios inclusos',
    
    -- Localização e responsabilidade
    organization_id INT NOT NULL COMMENT 'Seção/Divisão responsável',
    location VARCHAR(100) COMMENT 'Localização física específica',
    
    -- Calibração
    acquisition_date DATE COMMENT 'Data de aquisição',
    calibration_default_interval_days INT DEFAULT 365 COMMENT 'Intervalo padrão de calibração',
    last_calibration_id INT NULL COMMENT 'ID da última calibração',
    next_calibration_due_date DATE COMMENT 'Data de vencimento da próxima calibração',
    is_calibrated BOOLEAN DEFAULT FALSE COMMENT 'Status atual de calibração',
    
    -- Prioridade
    priority ENUM('critica', 'urgente', 'alta', 'media', 'normal') DEFAULT 'normal' COMMENT 'Nível de prioridade',
    
    -- Status
    status ENUM('active', 'quarantined', 'decommissioned', 'in_maintenance', 'transferred') 
        DEFAULT 'active' COMMENT 'Status operacional',
    
    -- Fornecedor
    provider_id INT NULL COMMENT 'Fornecedor padrão',
    provider_contact VARCHAR(100) COMMENT 'Contato do fornecedor',
    
    -- Observações
    notes TEXT COMMENT 'Observações gerais',
    
    -- Auditoria
    created_by INT NULL COMMENT 'Usuário que criou',
    updated_by INT NULL COMMENT 'Último usuário que atualizou',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE RESTRICT,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_internal_code (internal_code),
    INDEX idx_category (category_1, category_2),
    INDEX idx_organization (organization_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_next_calibration (next_calibration_due_date),
    INDEX idx_is_calibrated (is_calibrated),
    
    -- Índice FULLTEXT para busca
    FULLTEXT idx_search (manufacturer, model, serial_number, internal_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Equipamentos e instrumentos de medição';

-- Adicionar FK para last_calibration_id depois que tabela calibrations existir
-- Ver arquivo 10_add_foreign_keys.sql
