# 🗺️ Diagrama ER e Guia de Migração - Sistema CMASM

## 📊 Diagrama Entidade-Relacionamento (Textual)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    ESTRUTURA ORGANIZACIONAL                              │
└─────────────────────────────────────────────────────────────────────────┘

                            organizations
                    ┌───────────────────────────┐
                    │ id (PK)                   │
                    │ code (UK)                 │
                    │ name                      │
                    │ type (om/dept/div/sec)    │
                    │ parent_id (FK) ←──┐       │
                    │ responsible_officer       │
                    │ is_active                 │
                    └───────────────────────────┘
                            │         ↑
                            └─────────┘ (self-reference)
                            │
        ┌───────────────────┼───────────────────┬──────────────────┐
        │                   │                   │                  │
        ↓                   ↓                   ↓                  ↓
  equipment            users              services         budget_periods
        │                   │                   │
        └───────────────────┴───────────────────┘
                            ↓
                    equipment_movements
                    audit_logs
                    notifications


┌─────────────────────────────────────────────────────────────────────────┐
│                    EQUIPAMENTOS E CALIBRAÇÃO                             │
└─────────────────────────────────────────────────────────────────────────┘

        equipment                                    providers
    ┌───────────────────────┐                   ┌──────────────────┐
    │ id (PK)               │                   │ id (PK)          │
    │ internal_code (UK)    │                   │ laboratory_id    │
    │ manufacturer          │                   │ name             │
    │ model                 │                   │ cnpj (UK)        │
    │ serial_number         │                   │ rating           │
    │ category_1            │                   │ is_active        │
    │ category_2            │                   └──────────────────┘
    │ asset_type            │                            │
    │ weight_grams          │         ┌──────────────────┘
    │ dimensions            │         │
    │ organization_id (FK)  │         │       laboratories
    │ provider_id (FK) ─────┼─────────┤   ┌──────────────────┐
    │ priority              │         │   │ id (PK)          │
    │ status                │         └───│ code (UK)        │
    │ is_calibrated         │             │ name             │
    │ last_calibration_id   │             │ type (int/ext)   │
    └───────────────────────┘             │ is_accredited    │
            │       │                     │ rating           │
            │       └──────────┐          └──────────────────┘
            │                  │                   │
            ↓                  │                   │
    calibrations              │                   │
    ┌───────────────────────┐ │                   │
    │ id (PK)               │ │                   │
    │ equipment_id (FK) ←───┘                     │
    │ provider_id (FK) ───────────────────────────┘
    │ laboratory_id (FK) ─────────────────────────┘
    │ service_id (FK)       │
    │ calibration_date      │
    │ scheduled_date        │
    │ calibration_type      │
    │ status                │
    │ cost                  │
    │ pass_fail             │
    │ certificate_id        │
    └───────────────────────┘
            │
            │ 1:N
            ↓
    ┌───────────────────────────────┐
    │  measurement_parameters       │
    ├───────────────────────────────┤
    │  calibration_id (FK)          │
    │  parameter_name               │
    │  nominal_value                │
    │  measured_value               │
    │  uncertainty                  │
    └───────────────────────────────┘
            │
            │ 1:1
            ↓
        certificates
    ┌───────────────────────┐
    │ id (PK)               │
    │ certificate_number(UK)│
    │ calibration_id (FK)   │
    │ issue_date            │
    │ validity_from         │
    │ validity_to           │
    │ status                │
    │ digital_signature     │
    └───────────────────────┘

    calibrations ←──→ reference_standards
           N:N
    calibration_reference_standards
    ┌───────────────────────────────┐
    │ calibration_id (FK)           │
    │ reference_standard_id (FK)    │
    └───────────────────────────────┘


┌─────────────────────────────────────────────────────────────────────────┐
│                    SERVIÇOS E MOVIMENTAÇÃO                               │
└─────────────────────────────────────────────────────────────────────────┘

            services
    ┌───────────────────────────┐
    │ id (PK)                   │
    │ service_number (UK)       │
    │ service_type (ENUM)       │      - delineamento
    │ equipment_id (FK)         │      - transporte
    │ calibration_id (FK)       │      - recebimento
    │ requester_org_id (FK)     │      - avaliacao_tecnica
    │ executor_org_id (FK)      │      - manutencao_preventiva
    │ requested_date            │      - manutencao_preditiva
    │ expected_completion       │      - manutencao_corretiva
    │ status                    │      - modificacao_tecnica
    │ priority                  │      - baixa
    │ actual_cost               │      - armazenamento
    └───────────────────────────┘      - transferencia
            │                          - doacao
            │                          - calibracao
            ↓
    equipment_movements
    ┌────────────────────────────┐
    │ id (PK)                    │
    │ equipment_id (FK)          │
    │ movement_type (ENUM)       │
    │ from_organization_id (FK)  │
    │ to_organization_id (FK)    │
    │ service_id (FK)            │
    │ movement_date              │
    │ document_number            │
    │ condition_before/after     │
    └────────────────────────────┘


┌─────────────────────────────────────────────────────────────────────────┐
│                    AUDITORIA E NOTIFICAÇÕES                              │
└─────────────────────────────────────────────────────────────────────────┘

        users                          notifications
    ┌──────────────────┐          ┌───────────────────────┐
    │ id (PK)          │──┐       │ id (PK)               │
    │ username (UK)    │  │       │ user_id (FK)          │
    │ email (UK)       │  │       │ notification_type     │
    │ organization_id  │  │       │ title                 │
    │ role             │  │       │ message               │
    │ rank             │  │       │ related_entity_type   │
    │ is_active        │  │       │ related_entity_id     │
    └──────────────────┘  │       │ is_read               │
            │             │       │ priority              │
            └─────────────┼───────┤ created_at            │
                          │       └───────────────────────┘
                          │
                          │           audit_logs
                          │       ┌───────────────────────┐
                          └───────│ id (PK)               │
                                  │ user_id (FK)          │
                                  │ action                │
                                  │ entity_type           │
                                  │ entity_id             │
                                  │ old_values (JSON)     │
                                  │ new_values (JSON)     │
                                  │ changes_summary       │
                                  │ created_at            │
                                  └───────────────────────┘

                                      reports
                                  ┌───────────────────────┐
                                  │ id (PK)               │
                                  │ report_code (UK)      │
                                  │ report_type           │
                                  │ generated_by_user_id  │
                                  │ filters (JSON)        │
                                  │ file_path             │
                                  │ status                │
                                  └───────────────────────┘
```

---

## 🔄 Guia de Migração - Passo a Passo

### FASE 1: Backup e Preparação

```bash
# 1. Backup do banco atual (se existir)
mysqldump -u root -p existing_db > backup_pre_migration_$(date +%Y%m%d).sql

# 2. Criar novo banco de dados
mysql -u root -p
```

```sql
CREATE DATABASE cmasm_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cmasm_db;

-- Verificar configurações
SHOW VARIABLES LIKE 'character_set%';
SHOW VARIABLES LIKE 'collation%';
```

---

### FASE 2: Criação de Tabelas (Ordem de Dependências)

#### Script 1: Tabelas Base (sem foreign keys)

```sql
-- 01_create_organizations.sql
CREATE TABLE organizations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    type ENUM('om', 'department', 'division', 'section') NOT NULL,
    parent_id INT NULL,
    responsible_officer VARCHAR(100),
    contact_phone VARCHAR(20),
    contact_email VARCHAR(100),
    address TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_code (code),
    INDEX idx_type (type),
    INDEX idx_parent (parent_id),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 02_create_users.sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    rank VARCHAR(50),
    registration_number VARCHAR(50),
    organization_id INT NOT NULL,
    department VARCHAR(100),
    position VARCHAR(100),
    phone VARCHAR(20),
    mobile VARCHAR(20),
    role ENUM('admin', 'manager', 'technician', 'operator', 'viewer') DEFAULT 'viewer',
    permissions JSON,
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME,
    digital_signature TEXT,
    signature_certificate TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_organization (organization_id),
    INDEX idx_role (role),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 03_create_laboratories.sql
CREATE TABLE laboratories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    type ENUM('internal', 'external') NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    is_accredited BOOLEAN DEFAULT FALSE,
    accreditation_body VARCHAR(100),
    accreditation_number VARCHAR(50),
    accreditation_scope TEXT,
    accreditation_valid_until DATE,
    specialties JSON,
    default_lead_time_days INT DEFAULT 15,
    rating DECIMAL(3, 2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_code (code),
    INDEX idx_type (type),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 04_create_providers.sql
CREATE TABLE providers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laboratory_id INT NULL,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    accreditation_body VARCHAR(100),
    accreditation_number VARCHAR(50),
    accreditation_scope TEXT,
    address TEXT,
    cnpj VARCHAR(18) UNIQUE,
    contract_number VARCHAR(50),
    contract_valid_until DATE,
    payment_terms VARCHAR(100),
    rating DECIMAL(3, 2) DEFAULT 0.00,
    total_services INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_laboratory (laboratory_id),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 05_create_reference_standards.sql
CREATE TABLE reference_standards (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE,
    last_calibration_date DATE,
    traceability_chain TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

#### Script 2: Tabelas com Foreign Keys (Nível 1)

```sql
-- 06_create_equipment.sql
CREATE TABLE equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    internal_code VARCHAR(50) NOT NULL UNIQUE,
    manufacturer VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    category_1 ENUM('eletrico', 'mecanico') NOT NULL,
    category_2 VARCHAR(100),
    asset_type VARCHAR(50) NOT NULL,
    classification VARCHAR(50),
    weight_grams DECIMAL(10, 2),
    dimensions VARCHAR(50),
    accessories TEXT,
    organization_id INT NOT NULL,
    location VARCHAR(100),
    acquisition_date DATE,
    calibration_default_interval_days INT DEFAULT 365,
    last_calibration_id INT NULL,
    next_calibration_due_date DATE,
    is_calibrated BOOLEAN DEFAULT FALSE,
    priority ENUM('critica', 'urgente', 'alta', 'media', 'normal') DEFAULT 'normal',
    status ENUM('active', 'quarantined', 'decommissioned', 'in_maintenance', 'transferred') DEFAULT 'active',
    provider_id INT NULL,
    provider_contact VARCHAR(100),
    notes TEXT,
    created_by INT NULL,
    updated_by INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE RESTRICT,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    INDEX idx_internal_code (internal_code),
    INDEX idx_category (category_1, category_2),
    INDEX idx_organization (organization_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_next_calibration (next_calibration_due_date),
    INDEX idx_is_calibrated (is_calibrated),
    FULLTEXT idx_search (manufacturer, model, serial_number, internal_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 07_create_services.sql
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_number VARCHAR(50) NOT NULL UNIQUE,
    service_type ENUM(
        'delineamento', 'transporte', 'recebimento', 'avaliacao_tecnica',
        'manutencao_preventiva', 'manutencao_preditiva', 'manutencao_corretiva',
        'modificacao_tecnica', 'baixa', 'armazenamento', 'transferencia',
        'doacao', 'calibracao'
    ) NOT NULL,
    equipment_id INT NULL,
    calibration_id INT NULL,
    requester_id INT NULL,
    requester_organization_id INT NULL,
    executor_id INT NULL,
    executor_organization_id INT NULL,
    requested_date DATETIME NOT NULL,
    start_date DATETIME,
    expected_completion_date DATE,
    actual_completion_date DATETIME,
    deadline_days INT,
    instructions TEXT,
    inputs TEXT,
    outputs TEXT,
    status ENUM('pending', 'approved', 'in_progress', 'completed', 'cancelled', 'on_hold') DEFAULT 'pending',
    priority ENUM('critica', 'urgente', 'alta', 'media', 'normal') DEFAULT 'normal',
    estimated_cost DECIMAL(10, 2),
    actual_cost DECIMAL(10, 2),
    notes TEXT,
    cancellation_reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE SET NULL,
    FOREIGN KEY (requester_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    FOREIGN KEY (executor_organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    INDEX idx_service_number (service_number),
    INDEX idx_service_type (service_type),
    INDEX idx_equipment (equipment_id),
    INDEX idx_status (status),
    INDEX idx_priority (priority),
    INDEX idx_dates (requested_date, expected_completion_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

#### Script 3: Tabelas com Foreign Keys (Nível 2)

```sql
-- 08_create_calibrations.sql
CREATE TABLE calibrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    provider_id INT NULL,
    laboratory_id INT NULL,
    service_id INT NULL,
    performed_by_user_id INT NULL,
    calibration_date DATETIME NOT NULL,
    scheduled_date DATETIME,
    calibration_type ENUM('initial', 'routine', 'repair', 'verification') DEFAULT 'routine',
    calibration_method VARCHAR(100),
    cost DECIMAL(10, 2) DEFAULT 0,
    invoice_number VARCHAR(50),
    status ENUM('pending', 'scheduled', 'in_progress', 'completed', 'approved', 'rejected') DEFAULT 'pending',
    results_summary TEXT,
    pass_fail BOOLEAN,
    certificate_id INT NULL,
    environmental_temperature VARCHAR(50),
    environmental_humidity VARCHAR(50),
    environmental_pressure VARCHAR(50),
    notification_sent BOOLEAN DEFAULT FALSE,
    notification_sent_at DATETIME,
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

-- 09_create_certificates.sql
CREATE TABLE certificates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    certificate_number VARCHAR(50) NOT NULL UNIQUE,
    calibration_id INT NOT NULL,
    issue_date DATE NOT NULL,
    validity_from DATE NOT NULL,
    validity_to DATE NOT NULL,
    accreditation_declaration TEXT,
    traceability_statement TEXT,
    performed_by VARCHAR(100),
    approved_by VARCHAR(100),
    status VARCHAR(20) DEFAULT 'draft',
    digital_signature TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    INDEX idx_certificate_number (certificate_number),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 10_create_measurement_parameters.sql
CREATE TABLE measurement_parameters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    calibration_id INT NOT NULL,
    parameter_name VARCHAR(100) NOT NULL,
    nominal_value DECIMAL(15, 6),
    measured_value DECIMAL(15, 6),
    unit VARCHAR(20),
    tolerance DECIMAL(15, 6),
    uncertainty DECIMAL(15, 6),
    pass_fail BOOLEAN DEFAULT TRUE,
    remarks TEXT,
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    INDEX idx_calibration (calibration_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 11_create_calibration_reference_standards.sql
CREATE TABLE calibration_reference_standards (
    calibration_id INT NOT NULL,
    reference_standard_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (calibration_id, reference_standard_id),
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    FOREIGN KEY (reference_standard_id) REFERENCES reference_standards(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

#### Script 4: Tabelas de Suporte

```sql
-- 12_create_equipment_movements.sql
CREATE TABLE equipment_movements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    movement_type ENUM(
        'acquisition', 'transfer', 'loan', 'return',
        'maintenance', 'calibration', 'storage', 'decommission'
    ) NOT NULL,
    from_organization_id INT NULL,
    to_organization_id INT NULL,
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    authorized_by_user_id INT,
    received_by_user_id INT,
    document_number VARCHAR(50),
    service_id INT NULL,
    movement_date DATETIME NOT NULL,
    expected_return_date DATE,
    actual_return_date DATETIME,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 13_create_notifications.sql
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    organization_id INT NULL,
    notification_type ENUM(
        'calibration_due', 'calibration_overdue', 'service_pending',
        'equipment_movement', 'certificate_issued', 'system_alert', 'general'
    ) NOT NULL,
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    related_entity_type VARCHAR(50),
    related_entity_id INT,
    is_read BOOLEAN DEFAULT FALSE,
    read_at DATETIME,
    priority ENUM('low', 'medium', 'high', 'critical') DEFAULT 'medium',
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

-- 14_create_audit_logs.sql
CREATE TABLE audit_logs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    username VARCHAR(100),
    action VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50) NOT NULL,
    entity_id INT,
    organization_id INT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    old_values JSON,
    new_values JSON,
    changes_summary TEXT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 15_create_reports.sql
CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_code VARCHAR(50) NOT NULL UNIQUE,
    title VARCHAR(200) NOT NULL,
    report_type ENUM(
        'calibration_schedule', 'equipment_inventory', 'cost_analysis',
        'compliance_audit', 'service_performance', 'equipment_history', 'custom'
    ) NOT NULL,
    filters JSON,
    date_range_start DATE,
    date_range_end DATE,
    organization_id INT NULL,
    equipment_ids JSON,
    generated_by_user_id INT NOT NULL,
    generation_date DATETIME NOT NULL,
    file_format ENUM('pdf', 'excel', 'csv', 'json') DEFAULT 'pdf',
    file_path VARCHAR(255),
    file_size_kb INT,
    total_records INT,
    summary JSON,
    status ENUM('generating', 'completed', 'failed') DEFAULT 'generating',
    error_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (generated_by_user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL,
    INDEX idx_report_code (report_code),
    INDEX idx_type (report_type),
    INDEX idx_organization (organization_id),
    INDEX idx_generation_date (generation_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

---

### FASE 3: Adicionar Foreign Keys Pendentes

```sql
-- 16_add_foreign_keys.sql

-- equipment.last_calibration_id
ALTER TABLE equipment
ADD CONSTRAINT fk_equipment_last_calibration
FOREIGN KEY (last_calibration_id) REFERENCES calibrations(id) ON DELETE SET NULL;

-- services.calibration_id
ALTER TABLE services
ADD CONSTRAINT fk_services_calibration
FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE SET NULL;

-- organizations.parent_id (self-reference)
ALTER TABLE organizations
ADD CONSTRAINT fk_organizations_parent
FOREIGN KEY (parent_id) REFERENCES organizations(id) ON DELETE SET NULL;

-- providers.laboratory_id
ALTER TABLE providers
ADD CONSTRAINT fk_providers_laboratory
FOREIGN KEY (laboratory_id) REFERENCES laboratories(id) ON DELETE SET NULL;
```

---

### FASE 4: Seed Data (Dados Iniciais)

```sql
-- 17_seed_organizations.sql
INSERT INTO organizations (code, name, type, parent_id) VALUES
('CMASM', 'Centro de Mísseis e Armas Submarinas da Marinha', 'om', NULL),
('DEPT-ARMAS', 'Departamento de Armas', 'department', 1),
('DIV-MK48', 'Divisão MK-48', 'division', 2),
('DIV-MK46', 'Divisão MK-46', 'division', 2),
('DIV-F21', 'Divisão F-21', 'division', 2),
('DIV-EXOCET', 'Divisão EXOCET', 'division', 2),
('DIV-MINAS', 'Divisão Minas e Bombas', 'division', 2),
('DIV-MISSEIS', 'Divisão Mísseis Especiais', 'division', 2),
('DEPT-INFRA', 'Departamento de Infraestrutura', 'department', 1),
('DIV-MANUT', 'Divisão Manutenção Especializada', 'division', 9),
('SEC-CARP', 'Seção Carpintaria', 'section', 10),
('SEC-METAL', 'Seção Metalurgia', 'section', 10),
('SEC-PINT', 'Seção Pintura Industrial', 'section', 10),
('SEC-MAQ', 'Seção Máquinas', 'section', 10),
('SEC-REFRIG', 'Seção Refrigeração', 'section', 10),
('SEC-ELETRON', 'Seção Eletrônica', 'section', 10);

-- 18_seed_laboratories.sql
INSERT INTO laboratories (code, name, type, is_accredited, accreditation_body, rating) VALUES
('CMS', 'Centro de Manutenção da Marinha', 'internal', true, 'INMETRO', 4.50),
('BACS', 'BACS Laboratório', 'external', true, 'RBC', 4.20),
('MVMETRO', 'MV Metrologia', 'external', true, 'RBC', 4.80),
('MSMI', 'MSMI Calibração', 'external', false, NULL, 3.50),
('VISOMES', 'Visomes Metrologia', 'external', true, 'RBC', 4.60),
('IPTC', 'IPTC Instituto', 'external', true, 'INMETRO', 4.90),
('CALIBRARIO', 'Calibrario Ltda', 'external', false, NULL, 3.80);

-- 19_seed_reference_standards.sql
INSERT INTO reference_standards (id, name, code, last_calibration_date, traceability_chain) VALUES
('STD-001', 'Padrão de Tensão DC 10V', 'REF-VOLT-10V', '2025-06-15', 'RBC → INMETRO → BIPM'),
('STD-002', 'Padrão de Resistência 100Ω', 'REF-RES-100R', '2025-05-20', 'RBC → INMETRO'),
('STD-003', 'Padrão de Temperatura -20°C a 150°C', 'REF-TEMP-RANGE', '2025-07-10', 'RBC → INMETRO → PTB');

-- 20_seed_admin_user.sql
INSERT INTO users (username, email, password_hash, full_name, rank, organization_id, role, is_active) VALUES
('admin', 'admin@cmasm.mar.mil.br', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 
 'Administrador do Sistema', 'CT', 1, 'admin', true);
-- Senha: password (use bcrypt para hash real)
```

---

### FASE 5: Triggers e Procedures

```sql
-- 21_triggers.sql
DELIMITER $$

-- Trigger: Atualizar equipamento após calibração
CREATE TRIGGER trg_calibration_update_equipment
AFTER UPDATE ON calibrations
FOR EACH ROW
BEGIN
    IF NEW.status IN ('completed', 'approved') AND OLD.status != NEW.status THEN
        UPDATE equipment e
        SET e.last_calibration_id = NEW.id,
            e.next_calibration_due_date = DATE_ADD(NEW.calibration_date, 
                INTERVAL e.calibration_default_interval_days DAY),
            e.is_calibrated = TRUE
        WHERE e.id = NEW.equipment_id;
    END IF;
END$$

-- Trigger: Auditoria de equipamentos
CREATE TRIGGER trg_equipment_audit
AFTER UPDATE ON equipment
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        action, entity_type, entity_id,
        old_values, new_values, changes_summary
    ) VALUES (
        'UPDATE', 'equipment', NEW.id,
        JSON_OBJECT(
            'status', OLD.status,
            'location', OLD.location,
            'organization_id', OLD.organization_id
        ),
        JSON_OBJECT(
            'status', NEW.status,
            'location', NEW.location,
            'organization_id', NEW.organization_id
        ),
        CONCAT('Equipamento ', NEW.internal_code, ' atualizado')
    );
END$$

DELIMITER ;

-- 22_procedures.sql
DELIMITER $$

CREATE PROCEDURE sp_generate_service_number(OUT service_num VARCHAR(50))
BEGIN
    DECLARE next_id INT;
    SELECT COALESCE(MAX(id), 0) + 1 INTO next_id FROM services;
    SET service_num = CONCAT('OS-', YEAR(CURDATE()), '-', LPAD(next_id, 5, '0'));
END$$

CREATE PROCEDURE sp_generate_certificate_number(OUT cert_num VARCHAR(50))
BEGIN
    DECLARE next_id INT;
    SELECT COALESCE(MAX(id), 0) + 1 INTO next_id FROM certificates;
    SET cert_num = CONCAT('CERT-', YEAR(CURDATE()), '-', LPAD(next_id, 5, '0'));
END$$

DELIMITER ;
```

---

### FASE 6: Views

```sql
-- 23_views.sql
CREATE VIEW v_equipment_calibration_status AS
SELECT 
    e.id, e.internal_code, e.manufacturer, e.model,
    e.asset_type, e.priority, e.is_calibrated,
    e.next_calibration_due_date,
    o.name as organization_name, o.code as organization_code,
    CASE 
        WHEN e.next_calibration_due_date < CURDATE() THEN 'VENCIDO'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'VENCE_EM_30_DIAS'
        WHEN e.next_calibration_due_date <= DATE_ADD(CURDATE(), INTERVAL 60 DAY) THEN 'VENCE_EM_60_DIAS'
        ELSE 'OK'
    END as calibration_status,
    DATEDIFF(e.next_calibration_due_date, CURDATE()) as days_until_due,
    c.calibration_date as last_calibration_date,
    l.name as last_laboratory
FROM equipment e
LEFT JOIN organizations o ON e.organization_id = o.id
LEFT JOIN calibrations c ON e.last_calibration_id = c.id
LEFT JOIN laboratories l ON c.laboratory_id = l.id
WHERE e.status = 'active';
```

---

## ✅ Checklist de Migração

```markdown
□ FASE 1: Backup
  □ Backup do banco atual
  □ Criar novo banco cmasm_db
  
□ FASE 2: Criação de Tabelas
  □ Script 01-05: Tabelas base
  □ Script 06-07: Tabelas com FK nível 1
  □ Script 08-11: Tabelas com FK nível 2
  □ Script 12-15: Tabelas de suporte
  
□ FASE 3: Foreign Keys
  □ Script 16: Adicionar FKs pendentes
  
□ FASE 4: Seed Data
  □ Script 17-20: Dados iniciais
  
□ FASE 5: Triggers e Procedures
  □ Script 21: Triggers
  □ Script 22: Stored Procedures
  
□ FASE 6: Views
  □ Script 23: Views
  
□ Testes
  □ Testar constraints
  □ Testar triggers
  □ Testar procedures
  □ Validar seed data
```

---

**Documento:** Diagrama ER e Migração - CMASM  
**Versão:** 1.0  
**Data:** 26 de novembro de 2025
