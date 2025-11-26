-- Migration: Add ODS fields to calibrations table
-- Date: 2025-11-26
-- Description: Add fields from CMASM_Controle de Calibracao 2025.ods

USE cmasm_db;

-- Add valid_until field (VALIDADE CALIBRAÇÃO)
ALTER TABLE calibrations 
ADD COLUMN IF NOT EXISTS valid_until DATE NULL COMMENT 'Data de validade da calibração';

-- Add budget_number field (ORÇAMENTO)
ALTER TABLE calibrations 
ADD COLUMN IF NOT EXISTS budget_number VARCHAR(100) NULL COMMENT 'Número do orçamento';

-- Add payment_date field (PAGAMENTO)
ALTER TABLE calibrations 
ADD COLUMN IF NOT EXISTS payment_date DATE NULL COMMENT 'Data do pagamento da calibração';

-- Add index for valid_until (for filtering expired calibrations)
CREATE INDEX IF NOT EXISTS idx_calibrations_valid_until ON calibrations(valid_until);

-- Add index for payment_date (for financial reports)
CREATE INDEX IF NOT EXISTS idx_calibrations_payment_date ON calibrations(payment_date);

-- Verify changes
SELECT 
    'calibrations' as table_name,
    COUNT(*) as total_columns,
    SUM(CASE WHEN COLUMN_NAME = 'valid_until' THEN 1 ELSE 0 END) as has_valid_until,
    SUM(CASE WHEN COLUMN_NAME = 'budget_number' THEN 1 ELSE 0 END) as has_budget_number,
    SUM(CASE WHEN COLUMN_NAME = 'payment_date' THEN 1 ELSE 0 END) as has_payment_date
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'cmasm_db' 
AND TABLE_NAME = 'calibrations';
