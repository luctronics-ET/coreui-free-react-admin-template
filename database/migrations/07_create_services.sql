-- ============================================================================
-- Tabela: services
-- Descrição: Ordens de serviço (integração com SISCHAMADOS)
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_number VARCHAR(50) NOT NULL UNIQUE COMMENT 'Número da OS (ex: OS-2025-001)',
    
    -- Tipo de serviço
    service_type ENUM(
        'delineamento',
        'transporte',
        'recebimento',
        'avaliacao_tecnica',
        'manutencao_preventiva',
        'manutencao_preditiva',
        'manutencao_corretiva',
        'modificacao_tecnica',
        'baixa',
        'armazenamento',
        'transferencia',
        'doacao',
        'calibracao'
    ) NOT NULL COMMENT 'Tipo da ordem de serviço',
    
    -- Relacionamentos
    equipment_id INT NULL COMMENT 'Equipamento relacionado',
    calibration_id INT NULL COMMENT 'Calibração relacionada (se aplicável)',
    
    -- Responsáveis
    requester_id INT NULL COMMENT 'Usuário solicitante',
    requester_organization_id INT NULL COMMENT 'Seção solicitante',
    executor_id INT NULL COMMENT 'Usuário executor',
    executor_organization_id INT NULL COMMENT 'Seção executora',
    
    -- Datas e prazos
    requested_date DATETIME NOT NULL COMMENT 'Data/hora da solicitação',
    start_date DATETIME COMMENT 'Data/hora de início',
    expected_completion_date DATE COMMENT 'Data prevista de conclusão',
    actual_completion_date DATETIME COMMENT 'Data/hora real de conclusão',
    deadline_days INT COMMENT 'Prazo em dias',
    
    -- Detalhes
    instructions TEXT COMMENT 'Instruções específicas',
    inputs TEXT COMMENT 'Materiais/documentos de entrada',
    outputs TEXT COMMENT 'Resultados/entregas',
    
    -- Status
    status ENUM('pending', 'approved', 'in_progress', 'completed', 'cancelled', 'on_hold') 
        DEFAULT 'pending' COMMENT 'Status da OS',
    priority ENUM('critica', 'urgente', 'alta', 'media', 'normal') 
        DEFAULT 'normal' COMMENT 'Prioridade',
    
    -- Custo
    estimated_cost DECIMAL(10, 2) COMMENT 'Custo estimado',
    actual_cost DECIMAL(10, 2) COMMENT 'Custo real',
    
    -- Observações
    notes TEXT COMMENT 'Observações gerais',
    cancellation_reason TEXT COMMENT 'Motivo do cancelamento',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE SET NULL,
    FOREIGN KEY (requester_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (executor_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    -- Índices
    INDEX idx_service_number (service_number),
    INDEX idx_service_type (service_type),
    INDEX idx_equipment (equipment_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_dates (requested_date, expected_completion_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Ordens de serviço e tipos de manutenção';

-- Adicionar FK para calibration_id depois que tabela calibrations existir
-- Ver arquivo 10_add_foreign_keys.sql
