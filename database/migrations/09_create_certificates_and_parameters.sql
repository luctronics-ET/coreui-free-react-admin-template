-- ============================================================================
-- Tabelas: certificates e measurement_parameters
-- Descrição: Certificados de calibração e parâmetros de medição
-- Data: 2025-11-26
-- ============================================================================

-- Tabela de certificados
CREATE TABLE IF NOT EXISTS certificates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    certificate_number VARCHAR(50) NOT NULL UNIQUE COMMENT 'Número único do certificado',
    calibration_id INT NOT NULL COMMENT 'Calibração relacionada',
    issue_date DATE NOT NULL COMMENT 'Data de emissão',
    validity_from DATE NOT NULL COMMENT 'Início da validade',
    validity_to DATE NOT NULL COMMENT 'Fim da validade',
    accreditation_declaration TEXT COMMENT 'Declaração de acreditação',
    traceability_statement TEXT COMMENT 'Declaração de rastreabilidade',
    performed_by VARCHAR(100) COMMENT 'Responsável pela execução',
    approved_by VARCHAR(100) COMMENT 'Responsável pela aprovação',
    status VARCHAR(20) DEFAULT 'draft' COMMENT 'Status do certificado',
    digital_signature TEXT COMMENT 'Assinatura digital',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    
    -- Índices
    INDEX idx_certificate_number (certificate_number),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Certificados de calibração';

-- Tabela de parâmetros de medição
CREATE TABLE IF NOT EXISTS measurement_parameters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    calibration_id INT NOT NULL COMMENT 'Calibração relacionada',
    parameter_name VARCHAR(100) NOT NULL COMMENT 'Nome do parâmetro',
    nominal_value DECIMAL(15, 6) COMMENT 'Valor nominal',
    measured_value DECIMAL(15, 6) COMMENT 'Valor medido',
    unit VARCHAR(20) COMMENT 'Unidade de medida',
    tolerance DECIMAL(15, 6) COMMENT 'Tolerância',
    uncertainty DECIMAL(15, 6) COMMENT 'Incerteza de medição',
    pass_fail BOOLEAN DEFAULT TRUE COMMENT 'Aprovado?',
    remarks TEXT COMMENT 'Observações',
    
    -- Foreign Keys
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    
    -- Índices
    INDEX idx_calibration (calibration_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Parâmetros de medição de calibrações';

-- Tabela de relacionamento calibração-padrões
CREATE TABLE IF NOT EXISTS calibration_reference_standards (
    calibration_id INT NOT NULL COMMENT 'Calibração',
    reference_standard_id VARCHAR(50) NOT NULL COMMENT 'Padrão de referência',
    PRIMARY KEY (calibration_id, reference_standard_id),
    
    -- Foreign Keys
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    FOREIGN KEY (reference_standard_id) REFERENCES reference_standards(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Relacionamento N:N calibrações-padrões';
