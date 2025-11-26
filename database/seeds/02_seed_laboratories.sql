-- ============================================================================
-- Seed Data: Laboratórios de Calibração
-- Descrição: Laboratórios internos e externos
-- Data: 2025-11-26
-- ============================================================================

INSERT INTO laboratories (
    code, name, type, is_accredited, 
    accreditation_body, accreditation_number, rating,
    contact_person, phone, email
) VALUES
-- Laboratório interno
(
    'CMS-LAB',
    'Laboratório de Metrologia - Centro de Manutenção da Marinha',
    'internal',
    TRUE,
    'INMETRO',
    'RBC-LAB-001',
    4.50,
    'CT José Silva',
    '(21) 2104-5000',
    'metrologia@cms.mar.mil.br'
),

-- Laboratórios externos acreditados
(
    'BACS',
    'BACS Laboratório de Calibração',
    'external',
    TRUE,
    'RBC',
    'RBC-LAB-123',
    4.20,
    'Eng. Carlos Santos',
    '(21) 3333-1111',
    'contato@bacscalibracao.com.br'
),
(
    'MVMETRO',
    'MV Metrologia e Calibração',
    'external',
    TRUE,
    'RBC',
    'RBC-LAB-456',
    4.80,
    'Téc. Maria Oliveira',
    '(11) 4444-2222',
    'comercial@mvmetrologia.com.br'
),
(
    'VISOMES',
    'Visomes Metrologia',
    'external',
    TRUE,
    'RBC',
    'RBC-LAB-789',
    4.60,
    'Eng. Pedro Costa',
    '(21) 5555-3333',
    'atendimento@visomes.com.br'
),
(
    'IPTC',
    'IPTC - Instituto de Pesquisas Tecnológicas e Calibração',
    'external',
    TRUE,
    'INMETRO',
    'INMETRO-LAB-999',
    4.90,
    'Dr. Roberto Lima',
    '(11) 6666-4444',
    'comercial@iptc.org.br'
),

-- Laboratórios externos não acreditados
(
    'MSMI',
    'MSMI Calibração e Serviços',
    'external',
    FALSE,
    NULL,
    NULL,
    3.50,
    'João Ferreira',
    '(21) 7777-5555',
    'contato@msmicalib.com.br'
),
(
    'CALIBRARIO',
    'Calibrario Ltda',
    'external',
    FALSE,
    NULL,
    NULL,
    3.80,
    'Ana Paula',
    '(21) 8888-6666',
    'vendas@calibrario.com.br'
);

-- Adicionar especialidades em JSON
UPDATE laboratories SET specialties = JSON_ARRAY(
    'calibracao_eletrica',
    'calibracao_mecanica',
    'calibracao_temperatura',
    'calibracao_pressao'
) WHERE code = 'CMS-LAB';

UPDATE laboratories SET specialties = JSON_ARRAY(
    'calibracao_eletrica',
    'calibracao_eletronica'
) WHERE code = 'BACS';

UPDATE laboratories SET specialties = JSON_ARRAY(
    'calibracao_dimensional',
    'calibracao_mecanica',
    'calibracao_torque'
) WHERE code = 'MVMETRO';

UPDATE laboratories SET specialties = JSON_ARRAY(
    'calibracao_eletrica',
    'calibracao_temperatura',
    'calibracao_umidade'
) WHERE code = 'VISOMES';

UPDATE laboratories SET specialties = JSON_ARRAY(
    'calibracao_eletrica',
    'calibracao_mecanica',
    'calibracao_temperatura',
    'calibracao_pressao',
    'calibracao_dimensional',
    'calibracao_massa'
) WHERE code = 'IPTC';

-- Verificação
SELECT 
    code,
    name,
    type,
    is_accredited,
    accreditation_body,
    rating,
    contact_person
FROM laboratories
ORDER BY is_accredited DESC, rating DESC;
