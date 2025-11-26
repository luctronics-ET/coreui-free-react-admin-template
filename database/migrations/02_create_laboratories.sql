-- ============================================================================
-- Tabela: laboratories
-- Descrição: Laboratórios de calibração (internos e externos)
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS laboratories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE COMMENT 'Código do laboratório',
    name VARCHAR(200) NOT NULL COMMENT 'Nome do laboratório',
    type ENUM('internal', 'external') NOT NULL COMMENT 'Tipo: interno ou externo',
    
    -- Contato
    contact_person VARCHAR(100) COMMENT 'Pessoa de contato',
    phone VARCHAR(20) COMMENT 'Telefone',
    email VARCHAR(100) COMMENT 'Email',
    address TEXT COMMENT 'Endereço completo',
    
    -- Acreditação
    is_accredited BOOLEAN DEFAULT FALSE COMMENT 'Possui acreditação?',
    accreditation_body VARCHAR(100) COMMENT 'Órgão acreditador (INMETRO, RBC, etc)',
    accreditation_number VARCHAR(50) COMMENT 'Número da acreditação',
    accreditation_scope TEXT COMMENT 'Escopo da acreditação',
    accreditation_valid_until DATE COMMENT 'Validade da acreditação',
    
    -- Especialidades
    specialties JSON COMMENT 'Array de tipos de calibração oferecidos',
    
    -- Comercial
    default_lead_time_days INT DEFAULT 15 COMMENT 'Prazo padrão em dias',
    rating DECIMAL(3, 2) DEFAULT 0.00 COMMENT 'Avaliação (0-5)',
    
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Índices
    INDEX idx_code (code),
    INDEX idx_type (type),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Laboratórios de calibração (CMS, BACS, MV Metrologia, etc)';
