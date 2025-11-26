-- ============================================================================
-- Seed Data: Usuário Administrador
-- Descrição: Usuário admin inicial do sistema
-- Data: 2025-11-26
-- IMPORTANTE: Alterar senha em produção!
-- ============================================================================

-- Obter ID da organização CMASM
SET @cmasm_id = (SELECT id FROM organizations WHERE code = 'CMASM' LIMIT 1);

-- Criar usuário administrador
-- Senha padrão: Admin@123 (hash bcrypt)
-- IMPORTANTE: Mudar esta senha imediatamente após primeiro login!
INSERT INTO users (
    username,
    email,
    password_hash,
    full_name,
    `rank`,
    registration_number,
    organization_id,
    department,
    position,
    phone,
    mobile,
    role,
    permissions,
    is_active
) VALUES (
    'admin',
    'admin@cmasm.mar.mil.br',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'Administrador do Sistema',
    'CT',
    'MB-000001',
    @cmasm_id,
    'Tecnologia da Informação',
    'Administrador de Sistemas',
    '(21) 2104-5000',
    '(21) 99999-0000',
    'admin',
    JSON_OBJECT(
        'equipment', JSON_ARRAY('create', 'read', 'update', 'delete'),
        'calibrations', JSON_ARRAY('create', 'read', 'update', 'delete', 'approve'),
        'services', JSON_ARRAY('create', 'read', 'update', 'delete', 'approve'),
        'users', JSON_ARRAY('create', 'read', 'update', 'delete'),
        'reports', JSON_ARRAY('create', 'read', 'download'),
        'system', JSON_ARRAY('backup', 'restore', 'config')
    ),
    TRUE
);

SET @admin_id = LAST_INSERT_ID();

-- Obter ID da Seção Eletrônica
SET @sec_eletron_id = (SELECT id FROM organizations WHERE code = 'SEC-ELETRON' LIMIT 1);

-- Criar usuário técnico da Seção Eletrônica
INSERT INTO users (
    username,
    email,
    password_hash,
    full_name,
    `rank`,
    registration_number,
    organization_id,
    position,
    mobile,
    role,
    permissions,
    is_active
) VALUES (
    'tecnico.eletron',
    'tecnico.eletronica@cmasm.mar.mil.br',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'José da Silva Santos',
    'SO',
    'MB-123456',
    @sec_eletron_id,
    'Técnico em Eletrônica',
    '(21) 98888-1111',
    'technician',
    JSON_OBJECT(
        'equipment', JSON_ARRAY('create', 'read', 'update'),
        'calibrations', JSON_ARRAY('create', 'read', 'update'),
        'services', JSON_ARRAY('create', 'read', 'update'),
        'reports', JSON_ARRAY('read', 'download')
    ),
    TRUE
);

-- Criar usuário gerente
INSERT INTO users (
    username,
    email,
    password_hash,
    full_name,
    `rank`,
    registration_number,
    organization_id,
    position,
    mobile,
    role,
    permissions,
    is_active
) VALUES (
    'gerente.qualidade',
    'qualidade@cmasm.mar.mil.br',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'Maria Oliveira Costa',
    'CF',
    'MB-789012',
    @cmasm_id,
    'Gerente de Qualidade',
    '(21) 97777-2222',
    'manager',
    JSON_OBJECT(
        'equipment', JSON_ARRAY('read', 'update'),
        'calibrations', JSON_ARRAY('read', 'update', 'approve'),
        'services', JSON_ARRAY('read', 'update', 'approve'),
        'reports', JSON_ARRAY('create', 'read', 'download'),
        'certificates', JSON_ARRAY('read', 'approve', 'sign')
    ),
    TRUE
);

-- Verificação
SELECT 
    u.username,
    u.email,
    u.full_name,
    u.`rank`,
    o.name as organization,
    u.role,
    u.is_active
FROM users u
JOIN organizations o ON u.organization_id = o.id
ORDER BY u.role, u.username;

-- ============================================================================
-- AVISO DE SEGURANÇA
-- ============================================================================
-- As senhas acima são APENAS para desenvolvimento!
-- Em PRODUÇÃO, você DEVE:
-- 1. Alterar todas as senhas imediatamente
-- 2. Usar senhas fortes com no mínimo 12 caracteres
-- 3. Incluir letras maiúsculas, minúsculas, números e símbolos
-- 4. Ativar autenticação de dois fatores (2FA)
-- 5. Implementar política de rotação de senhas
-- ============================================================================
