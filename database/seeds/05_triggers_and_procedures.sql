-- ============================================================================
-- Triggers e Stored Procedures
-- Descrição: Automações e lógica de negócio
-- Data: 2025-11-26
-- ============================================================================

DELIMITER $$

-- ============================================================================
-- TRIGGER: Atualizar equipamento após conclusão de calibração
-- ============================================================================
DROP TRIGGER IF EXISTS trg_calibration_update_equipment$$

CREATE TRIGGER trg_calibration_update_equipment
AFTER UPDATE ON calibrations
FOR EACH ROW
BEGIN
    -- Quando calibração é completada ou aprovada
    IF NEW.status IN ('completed', 'approved') AND OLD.status != NEW.status THEN
        UPDATE equipment e
        SET 
            e.last_calibration_id = NEW.id,
            e.next_calibration_due_date = DATE_ADD(
                NEW.calibration_date, 
                INTERVAL e.calibration_default_interval_days DAY
            ),
            e.is_calibrated = TRUE,
            e.updated_at = CURRENT_TIMESTAMP
        WHERE e.id = NEW.equipment_id;
    END IF;
    
    -- Quando calibração é rejeitada
    IF NEW.status = 'rejected' AND OLD.status != 'rejected' THEN
        UPDATE equipment e
        SET 
            e.is_calibrated = FALSE,
            e.status = 'quarantined',
            e.updated_at = CURRENT_TIMESTAMP
        WHERE e.id = NEW.equipment_id;
    END IF;
END$$

-- ============================================================================
-- TRIGGER: Auditoria de equipamentos
-- ============================================================================
DROP TRIGGER IF EXISTS trg_equipment_audit_update$$

CREATE TRIGGER trg_equipment_audit_update
AFTER UPDATE ON equipment
FOR EACH ROW
BEGIN
    -- Registrar mudanças significativas
    IF OLD.status != NEW.status OR 
       OLD.location != NEW.location OR 
       OLD.organization_id != NEW.organization_id OR
       OLD.priority != NEW.priority THEN
        
        INSERT INTO audit_logs (
            user_id,
            action,
            entity_type,
            entity_id,
            old_values,
            new_values,
            changes_summary,
            status
        ) VALUES (
            NEW.updated_by,
            'UPDATE',
            'equipment',
            NEW.id,
            JSON_OBJECT(
                'status', OLD.status,
                'location', OLD.location,
                'organization_id', OLD.organization_id,
                'priority', OLD.priority,
                'is_calibrated', OLD.is_calibrated
            ),
            JSON_OBJECT(
                'status', NEW.status,
                'location', NEW.location,
                'organization_id', NEW.organization_id,
                'priority', NEW.priority,
                'is_calibrated', NEW.is_calibrated
            ),
            CONCAT('Equipamento ', NEW.internal_code, ' atualizado'),
            'success'
        );
    END IF;
END$$

-- ============================================================================
-- TRIGGER: Auditoria de calibrações
-- ============================================================================
DROP TRIGGER IF EXISTS trg_calibration_audit_update$$

CREATE TRIGGER trg_calibration_audit_update
AFTER UPDATE ON calibrations
FOR EACH ROW
BEGIN
    IF OLD.status != NEW.status THEN
        INSERT INTO audit_logs (
            action,
            entity_type,
            entity_id,
            old_values,
            new_values,
            changes_summary,
            status
        ) VALUES (
            'UPDATE',
            'calibration',
            NEW.id,
            JSON_OBJECT('status', OLD.status, 'pass_fail', OLD.pass_fail),
            JSON_OBJECT('status', NEW.status, 'pass_fail', NEW.pass_fail),
            CONCAT('Calibração ID ', NEW.id, ' mudou de ', OLD.status, ' para ', NEW.status),
            'success'
        );
    END IF;
END$$

-- ============================================================================
-- PROCEDURE: Gerar número de ordem de serviço
-- ============================================================================
DROP PROCEDURE IF EXISTS sp_generate_service_number$$

CREATE PROCEDURE sp_generate_service_number(OUT service_num VARCHAR(50))
BEGIN
    DECLARE next_id INT;
    
    -- Obter próximo ID
    SELECT COALESCE(MAX(id), 0) + 1 INTO next_id FROM services;
    
    -- Formato: OS-YYYY-NNNNN
    SET service_num = CONCAT(
        'OS-',
        YEAR(CURDATE()),
        '-',
        LPAD(next_id, 5, '0')
    );
END$$

-- ============================================================================
-- PROCEDURE: Gerar número de certificado
-- ============================================================================
DROP PROCEDURE IF EXISTS sp_generate_certificate_number$$

CREATE PROCEDURE sp_generate_certificate_number(OUT cert_num VARCHAR(50))
BEGIN
    DECLARE next_id INT;
    
    -- Obter próximo ID
    SELECT COALESCE(MAX(id), 0) + 1 INTO next_id FROM certificates;
    
    -- Formato: CERT-YYYY-NNNNN
    SET cert_num = CONCAT(
        'CERT-',
        YEAR(CURDATE()),
        '-',
        LPAD(next_id, 5, '0')
    );
END$$

-- ============================================================================
-- PROCEDURE: Agendar calibrações em lote
-- ============================================================================
DROP PROCEDURE IF EXISTS sp_schedule_calibrations_batch$$

CREATE PROCEDURE sp_schedule_calibrations_batch(
    IN p_months_ahead INT,
    IN p_organization_id INT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_equipment_id INT;
    DECLARE v_next_due DATE;
    DECLARE v_priority VARCHAR(20);
    DECLARE v_organization_id INT;
    DECLARE v_internal_code VARCHAR(50);
    
    DECLARE cur CURSOR FOR 
        SELECT 
            id, 
            next_calibration_due_date, 
            priority,
            organization_id,
            internal_code
        FROM equipment
        WHERE status = 'active'
        AND next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL p_months_ahead MONTH)
        AND (p_organization_id IS NULL OR organization_id = p_organization_id)
        AND id NOT IN (
            SELECT equipment_id 
            FROM calibrations 
            WHERE status IN ('scheduled', 'in_progress', 'pending')
        );
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_equipment_id, v_next_due, v_priority, v_organization_id, v_internal_code;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Criar calibração agendada
        INSERT INTO calibrations (
            equipment_id,
            scheduled_date,
            calibration_date,
            calibration_type,
            status
        ) VALUES (
            v_equipment_id,
            v_next_due,
            v_next_due,
            'routine',
            'scheduled'
        );
        
        -- Criar notificações para usuários da organização
        INSERT INTO notifications (
            user_id,
            notification_type,
            title,
            message,
            related_entity_type,
            related_entity_id,
            priority
        )
        SELECT 
            u.id,
            'calibration_due',
            'Calibração Agendada',
            CONCAT(
                'Equipamento ', v_internal_code, 
                ' agendado para calibração em ', 
                DATE_FORMAT(v_next_due, '%d/%m/%Y')
            ),
            'equipment',
            v_equipment_id,
            CASE v_priority
                WHEN 'critica' THEN 'critical'
                WHEN 'urgente' THEN 'high'
                ELSE 'medium'
            END
        FROM users u
        WHERE u.organization_id = v_organization_id
        AND u.role IN ('admin', 'manager', 'technician')
        AND u.is_active = TRUE;
        
    END LOOP;
    
    CLOSE cur;
    
    -- Retornar total de calibrações agendadas
    SELECT ROW_COUNT() as total_scheduled;
END$$

-- ============================================================================
-- PROCEDURE: Enviar notificações de calibrações vencidas
-- ============================================================================
DROP PROCEDURE IF EXISTS sp_notify_overdue_calibrations$$

CREATE PROCEDURE sp_notify_overdue_calibrations()
BEGIN
    -- Criar notificações para equipamentos com calibração vencida
    INSERT INTO notifications (
        user_id,
        notification_type,
        title,
        message,
        related_entity_type,
        related_entity_id,
        priority
    )
    SELECT 
        u.id,
        'calibration_overdue',
        'Calibração VENCIDA',
        CONCAT(
            'URGENTE: Equipamento ', e.internal_code,
            ' está com calibração vencida desde ',
            DATE_FORMAT(e.next_calibration_due_date, '%d/%m/%Y'),
            ' (', DATEDIFF(CURDATE(), e.next_calibration_due_date), ' dias)'
        ),
        'equipment',
        e.id,
        CASE 
            WHEN e.priority IN ('critica', 'urgente') THEN 'critical'
            ELSE 'high'
        END
    FROM equipment e
    JOIN users u ON u.organization_id = e.organization_id
    WHERE e.status = 'active'
    AND e.next_calibration_due_date < CURDATE()
    AND u.role IN ('admin', 'manager', 'technician')
    AND u.is_active = TRUE
    -- Não criar notificação duplicada nos últimos 7 dias
    AND NOT EXISTS (
        SELECT 1 FROM notifications n
        WHERE n.user_id = u.id
        AND n.related_entity_id = e.id
        AND n.notification_type = 'calibration_overdue'
        AND n.created_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
    );
    
    SELECT ROW_COUNT() as notifications_sent;
END$$

DELIMITER ;

-- Verificação
SELECT 'Triggers e Procedures criados com sucesso!' as status;

SHOW TRIGGERS;
SHOW PROCEDURE STATUS WHERE Db = DATABASE();
