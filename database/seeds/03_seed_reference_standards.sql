-- ============================================================================
-- Seed Data: Padrões de Referência
-- Descrição: Padrões rastreáveis para calibração
-- Data: 2025-11-26
-- ============================================================================

INSERT INTO reference_standards (
    id, name, code, last_calibration_date, traceability_chain
) VALUES
-- Padrões elétricos
(
    'STD-001',
    'Padrão de Tensão DC 10V',
    'REF-VOLT-10V',
    '2025-06-15',
    'RBC → INMETRO → BIPM (Bureau International des Poids et Mesures)'
),
(
    'STD-002',
    'Padrão de Resistência 100Ω',
    'REF-RES-100R',
    '2025-05-20',
    'RBC → INMETRO → PTB (Physikalisch-Technische Bundesanstalt)'
),
(
    'STD-003',
    'Padrão de Corrente DC 1A',
    'REF-CURR-1A',
    '2025-07-01',
    'RBC → INMETRO → NIST'
),

-- Padrões de temperatura
(
    'STD-004',
    'Padrão de Temperatura -20°C a 150°C',
    'REF-TEMP-RANGE',
    '2025-07-10',
    'RBC → INMETRO → PTB'
),
(
    'STD-005',
    'Termômetro Padrão Pt100',
    'REF-TEMP-PT100',
    '2025-08-05',
    'RBC → INMETRO → NIST'
),

-- Padrões mecânicos
(
    'STD-006',
    'Padrão de Massa 1kg',
    'REF-MASS-1KG',
    '2025-04-15',
    'INMETRO → BIPM'
),
(
    'STD-007',
    'Padrão de Torque 50 N.m',
    'REF-TORQUE-50NM',
    '2025-09-20',
    'RBC → INMETRO'
),

-- Padrões de pressão
(
    'STD-008',
    'Padrão de Pressão 0-10 bar',
    'REF-PRESS-10BAR',
    '2025-06-30',
    'RBC → INMETRO → PTB'
),
(
    'STD-009',
    'Manômetro Padrão Digital',
    'REF-PRESS-DIG',
    '2025-05-15',
    'RBC → INMETRO'
),

-- Padrões dimensionais
(
    'STD-010',
    'Bloco Padrão 100mm Classe 0',
    'REF-DIM-100MM',
    '2025-08-25',
    'RBC → INMETRO → PTB'
);

-- Verificação
SELECT 
    id,
    name,
    code,
    last_calibration_date,
    DATEDIFF(DATE_ADD(last_calibration_date, INTERVAL 365 DAY), CURDATE()) as days_until_recalibration,
    SUBSTRING(traceability_chain, 1, 50) as traceability
FROM reference_standards
ORDER BY last_calibration_date;
