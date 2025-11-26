-- ============================================================================
-- Seed Data: Estrutura Organizacional CMASM
-- Descrição: Hierarquia completa OM > Departamento > Divisão > Seção
-- Data: 2025-11-26
-- ============================================================================

-- OM Principal
INSERT INTO organizations (code, name, type, parent_id) VALUES
('CMASM', 'Centro de Mísseis e Armas Submarinas da Marinha', 'om', NULL);

SET @cmasm_id = LAST_INSERT_ID();

-- Departamento de Armas
INSERT INTO organizations (code, name, type, parent_id) VALUES
('DEPT-ARMAS', 'Departamento de Armas', 'department', @cmasm_id);

SET @dept_armas_id = LAST_INSERT_ID();

-- Divisões do Departamento de Armas
INSERT INTO organizations (code, name, type, parent_id) VALUES
('DIV-MK48', 'Divisão MK-48', 'division', @dept_armas_id),
('DIV-MK46', 'Divisão MK-46', 'division', @dept_armas_id),
('DIV-F21', 'Divisão F-21', 'division', @dept_armas_id),
('DIV-EXOCET', 'Divisão EXOCET', 'division', @dept_armas_id),
('DIV-MINAS', 'Divisão Minas e Bombas', 'division', @dept_armas_id),
('DIV-MISSEIS', 'Divisão Mísseis Especiais', 'division', @dept_armas_id);

-- Departamento de Infraestrutura
INSERT INTO organizations (code, name, type, parent_id) VALUES
('DEPT-INFRA', 'Departamento de Infraestrutura', 'department', @cmasm_id);

SET @dept_infra_id = LAST_INSERT_ID();

-- Divisão de Manutenção Especializada
INSERT INTO organizations (code, name, type, parent_id) VALUES
('DIV-MANUT', 'Divisão Manutenção Especializada', 'division', @dept_infra_id);

SET @div_manut_id = LAST_INSERT_ID();

-- Seções da Divisão de Manutenção Especializada
INSERT INTO organizations (code, name, type, parent_id, responsible_officer, contact_email) VALUES
('SEC-CARP', 'Seção Carpintaria', 'section', @div_manut_id, 'SO João Silva', 'carpintaria@cmasm.mar.mil.br'),
('SEC-METAL', 'Seção Metalurgia', 'section', @div_manut_id, 'SO Pedro Santos', 'metalurgia@cmasm.mar.mil.br'),
('SEC-PINT', 'Seção Pintura Industrial', 'section', @div_manut_id, 'SG Carlos Oliveira', 'pintura@cmasm.mar.mil.br'),
('SEC-MAQ', 'Seção Máquinas', 'section', @div_manut_id, 'SO Maria Ferreira', 'maquinas@cmasm.mar.mil.br'),
('SEC-REFRIG', 'Seção Refrigeração', 'section', @div_manut_id, 'SG José Costa', 'refrigeracao@cmasm.mar.mil.br'),
('SEC-ELETRON', 'Seção Eletrônica', 'section', @div_manut_id, 'SO Roberto Lima', 'eletronica@cmasm.mar.mil.br');

-- CMS (Centro de Manutenção da Marinha)
INSERT INTO organizations (code, name, type, parent_id) VALUES
('CMS', 'Centro de Manutenção da Marinha', 'om', NULL);

-- Verificação
SELECT 
    o.id,
    CONCAT(REPEAT('  ', 
        CASE o.type
            WHEN 'om' THEN 0
            WHEN 'department' THEN 1
            WHEN 'division' THEN 2
            WHEN 'section' THEN 3
        END
    ), o.name) as hierarchical_name,
    o.code,
    o.type
FROM organizations o
ORDER BY 
    COALESCE(o.parent_id, 0),
    o.id;
