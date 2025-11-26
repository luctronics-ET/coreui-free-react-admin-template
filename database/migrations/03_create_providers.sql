-- ============================================================================
-- Tabela: providers
-- Descrição: Fornecedores de serviços de calibração
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS providers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laboratory_id INT NULL COMMENT 'Vinculação opcional com laboratório',
    
    name VARCHAR(100) NOT NULL COMMENT 'Nome do fornecedor',
    contact VARCHAR(100) COMMENT 'Nome do contato',
    phone VARCHAR(20) COMMENT 'Telefone',
    email VARCHAR(100) COMMENT 'Email',
    
    -- Acreditação (caso não seja laboratório)
    accreditation_body VARCHAR(100) COMMENT 'Órgão acreditador',
    accreditation_number VARCHAR(50) COMMENT 'Número da acreditação',
    accreditation_scope TEXT COMMENT 'Escopo da acreditação',
    
    address TEXT COMMENT 'Endereço completo',
    
    -- Comercial
    cnpj VARCHAR(18) UNIQUE COMMENT 'CNPJ do fornecedor',
    contract_number VARCHAR(50) COMMENT 'Número do contrato',
    contract_valid_until DATE COMMENT 'Validade do contrato',
    payment_terms VARCHAR(100) COMMENT 'Condições de pagamento',
    
    -- Avaliação
    rating DECIMAL(3, 2) DEFAULT 0.00 COMMENT 'Avaliação (0-5)',
    total_services INT DEFAULT 0 COMMENT 'Total de serviços prestados',
    
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (laboratory_id) REFERENCES laboratories(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_laboratory (laboratory_id),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Fornecedores de serviços de calibração';
