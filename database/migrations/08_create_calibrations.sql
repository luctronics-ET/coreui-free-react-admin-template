-- ============================================================================
-- Tabela: calibrations
-- Descrição: Eventos de calibração
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS calibrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Relacionamentos
    equipment_id INT NOT NULL COMMENT 'Equipamento calibrado',
    provider_id INT NULL COMMENT 'Fornecedor do serviço',
    laboratory_id INT NULL COMMENT 'Laboratório que realizou',
    service_id INT NULL COMMENT 'Vinculação com ordem de serviço',
    performed_by_user_id INT NULL COMMENT 'Usuário que executou (interno)',
    
    -- Datas
    calibration_date DATETIME NOT NULL COMMENT 'Data/hora da calibração',
    scheduled_date DATETIME COMMENT 'Data agendada',
    
    -- Tipo e método
    calibration_type ENUM('initial', 'routine', 'repair', 'verification') 
        DEFAULT 'routine' COMMENT 'Tipo de calibração',
    calibration_method VARCHAR(100) COMMENT 'Método/norma utilizada',
    
    -- Financeiro
    cost DECIMAL(10, 2) DEFAULT 0 COMMENT 'Custo da calibração',
    invoice_number VARCHAR(50) COMMENT 'Número da nota fiscal',
    
    -- Status
    status ENUM('pending', 'scheduled', 'in_progress', 'completed', 'approved', 'rejected') 
        DEFAULT 'pending' COMMENT 'Status da calibração',
    
    -- Resultados
    results_summary TEXT COMMENT 'Resumo dos resultados',
    pass_fail BOOLEAN COMMENT 'Aprovado (TRUE) / Reprovado (FALSE)',
    certificate_id INT NULL COMMENT 'ID do certificado emitido',
    
    -- Condições ambientais
    environmental_temperature VARCHAR(50) COMMENT 'Temperatura ambiente',
    environmental_humidity VARCHAR(50) COMMENT 'Umidade relativa',
    environmental_pressure VARCHAR(50) COMMENT 'Pressão atmosférica',
    
    -- Notificações
    notification_sent BOOLEAN DEFAULT FALSE COMMENT 'Notificação enviada?',
    notification_sent_at DATETIME COMMENT 'Data/hora do envio da notificação',
    
    -- Observações
    notes TEXT COMMENT 'Observações gerais',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    FOREIGN KEY (laboratory_id) REFERENCES laboratories(id) ON DELETE SET NULL,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_equipment (equipment_id),
    INDEX idx_status (status),
    INDEX idx_calibration_date (calibration_date),
    INDEX idx_scheduled_date (scheduled_date),
    INDEX idx_laboratory (laboratory_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Eventos de calibração';
