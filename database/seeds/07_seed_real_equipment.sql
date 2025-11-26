-- ============================================================================
-- Seed Data: Equipamentos Reais CMASM (Dados de Exemplo)
-- Descrição: Equipamentos típicos de calibração encontrados no CMASM
-- Data: 2025-11-26
-- ============================================================================

-- Obter IDs de organizações
SET @cmasm_id = (SELECT id FROM organizations WHERE code = 'CMASM' LIMIT 1);
SET @sec_eletron_id = (SELECT id FROM organizations WHERE code = 'SEC-ELETRON' LIMIT 1);
SET @sec_manut_id = (SELECT id FROM organizations WHERE code = 'DIV-MANUT' LIMIT 1);
SET @sec_metal_id = (SELECT id FROM organizations WHERE code = 'SEC-METAL' LIMIT 1);
SET @sec_maq_id = (SELECT id FROM organizations WHERE code = 'SEC-MAQ' LIMIT 1);

-- Obter IDs de laboratórios
SET @cms_lab_id = (SELECT id FROM laboratories WHERE code = 'CMS-LAB' LIMIT 1);
SET @bacs_id = (SELECT id FROM laboratories WHERE code = 'BACS' LIMIT 1);
SET @mvmetro_id = (SELECT id FROM laboratories WHERE code = 'MVMETRO' LIMIT 1);

-- ============================================================================
-- EQUIPAMENTOS ELÉTRICOS - Seção Eletrônica
-- ============================================================================

INSERT INTO equipment (
    internal_code, asset_type, manufacturer, model, serial_number,
    organization_id, location, category_1, category_2, priority, status,
    is_calibrated, calibration_default_interval_days, weight_grams,
    acquisition_date, notes
) VALUES
-- Multímetros
(
    'MULT-001',
    'Multímetro Digital True RMS',
    'Fluke',
    '87V',
    '12345678',
    @sec_eletron_id,
    'Bancada 01 - Lab Eletrônica',
    'eletrico',
    'medicao_tensao',
    'alta',
    'active',
    TRUE,
    365,
    600,
    '2020-03-15',
    'Multímetro de precisão para medições AC/DC. Faixa: 0,1mV a 1000V'
),
(
    'MULT-002',
    'Multímetro Digital',
    'Keysight',
    '34465A',
    'MY57001234',
    @sec_eletron_id,
    'Bancada 02 - Lab Eletrônica',
    'eletrico',
    'medicao_tensao',
    'alta',
    'active',
    TRUE,
    365,
    950,
    '2021-06-20',
    '6½ dígitos, True RMS. Interface USB/LAN'
),
(
    'MULT-003',
    'Multímetro Digital',
    'Minipa',
    'ET-2042',
    'SN789456',
    @sec_eletron_id,
    'Estoque - Sala 3',
    'eletrico',
    'medicao_tensao',
    'normal',
    'active',
    TRUE,
    365,
    300,
    '2019-01-10',
    'Uso geral. Cat III 600V'
),

-- Osciloscópios
(
    'OSC-001',
    'Osciloscópio Digital 100MHz',
    'Tektronix',
    'TBS2104',
    'C012345',
    @sec_eletron_id,
    'Bancada 03 - Lab Eletrônica',
    'eletrico',
    'analise_forma_onda',
    'critica',
    'active',
    TRUE,
    730,
    3200,
    '2022-08-12',
    '4 canais, 1GS/s, display TFT. Calibração bienal'
),
(
    'OSC-002',
    'Osciloscópio Digital 200MHz',
    'Rigol',
    'DS1204B',
    'DS1ZC220100123',
    @sec_eletron_id,
    'Bancada 04 - Lab Eletrônica',
    'eletrico',
    'analise_forma_onda',
    'alta',
    'active',
    TRUE,
    730,
    4100,
    '2023-02-28',
    '4 canais, 2GSa/s. FFT integrado'
),

-- Fontes de alimentação
(
    'FONTE-001',
    'Fonte de Alimentação DC 30V/5A',
    'Agilent',
    'E3631A',
    'MY45123456',
    @sec_eletron_id,
    'Bancada 01 - Lab Eletrônica',
    'eletrico',
    'fonte_tensao',
    'alta',
    'active',
    TRUE,
    365,
    8500,
    '2018-11-05',
    'Tripla saída: ±25V/1A, 6V/5A. GPIB'
),
(
    'FONTE-002',
    'Fonte de Alimentação DC 60V/3A',
    'Minipa',
    'MPL-3003M',
    'MPL20190234',
    @sec_eletron_id,
    'Bancada 05 - Lab Eletrônica',
    'eletrico',
    'fonte_tensao',
    'normal',
    'active',
    TRUE,
    365,
    2800,
    '2019-09-18',
    'Saída única ajustável. Display LED'
),

-- Geradores de função
(
    'GEN-001',
    'Gerador de Funções 25MHz',
    'Keysight',
    '33220A',
    'MY50012345',
    @sec_eletron_id,
    'Bancada 03 - Lab Eletrônica',
    'eletrico',
    'geracao_sinais',
    'alta',
    'active',
    TRUE,
    730,
    2300,
    '2021-03-22',
    'Formas: senoidal, quadrada, triangular, rampa. AM/FM/PWM'
),

-- Medidores de potência
(
    'POT-001',
    'Wattímetro Digital Trifásico',
    'Yokogawa',
    'WT310',
    'C2SK12345',
    @sec_eletron_id,
    'Bancada 06 - Lab Eletrônica',
    'eletrico',
    'medicao_potencia',
    'critica',
    'active',
    TRUE,
    365,
    3500,
    '2020-05-14',
    'Faixa: 15Hz-100kHz. Precisão: ±0.1%. Medição trifásica'
),

-- ============================================================================
-- EQUIPAMENTOS MECÂNICOS - Seção Máquinas
-- ============================================================================

-- Paquímetros digitais
(
    'PAQ-001',
    'Paquímetro Digital 150mm',
    'Mitutoyo',
    '500-196-30',
    'MD201234',
    @sec_maq_id,
    'Sala Metrologia - Armário A1',
    'mecanico',
    'medicao_dimensional',
    'alta',
    'active',
    TRUE,
    365,
    180,
    '2021-07-08',
    'Resolução: 0,01mm. Certificado RBC. Aço inox'
),
(
    'PAQ-002',
    'Paquímetro Digital 300mm',
    'Starrett',
    '799A-6/150',
    'ST789012',
    @sec_maq_id,
    'Sala Metrologia - Armário A1',
    'mecanico',
    'medicao_dimensional',
    'alta',
    'active',
    TRUE,
    365,
    420,
    '2022-01-20',
    'Resolução: 0,01mm. Display LCD grande'
),

-- Micrômetros
(
    'MIC-001',
    'Micrômetro Externo Digital 0-25mm',
    'Mitutoyo',
    '293-340-30',
    'MC345678',
    @sec_maq_id,
    'Sala Metrologia - Armário A2',
    'mecanico',
    'medicao_dimensional',
    'critica',
    'active',
    TRUE,
    365,
    320,
    '2020-09-15',
    'Resolução: 0,001mm. IP65. Com certificado de calibração'
),
(
    'MIC-002',
    'Micrômetro Externo Digital 25-50mm',
    'Mitutoyo',
    '293-341-30',
    'MC345679',
    @sec_maq_id,
    'Sala Metrologia - Armário A2',
    'mecanico',
    'medicao_dimensional',
    'critica',
    'active',
    TRUE,
    365,
    330,
    '2020-09-15',
    'Resolução: 0,001mm. IP65. Com certificado de calibração'
),

-- Relógios comparadores
(
    'REL-001',
    'Relógio Comparador Digital 0,001mm',
    'Mitutoyo',
    '543-790B',
    'RC123456',
    @sec_maq_id,
    'Sala Metrologia - Bancada Central',
    'mecanico',
    'medicao_dimensional',
    'alta',
    'active',
    TRUE,
    365,
    250,
    '2019-05-10',
    'Curso: 12,7mm. Resolução: 0,001mm. Saída de dados'
),

-- Torquímetros
(
    'TOR-001',
    'Torquímetro Digital 10-100 N.m',
    'Gedore',
    'DREMOMETER A',
    'GD567890',
    @sec_maq_id,
    'Sala Ferramentas Especiais - Prateleira 2',
    'mecanico',
    'medicao_torque',
    'critica',
    'active',
    TRUE,
    365,
    1800,
    '2021-11-03',
    'Precisão: ±2%. Display digital. Sinal sonoro/luminoso'
),
(
    'TOR-002',
    'Torquímetro Digital 50-250 N.m',
    'Snap-on',
    'TECH3FR250',
    'SN890123',
    @sec_maq_id,
    'Sala Ferramentas Especiais - Prateleira 2',
    'mecanico',
    'medicao_torque',
    'critica',
    'active',
    TRUE,
    365,
    2300,
    '2022-04-15',
    'Precisão: ±2%. LED display. Memória de leituras'
),

-- Balanças
(
    'BAL-001',
    'Balança de Precisão 5kg x 0,01g',
    'Marte',
    'AS 5500C',
    'MT234567',
    @sec_maq_id,
    'Sala Metrologia - Bancada Pesagem',
    'mecanico',
    'medicao_massa',
    'alta',
    'active',
    TRUE,
    365,
    4200,
    '2020-02-18',
    'Calibração interna automática. Interface RS-232'
),
(
    'BAL-002',
    'Balança Analítica 220g x 0,0001g',
    'Shimadzu',
    'AUW220D',
    'SH123789',
    @sec_maq_id,
    'Sala Metrologia - Bancada Pesagem',
    'mecanico',
    'medicao_massa',
    'critica',
    'active',
    TRUE,
    365,
    5800,
    '2021-08-25',
    'Resolução 0,1mg. Calibração automática. Ambiente controlado'
),

-- ============================================================================
-- EQUIPAMENTOS DE PRESSÃO E TEMPERATURA
-- ============================================================================

-- Manômetros digitais
(
    'MAN-001',
    'Manômetro Digital 0-10 bar',
    'Beamex',
    'MC6-EX',
    'BX456789',
    @sec_manut_id,
    'Lab Pneumática - Bancada 1',
    'mecanico',
    'medicao_pressao',
    'alta',
    'active',
    TRUE,
    365,
    1200,
    '2022-06-30',
    'Precisão: 0,05% FS. ATEX Zone 0. Datalogger'
),
(
    'MAN-002',
    'Calibrador de Pressão Portátil 0-700 bar',
    'Druck',
    'DPI 610',
    'DK789012',
    @sec_manut_id,
    'Lab Pneumática - Armário Ferramentas',
    'mecanico',
    'medicao_pressao',
    'critica',
    'active',
    TRUE,
    365,
    2100,
    '2023-01-12',
    'Bomba manual integrada. Display duplo. Certificado NIST'
),

-- Termômetros e termopares
(
    'TERM-001',
    'Termômetro Digital Portátil -200 a 1372°C',
    'Fluke',
    '54-II',
    'FK234567',
    @sec_manut_id,
    'Lab Temperatura - Caixa Instrumentos',
    'eletrico',
    'medicao_temperatura',
    'alta',
    'active',
    TRUE,
    365,
    480,
    '2020-10-22',
    'Dual channel. Tipo K/J/T/E/R/S/N. Min/Max/Avg. Data logging'
),
(
    'TERM-002',
    'Calibrador de Temperatura -25 a 660°C',
    'Fluke',
    '9143',
    'FK567890',
    @sec_manut_id,
    'Lab Temperatura - Bancada Calibração',
    'eletrico',
    'medicao_temperatura',
    'critica',
    'active',
    TRUE,
    730,
    15000,
    '2023-03-08',
    'Bloco seco. Estabilidade: ±0,05°C. Calibração bienal. Interface USB'
),

-- Higrômetros
(
    'HIG-001',
    'Termo-Higrômetro Digital',
    'Testo',
    '625',
    'TS345678',
    @sec_manut_id,
    'Almoxarifado - Armário Climatização',
    'eletrico',
    'medicao_umidade',
    'normal',
    'active',
    TRUE,
    365,
    350,
    '2021-12-05',
    'Faixa: 0-100% UR. Temp: -20 a 70°C. Ponto de orvalho. Data hold'
),

-- ============================================================================
-- EQUIPAMENTOS DE METALURGIA
-- ============================================================================

-- Durômetros
(
    'DUR-001',
    'Durômetro Digital Portátil',
    'Mitutoyo',
    'HH-411',
    'DU123456',
    @sec_metal_id,
    'Lab Ensaios - Bancada Dureza',
    'mecanico',
    'ensaio_dureza',
    'alta',
    'active',
    TRUE,
    365,
    850,
    '2020-07-16',
    'Escalas: HRC/HRB/HV/HB. Display LCD. Conversão automática'
),

-- Rugosímetros
(
    'RUG-001',
    'Rugosímetro Portátil',
    'Mitutoyo',
    'SJ-210',
    'RG789012',
    @sec_metal_id,
    'Lab Ensaios - Armário Instrumentos',
    'mecanico',
    'medicao_rugosidade',
    'alta',
    'active',
    TRUE,
    365,
    420,
    '2021-09-20',
    'Parâmetros: Ra, Rz, Rq. Memória 10 medições. Bateria recarregável'
),

-- Espessímetros ultrassônicos
(
    'ESP-001',
    'Medidor de Espessura por Ultrassom',
    'Panametrics',
    '26MG',
    'PM456789',
    @sec_metal_id,
    'Lab NDT - Caixa Equipamentos',
    'eletrico',
    'medicao_espessura',
    'alta',
    'active',
    TRUE,
    365,
    680,
    '2022-11-10',
    'Faixa: 0,08-508mm. Display gráfico. Datalogger. IP67'
);

-- ============================================================================
-- CRIAR CALIBRAÇÕES HISTÓRICAS PARA ALGUNS EQUIPAMENTOS
-- ============================================================================

-- Calibrações do último ano (exemplos)
INSERT INTO calibrations (equipment_id, calibration_date, laboratory_id, calibration_type, status, cost, pass_fail)
SELECT id, DATE_SUB(CURDATE(), INTERVAL 180 DAY), @cms_lab_id, 'routine', 'approved', 350.00, TRUE
FROM equipment WHERE internal_code IN ('MULT-001', 'MULT-002', 'OSC-001', 'PAQ-001', 'MIC-001');

INSERT INTO calibrations (equipment_id, calibration_date, laboratory_id, calibration_type, status, cost, pass_fail)
SELECT id, DATE_SUB(CURDATE(), INTERVAL 90 DAY), @bacs_id, 'routine', 'approved', 420.00, TRUE
FROM equipment WHERE internal_code IN ('FONTE-001', 'GEN-001', 'POT-001', 'TOR-001', 'BAL-001');

-- Atualizar equipamentos com última calibração
UPDATE equipment e
JOIN calibrations c ON c.equipment_id = e.id
SET 
    e.last_calibration_id = c.id,
    e.next_calibration_due_date = DATE_ADD(c.calibration_date, INTERVAL e.calibration_default_interval_days DAY)
WHERE c.status = 'approved';

-- ============================================================================
-- VERIFICAÇÃO
-- ============================================================================

SELECT 
    o.name as organizacao,
    COUNT(e.id) as total_equipamentos,
    SUM(CASE WHEN e.category_1 = 'eletrico' THEN 1 ELSE 0 END) as eletricos,
    SUM(CASE WHEN e.category_1 = 'mecanico' THEN 1 ELSE 0 END) as mecanicos,
    SUM(CASE WHEN e.last_calibration_id IS NOT NULL THEN 1 ELSE 0 END) as calibrados
FROM equipment e
JOIN organizations o ON e.organization_id = o.id
GROUP BY o.name
ORDER BY o.name;

SELECT 
    'Total de equipamentos cadastrados' as info,
    COUNT(*) as quantidade
FROM equipment
UNION ALL
SELECT 
    'Equipamentos com calibração histórica',
    COUNT(*)
FROM equipment
WHERE last_calibration_id IS NOT NULL
UNION ALL
SELECT 
    'Calibrações registradas',
    COUNT(*)
FROM calibrations;

SELECT 'Seed de equipamentos reais concluído!' as status;
