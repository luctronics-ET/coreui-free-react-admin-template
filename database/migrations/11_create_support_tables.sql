-- ============================================================================
-- Tabelas de Suporte
-- Descrição: equipment_movements, notifications, audit_logs, reports
-- Data: 2025-11-26
-- ============================================================================

-- Tabela de movimentação de equipamentos
CREATE TABLE IF NOT EXISTS equipment_movements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL COMMENT 'Equipamento movimentado',
    
    -- Tipo de movimentação
    movement_type ENUM(
        'acquisition',
        'transfer',
        'loan',
        'return',
        'maintenance',
        'calibration',
        'storage',
        'decommission'
    ) NOT NULL COMMENT 'Tipo de movimentação',
    
    -- Origem e destino
    from_organization_id INT NULL COMMENT 'Organização de origem',
    to_organization_id INT NULL COMMENT 'Organização de destino',
    from_location VARCHAR(100) COMMENT 'Localização de origem',
    to_location VARCHAR(100) COMMENT 'Localização de destino',
    
    -- Responsáveis
    authorized_by_user_id INT COMMENT 'Usuário que autorizou',
    received_by_user_id INT COMMENT 'Usuário que recebeu',
    
    -- Documentação
    document_number VARCHAR(50) COMMENT 'Número do documento',
    service_id INT NULL COMMENT 'Vinculação com serviço',
    
    -- Datas
    movement_date DATETIME NOT NULL COMMENT 'Data/hora da movimentação',
    expected_return_date DATE COMMENT 'Data prevista de retorno',
    actual_return_date DATETIME COMMENT 'Data real de retorno',
    
    -- Condições
    condition_before TEXT COMMENT 'Condição antes da movimentação',
    condition_after TEXT COMMENT 'Condição após a movimentação',
    
    notes TEXT COMMENT 'Observações',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (from_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (to_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_equipment (equipment_id),
    INDEX idx_movement_type (movement_type),
    INDEX idx_movement_date (movement_date),
    INDEX idx_from_org (from_organization_id),
    INDEX idx_to_org (to_organization_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Histórico de movimentação de equipamentos';

-- Tabela de notificações
CREATE TABLE IF NOT EXISTS notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL COMMENT 'Usuário destinatário',
    organization_id INT NULL COMMENT 'Organização relacionada',
    
    -- Tipo e conteúdo
    notification_type ENUM(
        'calibration_due',
        'calibration_overdue',
        'service_pending',
        'equipment_movement',
        'certificate_issued',
        'system_alert',
        'general'
    ) NOT NULL COMMENT 'Tipo de notificação',
    
    title VARCHAR(200) NOT NULL COMMENT 'Título',
    message TEXT NOT NULL COMMENT 'Mensagem',
    
    -- Relacionamentos
    related_entity_type VARCHAR(50) COMMENT 'Tipo da entidade (equipment, service, etc)',
    related_entity_id INT COMMENT 'ID da entidade relacionada',
    
    -- Status
    is_read BOOLEAN DEFAULT FALSE COMMENT 'Foi lida?',
    read_at DATETIME COMMENT 'Data/hora da leitura',
    
    -- Prioridade
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium' COMMENT 'Prioridade',
    
    -- Validade
    expires_at DATETIME COMMENT 'Data/hora de expiração',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_user (user_id),
    INDEX idx_is_read (is_read),
    INDEX idx_type (notification_type),
    INDEX idx_priority (priority),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Sistema de notificações';

-- Tabela de auditoria
CREATE TABLE IF NOT EXISTS audit_logs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    
    -- Identificação
    user_id INT NULL COMMENT 'Usuário que executou a ação',
    username VARCHAR(100) COMMENT 'Nome do usuário',
    
    -- Ação
    action VARCHAR(50) NOT NULL COMMENT 'CREATE, UPDATE, DELETE, LOGIN, etc',
    entity_type VARCHAR(50) NOT NULL COMMENT 'equipment, calibration, service, etc',
    entity_id INT COMMENT 'ID da entidade',
    
    -- Contexto
    organization_id INT NULL COMMENT 'Organização relacionada',
    ip_address VARCHAR(45) COMMENT 'Endereço IP',
    user_agent TEXT COMMENT 'User agent do navegador',
    
    -- Dados
    old_values JSON COMMENT 'Valores antes da alteração',
    new_values JSON COMMENT 'Valores após a alteração',
    changes_summary TEXT COMMENT 'Resumo das alterações',
    
    -- Resultado
    status ENUM('success', 'failure', 'warning') DEFAULT 'success' COMMENT 'Status da operação',
    error_message TEXT COMMENT 'Mensagem de erro (se houver)',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_user (user_id),
    INDEX idx_action (action),
    INDEX idx_entity (entity_type, entity_id),
    INDEX idx_created_at (created_at),
    INDEX idx_organization (organization_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Auditoria completa de todas as operações';

-- Tabela de relatórios
CREATE TABLE IF NOT EXISTS reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    report_code VARCHAR(50) NOT NULL UNIQUE COMMENT 'Código único do relatório',
    title VARCHAR(200) NOT NULL COMMENT 'Título do relatório',
    
    -- Tipo
    report_type ENUM(
        'calibration_schedule',
        'equipment_inventory',
        'cost_analysis',
        'compliance_audit',
        'service_performance',
        'equipment_history',
        'custom'
    ) NOT NULL COMMENT 'Tipo de relatório',
    
    -- Parâmetros
    filters JSON COMMENT 'Filtros aplicados em JSON',
    date_range_start DATE COMMENT 'Início do período',
    date_range_end DATE COMMENT 'Fim do período',
    
    -- Relacionamentos
    organization_id INT NULL COMMENT 'Organização filtrada',
    equipment_ids JSON COMMENT 'IDs de equipamentos filtrados',
    
    -- Geração
    generated_by_user_id INT NOT NULL COMMENT 'Usuário que gerou',
    generation_date DATETIME NOT NULL COMMENT 'Data/hora de geração',
    
    -- Arquivo
    file_format ENUM('pdf', 'excel', 'csv', 'json') DEFAULT 'pdf' COMMENT 'Formato do arquivo',
    file_path VARCHAR(255) COMMENT 'Caminho do arquivo gerado',
    file_size_kb INT COMMENT 'Tamanho do arquivo em KB',
    
    -- Estatísticas
    total_records INT COMMENT 'Total de registros no relatório',
    summary JSON COMMENT 'Resumo estatístico em JSON',
    
    -- Status
    status ENUM('generating', 'completed', 'failed') DEFAULT 'generating' COMMENT 'Status da geração',
    error_message TEXT COMMENT 'Mensagem de erro (se houver)',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (generated_by_user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_report_code (report_code),
    INDEX idx_type (report_type),
    INDEX idx_organization (organization_id),
    INDEX idx_generation_date (generation_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Histórico de relatórios gerados';
