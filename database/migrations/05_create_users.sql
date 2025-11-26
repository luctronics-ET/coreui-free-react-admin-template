-- ============================================================================
-- Tabela: users
-- Descrição: Usuários do sistema
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Autenticação
    username VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nome de usuário único',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email único',
    password_hash VARCHAR(255) NOT NULL COMMENT 'Hash da senha (bcrypt)',
    
    -- Dados pessoais
    full_name VARCHAR(200) NOT NULL COMMENT 'Nome completo',
    `rank` VARCHAR(50) COMMENT 'Posto/Graduação militar',
    registration_number VARCHAR(50) COMMENT 'Número funcional/matrícula',
    
    -- Organização
    organization_id INT NOT NULL COMMENT 'Seção/Divisão de lotação',
    department VARCHAR(100) COMMENT 'Departamento',
    position VARCHAR(100) COMMENT 'Cargo/Função',
    
    -- Contato
    phone VARCHAR(20) COMMENT 'Telefone fixo',
    mobile VARCHAR(20) COMMENT 'Celular',
    
    -- Permissões
    role ENUM('admin', 'manager', 'technician', 'operator', 'viewer') DEFAULT 'viewer' COMMENT 'Perfil de acesso',
    permissions JSON COMMENT 'Permissões específicas em JSON',
    
    -- Status
    is_active BOOLEAN DEFAULT TRUE COMMENT 'Usuário ativo?',
    last_login DATETIME COMMENT 'Data/hora do último login',
    
    -- Assinatura digital (para certificados)
    digital_signature TEXT COMMENT 'Assinatura digital em base64',
    signature_certificate TEXT COMMENT 'Certificado digital',
    
    -- Auditoria
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE RESTRICT,
    
    -- Índices
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_organization (organization_id),
    INDEX idx_role (role),
    INDEX idx_is_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='Usuários do sistema';
