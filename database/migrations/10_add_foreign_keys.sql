-- ============================================================================
-- Foreign Keys Pendentes
-- Descrição: Adiciona FKs que dependem de tabelas criadas posteriormente
-- Data: 2025-11-26
-- ============================================================================

-- equipment.last_calibration_id → calibrations.id
ALTER TABLE equipment
ADD CONSTRAINT fk_equipment_last_calibration
FOREIGN KEY (last_calibration_id) REFERENCES calibrations(id) ON DELETE SET NULL;

-- services.calibration_id → calibrations.id
ALTER TABLE services
ADD CONSTRAINT fk_services_calibration
FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE SET NULL;
