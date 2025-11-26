-- ============================================================================
-- Views
-- Descrição: Views para consultas otimizadas
-- Data: 2025-11-26
-- ============================================================================

-- ============================================================================
-- VIEW: Status de calibração dos equipamentos
-- ============================================================================
CREATE OR REPLACE VIEW v_equipment_calibration_status AS
SELECT 
    e.id,
    e.internal_code,
    e.manufacturer,
    e.model,
    e.serial_number,
    e.asset_type,
    e.category_1,
    e.category_2,
    e.priority,
    e.status as equipment_status,
    e.is_calibrated,
    e.next_calibration_due_date,
    
    -- Organização
    o.id as organization_id,
    o.name as organization_name,
    o.code as organization_code,
    o.type as organization_type,
    
    -- Status de calibração calculado
    CASE 
        WHEN e.next_calibration_due_date IS NULL THEN 'SEM_DATA'
        WHEN e.next_calibration_due_date < CURDATE() THEN 'VENCIDO'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'VENCE_EM_30_DIAS'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 60 DAY) THEN 'VENCE_EM_60_DIAS'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 90 DAY) THEN 'VENCE_EM_90_DIAS'
        ELSE 'OK'
    END as calibration_status,
    
    -- Dias até vencimento (negativo se vencido)
    DATEDIFF(e.next_calibration_due_date, CURDATE()) as days_until_due,
    
    -- Última calibração
    c.id as last_calibration_id,
    c.calibration_date as last_calibration_date,
    c.status as last_calibration_status,
    c.cost as last_calibration_cost,
    
    -- Laboratório da última calibração
    l.id as last_laboratory_id,
    l.name as last_laboratory_name,
    l.type as last_laboratory_type,
    
    -- Fornecedor
    p.id as provider_id,
    p.name as provider_name,
    
    -- Timestamps
    e.created_at,
    e.updated_at
    
FROM equipment e
LEFT JOIN organizations o ON e.organization_id = o.id
LEFT JOIN calibrations c ON e.last_calibration_id = c.id
LEFT JOIN laboratories l ON c.laboratory_id = l.id
LEFT JOIN providers p ON e.provider_id = p.id
WHERE e.status = 'active';

-- ============================================================================
-- VIEW: Dashboard de serviços
-- ============================================================================
CREATE OR REPLACE VIEW v_services_dashboard AS
SELECT 
    s.id,
    s.service_number,
    s.service_type,
    s.status,
    s.priority,
    
    -- Datas
    s.requested_date,
    s.expected_completion_date,
    s.actual_completion_date,
    
    -- Cálculo de prazo
    DATEDIFF(s.expected_completion_date, CURDATE()) as days_until_deadline,
    
    -- Equipamento
    e.id as equipment_id,
    e.internal_code as equipment_code,
    e.manufacturer as equipment_manufacturer,
    e.model as equipment_model,
    
    -- Organizações
    req_org.id as requester_organization_id,
    req_org.name as requester_organization,
    req_org.code as requester_org_code,
    exec_org.id as executor_organization_id,
    exec_org.name as executor_organization,
    exec_org.code as executor_org_code,
    
    -- Custos
    s.estimated_cost,
    s.actual_cost,
    
    -- Status de deadline calculado
    CASE 
        WHEN s.status IN ('completed', 'cancelled') THEN 'Concluído'
        WHEN s.expected_completion_date < CURDATE() THEN 'ATRASADO'
        WHEN DATEDIFF(s.expected_completion_date, CURDATE()) <= 3 THEN 'URGENTE'
        WHEN DATEDIFF(s.expected_completion_date, CURDATE()) <= 7 THEN 'ATENÇÃO'
        ELSE 'No prazo'
    END as deadline_status,
    
    s.created_at,
    s.updated_at
    
FROM services s
LEFT JOIN equipment e ON s.equipment_id = e.id
LEFT JOIN organizations req_org ON s.requester_organization_id = req_org.id
LEFT JOIN organizations exec_org ON s.executor_organization_id = exec_org.id
WHERE s.status NOT IN ('completed', 'cancelled');

-- ============================================================================
-- VIEW: Relatório de calibrações por período
-- ============================================================================
CREATE OR REPLACE VIEW v_calibrations_report AS
SELECT 
    c.id,
    c.calibration_date,
    c.calibration_type,
    c.status,
    c.cost,
    c.pass_fail,
    
    -- Equipamento
    e.internal_code,
    e.manufacturer,
    e.model,
    e.asset_type,
    e.priority,
    
    -- Organização
    o.name as organization_name,
    o.code as organization_code,
    
    -- Laboratório
    l.name as laboratory_name,
    l.type as laboratory_type,
    l.is_accredited,
    
    -- Certificado
    cert.certificate_number,
    cert.issue_date as certificate_issue_date,
    cert.validity_to as certificate_validity_to,
    
    -- Métricas
    YEAR(c.calibration_date) as calibration_year,
    MONTH(c.calibration_date) as calibration_month,
    QUARTER(c.calibration_date) as calibration_quarter,
    
    c.created_at,
    c.updated_at
    
FROM calibrations c
JOIN equipment e ON c.equipment_id = e.id
JOIN organizations o ON e.organization_id = o.id
LEFT JOIN laboratories l ON c.laboratory_id = l.id
LEFT JOIN certificates cert ON c.certificate_id = cert.id;

-- ============================================================================
-- VIEW: Hierarquia organizacional completa
-- ============================================================================
CREATE OR REPLACE VIEW v_organization_hierarchy AS
WITH RECURSIVE org_tree AS (
    -- Base: Organizações de nível superior (OM)
    SELECT 
        id,
        code,
        name,
        type,
        parent_id,
        1 as level,
        CAST(name AS CHAR(500)) as path,
        CAST(code AS CHAR(200)) as code_path
    FROM organizations
    WHERE parent_id IS NULL
    
    UNION ALL
    
    -- Recursivo: Filhos de cada organização
    SELECT 
        o.id,
        o.code,
        o.name,
        o.type,
        o.parent_id,
        ot.level + 1,
        CONCAT(ot.path, ' > ', o.name),
        CONCAT(ot.code_path, ' > ', o.code)
    FROM organizations o
    JOIN org_tree ot ON o.parent_id = ot.id
)
SELECT 
    id,
    code,
    name,
    type,
    parent_id,
    level,
    path as hierarchy_path,
    code_path as hierarchy_code_path,
    CONCAT(REPEAT('  ', level - 1), name) as indented_name
FROM org_tree
ORDER BY code_path;

-- ============================================================================
-- VIEW: Dashboard executivo (KPIs)
-- ============================================================================
CREATE OR REPLACE VIEW v_executive_dashboard AS
SELECT 
    (SELECT COUNT(*) FROM equipment WHERE status = 'active') as total_equipment_active,
    
    (SELECT COUNT(*) FROM equipment 
     WHERE status = 'active' 
     AND next_calibration_due_date < CURDATE()) as equipment_overdue,
    
    (SELECT COUNT(*) FROM equipment 
     WHERE status = 'active' 
     AND next_calibration_due_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)) as equipment_due_30_days,
    
    (SELECT COUNT(*) FROM calibrations 
     WHERE status IN ('pending', 'scheduled', 'in_progress')) as calibrations_pending,
    
    (SELECT COUNT(*) FROM services 
     WHERE status IN ('pending', 'approved', 'in_progress')) as services_active,
    
    (SELECT COUNT(*) FROM services 
     WHERE status IN ('pending', 'approved', 'in_progress')
     AND expected_completion_date < CURDATE()) as services_overdue,
    
    (SELECT SUM(cost) FROM calibrations 
     WHERE status IN ('completed', 'approved')
     AND YEAR(calibration_date) = YEAR(CURDATE())) as calibration_costs_year,
    
    (SELECT SUM(cost) FROM calibrations 
     WHERE status IN ('completed', 'approved')
     AND YEAR(calibration_date) = YEAR(CURDATE())
     AND MONTH(calibration_date) = MONTH(CURDATE())) as calibration_costs_month,
    
    (SELECT COUNT(DISTINCT user_id) FROM notifications 
     WHERE is_read = FALSE) as users_with_unread_notifications,
    
    (SELECT COUNT(*) FROM notifications 
     WHERE is_read = FALSE 
     AND priority = 'critical') as critical_notifications;

-- Verificação
SELECT 'Views criadas com sucesso!' as status;

-- Testar views
SELECT * FROM v_executive_dashboard;

SELECT organization_name, calibration_status, COUNT(*) as total
FROM v_equipment_calibration_status
GROUP BY organization_name, calibration_status
ORDER BY organization_name, calibration_status;
