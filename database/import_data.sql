-- CMASM Calibration Data Import
-- Generated from ODS file

START TRANSACTION;


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-003', NULL, 'TT-SI 9001', '±1000 V AC 1400 V AC/DC 100 MHz', NULL, '1805707', 'eletrico', 'DIFFERENTIAL PROBE', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TT-SI 9001',
    measurement_range = '±1000 V AC 1400 V AC/DC 100 MHz',
    unit = NULL,
    serial_number = '1805707',
    category_1 = 'eletrico',
    asset_type = 'DIFFERENTIAL PROBE',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-03-12', '2026-03-12', 24, NULL, 373.83, NULL, NULL, NULL, NULL, '2024-03-14', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-001', NULL, 'CPC 6000', NULL, NULL, '611933', 'mecanico', 'CONTROLADOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CPC 6000',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '611933',
    category_1 = 'mecanico',
    asset_type = 'CONTROLADOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-002', NULL, 'CPC 6000', NULL, NULL, '613265', 'mecanico', 'CONTROLADOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CPC 6000',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '613265',
    category_1 = 'mecanico',
    asset_type = 'CONTROLADOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-07-01', '2026-07-01', 12, NULL, 193.0, NULL, NULL, NULL, NULL, '2025-07-08', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-003', NULL, 'CPC 3000', NULL, NULL, '810517', 'mecanico', 'CONTROLADOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CPC 3000',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '810517',
    category_1 = 'mecanico',
    asset_type = 'CONTROLADOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-004', NULL, 'CPC 3000', NULL, NULL, '810518', 'mecanico', 'CONTROLADOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CPC 3000',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '810518',
    category_1 = 'mecanico',
    asset_type = 'CONTROLADOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-004', NULL, 'XG 300-2.8', '0-300V , 0-2.8A ,850W', NULL, '1524A03449', 'eletrico', 'FONTE DC', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'XG 300-2.8',
    measurement_range = '0-300V , 0-2.8A ,850W',
    unit = NULL,
    serial_number = '1524A03449',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-12-12', '2025-12-12', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2025-01-31', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-004', NULL, 'PRESSURE SENSOR (ART_0000019066) – P2AIOP-IT (0-6 bar)', '6', 'Bar', '0025A', 'mecanico', 'MANÔMETRO DIGITAL IN LOCO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PRESSURE SENSOR (ART_0000019066) – P2AIOP-IT (0-6 bar)',
    measurement_range = '6',
    unit = 'Bar',
    serial_number = '0025A',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO DIGITAL IN LOCO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('BACS', 'BACS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-06-29', '2024-06-29', 12, NULL, 1058.44333333333, NULL, NULL, NULL, NULL, NULL, 'Calibração deve ser realizada in loco. ', (SELECT id FROM providers WHERE name = 'BACS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-005', NULL, 'PRESSURE SENSOR (ART_0000019066) – P1AIOP-IT (0-6 bar)', '6', 'Bar', '0045A', 'mecanico', 'MANÔMETRO DIGITAL IN LOCO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PRESSURE SENSOR (ART_0000019066) – P1AIOP-IT (0-6 bar)',
    measurement_range = '6',
    unit = 'Bar',
    serial_number = '0045A',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO DIGITAL IN LOCO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('BACS', 'BACS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-06-29', '2024-06-29', 12, NULL, 1058.44333333333, NULL, NULL, NULL, NULL, NULL, 'Calibração deve ser realizada in loco. ', (SELECT id FROM providers WHERE name = 'BACS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-005';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-006', NULL, 'PRESSURE SENSOR (ART_0000019066) – VÁCUOAIOP-IT (0-1,6 bar)', '1.6', 'Bar', '0049A', 'mecanico', 'MANÔMETRO DIGITAL IN LOCO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PRESSURE SENSOR (ART_0000019066) – VÁCUOAIOP-IT (0-1,6 bar)',
    measurement_range = '1.6',
    unit = 'Bar',
    serial_number = '0049A',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO DIGITAL IN LOCO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('BACS', 'BACS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-06-29', '2024-06-29', 12, NULL, 1058.44333333333, NULL, NULL, NULL, NULL, NULL, 'Calibração deve ser realizada in loco. ', (SELECT id FROM providers WHERE name = 'BACS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-005', NULL, 'BK9801', '    Output Voltage: 0-300V    Output Current: 3.0A at 0-150V , 1.5A at 0-300V    Max Power: 300VA', NULL, '461F17128', 'eletrico', 'FONTE DC', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'BK9801',
    measurement_range = '    Output Voltage: 0-300V    Output Current: 3.0A at 0-150V , 1.5A at 0-300V    Max Power: 300VA',
    unit = NULL,
    serial_number = '461F17128',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-05-10', '2024-05-10', 12, NULL, 1000.56, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-005';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-006', NULL, 'Z1020 LAN', '10 V /  20 A ', NULL, 'EAY-849A001-0001', 'eletrico', 'FONTE DC', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Z1020 LAN',
    measurement_range = '10 V /  20 A ',
    unit = NULL,
    serial_number = 'EAY-849A001-0001',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-05-10', '2024-05-10', 12, NULL, 1000.56, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-007', NULL, 'GENH30-25 LAN', '30 V /  25 A', NULL, 'LOC-843A174-0001', 'eletrico', 'FONTE DC', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GENH30-25 LAN',
    measurement_range = '30 V /  25 A',
    unit = NULL,
    serial_number = 'LOC-843A174-0001',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-05-09', '2024-05-09', 12, NULL, 1000.56, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-007';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-008', NULL, 'GENH300-2.5 LAN', '300 V /  2.5 A', NULL, 'LOC-846A105-0001', 'eletrico', 'FONTE DC', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GENH300-2.5 LAN',
    measurement_range = '300 V /  2.5 A',
    unit = NULL,
    serial_number = 'LOC-846A105-0001',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-05-09', '2024-05-09', 12, NULL, 1000.56, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-008';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-012', NULL, 'CA 6541', ' resistance: 0.01 Ω to 400 kΩ continuity: 0.01Ω to +40 Ω', NULL, '165549RJH', 'eletrico', 'MEGÔHMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CA 6541',
    measurement_range = ' resistance: 0.01 Ω to 400 kΩ continuity: 0.01Ω to +40 Ω',
    unit = NULL,
    serial_number = '165549RJH',
    category_1 = 'eletrico',
    asset_type = 'MEGÔHMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-17', '2024-10-17', 12, NULL, 373.83, NULL, NULL, NULL, NULL, '2023-10-23', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-012';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-013', NULL, '711B', NULL, NULL, '2019W450661', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '711B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2019W450661',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-12-12', '2025-12-12', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2025-01-31', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-013';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-014', NULL, '711B', NULL, NULL, '2019W450803', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '711B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2019W450803',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-015', NULL, '711B', NULL, NULL, '2019W460729', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '711B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2019W460729',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-09-27', '2024-09-27', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-10-09', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-015';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-016', NULL, '711B', NULL, NULL, '2020W020473', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '711B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2020W020473',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-017', NULL, '17B+', NULL, NULL, '48412868WS', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '17B+',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '48412868WS',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-08', '2025-07-08', 12, NULL, 667.04, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-017';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-018', NULL, '17B+', NULL, NULL, '51180543WS', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '17B+',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '51180543WS',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-04', '2026-02-04', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2025-02-17', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-018';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-019', NULL, '17B+', NULL, NULL, '51180565WS', 'eletrico', 'MULTÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '17B+',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '51180565WS',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-021', NULL, '34461A', NULL, NULL, 'MY53208356', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '34461A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'MY53208356',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-05-12', '2024-05-12', 12, NULL, 667.04, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-021';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-022', NULL, '34461A', '1000 VDC 750 VAC100 a 100M Ohm0.01 a 3 ADC1 a 3 AACContinuidade Diodo', NULL, 'MY57211490', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '34461A',
    measurement_range = '1000 VDC 750 VAC100 a 100M Ohm0.01 a 3 ADC1 a 3 AACContinuidade Diodo',
    unit = NULL,
    serial_number = 'MY57211490',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-05-12', '2024-05-12', 12, NULL, 667.04, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-022';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-023', NULL, 'RN5306', NULL, NULL, '2811NE080117A', 'eletrico', 'OHMÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RN5306',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2811NE080117A',
    category_1 = 'eletrico',
    asset_type = 'OHMÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-09-14', '2024-09-14', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-10-09', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-023';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-024', NULL, 'RN5306', NULL, NULL, '2811NE080141A', 'eletrico', 'OHMÍMETRO', 'F-21', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RN5306',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2811NE080141A',
    category_1 = 'eletrico',
    asset_type = 'OHMÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-025', NULL, 'RN5306', NULL, NULL, '2811NE080144A', 'eletrico', 'OHMÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RN5306',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2811NE080144A',
    category_1 = 'eletrico',
    asset_type = 'OHMÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-11', '2026-02-11', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2025-02-17', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-025';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-ATENA-004', NULL, 'FSL18', NULL, NULL, '102412', 'eletrico', 'ANALISADOR DE ESPECTRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'FSL18',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '102412',
    category_1 = 'eletrico',
    asset_type = 'ANALISADOR DE ESPECTRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-13', '2025-09-13', 12, NULL, 3104.95, NULL, NULL, NULL, NULL, '2024-09-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-ATENA-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-ATENA-001', NULL, '33220A', NULL, NULL, 'MY44059326', 'eletrico', 'GERADOR DE FUNÇÕES', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '33220A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'MY44059326',
    category_1 = 'eletrico',
    asset_type = 'GERADOR DE FUNÇÕES',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-10', '2025-09-10', 12, NULL, 1552.47, NULL, NULL, NULL, NULL, '2024-09-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-ATENA-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-BCA-004', NULL, '179', NULL, NULL, '25120143', 'eletrico', 'MULTÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '179',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '25120143',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-27', '2024-10-27', 12, NULL, 560.75, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-BCA-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-BCA-006', NULL, '73', NULL, NULL, '42520904', 'eletrico', 'MULTÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '73',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '42520904',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-01', '2024-11-01', 12, NULL, 560.75, NULL, NULL, NULL, NULL, '2023-11-16', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-BCA-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-BCA-001', NULL, '73', NULL, NULL, '42520905', 'eletrico', 'MULTÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '73',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '42520905',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-04-11', '2026-04-11', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2025-05-15', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-BCA-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-ATENA-002', NULL, '34401A', '1000 VDC 750 VAC100 a 100M Ohm0.01 a 3 ADC1 a 3 AACContinuidade Diodo', NULL, 'MY47068300', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '34401A',
    measurement_range = '1000 VDC 750 VAC100 a 100M Ohm0.01 a 3 ADC1 a 3 AACContinuidade Diodo',
    unit = NULL,
    serial_number = 'MY47068300',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2024-09-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-ATENA-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-BCA-002', NULL, 'TDS210', NULL, NULL, 'B104582', 'eletrico', 'OSCILOSCÓPIO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TDS210',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'B104582',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-10', '2024-11-10', 12, NULL, 747.66, NULL, NULL, NULL, NULL, '2023-12-21', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-BCA-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-BCA-003', NULL, 'TBS1102B ', NULL, NULL, 'C032174', 'eletrico', 'OSCILOSCÓPIO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TBS1102B ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'C032174',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-10', '2024-11-10', 12, NULL, 747.66, NULL, NULL, NULL, NULL, '2023-12-21', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-BCA-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-MIS-001', NULL, '6255A', NULL, NULL, '2625A-08580', 'eletrico', 'FONTE DC', 'MISTRAL', 'normal', 'cms', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '6255A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2625A-08580',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'MISTRAL',
    priority = 'normal',
    location = 'cms',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-12-18', '2025-12-18', 12, NULL, 560.75, NULL, NULL, NULL, NULL, '2025-01-31', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-MIS-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-004', NULL, '5328B', NULL, NULL, '2510A01544', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5328B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2510A01544',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-08-10', '2024-08-10', 12, NULL, 1552.47, NULL, NULL, NULL, NULL, '2023-12-21', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-005', NULL, '5328B', NULL, NULL, '2510A01575', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5328B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2510A01575',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-006', NULL, '5328B', NULL, NULL, '2716A03294', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5328B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2716A03294',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-012', NULL, '3325B', NULL, NULL, '2847A07888', 'eletrico', 'GERADOR DE FUNÇÕES', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3325B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2847A07888',
    category_1 = 'eletrico',
    asset_type = 'GERADOR DE FUNÇÕES',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-09-11', '2024-09-11', 12, NULL, 3881.18, NULL, NULL, NULL, NULL, '2023-09-18', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-012';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-014', NULL, '87 V', NULL, NULL, '27920124', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '87 V',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '27920124',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-08', '2025-08-08', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2024-08-22', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-014';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-015', NULL, '6300', NULL, NULL, '33492780', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '6300',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '33492780',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-13', '2025-08-13', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2024-08-22', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-015';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-016', NULL, '87', NULL, NULL, '52200130', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '87',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '52200130',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-08', '2025-08-08', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2024-08-22', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-016';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-018', NULL, '87', NULL, NULL, '52200139', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '87',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '52200139',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-20', '2024-10-20', 12, NULL, 560.75, NULL, NULL, NULL, NULL, '2023-11-16', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-018';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-019', NULL, '6300', NULL, NULL, '99492780', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '6300',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '99492780',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-04-02', '2026-04-02', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2025-05-15', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-019';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-021', NULL, 'MA-60', NULL, NULL, 'MA-605973', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MA-60',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'MA-605973',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-023', NULL, '3456A     ', '1000 VDC x 100 nV100 a 1G Ohm', NULL, '2015A00737', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3456A     ',
    measurement_range = '1000 VDC x 100 nV100 a 1G Ohm',
    unit = NULL,
    serial_number = '2015A00737',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-11', '2026-02-11', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2025-02-18', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-023';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-025', NULL, '3456A     ', '1000 VDC x 100 nV100 a 1G Ohm', NULL, '2825A21059', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3456A     ',
    measurement_range = '1000 VDC x 100 nV100 a 1G Ohm',
    unit = NULL,
    serial_number = '2825A21059',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-11', '2026-02-11', 12, NULL, 1164.35, NULL, NULL, NULL, NULL, '2025-02-17', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-025';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-027', NULL, 'DSO5034A ', NULL, NULL, 'MY47150672', 'eletrico', 'OSCILOSCÓPIO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'DSO5034A ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'MY47150672',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-08-15', '2024-08-15', 12, NULL, 1552.47, NULL, NULL, NULL, NULL, '2023-09-18', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-027';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-028', NULL, 'DSO5034A ', NULL, NULL, 'SG52370204', 'eletrico', 'OSCILOSCÓPIO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'DSO5034A ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'SG52370204',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-20', '2024-10-20', 12, NULL, 747.66, NULL, NULL, NULL, NULL, '2023-10-23', 'cms ', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-067', NULL, '5100B', '200 VDC x 100 uV1100 VAC x 0.1 uV1.9 ADC x 1nA1.9 AAC x 1nA1 a 10 Mohm', NULL, '3450005', 'eletrico', 'CALIBRADOR MULTIFUNÇÃO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5100B',
    measurement_range = '200 VDC x 100 uV1100 VAC x 0.1 uV1.9 ADC x 1nA1.9 AAC x 1nA1 a 10 Mohm',
    unit = NULL,
    serial_number = '3450005',
    category_1 = 'eletrico',
    asset_type = 'CALIBRADOR MULTIFUNÇÃO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-01-10', '2025-08-10', 7, NULL, 3104.95, NULL, NULL, NULL, NULL, '2025-01-15', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-067';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-039', NULL, '5100B', '200 VDC x 100 uV1100 VAC x 0.1 uV1.9 ADC x 1nA1.9 AAC x 1nA1 a 10 Mohm', NULL, '5165005', 'eletrico', 'CALIBRADOR MULTIFUNÇÃO', 'MK-48', 'normal', 'cms', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5100B',
    measurement_range = '200 VDC x 100 uV1100 VAC x 0.1 uV1.9 ADC x 1nA1.9 AAC x 1nA1 a 10 Mohm',
    unit = NULL,
    serial_number = '5165005',
    category_1 = 'eletrico',
    asset_type = 'CALIBRADOR MULTIFUNÇÃO',
    division = 'MK-48',
    priority = 'normal',
    location = 'cms',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-08', '2025-06-08', 7, NULL, 3104.95, NULL, NULL, NULL, NULL, '2024-11-12', 'nec material', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-039';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-069', NULL, '5100B', '200 VDC x 100 uV1100 VAC x 0.1 uV1.9 ADC x 1nA1.9 AAC x 1nA1 a 10 Mohm', NULL, '4795018', 'eletrico', 'CALIBRADOR MULTIFUNÇÃO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5100B',
    measurement_range = '200 VDC x 100 uV1100 VAC x 0.1 uV1.9 ADC x 1nA1.9 AAC x 1nA1 a 10 Mohm',
    unit = NULL,
    serial_number = '4795018',
    category_1 = 'eletrico',
    asset_type = 'CALIBRADOR MULTIFUNÇÃO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-01-19', '2023-08-19', 7, NULL, 3104.95, NULL, NULL, NULL, NULL, NULL, 'INSTRUMENTO COM DEFEITO. FAZER PS REPAROEnviado como sucata', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-069';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-032', NULL, 'R1M-A', NULL, NULL, '22079', 'eletrico', 'MEGÔHMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'R1M-A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '22079',
    category_1 = 'eletrico',
    asset_type = 'MEGÔHMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-07', '2028-02-07', 36, NULL, 674.72, NULL, NULL, NULL, NULL, '2025-02-17', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-032';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-013', NULL, '260-6XLPM', NULL, NULL, '629', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '260-6XLPM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '629',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-21', '2026-07-21', 20, NULL, 776.23, NULL, NULL, NULL, NULL, '2025-01-15', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-013';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-051', NULL, '77', NULL, NULL, '49020911', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '77',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '49020911',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-03-21', '2027-03-21', 36, NULL, 776.23, NULL, NULL, NULL, NULL, '2024-05-17', 'PS 036/2023', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-051';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-011', NULL, '83-V', NULL, NULL, '97800392', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '83-V',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '97800392',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-03-25', '2027-03-25', 36, NULL, 560.75, NULL, NULL, NULL, NULL, '2024-05-17', 'PS 035/2023', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-011';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-084', NULL, 'THS730A', NULL, NULL, 'B033690', 'eletrico', 'OSCILOSCÓPIO', 'MK-48', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'THS730A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'B033690',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-08-18', '2023-08-18', 12, NULL, 747.66, NULL, NULL, NULL, NULL, NULL, 'PS 046/2023', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-084';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-022', NULL, 'TBS1102B ', NULL, NULL, 'CO32187', 'eletrico', 'OSCILOSCÓPIO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TBS1102B ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'CO32187',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-04-08', '2025-04-08', 12, NULL, 747.66, NULL, NULL, NULL, NULL, '2024-05-17', 'PS 047/2023', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-022';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-BCA-005', NULL, '1681A', NULL, NULL, 'MAG00729', 'eletrico', 'OHMÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1681A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'MAG00729',
    category_1 = 'eletrico',
    asset_type = 'OHMÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-12', '2025-11-12', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-BCA-005';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-ATENA-003', NULL, 'MR46', NULL, NULL, '1528813', 'eletrico', 'OHMÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MR46',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '1528813',
    category_1 = 'eletrico',
    asset_type = 'OHMÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-12', '2025-11-12', 12, NULL, 270.0, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-ATENA-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-001', NULL, '1 - 4 dNm ', '0.4', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1 - 4 dNm ',
    measurement_range = '0.4',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-019', NULL, 'Facom - A-301 MT 15-75c nM', '75', 'Nm', '7090062', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - A-301 MT 15-75c nM',
    measurement_range = '75',
    unit = 'Nm',
    serial_number = '7090062',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-019';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-020', NULL, 'Facom - A404 2-10 Nm', '10', 'Nm', 'x030736', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - A404 2-10 Nm',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'x030736',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-020';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-021', NULL, 'Facom - A402 0,5-2,5Nm', '2.5', 'Nm', 'v090567', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - A402 0,5-2,5Nm',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'v090567',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-16', '2025-10-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-09-18', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-021';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-022', NULL, 'Facom - 20-100 Nm', '100', 'Nm', 'y070411', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - 20-100 Nm',
    measurement_range = '100',
    unit = 'Nm',
    serial_number = 'y070411',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-022';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-023', NULL, 'Facom - 20-100 Nm', '100', 'Nm', 'y050048', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - 20-100 Nm',
    measurement_range = '100',
    unit = 'Nm',
    serial_number = 'y050048',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-023';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-024', NULL, 'Facom - 5-25 Nm', '25', 'Nm', 'y020215', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - 5-25 Nm',
    measurement_range = '25',
    unit = 'Nm',
    serial_number = 'y020215',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-024';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-025', NULL, 'Facom - 1-5 Nm', '5', 'Nm', 'y020171', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - 1-5 Nm',
    measurement_range = '5',
    unit = 'Nm',
    serial_number = 'y020171',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-025';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-026', NULL, 'Facom - 2-10 Nm', '10', 'Nm', 'y030048', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - 2-10 Nm',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'y030048',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-16', '2025-10-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-09-18', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-026';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-027', NULL, 'Facom - 4-2 daNm', '200', 'Nm', 'x100188', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom - 4-2 daNm',
    measurement_range = '200',
    unit = 'Nm',
    serial_number = 'x100188',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-027';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-028', NULL, 'Facom – 1-10 Nm', '10', 'Nm', 'Y110663', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Facom – 1-10 Nm',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'Y110663',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-13', '2024-11-13', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-015', NULL, '40 – 200 Nm S315 DA', '265', 'Nm', 'S315DA', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '40 – 200 Nm S315 DA',
    measurement_range = '265',
    unit = 'Nm',
    serial_number = 'S315DA',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-015';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-014', NULL, '2 – 20 MdaN', '200', 'Nm', '8312', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '2 – 20 MdaN',
    measurement_range = '200',
    unit = 'Nm',
    serial_number = '8312',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-016', NULL, 'Sam – 20-200 Nm', '200', 'Nm', '27481', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Sam – 20-200 Nm',
    measurement_range = '200',
    unit = 'Nm',
    serial_number = '27481',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-16', '2025-09-16', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-016';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-017', NULL, 'Sam - type II classe A - 5-25 Nm', '25', 'Nm', '193700110', 'mecanico', 'TORQUÍMETRO', 'EXOCET', 'normal', 'MV', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Sam - type II classe A - 5-25 Nm',
    measurement_range = '25',
    unit = 'Nm',
    serial_number = '193700110',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'EXOCET',
    priority = 'normal',
    location = 'MV',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-017';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-001', NULL, 'GPT-9802', '0.1...5kV AC, 0.1...6kV DC', NULL, 'GEU212321', 'eletrico', 'ANALISADOR DE SEGURANÇA', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GPT-9802',
    measurement_range = '0.1...5kV AC, 0.1...6kV DC',
    unit = NULL,
    serial_number = 'GEU212321',
    category_1 = 'eletrico',
    asset_type = 'ANALISADOR DE SEGURANÇA',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, 3104.95, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-002', NULL, 'CPC3000', NULL, NULL, '410009GB', 'mecanico', 'CONTROLADOR DE PRESSÃO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CPC3000',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '410009GB',
    category_1 = 'mecanico',
    asset_type = 'CONTROLADOR DE PRESSÃO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-06-27', '2024-06-27', 12, NULL, 130.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-009', NULL, 'SGA-600625D-1D-AA', NULL, NULL, '1649A00605', 'eletrico', 'FONTE DC', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SGA-600625D-1D-AA',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '1649A00605',
    category_1 = 'eletrico',
    asset_type = 'FONTE DC',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA AUTORIZADA AMETEK', 'EMPRESA AUTORIZADA AMETEK', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2021-01-26', '2022-01-26', 12, NULL, 560.75, NULL, NULL, NULL, NULL, NULL, 'VRF PSB CALIBRAÇÃO POR EMPRESA COMUM', (SELECT id FROM providers WHERE name = 'EMPRESA AUTORIZADA AMETEK' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-009';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-011', NULL, '1507', '0,01 MΩ -10 GΩ', 'Ω', '48630167', 'eletrico', 'MEGÔHMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1507',
    measurement_range = '0,01 MΩ -10 GΩ',
    unit = 'Ω',
    serial_number = '48630167',
    category_1 = 'eletrico',
    asset_type = 'MEGÔHMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-03', '2025-10-03', 12, NULL, 373.83, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01CMS NÃO CALIBRA', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-011';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-010', NULL, 'MXS500', '50KΩ - 200GΩ', 'Ω', '72233', 'eletrico', 'MEGÔHMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MXS500',
    measurement_range = '50KΩ - 200GΩ',
    unit = 'Ω',
    serial_number = '72233',
    category_1 = 'eletrico',
    asset_type = 'MEGÔHMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-06-28', '2024-06-28', 12, NULL, 150.0, NULL, NULL, NULL, NULL, '2023-05-18', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-010';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-020', NULL, 'PXIE-4080', NULL, NULL, '01CE4764', 'eletrico', 'MULTÍMETROPROPRIETÁRIO NI', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PXIE-4080',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '01CE4764',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETROPROPRIETÁRIO NI',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-08-03', '2022-08-03', 24, NULL, 560.75, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-020';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-026', NULL, 'IND43', NULL, NULL, '4602VC370001D', 'eletrico', 'OHMÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'IND43',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '4602VC370001D',
    category_1 = 'eletrico',
    asset_type = 'OHMÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-06-28', '2024-06-28', 12, NULL, 150.0, NULL, NULL, NULL, NULL, '2023-05-18', 'MSMI LOTE 04', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-026';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-027', NULL, 'OPM1-2C', NULL, NULL, 'G218734', 'eletrico', 'OPTICAL POWER METER', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'OPM1-2C',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'G218734',
    category_1 = 'eletrico',
    asset_type = 'OPTICAL POWER METER',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESADESERTO EM 2024', 'EMPRESADESERTO EM 2024', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2021-09-01', '2022-09-01', 12, NULL, 747.66, NULL, NULL, NULL, NULL, NULL, 'VRF ORÇAMENTO EMPRESAS', (SELECT id FROM providers WHERE name = 'EMPRESADESERTO EM 2024' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-027';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-028', NULL, 'NI-PXI-5122', NULL, NULL, '01B7B0CB', 'eletrico', 'OSCILOSCÓPIO PXI PROPRIETÁRIO NI', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'NI-PXI-5122',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '01B7B0CB',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO PXI PROPRIETÁRIO NI',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-09-27', '2024-09-27', 24, NULL, 776.23, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-033', NULL, 'OPTICAL REFLECTOMETER EXFO FTB2 CONFIGURED WITH OTDR FTBX-735C-SM1-EA', NULL, NULL, '1179658', 'eletrico', 'REFLECTÔMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'OPTICAL REFLECTOMETER EXFO FTB2 CONFIGURED WITH OTDR FTBX-735C-SM1-EA',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '1179658',
    category_1 = 'eletrico',
    asset_type = 'REFLECTÔMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-F21-034', NULL, 'HH314A', '0-50 °C0 a 100% UR', NULL, '171101511', 'eletrico', 'TERMOHIGROMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'HH314A',
    measurement_range = '0-50 °C0 a 100% UR',
    unit = NULL,
    serial_number = '171101511',
    category_1 = 'eletrico',
    asset_type = 'TERMOHIGROMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-03', '2025-10-03', 12, NULL, 80.0, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-F21-034';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-001', NULL, 'TMC 1500', '1500', 'KG', '100614139', 'mecanico', 'DINAMÔMETRO DIGITAL', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TMC 1500',
    measurement_range = '1500',
    unit = 'KG',
    serial_number = '100614139',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO DIGITAL',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-10-16', 'VRF MARCA MODELO/ MQT', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-002', NULL, 'PRESSURE REGULATOR', NULL, NULL, 'G218315', 'mecanico', 'MANÔMETRO ANALÓGICO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PRESSURE REGULATOR',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'G218315',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-08-07', '2022-08-07', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'somente em dez', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-003', NULL, 'ANALOGIC MANOMETER 0 TO 400 BARS', '400', 'Bar', 'S/N', 'mecanico', 'MANÔMETRO ANALÓGICO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'ANALOGIC MANOMETER 0 TO 400 BARS',
    measurement_range = '400',
    unit = 'Bar',
    serial_number = 'S/N',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-007', NULL, 'PRESSURE SWITCH SETTING TOOL (ART_0000016319) (WIKA CPH6300 (READER) + CPT6200 (SENSOR))', NULL, NULL, 'F301900002', 'mecanico', 'MANÔMETRO DIGITAL', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PRESSURE SWITCH SETTING TOOL (ART_0000016319) (WIKA CPH6300 (READER) + CPT6200 (SENSOR))',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'F301900002',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO DIGITAL',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-03', '2025-10-03', 12, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-007';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-008', NULL, '806.F', '0.01', 'mm', '180181191', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '806.F',
    measurement_range = '0.01',
    unit = 'mm',
    serial_number = '180181191',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-30', '2025-09-30', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-008';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-009', NULL, '806.F', '0.01', 'mm', '180181221', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '806.F',
    measurement_range = '0.01',
    unit = 'mm',
    serial_number = '180181221',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-009';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-010', NULL, '806.F', '0.01', 'mm', '191085777', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '806.F',
    measurement_range = '0.01',
    unit = 'mm',
    serial_number = '191085777',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-011', NULL, '806.F', '0.01', 'mm', '191085779', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '806.F',
    measurement_range = '0.01',
    unit = 'mm',
    serial_number = '191085779',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-012', NULL, 'PAQUÍMETRO (805.1)', NULL, NULL, 'X120314', 'mecanico', 'PAQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUÍMETRO (805.1)',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'X120314',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-012';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-013', NULL, 'PAQUÍMETRO (805.1)', NULL, NULL, 'X120317', 'mecanico', 'PAQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUÍMETRO (805.1)',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'X120317',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-013';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-014', NULL, 'PAQUÍMETRO (805.1)', NULL, NULL, 'X120377', 'mecanico', 'PAQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUÍMETRO (805.1)',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'X120377',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-015', NULL, 'PAQUÍMETRO (805.1)', NULL, NULL, 'X120381', 'mecanico', 'PAQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUÍMETRO (805.1)',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'X120381',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-015';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-016', NULL, 'TORQUÍMETRO TIPO RELÓGIO 3/8”  0-3,5 NM', '3.5', 'Nm', '10516', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO TIPO RELÓGIO 3/8”  0-3,5 NM',
    measurement_range = '3.5',
    unit = 'Nm',
    serial_number = '10516',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2325-02-05', '2326-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-016';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-017', NULL, 'TORQUÍMETRO RELÓGIO 3/8” 0-3,5 NM', '3.5', 'Nm', '11719', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO RELÓGIO 3/8” 0-3,5 NM',
    measurement_range = '3.5',
    unit = 'Nm',
    serial_number = '11719',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-017';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-018', NULL, 'TORQUÍMETRO 3/8” 1-5 N.M', '5', 'Nm', '200050002', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8” 1-5 N.M',
    measurement_range = '5',
    unit = 'Nm',
    serial_number = '200050002',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-019', NULL, 'TORQUÍMETRO 3/8” 1-6 NM ', '6', 'Nm', '200060005', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8” 1-6 NM ',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '200060005',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-019';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-020', NULL, 'TORQUÍMETRO 3/8”   2-10 NM ', '10', 'Nm', '200100004', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8”   2-10 NM ',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '200100004',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-020';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-021', NULL, 'TORQUÍMETRO 3/8” 5-50 NM', '50', 'Nm', '200500038', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8” 5-50 NM',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = '200500038',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-022', NULL, 'TORQUÍMETRO  3/8” 5-50 N.M ', '50', 'Nm', '200500300', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO  3/8” 5-50 N.M ',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = '200500300',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-023', NULL, 'Torquímetro  3/8” 5-50 N.m  ', '50', 'Nm', '200500300', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Torquímetro  3/8” 5-50 N.m  ',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = '200500300',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-024', NULL, 'TORQUÍMETRO 3/8”  5-50 NM ', '50', 'Nm', '2', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8”  5-50 NM ',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = '2',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-024';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-025', NULL, 'TORQUÍMETRO 3/8”  5-50 NM ', '50', 'Nm', '200500737', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8”  5-50 NM ',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = '200500737',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-025';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-026', NULL, 'TORQUÍMETRO 3/8” 2-10 N.M', '10', 'Nm', '200100001', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 3/8” 2-10 N.M',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '200100001',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-026';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-027', NULL, 'TORQUE METER (20-240 NMN)', '0.24', 'Nm', 'G218732', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUE METER (20-240 NMN)',
    measurement_range = '0.24',
    unit = 'Nm',
    serial_number = 'G218732',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-09-01', '2022-09-01', 24, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-027';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-028', NULL, 'TORQUE METER (5-60 NMN)', '0.06', 'Nm', 'G218733', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUE METER (5-60 NMN)',
    measurement_range = '0.06',
    unit = 'Nm',
    serial_number = 'G218733',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-09-01', '2022-09-01', 24, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-029', NULL, 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)', '2.5', 'Nm', 'Y010082 ', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'Y010082 ',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2027-08-02', '2028-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-029';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-029', NULL, 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)', '2.5', 'Nm', ' Y040207', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = ' Y040207',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-029';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-030', NULL, 'TORQUÍMETRO 2 NM A 10 NM (A.404)', '10', 'Nm', 'Y020384', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 2 NM A 10 NM (A.404)',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'Y020384',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-030';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-031', NULL, 'TORQUÍMETRO 2 NM A 10 NM (A.404)', '10', 'Nm', 'Y020385', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 2 NM A 10 NM (A.404)',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'Y020385',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-031';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-032', NULL, 'TORQUÍMETRO 2 NM A 10 NM (A.404)', '10', 'Nm', 'Y020490', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 2 NM A 10 NM (A.404)',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'Y020490',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-032';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-033', NULL, 'TORQUÍMETRO 2 NM A 10 NM (A.404)', '10', 'Nm', 'Y020565', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 2 NM A 10 NM (A.404)',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'Y020565',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-08-02', '2026-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2025-03-24', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-033';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-034', NULL, 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)', '50', 'Nm', 'Y030893', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = 'Y030893',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2025-03-24', 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-034';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-035', NULL, 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)', '50', 'Nm', 'Y030895', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = 'Y030895',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-035';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-036', NULL, 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)', '50', 'Nm', 'Y030900', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = 'Y030900',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-036';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-037', NULL, 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)', '50', 'Nm', 'Y030902', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 10 NM A 50 NM (J.208-50)',
    measurement_range = '50',
    unit = 'Nm',
    serial_number = 'Y030902',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-037';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-038', NULL, 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)', '25', 'Nm', 'Y040130', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)',
    measurement_range = '25',
    unit = 'Nm',
    serial_number = 'Y040130',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2025-07-25', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-038';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-039', NULL, 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)', '25', 'Nm', 'Y040131', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)',
    measurement_range = '25',
    unit = 'Nm',
    serial_number = 'Y040131',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-040', NULL, 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)', '25', 'Nm', 'Y040156', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)',
    measurement_range = '25',
    unit = 'Nm',
    serial_number = 'Y040156',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-040';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-041', NULL, 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)', '25', 'Nm', 'Y040160', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 5 NM A 25 NM (R.306-25D)',
    measurement_range = '25',
    unit = 'Nm',
    serial_number = 'Y040160',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-041';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-042', NULL, 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)', '2.5', 'Nm', 'Y040189', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'Y040189',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-042';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-F21-043', NULL, 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)', '2.5', 'Nm', 'Y040190', 'mecanico', 'TORQUÍMETRO', 'F-21', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUÍMETRO 0,5 NM A 2,5 NM (A.402)',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'Y040190',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'F-21',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2025-02-05', '2026-02-05', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2025-03-24', 'MSMSI TORQ LOTE 05 DEZ', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-F21-043';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-MBF-001', NULL, '77DMM', NULL, NULL, '37661759', 'eletrico', 'MULTÍMETRO', 'MINAS E BOMBAS', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '77DMM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '37661759',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MINAS E BOMBAS',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-09', '2024-11-09', 12, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-MBF-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-MBF-001', NULL, 'FAMABRAS 0 – 3 kgf/cm2', '3', 'kgf/cm²', 'PI 15976-01', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MINAS E BOMBAS', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'FAMABRAS 0 – 3 kgf/cm2',
    measurement_range = '3',
    unit = 'kgf/cm²',
    serial_number = 'PI 15976-01',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MINAS E BOMBAS',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-01-24', '2026-01-24', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-01-29', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-MBF-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-MBF-002', NULL, 'FAMABRAS 0 – 30 kgf/cm2', '30', 'kgf/cm²', 'PI 15976-02', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MINAS E BOMBAS', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'FAMABRAS 0 – 30 kgf/cm2',
    measurement_range = '30',
    unit = 'kgf/cm²',
    serial_number = 'PI 15976-02',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MINAS E BOMBAS',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-01-24', '2026-01-24', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-01-29', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-MBF-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-MBF-003', NULL, '1 a 7 kgf ', '68', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MINAS E BOMBAS', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1 a 7 kgf ',
    measurement_range = '68',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MINAS E BOMBAS',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2026-08-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-MBF-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-MIS-002', NULL, '34461A', '1000 VDC 750 VAC100 a 100M Ohm0.01 a 3 ADC1 a 3 AACContinuidade Diodo', NULL, 'US36096717', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'MISTRAL', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '34461A',
    measurement_range = '1000 VDC 750 VAC100 a 100M Ohm0.01 a 3 ADC1 a 3 AACContinuidade Diodo',
    unit = NULL,
    serial_number = 'US36096717',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'MISTRAL',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2017-10-05', '2018-10-05', 12, NULL, 776.23, NULL, NULL, NULL, NULL, NULL, 'Enviado para calibração em 24/01/22PS39/2021 –  CMS[23JAN2024] CMS: AGU obtenção componentes', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-MIS-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-MIS-002', NULL, '0,8M DAN', '8', 'Nm', '1011775G00', 'mecanico', 'TORQUÍMETRO', 'MISTRAL', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '0,8M DAN',
    measurement_range = '8',
    unit = 'Nm',
    serial_number = '1011775G00',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MISTRAL',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-MIS-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-MIS-003', NULL, '1,7M DAN', '17', 'Nm', '1028199S00', 'mecanico', 'TORQUÍMETRO', 'MISTRAL', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1,7M DAN',
    measurement_range = '17',
    unit = 'Nm',
    serial_number = '1028199S00',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MISTRAL',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-MIS-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-MIS-001', NULL, 'TCI-150', '17', 'Nm', '44030109', 'mecanico', 'TORQUÍMETRO', 'MISTRAL', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TCI-150',
    measurement_range = '17',
    unit = 'Nm',
    serial_number = '44030109',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MISTRAL',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-MIS-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-001', NULL, '2461-CD', NULL, NULL, '12123920', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '2461-CD',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '12123920',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-002', NULL, '2461-CD', NULL, NULL, '13010358', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '2461-CD',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '13010358',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-003', NULL, '2461-CD', NULL, NULL, '14021307', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '2461-CD',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '14021307',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-007', NULL, '5328B', NULL, NULL, '2716A03309', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5328B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2716A03309',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-008', NULL, '5328B', NULL, NULL, '2924A03338', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5328B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2924A03338',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-14', '2024-11-14', 12, NULL, 1552.47, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-008';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-009', NULL, '5328B', NULL, NULL, '2924A04249', 'eletrico', 'CONTADOR', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5328B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2924A04249',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-14', '2024-11-14', 12, NULL, 1552.47, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-009';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-100', NULL, '4440B', '40 pF a 1,2 uF', NULL, '1224J04111', 'eletrico', 'DÉCADA CAPACITIVA', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '4440B',
    measurement_range = '40 pF a 1,2 uF',
    unit = NULL,
    serial_number = '1224J04111',
    category_1 = 'eletrico',
    asset_type = 'DÉCADA CAPACITIVA',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-101', NULL, '1433-K', '0,1 a 1.111,0 Ohms', NULL, '16995', 'eletrico', 'DÉCADA RESISTIVA', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1433-K',
    measurement_range = '0,1 a 1.111,0 Ohms',
    unit = NULL,
    serial_number = '16995',
    category_1 = 'eletrico',
    asset_type = 'DÉCADA RESISTIVA',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-101';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-102', NULL, '1433-N', '0,1 a 11.111,0 Ohms', NULL, '15091', 'eletrico', 'DÉCADA RESISTIVA', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1433-N',
    measurement_range = '0,1 a 11.111,0 Ohms',
    unit = NULL,
    serial_number = '15091',
    category_1 = 'eletrico',
    asset_type = 'DÉCADA RESISTIVA',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-102';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-103', NULL, '1433-Y', '100 a 11.111.000 Ohms', NULL, '16123', 'eletrico', 'DÉCADA RESISTIVA', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1433-Y',
    measurement_range = '100 a 11.111.000 Ohms',
    unit = NULL,
    serial_number = '16123',
    category_1 = 'eletrico',
    asset_type = 'DÉCADA RESISTIVA',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-103';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-104', NULL, '1433-Y', '100 a 11.111.000 Ohms', NULL, '16135', 'eletrico', 'DÉCADA RESISTIVA', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1433-Y',
    measurement_range = '100 a 11.111.000 Ohms',
    unit = NULL,
    serial_number = '16135',
    category_1 = 'eletrico',
    asset_type = 'DÉCADA RESISTIVA',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-104';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-013', NULL, '3325B', NULL, NULL, '2847A10Z34', 'eletrico', 'GERADOR DE FUNÇÕES', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3325B',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2847A10Z34',
    category_1 = 'eletrico',
    asset_type = 'GERADOR DE FUNÇÕES',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-14', '2024-11-14', 12, NULL, 1869.16, NULL, NULL, NULL, NULL, '2023-12-05', 'REPARADO EM 2022, MAS APRESENTA FALHA NOVAMENTEFAIL 023[23JAN2024] CMS: Pesquisa da avaria "Fail 023" em andamento. PS 077/2023', (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-013';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-010', NULL, '3152B VXI', NULL, NULL, '1202849', 'eletrico', 'GERADOR DE FUNÇÕES', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3152B VXI',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '1202849',
    category_1 = 'eletrico',
    asset_type = 'GERADOR DE FUNÇÕES',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-011', NULL, '3152B VXI', NULL, NULL, '13011821', 'eletrico', 'GERADOR DE FUNÇÕES', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3152B VXI',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '13011821',
    category_1 = 'eletrico',
    asset_type = 'GERADOR DE FUNÇÕES',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-017', NULL, '87', NULL, NULL, '52200132', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '87',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '52200132',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-26', '2024-11-26', 12, NULL, 560.75, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-017';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-022', NULL, 'E1412A', NULL, NULL, 'MY45002134', 'eletrico', 'MULTÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'E1412A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'MY45002134',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-024', NULL, '3456A     ', '1000 VDC x 100 nV100 a 1G Ohm', NULL, '2201A10066', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3456A     ',
    measurement_range = '1000 VDC x 100 nV100 a 1G Ohm',
    unit = NULL,
    serial_number = '2201A10066',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-21', '2024-11-21', 12, NULL, 560.75, NULL, NULL, NULL, NULL, '2023-12-21', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-024';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-026', NULL, '3456A     ', '1000 VDC x 100 nV100 a 1G Ohm', NULL, '2943A22272', 'eletrico', 'MULTÍMETRO 6 DÍGITOS', 'MK-46', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3456A     ',
    measurement_range = '1000 VDC x 100 nV100 a 1G Ohm',
    unit = NULL,
    serial_number = '2943A22272',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO 6 DÍGITOS',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T46-029', NULL, 'DSO5034A ', NULL, NULL, 'SG52370208', 'eletrico', 'OSCILOSCÓPIO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'DSO5034A ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'SG52370208',
    category_1 = 'eletrico',
    asset_type = 'OSCILOSCÓPIO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-10', '2024-11-10', 12, NULL, 747.66, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T46-029';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('100012482217', NULL, 'MENSOR 2780 (0-800 PSI)', '800', 'PSI', '100012482217', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MENSOR 2780 (0-800 PSI)',
    measurement_range = '800',
    unit = 'PSI',
    serial_number = '100012482217',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = '100012482217';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-008', NULL, '3D INSTRUMENTS INC (0-800 PSI)', '800', 'PSI', '21767762', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3D INSTRUMENTS INC (0-800 PSI)',
    measurement_range = '800',
    unit = 'PSI',
    serial_number = '21767762',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-008';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-009', NULL, '3D INSTRUMENTS INC (0-800 PSI)', '800', 'PSI', '21767862', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '3D INSTRUMENTS INC (0-800 PSI)',
    measurement_range = '800',
    unit = 'PSI',
    serial_number = '21767862',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-009';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-012', NULL, 'SNAP-ON (TE250FU)', NULL, NULL, '14008', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (TE250FU)',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '14008',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-26', '2025-07-26', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-012';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-013', NULL, 'Consolidated devices (6002DI) 0 – 600 lbs', '68', 'Nm', '40300128', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Consolidated devices (6002DI) 0 – 600 lbs',
    measurement_range = '68',
    unit = 'Nm',
    serial_number = '40300128',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-014', NULL, 'Consolidated devices (6002DI) 0 – 600 lbs', '68', 'Nm', '40300129', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Consolidated devices (6002DI) 0 – 600 lbs',
    measurement_range = '68',
    unit = 'Nm',
    serial_number = '40300129',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-014';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-015', NULL, 'CONSOLITED DEVICES (1502MR) 10-150 lbs', '15', 'Nm', '44000123', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CONSOLITED DEVICES (1502MR) 10-150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '44000123',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-016', NULL, 'UTICA (DA130) 0-30 lbs', '3', 'Nm', '44030102', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'UTICA (DA130) 0-30 lbs',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = '44030102',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-017', NULL, 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs', '4', 'Nm', '44030104', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '44030104',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-018', NULL, 'UTICA (TCI-150) 0-150 lbs', '15', 'Nm', '44030108', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'UTICA (TCI-150) 0-150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '44030108',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-018';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-019', NULL, 'UTICA (TCI-150) 0-150 lbs', '15', 'Nm', '44030109', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'UTICA (TCI-150) 0-150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '44030109',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-020', NULL, 'UTICA (TCI-150) 0-150 lbs', '15', 'Nm', '44030110', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'UTICA (TCI-150) 0-150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '44030110',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-020';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-021', NULL, 'UTICA (DA130) 0-30 lbs', '3', 'Nm', '44030112', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'UTICA (DA130) 0-30 lbs',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = '44030112',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-021';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-022', NULL, 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs', '4', 'Nm', '44030121', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '44030121',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-024', NULL, 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs', '4', 'Nm', '44030126', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '44030126',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-025', NULL, 'UTICA (DA130) 0-30 lbs', '3', 'Nm', '44050130', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'UTICA (DA130) 0-30 lbs',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = '44050130',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-025';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-026', NULL, 'SNAP-ON (QDJR50) 10-50 lbs', '6', 'Nm', '506356537', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QDJR50) 10-50 lbs',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '506356537',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-027', NULL, 'SNAP-ON (QDJR50) 10-50 lbs', '6', 'Nm', '506356573', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QDJR50) 10-50 lbs',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '506356573',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-028', NULL, 'SNAP-ON (QDJR50) 10-50 lbs', '6', 'Nm', '506358602', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QDJR50) 10-50 lbs',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '506358602',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-029', NULL, 'SNAP-ON (QD1200) 40-200 lbs', '20', 'Nm', '606389094', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QD1200) 40-200 lbs',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '606389094',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-029';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-030', NULL, 'SNAP-ON (QD1200) 40-200 lbs', '20', 'Nm', '606389100', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QD1200) 40-200 lbs',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '606389100',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-031', NULL, 'SNAP-ON (QD1200) 40-200 lbs', '20', 'Nm', '606620314', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QD1200) 40-200 lbs',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '606620314',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-032', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010020', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010020',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-032';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-033', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010026', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010026',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-033';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-034', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010040', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010040',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-034';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-035', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010045', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010045',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-035';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-036', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010089', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010089',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-038', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010099', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010099',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-038';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-039', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010105', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010105',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-040', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '9910010132', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '9910010132',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-040';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-041', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011105', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011105',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-041';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-042', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011123', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011123',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-042';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-043', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011147', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011147',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-043';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-045', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011207', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011207',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-046', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011214', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011214',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-047', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011218', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011218',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-048', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011223', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011223',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-049', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011229', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011229',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-050', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011239', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011239',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '224-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-050';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-051', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011243', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011243',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-27', '2025-07-27', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-051';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-052', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011266', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011266',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-052';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-053', NULL, 'SNAP-ON (QJR284E) 150-1000 lbs', '115', 'Nm', '11910011986', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SNAP-ON (QJR284E) 150-1000 lbs',
    measurement_range = '115',
    unit = 'Nm',
    serial_number = '11910011986',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-054', NULL, 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs', '4', 'Nm', '104-A', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'STURTEVANT RICHMONT (CAL-36) 2-36 lbs',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '104-A',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-055', NULL, 'Consolidated devices (1502DI) 0 – 150 lbs', '15', 'Nm', '5120-00-230-63-80575', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Consolidated devices (1502DI) 0 – 150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '5120-00-230-63-80575',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-055';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-056', NULL, 'Consolidated devices (1502DI) 0 – 150 lbs', '15', 'Nm', '5120-00-230-63-80976', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Consolidated devices (1502DI) 0 – 150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '5120-00-230-63-80976',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-057', NULL, 'CONSOLITED DEVICES (1502MR) 10-150 lbs', '15', 'Nm', '5120-00-288-8865', 'mecanico', 'TORQUÍMETRO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'CONSOLITED DEVICES (1502MR) 10-150 lbs',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '5120-00-288-8865',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-057';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-059', NULL, 'Transducer Mensor Corporation 1500 PSI 17777001', '1500', 'PSI', '832515', 'mecanico', 'TRANSDUTOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Transducer Mensor Corporation 1500 PSI 17777001',
    measurement_range = '1500',
    unit = 'PSI',
    serial_number = '832515',
    category_1 = 'mecanico',
    asset_type = 'TRANSDUTOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-12', '2025-11-12', 12, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-059';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-061', NULL, 'Transducer Mensor Corporation 200 PSI 17777001 ', '200', 'PSI', '832521', 'mecanico', 'TRANSDUTOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Transducer Mensor Corporation 200 PSI 17777001 ',
    measurement_range = '200',
    unit = 'PSI',
    serial_number = '832521',
    category_1 = 'mecanico',
    asset_type = 'TRANSDUTOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-12', '2025-11-12', 12, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-061';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-062', NULL, 'Transducer Mensor Corporation 200 PSI 17777001 ', '200', 'PSI', '410009JN', 'mecanico', 'TRANSDUTOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Transducer Mensor Corporation 200 PSI 17777001 ',
    measurement_range = '200',
    unit = 'PSI',
    serial_number = '410009JN',
    category_1 = 'mecanico',
    asset_type = 'TRANSDUTOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-12', '2025-11-12', 12, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-062';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T46-063', NULL, 'Transducer Mensor Corporation 1500 PSI 17777001', '1500', 'PSI', '410009TL', 'mecanico', 'TRANSDUTOR DE PRESSÃO', 'MK-46', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Transducer Mensor Corporation 1500 PSI 17777001',
    measurement_range = '1500',
    unit = 'PSI',
    serial_number = '410009TL',
    category_1 = 'mecanico',
    asset_type = 'TRANSDUTOR DE PRESSÃO',
    division = 'MK-46',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-12', '2025-11-12', 12, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T46-063';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-043', NULL, '5220A', NULL, NULL, '5530012', 'eletrico', 'AMPLIFICADOR TRANSCONDUTÂNCIA', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5220A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '5530012',
    category_1 = 'eletrico',
    asset_type = 'AMPLIFICADOR TRANSCONDUTÂNCIA',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-24', '2026-07-24', 32, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-12-21', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-043';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-044', NULL, '5220A', NULL, NULL, '3315010', 'eletrico', 'AMPLIFICADOR TRANSCONDUTÂNCIA', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5220A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '3315010',
    category_1 = 'eletrico',
    asset_type = 'AMPLIFICADOR TRANSCONDUTÂNCIA',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-06-12', '2027-02-12', 32, NULL, 373.86, NULL, NULL, NULL, NULL, '2023-07-25', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-044';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-031', NULL, 'DVL 8500', '+- 19.999 VDC x 1mV', NULL, '23360381', 'eletrico', 'CALIBRADOR TENSÃO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'DVL 8500',
    measurement_range = '+- 19.999 VDC x 1mV',
    unit = NULL,
    serial_number = '23360381',
    category_1 = 'eletrico',
    asset_type = 'CALIBRADOR TENSÃO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-07-20', '2026-07-20', 36, NULL, 373.86, NULL, NULL, NULL, NULL, '2023-07-25', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-031';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-045', NULL, '5335A', NULL, NULL, '2934A14344', 'eletrico', 'CONTADOR', 'MK-48', 'normal', 'CMS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5335A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2934A14344',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMS',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-08-15', '2025-08-15', 36, NULL, 747.66, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-045';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-096', NULL, '5335A', NULL, NULL, '2838A12773', 'eletrico', 'CONTADOR', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '5335A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '2838A12773',
    category_1 = 'eletrico',
    asset_type = 'CONTADOR',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-27', '2026-11-27', 36, NULL, 747.66, NULL, NULL, NULL, NULL, '2023-12-21', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-096';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-007', NULL, 'Ground Strap Tester 253A', NULL, NULL, '177', 'eletrico', 'GROUND STRAP TESTER', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Ground Strap Tester 253A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '177',
    category_1 = 'eletrico',
    asset_type = 'GROUND STRAP TESTER',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-08-25', '2021-08-25', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-007';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-010', NULL, 'Ground Strap Tester 253A', NULL, NULL, '179', 'eletrico', 'GROUND STRAP TESTER', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Ground Strap Tester 253A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '179',
    category_1 = 'eletrico',
    asset_type = 'GROUND STRAP TESTER',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-010';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-017', NULL, 'Ground Strap Tester 253A', NULL, NULL, '182', 'eletrico', 'GROUND STRAP TESTER', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Ground Strap Tester 253A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '182',
    category_1 = 'eletrico',
    asset_type = 'GROUND STRAP TESTER',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-017';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-020', NULL, 'Ground Strap Tester 253A', NULL, NULL, '174', 'eletrico', 'GROUND STRAP TESTER', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Ground Strap Tester 253A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '174',
    category_1 = 'eletrico',
    asset_type = 'GROUND STRAP TESTER',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-020';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-027', NULL, 'Ground Strap Tester 253A', NULL, NULL, '185', 'eletrico', 'GROUND STRAP TESTER', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Ground Strap Tester 253A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '185',
    category_1 = 'eletrico',
    asset_type = 'GROUND STRAP TESTER',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-027';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-028', NULL, 'Ground Strap Tester 253A', NULL, NULL, '178', 'eletrico', 'GROUND STRAP TESTER', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Ground Strap Tester 253A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '178',
    category_1 = 'eletrico',
    asset_type = 'GROUND STRAP TESTER',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-052', NULL, 'Mod. 101-5BFAA', NULL, NULL, '26360', 'eletrico', 'IGNITER CIRCUIT TEST', 'MK-48', 'normal', 'MSMI', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Mod. 101-5BFAA',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '26360',
    category_1 = 'eletrico',
    asset_type = 'IGNITER CIRCUIT TEST',
    division = 'MK-48',
    priority = 'normal',
    location = 'MSMI',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2027-10-22', 36, NULL, 776.23, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-052';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-058', NULL, 'Mod. 101-5BFAA', NULL, NULL, '00161AA', 'eletrico', 'IGNITER CIRCUIT TEST', 'MK-48', 'normal', 'MSMI', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Mod. 101-5BFAA',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '00161AA',
    category_1 = 'eletrico',
    asset_type = 'IGNITER CIRCUIT TEST',
    division = 'MK-48',
    priority = 'normal',
    location = 'MSMI',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2027-10-22', 36, NULL, 776.23, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-058';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-070', NULL, 'Mod. 101-5BFAA', NULL, NULL, '00180', 'eletrico', 'IGNITER CIRCUIT TEST', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Mod. 101-5BFAA',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '00180',
    category_1 = 'eletrico',
    asset_type = 'IGNITER CIRCUIT TEST',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-05-26', '2025-05-26', 36, NULL, 776.23, NULL, NULL, NULL, NULL, NULL, 'não calibrar em 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-070';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-076', NULL, 'Mod. 101-5BFAA', NULL, NULL, '00171', 'eletrico', 'IGNITER CIRCUIT TEST', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'Mod. 101-5BFAA',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '00171',
    category_1 = 'eletrico',
    asset_type = 'IGNITER CIRCUIT TEST',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-02-24', '2026-02-24', 36, NULL, 776.23, NULL, NULL, NULL, NULL, NULL, 'não calibrar em 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-076';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-094', NULL, 'MI-2551', NULL, NULL, 'DD255104248', 'eletrico', 'MEGÔHMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MI-2551',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'DD255104248',
    category_1 = 'eletrico',
    asset_type = 'MEGÔHMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-18', '2026-10-18', 36, NULL, 373.86, NULL, NULL, NULL, NULL, '2023-10-23', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-094';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-086', NULL, 'R1M-A', NULL, NULL, '202111ORIM-A', 'eletrico', 'MEGÔHMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'R1M-A',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '202111ORIM-A',
    category_1 = 'eletrico',
    asset_type = 'MEGÔHMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-07-20', '2026-07-20', 36, NULL, 373.83, NULL, NULL, NULL, NULL, '2023-08-11', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-086';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-016', NULL, '83-V', NULL, NULL, '97310078', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '83-V',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '97310078',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-08-17', '2025-08-17', 36, NULL, 1164.35, NULL, NULL, NULL, NULL, '2023-10-09', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-016';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-034', NULL, '83-V', NULL, NULL, '97870322', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '83-V',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '97870322',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-05', '2026-10-05', 36, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-10-09', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-034';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-049', NULL, '77', NULL, NULL, '49050228', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '77',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '49050228',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-03-13', '2025-03-13', 36, NULL, 560.75, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-049';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-050', NULL, '85-III', NULL, NULL, '77033433', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '85-III',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '77033433',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-07-14', '2026-07-14', 36, NULL, 560.75, NULL, NULL, NULL, NULL, '2023-07-25', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-050';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-059', NULL, '85-III', NULL, NULL, '77033422', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '85-III',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '77033422',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-07-17', '2026-07-17', 36, NULL, 1164.35, NULL, NULL, NULL, NULL, '2023-07-25', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-059';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-060', NULL, '85-III', NULL, NULL, '77050316', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '85-III',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '77050316',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-18', '2026-10-18', 36, NULL, 1164.35, NULL, NULL, NULL, NULL, '2023-10-23', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-060';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-003', NULL, '260-6XLPM', NULL, NULL, NULL, 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '260-6XLPM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = NULL,
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-21', '2025-07-21', 20, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-12-21', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-006', NULL, '260-6XLPM', NULL, NULL, NULL, 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '260-6XLPM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = NULL,
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-09', '2025-07-09', 20, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-11-16', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-002', NULL, '260-6XLPM', NULL, NULL, '1308', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '260-6XLPM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '1308',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-07-19', '2025-03-19', 20, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-07-25', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-012', NULL, '260-6XLPM', NULL, NULL, '612E', 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '260-6XLPM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '612E',
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-10-19', '2025-06-19', 20, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-10-23', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-012';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-023', NULL, '260-6XLPM', NULL, NULL, NULL, 'eletrico', 'MULTÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '260-6XLPM',
    measurement_range = NULL,
    unit = NULL,
    serial_number = NULL,
    category_1 = 'eletrico',
    asset_type = 'MULTÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('CMS', 'CMS', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-12-07', '2025-08-07', 20, NULL, 776.23, NULL, NULL, NULL, NULL, '2023-12-21', NULL, (SELECT id FROM providers WHERE name = 'CMS' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-023';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDE-T48-062', NULL, 'HH11B', '750', '°C', '110718', 'eletrico', 'TERMÔMETRO DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'HH11B',
    measurement_range = '750',
    unit = '°C',
    serial_number = '110718',
    category_1 = 'eletrico',
    asset_type = 'TERMÔMETRO DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-03', '2025-10-03', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDE-T48-062';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-266', NULL, 'BALANÇA DIGITAL (0 - 1200g)', '1,2', 'Kg ', '---', 'mecanico', 'BALANÇA DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'BALANÇA DIGITAL (0 - 1200g)',
    measurement_range = '1,2',
    unit = 'Kg ',
    serial_number = '---',
    category_1 = 'mecanico',
    asset_type = 'BALANÇA DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-10-22', 12, NULL, 70.0, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-266';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-267', NULL, 'SCALE, DIGITAL READOUT 5000 LB', '2268', 'Kg', '19399/25102', 'mecanico', 'BALANÇA DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCALE, DIGITAL READOUT 5000 LB',
    measurement_range = '2268',
    unit = 'Kg',
    serial_number = '19399/25102',
    category_1 = 'mecanico',
    asset_type = 'BALANÇA DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-267';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-039', NULL, 'COX AN10', '57', 'L/m', '206', 'mecanico', 'DINAMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'COX AN10',
    measurement_range = '57',
    unit = 'L/m',
    serial_number = '206',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-21', '2027-11-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-039';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-040', NULL, 'COX AN10', '57', 'L/m', '203', 'mecanico', 'DINAMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'COX AN10',
    measurement_range = '57',
    unit = 'L/m',
    serial_number = '203',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-02-19', '2023-02-19', 36, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, 'vrf calibração', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-040';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-302', NULL, 'COX AN10', '57', 'L/m', '303', 'mecanico', 'DINAMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'COX AN10',
    measurement_range = '57',
    unit = 'L/m',
    serial_number = '303',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2017-11-28', '2020-11-28', 36, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, 'vrf calibração', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-302';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-305', NULL, 'COX AN10', '57', 'L/m', '207', 'mecanico', 'DINAMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'COX AN10',
    measurement_range = '57',
    unit = 'L/m',
    serial_number = '207',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-21', '2027-11-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-11-25', 'MSMI LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-305';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-053', NULL, 'SCALE, PUSH/PULL TENSION  500 g', '0,5', 'Kg ', '516-500', 'mecanico', 'DINAMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCALE, PUSH/PULL TENSION  500 g',
    measurement_range = '0,5',
    unit = 'Kg ',
    serial_number = '516-500',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2025-10-01', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-053';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-268', NULL, 'SCALE, DIGITAL READOUT 5000 LB', '2268', 'Kg ', '19406/22632', 'mecanico', 'DINAMÔMETRO DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCALE, DIGITAL READOUT 5000 LB',
    measurement_range = '2268',
    unit = 'Kg ',
    serial_number = '19406/22632',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2021-08-23', '2023-08-23', 24, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-268';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-269', NULL, 'SCALE, DIGITAL READOUT 2500 LB', '1134', 'Kg ', '8115', 'mecanico', 'DINAMÔMETRO DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCALE, DIGITAL READOUT 2500 LB',
    measurement_range = '1134',
    unit = 'Kg ',
    serial_number = '8115',
    category_1 = 'mecanico',
    asset_type = 'DINAMÔMETRO DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-269';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-270', NULL, 'HYDRAULIC DEADWEIGHT TESTER DM-T-100/C', '15000', 'PSI', '100311', 'mecanico', 'BALANÇA DE PESO MORTO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'HYDRAULIC DEADWEIGHT TESTER DM-T-100/C',
    measurement_range = '15000',
    unit = 'PSI',
    serial_number = '100311',
    category_1 = 'mecanico',
    asset_type = 'BALANÇA DE PESO MORTO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESADESERTO EM 2024', 'EMPRESADESERTO EM 2024', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2017-10-18', '2019-10-18', 24, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESADESERTO EM 2024' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-270';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-271', NULL, 'HYDRAULIC DEADWEIGHT TESTER DM-T-100/C', '15000', 'PSI', '100312', 'mecanico', 'BALANÇA DE PESO MORTO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'HYDRAULIC DEADWEIGHT TESTER DM-T-100/C',
    measurement_range = '15000',
    unit = 'PSI',
    serial_number = '100312',
    category_1 = 'mecanico',
    asset_type = 'BALANÇA DE PESO MORTO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESADESERTO EM 2024', 'EMPRESADESERTO EM 2024', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2017-04-04', '2019-04-04', 24, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESADESERTO EM 2024' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-271';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-187', NULL, 'GAUGE, (0-30 PSI)', '30', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, (0-30 PSI)',
    measurement_range = '30',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-01', '2024-11-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-187';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-189', NULL, 'GAUGE, PRESSURE (0-200 PSI) ECP REQ', '200 ', 'PSI', '012810', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, PRESSURE (0-200 PSI) ECP REQ',
    measurement_range = '200 ',
    unit = 'PSI',
    serial_number = '012810',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2023-11-16', '2025-11-16', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-02-05', 'MQT LOTE 02 ???', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-189';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-194', NULL, 'GAUGE, (IN.Hg VAC 30-0-60 PSI)', '60', NULL, NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, (IN.Hg VAC 30-0-60 PSI)',
    measurement_range = '60',
    unit = NULL,
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-12-14', '2024-12-14', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-194';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-239', NULL, 'GAUGE, (0-30 PSI)', '30', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, (0-30 PSI)',
    measurement_range = '30',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-30', '2026-09-30', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-239';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-244', NULL, 'GAUGE 2000 PSI ', '2000', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 2000 PSI ',
    measurement_range = '2000',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-03', '2024-11-03', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-244';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-245', NULL, 'GAUGE 2000 PSI ', '2000', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 2000 PSI ',
    measurement_range = '2000',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-09-30', '2026-09-30', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-245';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-247', NULL, 'GAUGE 2000 PSI', '2000', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 2000 PSI',
    measurement_range = '2000',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-01-23', '2026-01-23', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-02-05', 'NAO CALIBRAR EM 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-247';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-248', NULL, 'GAUGE 2000 PSI', '2000', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 2000 PSI',
    measurement_range = '2000',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-01-23', '2026-01-23', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-02-05', 'NAO CALIBRAR EM 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-248';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-249', NULL, 'GAUGE 1500 PSI', '1500', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 1500 PSI',
    measurement_range = '1500',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-249';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-251', NULL, 'GAUGE 100 PSI', '100', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 100 PSI',
    measurement_range = '100',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-01', '2024-11-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-251';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-252', NULL, 'GAUGE 100 PSI', '100', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 100 PSI',
    measurement_range = '100',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2019-11-20', '2021-11-20', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-252';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-253', NULL, 'GAUGE 100 PSI', '100', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 100 PSI',
    measurement_range = '100',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-253';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-254', NULL, 'GAUGE 100 PSI', '100', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 100 PSI',
    measurement_range = '100',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-254';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-255', NULL, 'GAUGE 30 PSI', '30', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 30 PSI',
    measurement_range = '30',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-255';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-257', NULL, 'GAUGE 160 PSI', '160', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 160 PSI',
    measurement_range = '160',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2019-05-29', '2021-05-29', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-257';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-258', NULL, 'GAUGE 2000 PSI', NULL, NULL, NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 2000 PSI',
    measurement_range = NULL,
    unit = NULL,
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-03', '2024-11-03', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-258';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-260', NULL, 'GAUGE ASSEMBLY (0-3000 PSIG) ', '3000', 'PSI', 'CM-131808', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE ASSEMBLY (0-3000 PSIG) ',
    measurement_range = '3000',
    unit = 'PSI',
    serial_number = 'CM-131808',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-30', '2024-11-30', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-260';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-261', NULL, 'GAUGE ASSEMBLY (0-3000 PSIG) ', '3000', 'PSI', 'CM-131840', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE ASSEMBLY (0-3000 PSIG) ',
    measurement_range = '3000',
    unit = 'PSI',
    serial_number = 'CM-131840',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-261';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-265', NULL, 'GAUGE, (30-0-30 PSI)', '30', 'PSI', 'KR01833', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, (30-0-30 PSI)',
    measurement_range = '30',
    unit = 'PSI',
    serial_number = 'KR01833',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-01', '2024-11-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-265';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-278', NULL, 'GAUGE  300 PSI ', '300', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE  300 PSI ',
    measurement_range = '300',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-08', '2024-11-08', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-278';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-328', NULL, 'GAUGE, (30-0-30 PSI)', '30', 'PSI', '42128', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, (30-0-30 PSI)',
    measurement_range = '30',
    unit = 'PSI',
    serial_number = '42128',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-328';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-345', NULL, 'GAUGE, ABSOLUTE PRESSURE (0-20 PSIG)', '20', 'PSI', '0711117', 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'BACS', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, ABSOLUTE PRESSURE (0-20 PSIG)',
    measurement_range = '20',
    unit = 'PSI',
    serial_number = '0711117',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'BACS',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2021-01-19', '2022-02-19', 13, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MK48 ESTÁ VRF', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-345';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-349', NULL, 'GAUGE 160 PSI', '160', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 160 PSI',
    measurement_range = '160',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-08', '2024-11-08', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-349';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-350', NULL, 'GAUGE 160 PSI', '160', 'PSI', NULL, 'mecanico', 'MANÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE 160 PSI',
    measurement_range = '160',
    unit = 'PSI',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-08', '2024-11-08', 24, NULL, 90.0, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-350';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-262', NULL, 'GAUGE ASSEMBLY (0-4500 FT. SEAWATER)', '2000', 'PSI', 'CM-138005', 'mecanico', 'MANÔMETRO ANALÓGICO BACS', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE ASSEMBLY (0-4500 FT. SEAWATER)',
    measurement_range = '2000',
    unit = 'PSI',
    serial_number = 'CM-138005',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO ANALÓGICO BACS',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2019-11-20', '2021-11-20', 24, NULL, 338.69, NULL, NULL, NULL, NULL, NULL, 'MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-262';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-190', NULL, 'DIGITAL TEST GAUGE  25 PSI', '25 ', 'PSI', '1302881', 'mecanico', 'MANÔMETRO DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'DIGITAL TEST GAUGE  25 PSI',
    measurement_range = '25 ',
    unit = 'PSI',
    serial_number = '1302881',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-03', '2026-10-03', 24, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-190';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-285', NULL, 'DIGITAL TEST GAUGE 1,500  PSIg', '1500', 'PSI', '1205974', 'mecanico', 'MANÔMETRO DIGITAL', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'DIGITAL TEST GAUGE 1,500  PSIg',
    measurement_range = '1500',
    unit = 'PSI',
    serial_number = '1205974',
    category_1 = 'mecanico',
    asset_type = 'MANÔMETRO DIGITAL',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA LMC', 'EMPRESA LMC', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-03', '2025-04-03', 6, NULL, 338.69, NULL, NULL, NULL, NULL, '2024-10-16', 'LCM LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA LMC' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-285';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-184', NULL, 'GAUGE, (30-0-30 PSI)', '30', 'PSI', '42127', 'mecanico', 'MANOVACUÔMETRO ANALÓGICO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAUGE, (30-0-30 PSI)',
    measurement_range = '30',
    unit = 'PSI',
    serial_number = '42127',
    category_1 = 'mecanico',
    asset_type = 'MANOVACUÔMETRO ANALÓGICO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 90.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-184';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-023', NULL, 'GAGE, DEPTH MICROMETER  0-6"', '6', 'POL', '070128971', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DEPTH MICROMETER  0-6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '070128971',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-023';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-024', NULL, 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"', '0.0025', 'POL', '080622622', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"',
    measurement_range = '0.0025',
    unit = 'POL',
    serial_number = '080622622',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-024';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-033', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', '440', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = '440',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-033';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-049', NULL, 'GAGE, DEPTH MICROMETER  0-6"', '6', 'POL', '070525350', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DEPTH MICROMETER  0-6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '070525350',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-049';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-079', NULL, 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"', '0.0025', 'POL', '080622588', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"',
    measurement_range = '0.0025',
    unit = 'POL',
    serial_number = '080622588',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-11-07', 36, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, 'NAO CALIBRAR EM 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-079';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-138', NULL, 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"', '0.0025', 'POL', '080622620', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"',
    measurement_range = '0.0025',
    unit = 'POL',
    serial_number = '080622620',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-138';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-140', NULL, 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"', '0.0025', 'POL', '080622614', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"',
    measurement_range = '0.0025',
    unit = 'POL',
    serial_number = '080622614',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-11-07', 36, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, 'NAO CALIBRAR EM 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-140';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-141', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-141';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-227', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-227';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-228', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-228';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-229', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-229';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-230', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-230';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-231', NULL, 'MICROMETER, DEPTH 0-3" STARRETT', '3', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'MICROMETER, DEPTH 0-3" STARRETT',
    measurement_range = '3',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-231';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-232', NULL, 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"', '0.0025', 'POL', '80622591', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"',
    measurement_range = '0.0025',
    unit = 'POL',
    serial_number = '80622591',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-232';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-233', NULL, 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"', '0.0025', 'POL', 'J-412', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'GAGE, DIAL DEPTH STARRET .0025"-0-.0025"',
    measurement_range = '0.0025',
    unit = 'POL',
    serial_number = 'J-412',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2027-10-01', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-233';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-235', NULL, 'RELOGIO COMPARADOR .050"-0-.050"', '0,05', 'POL', '201', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RELOGIO COMPARADOR .050"-0-.050"',
    measurement_range = '0,05',
    unit = 'POL',
    serial_number = '201',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-235';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-236', NULL, 'RELOGIO COMPARADOR .050"-0-.050"', '0,05', 'POL', '03', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RELOGIO COMPARADOR .050"-0-.050"',
    measurement_range = '0,05',
    unit = 'POL',
    serial_number = '03',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-236';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-237', NULL, 'RELOGIO COMPARADOR .050"-0-.050"', '0,05', 'POL', NULL, 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RELOGIO COMPARADOR .050"-0-.050"',
    measurement_range = '0,05',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-237';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-343', NULL, 'RELOGIO COMPARADOR .050"-0-.050"', '0,05', 'POL', '1498', 'mecanico', 'MICROMETRO DE PROFUNDIDADE', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'RELOGIO COMPARADOR .050"-0-.050"',
    measurement_range = '0,05',
    unit = 'POL',
    serial_number = '1498',
    category_1 = 'mecanico',
    asset_type = 'MICROMETRO DE PROFUNDIDADE',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2023-11-07', 12, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-16', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-343';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-020', NULL, 'LEVEL, PRECISION', NULL, NULL, NULL, 'mecanico', 'NÍVEL LINEAR DE PRECISÃO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'LEVEL, PRECISION',
    measurement_range = NULL,
    unit = NULL,
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'NÍVEL LINEAR DE PRECISÃO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2027-10-22', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-020';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-107', NULL, 'PAQUIMETRO  6"', '6', 'POL', '8S20626', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '8S20626',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2027-10-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-107';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-111', NULL, 'PAQUIMETRO  6"', '6', 'POL', '8010072', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '8010072',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2027-10-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-111';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-113', NULL, 'PAQUIMETRO  6"', '6', 'POL', '803079', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '803079',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2027-10-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-113';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-114', NULL, 'PAQUIMETRO  6"', '6', 'POL', '8L10405', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '8L10405',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2027-10-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-114';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-136', NULL, 'PAQUIMETRO  6"', '6', 'POL', '8L20801', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '8L20801',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2027-10-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-136';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-139', NULL, 'PAQUIMETRO  6"', '6', 'POL', '8S20972', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '8S20972',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2020-08-13', '2023-08-13', 36, NULL, 84.33, NULL, NULL, NULL, NULL, NULL, 'RETIRADO NO DIA DA COLETA MQT LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-139';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-168', NULL, 'PAQUIMETRO  6"', '6', 'POL', '8S30495', 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = '8S30495',
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2027-10-21', 36, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-168';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-234', NULL, 'PAQUIMETRO  6"', '6', 'POL', NULL, 'mecanico', 'PAQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'PAQUIMETRO  6"',
    measurement_range = '6',
    unit = 'POL',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'PAQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-21', '2026-10-21', 24, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-234';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-181', NULL, 'TERMÔMETRO, (32-212 F)', '100', '°C', '335229', 'mecanico', 'TERMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TERMÔMETRO, (32-212 F)',
    measurement_range = '100',
    unit = '°C',
    serial_number = '335229',
    category_1 = 'mecanico',
    asset_type = 'TERMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-07-22', 9, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-181';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-182', NULL, 'TERMÔMETRO, (0-200 F)', '100', '°C', NULL, 'mecanico', 'TERMÔMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TERMÔMETRO, (0-200 F)',
    measurement_range = '100',
    unit = '°C',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TERMÔMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-22', '2025-07-22', 9, NULL, 84.33, NULL, NULL, NULL, NULL, '2024-10-30', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-182';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-001', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013485', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013485',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-001';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-002', NULL, 'WRENCH, TORQUE 50-0-50 IN LB 1/4 SQ DR', '6', 'Nm', '7168', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 IN LB 1/4 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '7168',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-003', NULL, 'WRENCH, TORQUE 175-0-175 FT LB 1/2 SQ DR TE175', '15', 'Nm', '55301', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 175-0-175 FT LB 1/2 SQ DR TE175',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '55301',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-05-07', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'NAO CALIBRAR EM 2024', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-004', NULL, 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR', '140', 'Nm', '7938', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR',
    measurement_range = '140',
    unit = 'Nm',
    serial_number = '7938',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-005', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 3/8 SQ DR', '70', 'Nm', '11895', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 3/8 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '11895',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-005';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-006', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81006147', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81006147',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-006', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', NULL, NULL, 'ADD', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'ADD',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-007', NULL, 'WRENCH, TORQUE 60-0-60 IN LB 1/4 SQ DR', '10', 'Nm', '6302', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 60-0-60 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '6302',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-25', '2026-08-25', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-007';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-008', NULL, 'TORQUE DRIVER 24-0-24 IN LB', '3', 'Nm', '5411', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUE DRIVER 24-0-24 IN LB',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = '5411',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-008';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-009', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR', '70', 'Nm', '4129', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '4129',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2025-10-25', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-009';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-010', NULL, 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR', '2', 'Nm', '6263', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '6263',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-07-24', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-010';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-011', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '3447', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '3447',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-011';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-012', NULL, 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR', '2', 'Nm', '6266', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '6266',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-07-24', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-012';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-013', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39722', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39722',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-013';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-014', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA', '70', 'Nm', '17162', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '17162',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-014';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-015', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA', '70', 'Nm', '17165', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '17165',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-015';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-016', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA', '70', 'Nm', '17186', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '17186',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-016';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-017', NULL, 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR', '2', 'Nm', '6264', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '6264',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-017';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-018', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '7103', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '7103',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-05-07', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-018';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-019', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '7101', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '7101',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-05-07', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-019';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-021', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '7102', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '7102',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-05-07', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-021';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-022', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR', '70', 'Nm', '4128', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '4128',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-10-24', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-022';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-026', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81006120', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81006120',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-026';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-027', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39720', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39720',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2021-09-21', '2022-12-21', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-027';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-028', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24484', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24484',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-08', '2025-05-08', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-028';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-029', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '15', 'Nm', '39864', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '39864',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-029';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-030', NULL, 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR', '150', 'Nm', '7944', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR',
    measurement_range = '150',
    unit = 'Nm',
    serial_number = '7944',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-030';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-031', NULL, 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR', '140', 'Nm', '7888', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR',
    measurement_range = '140',
    unit = 'Nm',
    serial_number = '7888',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-10-24', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-031';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-032', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39892', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39892',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-032';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-034', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', 'BT-1B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'BT-1B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-16', '2024-11-16', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-034';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-034', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR', '10', 'Nm', '04111342', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '04111342',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-04-02', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-034';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-035', NULL, 'WRENCH, TORQUE PRESET 8 IN LB', '1', 'Nm', 'BT-1', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 8 IN LB',
    measurement_range = '1',
    unit = 'Nm',
    serial_number = 'BT-1',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-07-25', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-035';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-036', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', 'BT-1B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'BT-1B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-036';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-037', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR', '10', 'Nm', 'ADCAP', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'ADCAP',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-037';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-038', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', 'BT-1B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'BT-1B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-038';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-041', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39887', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39887',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-02-06', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-041';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-042', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '15', 'Nm', '39883', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '39883',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-08', '2024-02-08', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '234-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-042';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-043', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24456', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24456',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-043';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-044', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24496', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24496',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-044';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-045', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '15', 'Nm', '39890', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '39890',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-10-24', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-045';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-046', NULL, 'WRENCH, ROTARY TORQUE DRIVER 12-0-12 IN LB', '2', 'Nm', '8756', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, ROTARY TORQUE DRIVER 12-0-12 IN LB',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '8756',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-07-24', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-046';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-047', NULL, 'WRENCH, TORQUE 50-0-50 IN LB 1/4 SQ DR', '6', 'Nm', '7157', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 IN LB 1/4 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '7157',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-07-24', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-047';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-048', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEX', '10', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEX',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2026-08-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-048';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-050', NULL, 'WRENCH, TORQUE PRESET 250 IN LB', '30', 'Nm', '04111019', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 250 IN LB',
    measurement_range = '30',
    unit = 'Nm',
    serial_number = '04111019',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-050';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-051', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013501', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013501',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-051';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-052', NULL, 'WRENCH, TORQUE PRESET 30 IN LB 1/4 SQ DR', '3', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 30 IN LB 1/4 SQ DR',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-052';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-057', NULL, 'WRENCH, TORQUE PRESET 7-25 FT LB 3/16 HEX', '35', 'Nm', '0608506720', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 7-25 FT LB 3/16 HEX',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '0608506720',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-057';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-058', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81006153', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81006153',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-058';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-060', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR CCW', '10', 'Nm', '702C', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR CCW',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '702C',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-060';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-061', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT', '10', 'Nm', '702A', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '702A',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2026-08-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-061';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-062', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24486', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24486',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-062';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-063', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 3/8 SQ DR', '70', 'Nm', '11896', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 3/8 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '11896',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-063';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-064', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39889', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39889',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-064';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-065', NULL, 'WRENCH, TORQUE PRESET 140 IN LB', '16', 'Nm', '1509', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 140 IN LB',
    measurement_range = '16',
    unit = 'Nm',
    serial_number = '1509',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-065';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-066', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13547', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13547',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2027-07-25', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-066';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-067', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13555', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13555',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-07-24', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-067';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-068', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 3/8 SQ DR', '70', 'Nm', '11897', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 3/8 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '11897',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-068';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-069', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR', '10', 'Nm', '557-2', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '557-2',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-01-24', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-069';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-070', NULL, 'WRENCH, TORQUE PRESET 85 IN LB', '10', 'Nm', 'VB100T', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 85 IN LB',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'VB100T',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2025-05-25', 10, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-070';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-071', NULL, 'WRENCH, ROTARY TORQUE DRIVER 12-0-12 IN LB', '2', 'Nm', '8757', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, ROTARY TORQUE DRIVER 12-0-12 IN LB',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '8757',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-071';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-072', NULL, 'TORQUE DRIVER 60-0-60  IN LB 1/4 SQ DR', '10', 'Nm', '6301', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'TORQUE DRIVER 60-0-60  IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '6301',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-072';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-073', NULL, 'WRENCH, TORQUE PRESET 10 IN LB (2T-1)', '15', 'Nm', 'VB 2T-1', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 10 IN LB (2T-1)',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = 'VB 2T-1',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-073';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-074', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13557', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13557',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-074';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-075', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '101704294', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '101704294',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-075';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-076', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '7104', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '7104',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-01-24', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-076';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-077', NULL, 'WRENCH, TORQUE PRESET 30 IN LB 1/4 SQ DR', '4', 'Nm', 'BT-1 ', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = 'BT-1 ',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-077';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-078', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '7143', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '7143',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-078';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-080', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', 'BT-1B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'BT-1B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-10-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-080';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-081', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR', '70', 'Nm', '4127', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '4127',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-081';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-082', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA', '70', 'Nm', '17185', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '17185',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-082';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-083', NULL, 'WRENCH, TORQUE 200-600 FT LB', '820', 'Nm', '1108101176', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 200-600 FT LB',
    measurement_range = '820',
    unit = 'Nm',
    serial_number = '1108101176',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-083';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-084', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81006178', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81006178',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-084';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-085', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24491', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24491',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-085';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-086', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81006152', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81006152',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-086';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-087', NULL, 'WRENCH, TORQUE 50-0-50 IN LB 1/4 SQ DR', '6', 'Nm', '7167', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 IN LB 1/4 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '7167',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-087';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-088', NULL, 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR', '140', 'Nm', '7943', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR',
    measurement_range = '140',
    unit = 'Nm',
    serial_number = '7943',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-088';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-089', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13552', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13552',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-089';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-090', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81006156', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81006156',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-090';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-090', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', NULL, NULL, 'ADD', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = NULL,
    unit = NULL,
    serial_number = 'ADD',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-07-24', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-090';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-091', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013496', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013496',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-091';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-092', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39723', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39723',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-092';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-093', NULL, 'WRENCH, TORQUE 250-0-250 FT LB 1/2 SQ DR TE250', '340', 'Nm', '19164', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 250-0-250 FT LB 1/2 SQ DR TE250',
    measurement_range = '340',
    unit = 'Nm',
    serial_number = '19164',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-05-07', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-093';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-094', NULL, 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR', '140', 'Nm', '7715', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 100-0-100 FT LB 1/2 SQ DR',
    measurement_range = '140',
    unit = 'Nm',
    serial_number = '7715',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-10-24', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-094';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-095', NULL, 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR', '70', 'Nm', '4126', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 50-0-50 FT LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '4126',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-095';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-096', NULL, 'WRENCH, TORQUE PRESET 50 IN LB 3/8 SQ DR', '6', 'Nm', '713', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 50 IN LB 3/8 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '713',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-096';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-097', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13559', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13559',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-097';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-098', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '7100', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '7100',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-098';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-099', NULL, 'WRENCH, TORQUE PRESET 140 IN LB', '16', 'Nm', '1024', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 140 IN LB',
    measurement_range = '16',
    unit = 'Nm',
    serial_number = '1024',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-099';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-100', NULL, 'WRENCH, TORQUE PRESET 150 IN LB', '20', 'Nm', '430', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 150 IN LB',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '430',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2026-06-02', 22, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-100';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-100A', NULL, 'WRENCH, TORQUE PRESET 150 IN LB', '20', 'Nm', '07286', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 150 IN LB',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '07286',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-09-06', 22, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-100A';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-103', NULL, 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR', '2', 'Nm', '6267', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '6267',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-103';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-104', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24476', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24476',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-08', '2025-05-08', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-104';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-105', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24477', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24477',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-105';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-106', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '15', 'Nm', '39880', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '39880',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-10-24', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-106';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-108', NULL, 'WRENCH, TORQUE 250-0-250 FT LB 1/2 SQ DR TE250', '340', 'Nm', '081123983', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 250-0-250 FT LB 1/2 SQ DR TE250',
    measurement_range = '340',
    unit = 'Nm',
    serial_number = '081123983',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-108';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-109', NULL, 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR', '2', 'Nm', '6265', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '6265',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-109';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-110', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013499', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013499',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-110';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-112', NULL, 'WRENCH, TORQUE PRESET 50 IN LB 3/8 SQ DR', '6', 'Nm', '713', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 50 IN LB 3/8 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '713',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-04-02', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-112';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-115', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', '186', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = '186',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-115';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-119', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013488', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013488',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-119';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-120', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13558', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13558',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-120';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-122', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', 'BT-1B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'BT-1B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-122';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-123', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013494', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013494',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-123';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-124', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24468', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24468',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-01-24', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-124';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-125', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13551', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13551',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-125';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-126', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13562', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13562',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-126';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-127', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13553', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13553',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-127';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-128', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-128';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-129', NULL, 'WRENCH, TORQUE PRESET 30 IN LB 1/4 SQ DR', '3', 'Nm', 'BT-1', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 30 IN LB 1/4 SQ DR',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = 'BT-1',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-129';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-130', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT', '10', 'Nm', '7549', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '7549',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-130';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-131', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR', '70', 'Nm', '4906', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 1/2 SQ DR',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '4906',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2022-11-07', '2025-05-07', 30, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-131';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-132', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013486', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013486',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-132';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-133', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24488', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24488',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2027-01-24', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-133';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-134', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '20', 'Nm', '39884', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '39884',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-01-02', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-134';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-135', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013497', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013497',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-135';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-137', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13560', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13560',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-137';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-142', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13554', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13554',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-142';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-143', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24492', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24492',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-143';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-144', NULL, 'WRENCH, TORQUE PRESET 140 IN LB', '16', 'Nm', '1510', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 140 IN LB',
    measurement_range = '16',
    unit = 'Nm',
    serial_number = '1510',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-144';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-145', NULL, 'WRENCH, TORQUE SPECIAL 200 IN LB 3/8 SQ DR', '20', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE SPECIAL 200 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-07-25', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-145';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-146', NULL, 'WRENCH, TORQUE PRESET 50 IN LB', '6', 'Nm', '9IE0043B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 50 IN LB',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '9IE0043B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-146';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-147', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR', '10', 'Nm', '7584', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '7584',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-01-24', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-147';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-149', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '24498', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '24498',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-149';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-152', NULL, 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR', '15', 'Nm', '39881', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 150-0-150 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '39881',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2025-10-25', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-152';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-153', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013498', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013498',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-153';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-155', NULL, 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR', '4', 'Nm', '13550', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 30-0-30 IN LB 1/4 SQ DR',
    measurement_range = '4',
    unit = 'Nm',
    serial_number = '13550',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-155';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-160', NULL, 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR', '35', 'Nm', '81013495', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 300-0-300 IN LB 3/8 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '81013495',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-160';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-161', NULL, 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA ', '70', 'Nm', '17173', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 600-0-600 IN LB 3/8 SQ DR TE50FUA ',
    measurement_range = '70',
    unit = 'Nm',
    serial_number = '17173',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-10-24', 15, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-161';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-166', NULL, 'WRENCH, TORQUE PRESET 17 IN LB', '2', 'Nm', '48-A1-01', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 17 IN LB',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '48-A1-01',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-06-02', 10, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-166';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-167', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '25072', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '25072',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-04-02', 30, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-167';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-169', NULL, 'WRENCH, TORQUE PRESET 50 IN LB 1/4 SQ DR', '6', 'Nm', '10T', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 50 IN LB 1/4 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '10T',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-169';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-172', NULL, 'WRENCH, TORQUE PRESET 50 IN LB', '6', 'Nm', '04111375', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 50 IN LB',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '04111375',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-07-25', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-172';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-173', NULL, 'WRENCH, TORQUE PRESET 140 IN LB', '16', 'Nm', '02109461', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 140 IN LB',
    measurement_range = '16',
    unit = 'Nm',
    serial_number = '02109461',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-173';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-174', NULL, 'WRENCH, TORQUE SPECIAL 200 IN LB 3/8 SQ DR', '20', 'Nm', '04111016', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE SPECIAL 200 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '04111016',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-174';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-176', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT', '10', 'Nm', 'J-4', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = 'J-4',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2026-08-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-176';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-199', NULL, 'WRENCH, TORQUE PRESET 200 IN LB 3/8 SQ DR', '20', 'Nm', '04111022', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 200 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '04111022',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-199';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-200', NULL, 'WRENCH, TORQUE PRESET 100 IN LB 3/8 SQ DR', '15', 'Nm', '04111369', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 100 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '04111369',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-04-02', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-200';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-201', NULL, 'WRENCH, TORQUE PRESET 50 IN LB 3/8 SQ DR', '6', 'Nm', '04111388', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 50 IN LB 3/8 SQ DR',
    measurement_range = '6',
    unit = 'Nm',
    serial_number = '04111388',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-201';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-203', NULL, 'WRENCH, TORQUE SPECIAL 200 IN LB 3/8 SQ DR', '20', 'Nm', '02109491', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE SPECIAL 200 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '02109491',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', NULL, (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-203';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-206', NULL, 'WRENCH, TORQUE PRESET 100 IN LB 3/8 SQ DR', '15', 'Nm', '04111384', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 100 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '04111384',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-01-24', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-206';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-207', NULL, 'WRENCH, TORQUE PRESET 200 IN LB 3/8 SQ DR', '20', 'Nm', '02109457', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 200 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '02109457',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-07-25', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-207';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-209', NULL, 'WRENCH, TORQUE PRESET 250 IN LB', '20', 'Nm', 'RJE-11', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 250 IN LB',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = 'RJE-11',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-209';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-210', NULL, 'WRENCH, TORQUE PRESET 100 IN LB 3/8 SQ DR', '15', 'Nm', '04111372', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 100 IN LB 3/8 SQ DR',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '04111372',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-210';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-211', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR', '10', 'Nm', '04111394', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 3/8 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '04111394',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-01-25', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-211';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-212', NULL, 'SCREWDRIVER, TORQUE 5 IN LB', '0.5', 'Nm', '5BJ008503', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCREWDRIVER, TORQUE 5 IN LB',
    measurement_range = '0.5',
    unit = 'Nm',
    serial_number = '5BJ008503',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2025-04-25', 9, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-212';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-215', NULL, 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT', '10', 'Nm', '7549', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 75 IN LB 1/4 HEXBIT',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '7549',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02NAO CALIBRADO POIS NEC ADAPATADOR', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-215';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-216', NULL, 'WRENCH, TORQUE 200-600 FT LB', '820', 'Nm', '3802', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 200-600 FT LB',
    measurement_range = '820',
    unit = 'Nm',
    serial_number = '3802',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2026-07-25', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-216';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-218', NULL, 'WRENCH, TORQUE PRESET 3-9  FT LB 3/8 SQ DR VB-10T-1', '10', 'Nm', '0109004063', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 3-9  FT LB 3/8 SQ DR VB-10T-1',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '0109004063',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-01-24', 18, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-218';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-221', NULL, 'WRENCH, TORQUE PRESET 7-25  FT LB 3/16 SQ DR', '35', 'Nm', '6934601', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 7-25  FT LB 3/16 SQ DR',
    measurement_range = '35',
    unit = 'Nm',
    serial_number = '6934601',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2026-08-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-221';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-222', NULL, 'SCREWDRIVER, TORQUE 5 IN LB', '0.5', 'Nm', 'BA73139', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCREWDRIVER, TORQUE 5 IN LB',
    measurement_range = '0.5',
    unit = 'Nm',
    serial_number = 'BA73139',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2025-07-02', 9, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-222';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-223', NULL, 'WRENCH, TORQUE PRESET 200 IN LB 3/8 SQ DR', '20', 'Nm', '02109509', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 200 IN LB 3/8 SQ DR',
    measurement_range = '20',
    unit = 'Nm',
    serial_number = '02109509',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2026-07-24', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-223';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-225', NULL, 'WRENCH, TORQUE PRESET 26 IN LB 9/64 HEX', '3', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 26 IN LB 9/64 HEX',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-06-02', 10, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-225';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-226', NULL, 'WRENCH, TORQUE PRESET 26 IN LB 9/64 HEX', '3', 'Nm', NULL, 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 26 IN LB 9/64 HEX',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-25', '2025-05-25', 10, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-226';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-280', NULL, 'WRENCH, TORQUE 0-150 IN LB 3/8 SQ DR TE12FUA', '15', 'Nm', '13810C', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 0-150 IN LB 3/8 SQ DR TE12FUA',
    measurement_range = '15',
    unit = 'Nm',
    serial_number = '13810C',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-11-06', '2026-11-06', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-11-11', 'MSMI TORQ LOTE 03', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-280';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-282', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', 'BT-1B', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = 'BT-1B',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-282';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-298', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', '53711-5168333-14', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = '53711-5168333-14',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-298';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-299', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', '53711-5168333K4', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = '53711-5168333K4',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-299';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-300', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', '53711-51683334', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = '53711-51683334',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-300';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-301', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', '53711-5168333-4', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = '53711-5168333-4',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-301';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-351', NULL, 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR', '2', 'Nm', '6776', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 15-0-15 IN LB 1/4 SQ DR',
    measurement_range = '2',
    unit = 'Nm',
    serial_number = '6776',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2027-10-02', 36, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-351';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-352', NULL, 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR', '10', 'Nm', '1302', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE 75-0-75 IN LB 1/4 SQ DR',
    measurement_range = '10',
    unit = 'Nm',
    serial_number = '1302',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2019-10-29', '2022-10-29', 36, NULL, 100.0, NULL, NULL, NULL, NULL, NULL, 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-352';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-353', NULL, 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR', '2.5', 'Nm', '5168333-4', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'WRENCH, TORQUE PRESET 18 IN LB 1/4 SQ DR',
    measurement_range = '2.5',
    unit = 'Nm',
    serial_number = '5168333-4',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-02', '2026-10-02', 24, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-10-16', 'MSMI TORQ LOTE 02', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-353';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-354', NULL, 'SCREWDRIVER, TORQUE 5 IN LB', '0.5', 'Nm', '5MN100475', 'mecanico', 'TORQUÍMETRO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'SCREWDRIVER, TORQUE 5 IN LB',
    measurement_range = '0.5',
    unit = 'Nm',
    serial_number = '5MN100475',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-07-24', '2025-04-24', 9, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI TORQ LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-354';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-272', NULL, 'VÁLVULA DE ALÍVIO DO RESERVATÓRIO DE BAIXA ', NULL, NULL, NULL, 'mecanico', 'VÁLVULA DE ALÍVIO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'VÁLVULA DE ALÍVIO DO RESERVATÓRIO DE BAIXA ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = NULL,
    category_1 = 'mecanico',
    asset_type = 'VÁLVULA DE ALÍVIO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 776.23, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-272';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('CMASM-IDM-T48-273', NULL, 'VÁLVULA DE ALÍVIO DO RESERVATÓRIO DE ALTA ', NULL, NULL, '074 / 09', 'mecanico', 'VÁLVULA DE ALÍVIO', 'MK-48', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'VÁLVULA DE ALÍVIO DO RESERVATÓRIO DE ALTA ',
    measurement_range = NULL,
    unit = NULL,
    serial_number = '074 / 09',
    category_1 = 'mecanico',
    asset_type = 'VÁLVULA DE ALÍVIO',
    division = 'MK-48',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MQT', 'EMPRESA MQT', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-10-01', '2026-10-01', 24, NULL, 776.23, NULL, NULL, NULL, NULL, '2024-10-16', 'MQT LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MQT' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'CMASM-IDM-T48-273';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-002', NULL, '10-60 NM', '60', 'Nm', '19-0616228', 'mecanico', 'TORQUÍMETRO', 'PENGUIN', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '10-60 NM',
    measurement_range = '60',
    unit = 'Nm',
    serial_number = '19-0616228',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'PENGUIN',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-002';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-003', NULL, '8-60 NM 7000B', '60', 'Nm', '79108366887', 'mecanico', 'TORQUÍMETRO', 'PENGUIN', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '8-60 NM 7000B',
    measurement_range = '60',
    unit = 'Nm',
    serial_number = '79108366887',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'PENGUIN',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-003';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-004', NULL, '0,3-1,2 NM', '1.2', 'Nm', '7440074700', 'mecanico', 'TORQUÍMETRO', 'PENGUIN', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '0,3-1,2 NM',
    measurement_range = '1.2',
    unit = 'Nm',
    serial_number = '7440074700',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'PENGUIN',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-004';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-005', NULL, '1,2-3 NM', '3', 'Nm', '7441074701', 'mecanico', 'TORQUÍMETRO', 'PENGUIN', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '1,2-3 NM',
    measurement_range = '3',
    unit = 'Nm',
    serial_number = '7441074701',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'PENGUIN',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-005';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-008', NULL, '452', NULL, 'Nm', '130815179(CADBEM)', 'mecanico', 'TORQUÍMETRO', 'SEASKUA', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '452',
    measurement_range = NULL,
    unit = 'Nm',
    serial_number = '130815179(CADBEM)',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'SEASKUA',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-008';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-009', NULL, 'NEK-94', NULL, 'Nm', '130815586(CADBEM)', 'mecanico', 'TORQUÍMETRO', 'SEASKUA', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = 'NEK-94',
    measurement_range = NULL,
    unit = 'Nm',
    serial_number = '130815586(CADBEM)',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'SEASKUA',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-009';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-006', NULL, '150 Nm', NULL, 'Nm ', '13081588-8', 'mecanico', 'TORQUÍMETRO', 'SEASKUA', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '150 Nm',
    measurement_range = NULL,
    unit = 'Nm ',
    serial_number = '13081588-8',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'SEASKUA',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-006';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-010', NULL, '0,2 – 1,8 Nm', '1.8', 'Nm ', '130815888(CADBEM)', 'mecanico', 'TORQUÍMETRO', 'SEASKUA', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '0,2 – 1,8 Nm',
    measurement_range = '1.8',
    unit = 'Nm ',
    serial_number = '130815888(CADBEM)',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'SEASKUA',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-010';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-007', NULL, '45 – 265 Nm', '265', 'Nm', '130815713(CADBEM)', 'mecanico', 'TORQUÍMETRO', 'SEASKUA', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '45 – 265 Nm',
    measurement_range = '265',
    unit = 'Nm',
    serial_number = '130815713(CADBEM)',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'SEASKUA',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-007';


INSERT INTO equipment (internal_code, manufacturer, model, measurement_range, unit, serial_number, category_1, asset_type, division, priority, location, organization_id, status, created_at, updated_at)
VALUES ('MAN-EXO-MEC-012', NULL, '45 – 265 Nm', '265', 'Nm', '130815748(CADBEM)', 'mecanico', 'TORQUÍMETRO', 'SEASKUA', 'normal', 'CMASM', 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
    manufacturer = NULL,
    model = '45 – 265 Nm',
    measurement_range = '265',
    unit = 'Nm',
    serial_number = '130815748(CADBEM)',
    category_1 = 'mecanico',
    asset_type = 'TORQUÍMETRO',
    division = 'SEASKUA',
    priority = 'normal',
    location = 'CMASM',
    updated_at = NOW();


INSERT INTO providers (name, contact, is_active, created_at, updated_at)
VALUES ('EMPRESA MV', 'EMPRESA MV', 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name = name;


INSERT INTO calibrations (equipment_id, calibration_date, next_calibration_date, calibration_interval, valid_until, cost, budget_number, payment_date, entry_date, exit_to_cal_date, return_from_cal_date, comments, provider_id, status, created_at, updated_at)
SELECT id, '2024-08-02', '2025-08-02', 12, NULL, 100.0, NULL, NULL, NULL, NULL, '2024-08-12', 'MSMI LOTE 01', (SELECT id FROM providers WHERE name = 'EMPRESA MV' LIMIT 1), 'completed', NOW(), NOW()
FROM equipment WHERE internal_code = 'MAN-EXO-MEC-012';


COMMIT;