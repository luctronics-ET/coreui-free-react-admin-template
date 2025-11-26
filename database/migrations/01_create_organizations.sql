-- ============================================================================
-- Tabela: organizations
-- Descrição: Estrutura hierárquica OM > Departamento > Divisão > Seção
-- Data: 2025-11-26
-- ============================================================================

CREATE TABLE IF NOT EXISTS organizations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE COMMENT 'Código da organização (CMASM, DEPT-ARMAS, etc)',
    name VARCHAR(200) NOT NULL COMMENT 'Nome completo da organização',
    type ENUM('om', 'department', 'division', 'section') NOT NULL COMMENT 'Tipo hierárquico',
    parent_id INT NULL COMMENT 'ID da organização pai (hierarquia)',
    responsible_officer VARCHAR(100) COMMENT 'Oficial responsável',
    contact_phone VARCHAR(20) COMMENT 'Telefone de contato',
    contact_email VARCHAR(100) COMMENT 'Email institucional',
    address TEXT COMMENT 'Endereço completo',
    is_active BOOLEAN DEFAULT TRUE COMMENT 'Status ativo/inativo',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Índices
    INDEX idx_code (code),
    INDEX idx_type (type),
    INDEX idx_parent (parent_id),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci 
COMMENT='Estrutura organizacional CMASM';

-- Adicionar foreign key self-reference após criação da tabela
ALTER TABLE organizations
ADD CONSTRAINT fk_organizations_parent
FOREIGN KEY (parent_id) REFERENCES organizations(id) ON DELETE SET NULL;
