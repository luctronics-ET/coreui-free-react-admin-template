# 🏗️ Arquitetura de Database e Backend - Sistema CMASM

## 📋 Sumário Executivo

Este documento apresenta uma análise completa da estrutura de dados do sistema CMASM (Centro de Mísseis e Armas Submarinas da Marinha), incluindo:
- ✅ Análise da estrutura atual
- 🔧 Melhorias e otimizações propostas
- 🆕 Novas tabelas e relacionamentos sugeridos
- 📊 Diagramas de relacionamento
- 🔐 Estratégias de segurança e auditoria

---

## 🎯 Estrutura Organizacional Completa

### Hierarquia do CMASM

```
OM (Organização Militar)
└── DEPARTAMENTO
    └── DIVISÃO
        └── SEÇÃO
```

#### Departamentos Principais

**1. DEPARTAMENTO DE ARMAS**
- Divisão MK-48
- Divisão MK-46
- Divisão F-21
- Divisão EXOCET
- Divisão MINAS E BOMBAS
- Divisão MISSEIS ESPECIAIS

**2. DEPARTAMENTO DE INFRAESTRUTURA**
- Divisão: Manutenção Especializada
  - Seção: Carpintaria
  - Seção: Metalurgia
  - Seção: Pintura Industrial
  - Seção: Máquinas
  - Seção: Refrigeração
  - Seção: Eletrônica

---

## 📊 Schema Database Atual (Análise)

### ✅ Tabelas Existentes

#### 1. **equipment** - Equipamentos
```sql
CREATE TABLE equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    internal_code VARCHAR(50) NOT NULL UNIQUE,
    manufacturer VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    asset_type VARCHAR(50) NOT NULL,
    classification VARCHAR(50),
    location VARCHAR(100),
    acquisition_date DATE,
    calibration_default_interval_days INT DEFAULT 365,
    last_calibration_id INT NULL,
    next_calibration_due_date DATE,
    status VARCHAR(20) DEFAULT 'active',
    provider_id INT NULL,
    provider_contact VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

**Pontos fortes:**
- ✅ Rastreamento de próxima calibração
- ✅ Relacionamento com fornecedor
- ✅ Timestamps de auditoria

**Melhorias necessárias:**
- ❌ Falta relacionamento com estrutura organizacional (OM, Departamento, Divisão, Seção)
- ❌ Falta campos físicos (peso, dimensões, acessórios)
- ❌ Falta prioridade do equipamento
- ❌ Falta flag de equipamento calibrado
- ❌ Falta histórico de movimentação

---

## 🔧 Estrutura Database OTIMIZADA

### 1. **Tabela: organizations** (NOVA)
```sql
CREATE TABLE organizations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE COMMENT 'CMASM, CMS, etc',
    name VARCHAR(200) NOT NULL,
    type ENUM('om', 'department', 'division', 'section') NOT NULL,
    parent_id INT NULL COMMENT 'Hierarquia organizacional',
    responsible_officer VARCHAR(100),
    contact_phone VARCHAR(20),
    contact_email VARCHAR(100),
    address TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (parent_id) REFERENCES organizations(id) ON DELETE SET NULL,
    INDEX idx_code (code),
    INDEX idx_type (type),
    INDEX idx_parent (parent_id),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Estrutura hierárquica OM > Depto > Divisão > Seção';
```

**Exemplo de dados:**
```sql
INSERT INTO organizations (code, name, type, parent_id) VALUES
('CMASM', 'Centro de Mísseis e Armas Submarinas da Marinha', 'om', NULL),
('DEPT-ARMAS', 'Departamento de Armas', 'department', 1),
('DIV-MK48', 'Divisão MK-48', 'division', 2),
('DEPT-INFRA', 'Departamento de Infraestrutura', 'department', 1),
('DIV-MANUT', 'Divisão Manutenção Especializada', 'division', 4),
('SEC-ELETRON', 'Seção Eletrônica', 'section', 5);
```

---

### 2. **Tabela: equipment** (MELHORADA)
```sql
CREATE TABLE equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    internal_code VARCHAR(50) NOT NULL UNIQUE COMMENT 'Código interno CMASM',
    
    -- Informações básicas
    manufacturer VARCHAR(100) COMMENT 'HP, FLUKE, MINIPA, etc',
    model VARCHAR(100),
    serial_number VARCHAR(100),
    
    -- Categorização
    category_1 ENUM('eletrico', 'mecanico') NOT NULL,
    category_2 VARCHAR(100) COMMENT 'multimetro_digital, fonte_dc, torquimetro, etc',
    asset_type VARCHAR(50) NOT NULL,
    classification VARCHAR(50),
    
    -- Características físicas (NOVO)
    weight_grams DECIMAL(10, 2) COMMENT 'Peso em gramas',
    dimensions VARCHAR(50) COMMENT 'ex: 150x80x40mm',
    accessories TEXT COMMENT 'Lista de acessórios inclusos',
    
    -- Localização e responsabilidade
    organization_id INT NOT NULL COMMENT 'Seção/Divisão responsável',
    location VARCHAR(100) COMMENT 'Localização física específica',
    
    -- Calibração
    acquisition_date DATE,
    calibration_default_interval_days INT DEFAULT 365,
    last_calibration_id INT NULL,
    next_calibration_due_date DATE,
    is_calibrated BOOLEAN DEFAULT FALSE COMMENT 'Status atual de calibração',
    
    -- Prioridade (NOVO)
    priority ENUM('critica', 'urgente', 'alta', 'media', 'normal') DEFAULT 'normal',
    
    -- Status
    status ENUM('active', 'quarantined', 'decommissioned', 'in_maintenance', 'transferred') DEFAULT 'active',
    
    -- Fornecedor
    provider_id INT NULL,
    provider_contact VARCHAR(100),
    
    -- Observações
    notes TEXT,
    
    -- Auditoria
    created_by INT NULL,
    updated_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE RESTRICT,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    FOREIGN KEY (last_calibration_id) REFERENCES calibrations(id) ON DELETE SET NULL,
    
    INDEX idx_internal_code (internal_code),
    INDEX idx_category (category_1, category_2),
    INDEX idx_organization (organization_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_next_calibration (next_calibration_due_date),
    INDEX idx_is_calibrated (is_calibrated),
    
    FULLTEXT idx_search (manufacturer, model, serial_number, internal_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Equipamentos e instrumentos de medição';
```

---

### 3. **Tabela: laboratories** (NOVA)
```sql
CREATE TABLE laboratories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    type ENUM('internal', 'external') NOT NULL,
    
    -- Informações de contato
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    
    -- Acreditação
    is_accredited BOOLEAN DEFAULT FALSE,
    accreditation_body VARCHAR(100) COMMENT 'INMETRO, RBC, etc',
    accreditation_number VARCHAR(50),
    accreditation_scope TEXT,
    accreditation_valid_until DATE,
    
    -- Especialidades
    specialties JSON COMMENT 'Array de tipos de calibração oferecidos',
    
    -- Comercial
    default_lead_time_days INT DEFAULT 15,
    rating DECIMAL(3, 2) DEFAULT 0.00 COMMENT 'Avaliação 0-5',
    
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_code (code),
    INDEX idx_type (type),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='CMS, BACS, MV METROLOGIA, MSMI, etc';
```

**Exemplos:**
```sql
INSERT INTO laboratories (code, name, type, is_accredited) VALUES
('CMS', 'Centro de Manutenção da Marinha', 'internal', true),
('BACS', 'BACS Laboratório', 'external', true),
('MVMETRO', 'MV Metrologia', 'external', true),
('MSMI', 'MSMI Calibração', 'external', false),
('VISOMES', 'Visomes Metrologia', 'external', true),
('IPTC', 'IPTC Instituto', 'external', true),
('CALIBRARIO', 'Calibrario Ltda', 'external', false);
```

---

### 4. **Tabela: providers** (MELHORADA)
```sql
CREATE TABLE providers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laboratory_id INT NULL COMMENT 'Vinculação opcional com laboratório',
    
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    
    -- Acreditação (caso não seja laboratório)
    accreditation_body VARCHAR(100),
    accreditation_number VARCHAR(50),
    accreditation_scope TEXT,
    
    address TEXT,
    
    -- Comercial (NOVO)
    cnpj VARCHAR(18) UNIQUE,
    contract_number VARCHAR(50),
    contract_valid_until DATE,
    payment_terms VARCHAR(100),
    
    -- Avaliação (NOVO)
    rating DECIMAL(3, 2) DEFAULT 0.00,
    total_services INT DEFAULT 0,
    
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (laboratory_id) REFERENCES laboratories(id) ON DELETE SET NULL,
    INDEX idx_laboratory (laboratory_id),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

---

### 5. **Tabela: services** (NOVA - SUPER IMPORTANTE)
```sql
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_number VARCHAR(50) NOT NULL UNIQUE COMMENT 'Número do serviço/OS',
    
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
    ) NOT NULL,
    
    -- Relacionamentos
    equipment_id INT NULL COMMENT 'Equipamento relacionado',
    calibration_id INT NULL COMMENT 'Calibração relacionada (se aplicável)',
    
    -- Responsáveis
    requester_id INT NULL COMMENT 'Usuário solicitante',
    requester_organization_id INT NULL COMMENT 'Seção solicitante',
    executor_id INT NULL COMMENT 'Usuário executor',
    executor_organization_id INT NULL COMMENT 'Seção executora',
    
    -- Datas e prazos
    requested_date DATETIME NOT NULL,
    start_date DATETIME,
    expected_completion_date DATE,
    actual_completion_date DATETIME,
    deadline_days INT,
    
    -- Detalhes
    instructions TEXT COMMENT 'Instruções específicas',
    inputs TEXT COMMENT 'Materiais/documentos de entrada',
    outputs TEXT COMMENT 'Resultados/entregas',
    
    -- Status
    status ENUM('pending', 'approved', 'in_progress', 'completed', 'cancelled', 'on_hold') DEFAULT 'pending',
    priority ENUM('critica', 'urgente', 'alta', 'media', 'normal') DEFAULT 'normal',
    
    -- Custo
    estimated_cost DECIMAL(10, 2),
    actual_cost DECIMAL(10, 2),
    
    -- Observações
    notes TEXT,
    cancellation_reason TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE SET NULL,
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE SET NULL,
    FOREIGN KEY (requester_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (executor_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    INDEX idx_service_number (service_number),
    INDEX idx_service_type (service_type),
    INDEX idx_equipment (equipment_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_dates (requested_date, expected_completion_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Ordens de serviço e tipos de manutenção';
```

---

### 6. **Tabela: calibrations** (MELHORADA)
```sql
CREATE TABLE calibrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Relacionamentos
    equipment_id INT NOT NULL,
    provider_id INT NULL,
    laboratory_id INT NULL COMMENT 'Laboratório que realizou',
    service_id INT NULL COMMENT 'Vinculação com ordem de serviço',
    performed_by_user_id INT NULL,
    
    -- Datas
    calibration_date DATETIME NOT NULL,
    scheduled_date DATETIME COMMENT 'Data agendada',
    
    -- Tipo e método
    calibration_type ENUM('initial', 'routine', 'repair', 'verification') DEFAULT 'routine',
    calibration_method VARCHAR(100) COMMENT 'Método/norma utilizada',
    
    -- Financeiro
    cost DECIMAL(10, 2) DEFAULT 0,
    invoice_number VARCHAR(50),
    
    -- Status
    status ENUM('pending', 'scheduled', 'in_progress', 'completed', 'approved', 'rejected') DEFAULT 'pending',
    
    -- Resultados
    results_summary TEXT,
    pass_fail BOOLEAN COMMENT 'Aprovado/Reprovado',
    certificate_id INT NULL,
    
    -- Condições ambientais
    environmental_temperature VARCHAR(50),
    environmental_humidity VARCHAR(50),
    environmental_pressure VARCHAR(50) COMMENT 'NOVO',
    
    -- Notificações (NOVO)
    notification_sent BOOLEAN DEFAULT FALSE,
    notification_sent_at DATETIME,
    
    -- Observações
    notes TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    FOREIGN KEY (laboratory_id) REFERENCES laboratories(id) ON DELETE SET NULL,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    
    INDEX idx_equipment (equipment_id),
    INDEX idx_status (status),
    INDEX idx_calibration_date (calibration_date),
    INDEX idx_scheduled_date (scheduled_date),
    INDEX idx_laboratory (laboratory_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

---

### 7. **Tabela: equipment_movements** (NOVA)
```sql
CREATE TABLE equipment_movements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    
    -- Tipo de movimentação
    movement_type ENUM(
        'acquisition',          -- Aquisição
        'transfer',            -- Transferência
        'loan',                -- Empréstimo
        'return',              -- Devolução
        'maintenance',         -- Manutenção
        'calibration',         -- Calibração
        'storage',             -- Armazenamento
        'decommission'         -- Baixa
    ) NOT NULL,
    
    -- Origem e destino
    from_organization_id INT NULL,
    to_organization_id INT NULL,
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    
    -- Responsáveis
    authorized_by_user_id INT,
    received_by_user_id INT,
    
    -- Documentação
    document_number VARCHAR(50),
    service_id INT NULL COMMENT 'Vinculação com serviço',
    
    -- Datas
    movement_date DATETIME NOT NULL,
    expected_return_date DATE,
    actual_return_date DATETIME,
    
    -- Condições
    condition_before TEXT,
    condition_after TEXT,
    
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (from_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (to_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    
    INDEX idx_equipment (equipment_id),
    INDEX idx_movement_type (movement_type),
    INDEX idx_movement_date (movement_date),
    INDEX idx_from_org (from_organization_id),
    INDEX idx_to_org (to_organization_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Histórico de movimentação de equipamentos';
```

---

### 8. **Tabela: users** (MELHORADA)
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Autenticação
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    
    -- Dados pessoais
    full_name VARCHAR(200) NOT NULL,
    rank VARCHAR(50) COMMENT 'Posto/Graduação militar',
    registration_number VARCHAR(50) COMMENT 'Número funcional/matrícula',
    
    -- Organização
    organization_id INT NOT NULL,
    department VARCHAR(100),
    position VARCHAR(100),
    
    -- Contato
    phone VARCHAR(20),
    mobile VARCHAR(20),
    
    -- Permissões
    role ENUM('admin', 'manager', 'technician', 'operator', 'viewer') DEFAULT 'viewer',
    permissions JSON COMMENT 'Permissões específicas',
    
    -- Status
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME,
    
    -- Assinatura digital (para certificados)
    digital_signature TEXT,
    signature_certificate TEXT,
    
    -- Auditoria
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE RESTRICT,
    
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_organization (organization_id),
    INDEX idx_role (role),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

---

### 9. **Tabela: audit_logs** (MELHORADA)
```sql
CREATE TABLE audit_logs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    
    -- Identificação
    user_id INT NULL,
    username VARCHAR(100),
    
    -- Ação
    action VARCHAR(50) NOT NULL COMMENT 'CREATE, UPDATE, DELETE, LOGIN, etc',
    entity_type VARCHAR(50) NOT NULL COMMENT 'equipment, calibration, service, etc',
    entity_id INT,
    
    -- Contexto
    organization_id INT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    
    -- Dados
    old_values JSON COMMENT 'Valores antes da alteração',
    new_values JSON COMMENT 'Valores após a alteração',
    changes_summary TEXT,
    
    -- Resultado
    status ENUM('success', 'failure', 'warning') DEFAULT 'success',
    error_message TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    INDEX idx_user (user_id),
    INDEX idx_action (action),
    INDEX idx_entity (entity_type, entity_id),
    INDEX idx_created_at (created_at),
    INDEX idx_organization (organization_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Auditoria completa de todas as operações';
```

---

### 10. **Tabela: notifications** (NOVA)
```sql
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Destinatário
    user_id INT NOT NULL,
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
    ) NOT NULL,
    
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    
    -- Relacionamentos
    related_entity_type VARCHAR(50) COMMENT 'equipment, service, calibration',
    related_entity_id INT,
    
    -- Status
    is_read BOOLEAN DEFAULT FALSE,
    read_at DATETIME,
    
    -- Prioridade
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
    
    -- Validade
    expires_at DATETIME,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    INDEX idx_user (user_id),
    INDEX idx_is_read (is_read),
    INDEX idx_type (notification_type),
    INDEX idx_priority (priority),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

---

### 11. **Tabela: reports** (NOVA)
```sql
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Identificação
    report_code VARCHAR(50) NOT NULL UNIQUE,
    title VARCHAR(200) NOT NULL,
    
    -- Tipo
    report_type ENUM(
        'calibration_schedule',
        'equipment_inventory',
        'cost_analysis',
        'compliance_audit',
        'service_performance',
        'equipment_history',
        'custom'
    ) NOT NULL,
    
    -- Parâmetros
    filters JSON COMMENT 'Filtros aplicados',
    date_range_start DATE,
    date_range_end DATE,
    
    -- Relacionamentos
    organization_id INT NULL,
    equipment_ids JSON,
    
    -- Geração
    generated_by_user_id INT NOT NULL,
    generation_date DATETIME NOT NULL,
    
    -- Arquivo
    file_format ENUM('pdf', 'excel', 'csv', 'json') DEFAULT 'pdf',
    file_path VARCHAR(255),
    file_size_kb INT,
    
    -- Estatísticas
    total_records INT,
    summary JSON COMMENT 'Resumo estatístico',
    
    -- Status
    status ENUM('generating', 'completed', 'failed') DEFAULT 'generating',
    error_message TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (generated_by_user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    
    INDEX idx_report_code (report_code),
    INDEX idx_type (report_type),
    INDEX idx_organization (organization_id),
    INDEX idx_generation_date (generation_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Histórico de relatórios gerados';
```

---

## 📈 Diagrama de Relacionamentos (Simplificado)

```
organizations (OM/Depto/Div/Seção)
    ↓
    ├── equipment ←→ calibrations ←→ certificates
    ├── services (OS de todos os tipos)
    ├── users (funcionários/técnicos)
    └── equipment_movements (histórico)

laboratories ←→ calibrations
providers ←→ calibrations

services ←→ equipment
services ←→ calibrations

users → audit_logs
users → notifications
users → reports
```

---

## 🔐 Views e Stored Procedures Recomendadas

### View: Equipamentos com Status de Calibração
```sql
CREATE VIEW v_equipment_calibration_status AS
SELECT 
    e.id,
    e.internal_code,
    e.manufacturer,
    e.model,
    e.asset_type,
    e.priority,
    e.is_calibrated,
    e.next_calibration_due_date,
    o.name as organization_name,
    o.code as organization_code,
    CASE 
        WHEN e.next_calibration_due_date < CURDATE() THEN 'VENCIDO'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'VENCE_EM_30_DIAS'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 60 DAY) THEN 'VENCE_EM_60_DIAS'
        ELSE 'OK'
    END as calibration_status,
    DATEDIFF(e.next_calibration_due_date, CURDATE()) as days_until_due,
    c.calibration_date as last_calibration_date,
    l.name as last_laboratory,
    p.name as provider_name
FROM equipment e
LEFT JOIN organizations o ON e.organization_id = o.id
LEFT JOIN calibrations c ON e.last_calibration_id = c.id
LEFT JOIN laboratories l ON c.laboratory_id = l.id
LEFT JOIN providers p ON e.provider_id = p.id
WHERE e.status = 'active';
```

### View: Dashboard de Serviços
```sql
CREATE VIEW v_services_dashboard AS
SELECT 
    s.id,
    s.service_number,
    s.service_type,
    s.status,
    s.priority,
    s.requested_date,
    s.expected_completion_date,
    DATEDIFF(s.expected_completion_date, CURDATE()) as days_until_deadline,
    e.internal_code as equipment_code,
    req_org.name as requester_organization,
    exec_org.name as executor_organization,
    CASE 
        WHEN s.status = 'completed' THEN 'Concluído'
        WHEN s.expected_completion_date < CURDATE() THEN 'ATRASADO'
        WHEN DATEDIFF(s.expected_completion_date, CURDATE()) <= 3 THEN 'URGENTE'
        ELSE 'No prazo'
    END as deadline_status
FROM services s
LEFT JOIN equipment e ON s.equipment_id = e.id
LEFT JOIN organizations req_org ON s.requester_organization_id = req_org.id
LEFT JOIN organizations exec_org ON s.executor_organization_id = exec_org.id
WHERE s.status NOT IN ('completed', 'cancelled');
```

### Stored Procedure: Agendar Calibração Automática
```sql
DELIMITER $$

CREATE PROCEDURE sp_schedule_calibrations_batch(
    IN p_months_ahead INT,
    IN p_organization_id INT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_equipment_id INT;
    DECLARE v_next_due DATE;
    DECLARE v_priority VARCHAR(20);
    
    DECLARE cur CURSOR FOR 
        SELECT id, next_calibration_due_date, priority
        FROM equipment
        WHERE status = 'active'
        AND next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL p_months_ahead MONTH)
        AND (p_organization_id IS NULL OR organization_id = p_organization_id)
        AND id NOT IN (
            SELECT equipment_id 
            FROM calibrations 
            WHERE status IN ('scheduled', 'in_progress')
        );
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_equipment_id, v_next_due, v_priority;
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
        
        -- Criar notificação
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
            CONCAT('Equipamento ', e.internal_code, ' agendado para calibração em ', DATE_FORMAT(v_next_due, '%d/%m/%Y')),
            'equipment',
            v_equipment_id,
            CASE v_priority
                WHEN 'critica' THEN 'critical'
                WHEN 'urgente' THEN 'high'
                ELSE 'medium'
            END
        FROM equipment e
        JOIN organizations o ON e.organization_id = o.id
        JOIN users u ON u.organization_id = o.id
        WHERE e.id = v_equipment_id
        AND u.role IN ('admin', 'manager', 'technician');
        
    END LOOP;
    
    CLOSE cur;
END$$

DELIMITER ;
```

---

## 🚀 Melhorias e Recursos Adicionais

### 1. Sistema de Tags/Etiquetas
```sql
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    color VARCHAR(7) DEFAULT '#6c757d',
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE equipment_tags (
    equipment_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (equipment_id, tag_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
) ENGINE=InnoDB;
```

### 2. Templates de Certificados
```sql
CREATE TABLE certificate_templates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    asset_type VARCHAR(50),
    template_html TEXT,
    template_css TEXT,
    header_image_path VARCHAR(255),
    footer_text TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;
```

### 3. Checklist de Calibração
```sql
CREATE TABLE calibration_checklists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    asset_type VARCHAR(50) NOT NULL,
    checklist_name VARCHAR(100),
    items JSON COMMENT 'Array de itens do checklist',
    is_mandatory BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE calibration_checklist_responses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    calibration_id INT NOT NULL,
    checklist_id INT NOT NULL,
    responses JSON COMMENT 'Respostas aos itens',
    completed_by_user_id INT,
    completed_at DATETIME,
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    FOREIGN KEY (checklist_id) REFERENCES calibration_checklists(id)
) ENGINE=InnoDB;
```

### 4. Custos e Orçamento
```sql
CREATE TABLE budget_periods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    year INT NOT NULL,
    organization_id INT NOT NULL,
    total_budget DECIMAL(12, 2),
    calibration_budget DECIMAL(12, 2),
    maintenance_budget DECIMAL(12, 2),
    spent_calibration DECIMAL(12, 2) DEFAULT 0,
    spent_maintenance DECIMAL(12, 2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (organization_id) REFERENCES organizations(id),
    UNIQUE KEY (year, organization_id)
) ENGINE=InnoDB;
```

---

## 📊 Índices e Performance

### Índices Compostos Recomendados
```sql
-- Para consultas de equipamentos por organização e status
ALTER TABLE equipment 
ADD INDEX idx_org_status (organization_id, status, next_calibration_due_date);

-- Para histórico de calibrações por equipamento
ALTER TABLE calibrations 
ADD INDEX idx_equipment_date (equipment_id, calibration_date DESC);

-- Para busca de serviços por período e organização
ALTER TABLE services 
ADD INDEX idx_org_dates (requester_organization_id, requested_date, status);

-- Para auditoria por período
ALTER TABLE audit_logs 
ADD INDEX idx_date_entity (created_at DESC, entity_type, entity_id);
```

### Particionamento (para tabelas grandes)
```sql
-- Particionar audit_logs por mês
ALTER TABLE audit_logs
PARTITION BY RANGE (TO_DAYS(created_at)) (
    PARTITION p202401 VALUES LESS THAN (TO_DAYS('2024-02-01')),
    PARTITION p202402 VALUES LESS THAN (TO_DAYS('2024-03-01')),
    -- ... continuar por 2 anos
    PARTITION p_future VALUES LESS THAN MAXVALUE
);
```

---

## 🔒 Segurança e Backup

### Triggers de Auditoria
```sql
DELIMITER $$

CREATE TRIGGER trg_equipment_audit_update
AFTER UPDATE ON equipment
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        user_id,
        action,
        entity_type,
        entity_id,
        old_values,
        new_values,
        changes_summary
    ) VALUES (
        @current_user_id,
        'UPDATE',
        'equipment',
        NEW.id,
        JSON_OBJECT(
            'internal_code', OLD.internal_code,
            'status', OLD.status,
            'location', OLD.location,
            'priority', OLD.priority
        ),
        JSON_OBJECT(
            'internal_code', NEW.internal_code,
            'status', NEW.status,
            'location', NEW.location,
            'priority', NEW.priority
        ),
        CONCAT('Equipamento ', NEW.internal_code, ' atualizado')
    );
END$$

DELIMITER ;
```

### Estratégia de Backup
```bash
# Backup diário completo
mysqldump -u root -p cmasm_db > backup_$(date +%Y%m%d).sql

# Backup incremental de tabelas críticas
mysqldump -u root -p cmasm_db \
  equipment calibrations certificates services \
  > backup_critical_$(date +%Y%m%d).sql
```

---

## 📝 Recomendações Finais

### Prioridades de Implementação

**FASE 1 - CRÍTICO** (1-2 semanas)
1. ✅ Tabelas: `organizations`, `users`, `equipment` (melhorada)
2. ✅ Tabelas: `laboratories`, `providers` (melhorada), `calibrations` (melhorada)
3. ✅ View: `v_equipment_calibration_status`

**FASE 2 - IMPORTANTE** (2-3 semanas)
1. ✅ Tabela: `services` (ordens de serviço)
2. ✅ Tabela: `equipment_movements` (rastreamento)
3. ✅ Tabela: `notifications`
4. ✅ Stored Procedure: `sp_schedule_calibrations_batch`

**FASE 3 - COMPLEMENTAR** (1-2 semanas)
1. ✅ Tabelas: `audit_logs`, `reports`
2. ✅ Tabelas: `tags`, `certificate_templates`, `calibration_checklists`
3. ✅ Triggers de auditoria
4. ✅ Views adicionais

**FASE 4 - OTIMIZAÇÃO** (1 semana)
1. ✅ Índices compostos
2. ✅ Particionamento de tabelas grandes
3. ✅ Procedures de manutenção
4. ✅ Jobs de backup automático

---

## 🎓 Benefícios da Nova Arquitetura

### 1. **Rastreabilidade Completa**
- ✅ Histórico de movimentação de equipamentos
- ✅ Auditoria de todas as operações
- ✅ Cadeia de custódia documentada

### 2. **Conformidade ISO/IEC 17025**
- ✅ Rastreabilidade de padrões
- ✅ Controle de condições ambientais
- ✅ Assinaturas digitais em certificados
- ✅ Laboratórios acreditados

### 3. **Gestão Organizacional**
- ✅ Hierarquia OM > Departamento > Divisão > Seção
- ✅ Responsabilidades por setor
- ✅ Controle de custos por organização

### 4. **Automação Inteligente**
- ✅ Agendamento automático de calibrações
- ✅ Notificações de vencimento
- ✅ Relatórios programados
- ✅ Alertas de prioridade

### 5. **Integrações Futuras**
- ✅ Integração com SISCHAMADOS (via `services`)
- ✅ API RESTful completa
- ✅ Importação/exportação de dados
- ✅ Dashboard em tempo real

---

## 🔗 Próximos Passos

1. **Validação com equipe técnica** - Revisar estrutura proposta
2. **Criação de scripts SQL** - Scripts de migração e seeds
3. **Documentação de API** - Endpoints RESTful para cada tabela
4. **Testes de carga** - Simular operação com dados reais
5. **Treinamento** - Capacitação da equipe

---

**Documento elaborado em:** 26 de novembro de 2025  
**Versão:** 1.0  
**Responsável:** Análise de Sistemas CMASM
