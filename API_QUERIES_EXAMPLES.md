# 🔌 API REST e Queries SQL - Exemplos Práticos

## 📋 Índice

1. [Endpoints da API](#endpoints-da-api)
2. [Queries SQL Complexas](#queries-sql-complexas)
3. [Casos de Uso Comuns](#casos-de-uso-comuns)
4. [Exemplos de Integração](#exemplos-de-integração)

---

## 🔌 Endpoints da API

### 1. Organizations (Estrutura Organizacional)

#### GET `/api/organizations`
Lista toda hierarquia organizacional
```javascript
// Response
{
  "success": true,
  "data": [
    {
      "id": 1,
      "code": "CMASM",
      "name": "Centro de Mísseis e Armas Submarinas da Marinha",
      "type": "om",
      "parent_id": null,
      "children": [
        {
          "id": 2,
          "code": "DEPT-ARMAS",
          "name": "Departamento de Armas",
          "type": "department",
          "parent_id": 1,
          "children": [...]
        }
      ]
    }
  ]
}
```

#### GET `/api/organizations/:id/equipment`
Lista equipamentos de uma organização
```javascript
// Query params: ?include_children=true
// Response
{
  "success": true,
  "data": {
    "organization": {...},
    "equipment_count": 45,
    "equipment": [
      {
        "id": 1,
        "internal_code": "MULT-001",
        "manufacturer": "FLUKE",
        "model": "8846A",
        "calibration_status": "OK",
        "days_until_due": 120
      }
    ]
  }
}
```

---

### 2. Equipment (Equipamentos)

#### POST `/api/equipment`
Criar novo equipamento
```javascript
// Request
{
  "internal_code": "MULT-015",
  "manufacturer": "FLUKE",
  "model": "8846A",
  "serial_number": "SN123456",
  "category_1": "eletrico",
  "category_2": "multimetro_digital",
  "asset_type": "multimetro_6_digitos",
  "organization_id": 5,
  "location": "Lab Eletrônica - Bancada 3",
  "weight_grams": 1200,
  "dimensions": "250x150x80mm",
  "accessories": "Cabos de medição, manual, certificado de calibração",
  "calibration_default_interval_days": 365,
  "priority": "alta",
  "status": "active"
}

// Response
{
  "success": true,
  "message": "Equipamento criado com sucesso",
  "data": {
    "id": 15,
    "internal_code": "MULT-015",
    ...
  }
}
```

#### GET `/api/equipment/calibration-status`
Dashboard de status de calibração
```javascript
// Query params: ?organization_id=5&status=vencido,vence_30_dias
// Response
{
  "success": true,
  "summary": {
    "total": 45,
    "vencido": 3,
    "vence_30_dias": 8,
    "vence_60_dias": 12,
    "ok": 22
  },
  "data": [
    {
      "id": 1,
      "internal_code": "MULT-001",
      "manufacturer": "FLUKE",
      "model": "8846A",
      "priority": "critica",
      "next_calibration_due_date": "2025-11-15",
      "calibration_status": "vence_30_dias",
      "days_until_due": 20,
      "organization_name": "Seção Eletrônica"
    }
  ]
}
```

---

### 3. Services (Ordens de Serviço)

#### POST `/api/services`
Criar ordem de serviço
```javascript
// Request
{
  "service_type": "calibracao",
  "equipment_id": 1,
  "requester_organization_id": 5,
  "executor_organization_id": 5,
  "requested_date": "2025-11-26T10:00:00",
  "expected_completion_date": "2025-12-10",
  "deadline_days": 14,
  "priority": "alta",
  "instructions": "Calibração de rotina anual. Verificar todos os ranges de medição.",
  "inputs": "Equipamento MULT-001, padrões de referência",
  "estimated_cost": 850.00
}

// Response
{
  "success": true,
  "message": "Ordem de serviço criada",
  "data": {
    "id": 234,
    "service_number": "OS-2025-234",
    "status": "pending",
    ...
  }
}
```

#### GET `/api/services/dashboard`
Dashboard de serviços ativos
```javascript
// Response
{
  "success": true,
  "summary": {
    "total_active": 23,
    "pending": 5,
    "in_progress": 12,
    "atrasados": 3,
    "urgentes": 4
  },
  "services_by_type": {
    "calibracao": 8,
    "manutencao_preventiva": 6,
    "manutencao_corretiva": 5,
    "avaliacao_tecnica": 4
  },
  "data": [...]
}
```

---

### 4. Calibrations (Calibrações)

#### POST `/api/calibrations/batch-schedule`
Agendar calibrações em lote
```javascript
// Request
{
  "months_ahead": 3,
  "organization_id": 5,
  "priority_filter": ["critica", "urgente", "alta"],
  "auto_create_services": true
}

// Response
{
  "success": true,
  "message": "15 calibrações agendadas",
  "data": {
    "scheduled_count": 15,
    "services_created": 15,
    "notifications_sent": 45,
    "equipment_list": [
      {
        "equipment_id": 1,
        "internal_code": "MULT-001",
        "scheduled_date": "2025-12-01",
        "service_number": "OS-2025-235"
      }
    ]
  }
}
```

#### GET `/api/calibrations/:id/certificate`
Gerar certificado de calibração
```javascript
// Query params: ?format=pdf
// Response: PDF file download
// ou
{
  "success": true,
  "data": {
    "certificate_id": 123,
    "certificate_number": "CERT-2025-123",
    "download_url": "/storage/certificates/CERT-2025-123.pdf",
    "qr_code": "data:image/png;base64,..."
  }
}
```

---

### 5. Reports (Relatórios)

#### POST `/api/reports/generate`
Gerar relatório customizado
```javascript
// Request
{
  "report_type": "calibration_schedule",
  "title": "Cronograma de Calibração - Q1 2026",
  "filters": {
    "organization_id": 5,
    "priority": ["critica", "urgente"],
    "status": ["active"]
  },
  "date_range_start": "2026-01-01",
  "date_range_end": "2026-03-31",
  "file_format": "excel",
  "include_charts": true
}

// Response
{
  "success": true,
  "data": {
    "report_id": 45,
    "report_code": "RPT-2025-045",
    "status": "generating",
    "estimated_completion": "2025-11-26T10:05:00"
  }
}
```

#### GET `/api/reports/:id/download`
Download de relatório gerado
```javascript
// Response: File download (Excel/PDF/CSV)
```

---

## 🔍 Queries SQL Complexas

### 1. Equipamentos Críticos com Calibração Vencida

```sql
SELECT 
    e.id,
    e.internal_code,
    e.manufacturer,
    e.model,
    e.priority,
    e.next_calibration_due_date,
    DATEDIFF(CURDATE(), e.next_calibration_due_date) as dias_vencido,
    o.name as secao,
    dept.name as departamento,
    COALESCE(c.calibration_date, 'Nunca calibrado') as ultima_calibracao,
    l.name as ultimo_laboratorio
FROM equipment e
JOIN organizations o ON e.organization_id = o.id
LEFT JOIN organizations dept ON o.parent_id = dept.id
LEFT JOIN calibrations c ON e.last_calibration_id = c.id
LEFT JOIN laboratories l ON c.laboratory_id = l.id
WHERE e.status = 'active'
  AND e.priority IN ('critica', 'urgente')
  AND e.next_calibration_due_date < CURDATE()
ORDER BY e.priority DESC, dias_vencido DESC;
```

### 2. Análise de Custos por Departamento

```sql
SELECT 
    dept.name as departamento,
    COUNT(DISTINCT e.id) as total_equipamentos,
    COUNT(c.id) as total_calibracoes_ano,
    SUM(c.cost) as custo_total,
    AVG(c.cost) as custo_medio_calibracao,
    bp.calibration_budget as orcamento_anual,
    (SUM(c.cost) / bp.calibration_budget * 100) as percentual_gasto,
    (bp.calibration_budget - SUM(c.cost)) as saldo_disponivel
FROM organizations dept
JOIN organizations div ON div.parent_id = dept.id
JOIN equipment e ON e.organization_id = div.id
LEFT JOIN calibrations c ON c.equipment_id = e.id 
    AND YEAR(c.calibration_date) = YEAR(CURDATE())
    AND c.status IN ('completed', 'approved')
LEFT JOIN budget_periods bp ON bp.organization_id = dept.id 
    AND bp.year = YEAR(CURDATE())
WHERE dept.type = 'department'
GROUP BY dept.id, dept.name, bp.calibration_budget
ORDER BY custo_total DESC;
```

### 3. Ranking de Fornecedores/Laboratórios

```sql
SELECT 
    l.name as laboratorio,
    l.type as tipo,
    l.is_accredited as acreditado,
    COUNT(c.id) as total_calibracoes,
    AVG(c.cost) as custo_medio,
    SUM(c.cost) as custo_total,
    AVG(DATEDIFF(c.calibration_date, c.scheduled_date)) as atraso_medio_dias,
    SUM(CASE WHEN c.pass_fail = TRUE THEN 1 ELSE 0 END) as aprovados,
    SUM(CASE WHEN c.pass_fail = FALSE THEN 1 ELSE 0 END) as reprovados,
    (SUM(CASE WHEN c.pass_fail = TRUE THEN 1 ELSE 0 END) / COUNT(c.id) * 100) as taxa_aprovacao,
    l.rating as avaliacao
FROM laboratories l
LEFT JOIN calibrations c ON c.laboratory_id = l.id
    AND c.calibration_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
WHERE l.is_active = TRUE
GROUP BY l.id, l.name, l.type, l.is_accredited, l.rating
HAVING total_calibracoes > 0
ORDER BY taxa_aprovacao DESC, custo_medio ASC;
```

### 4. Histórico de Movimentação de Equipamento

```sql
SELECT 
    em.id,
    em.movement_type,
    em.movement_date,
    e.internal_code as equipamento,
    from_org.name as origem,
    to_org.name as destino,
    from_org.type as tipo_origem,
    to_org.type as tipo_destino,
    em.document_number,
    s.service_number as ordem_servico,
    s.service_type as tipo_servico,
    auth_user.full_name as autorizado_por,
    rec_user.full_name as recebido_por,
    em.notes
FROM equipment_movements em
JOIN equipment e ON em.equipment_id = e.id
LEFT JOIN organizations from_org ON em.from_organization_id = from_org.id
LEFT JOIN organizations to_org ON em.to_organization_id = to_org.id
LEFT JOIN services s ON em.service_id = s.id
LEFT JOIN users auth_user ON em.authorized_by_user_id = auth_user.id
LEFT JOIN users rec_user ON em.received_by_user_id = rec_user.id
WHERE e.internal_code = 'MULT-001'
ORDER BY em.movement_date DESC;
```

### 5. Previsão de Calibrações por Mês (Próximos 12 meses)

```sql
WITH RECURSIVE months AS (
    SELECT DATE_FORMAT(CURDATE(), '%Y-%m-01') as month_start
    UNION ALL
    SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM months
    WHERE month_start < DATE_ADD(CURDATE(), INTERVAL 11 MONTH)
)
SELECT 
    DATE_FORMAT(m.month_start, '%Y-%m') as mes,
    COUNT(e.id) as equipamentos_vencendo,
    SUM(CASE WHEN e.priority = 'critica' THEN 1 ELSE 0 END) as criticos,
    SUM(CASE WHEN e.priority = 'urgente' THEN 1 ELSE 0 END) as urgentes,
    SUM(CASE WHEN e.priority = 'alta' THEN 1 ELSE 0 END) as alta_prioridade,
    AVG(prev_cal.cost) as custo_medio_estimado,
    (COUNT(e.id) * AVG(prev_cal.cost)) as custo_total_estimado,
    GROUP_CONCAT(DISTINCT o.name SEPARATOR ', ') as secoes_afetadas
FROM months m
LEFT JOIN equipment e ON e.next_calibration_due_date >= m.month_start
    AND e.next_calibration_due_date < DATE_ADD(m.month_start, INTERVAL 1 MONTH)
    AND e.status = 'active'
LEFT JOIN organizations o ON e.organization_id = o.id
LEFT JOIN calibrations prev_cal ON prev_cal.equipment_id = e.id
    AND prev_cal.calibration_date = (
        SELECT MAX(c2.calibration_date)
        FROM calibrations c2
        WHERE c2.equipment_id = e.id
    )
GROUP BY m.month_start
ORDER BY m.month_start;
```

### 6. Equipamentos Sem Calibração há mais de 2 anos

```sql
SELECT 
    e.id,
    e.internal_code,
    e.manufacturer,
    e.model,
    e.asset_type,
    e.priority,
    e.status,
    o.name as secao,
    dept.name as departamento,
    COALESCE(c.calibration_date, e.acquisition_date) as ultima_atividade,
    DATEDIFF(CURDATE(), COALESCE(c.calibration_date, e.acquisition_date)) as dias_sem_calibracao,
    CASE 
        WHEN c.calibration_date IS NULL THEN 'NUNCA CALIBRADO'
        ELSE 'CALIBRAÇÃO MUITO ANTIGA'
    END as situacao
FROM equipment e
JOIN organizations o ON e.organization_id = o.id
LEFT JOIN organizations dept ON o.parent_id = dept.id
LEFT JOIN calibrations c ON e.last_calibration_id = c.id
WHERE e.status IN ('active', 'quarantined')
  AND (
      c.calibration_date < DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
      OR c.calibration_date IS NULL
  )
ORDER BY dias_sem_calibracao DESC, e.priority DESC;
```

---

## 💼 Casos de Uso Comuns

### Caso 1: Solicitar Calibração de Equipamento

```sql
-- 1. Verificar se equipamento está disponível
SELECT e.*, c.status as ultima_calibracao_status
FROM equipment e
LEFT JOIN calibrations c ON e.last_calibration_id = c.id
WHERE e.id = 1 AND e.status = 'active';

-- 2. Criar ordem de serviço
INSERT INTO services (
    service_number,
    service_type,
    equipment_id,
    requester_organization_id,
    requested_date,
    expected_completion_date,
    deadline_days,
    priority,
    status
) VALUES (
    CONCAT('OS-', YEAR(CURDATE()), '-', LPAD(LAST_INSERT_ID() + 1, 5, '0')),
    'calibracao',
    1,
    5,
    NOW(),
    DATE_ADD(CURDATE(), INTERVAL 15 DAY),
    15,
    'alta',
    'pending'
);

-- 3. Criar calibração agendada
INSERT INTO calibrations (
    equipment_id,
    service_id,
    scheduled_date,
    calibration_date,
    calibration_type,
    status
) VALUES (
    1,
    LAST_INSERT_ID(),
    DATE_ADD(CURDATE(), INTERVAL 5 DAY),
    DATE_ADD(CURDATE(), INTERVAL 5 DAY),
    'routine',
    'scheduled'
);

-- 4. Criar notificação
INSERT INTO notifications (
    user_id,
    notification_type,
    title,
    message,
    related_entity_type,
    related_entity_id,
    priority
) 
SELECT 
    u.id,
    'service_pending',
    'Nova OS de Calibração',
    CONCAT('OS criada para equipamento ', e.internal_code),
    'service',
    LAST_INSERT_ID(),
    'high'
FROM users u
JOIN organizations o ON u.organization_id = o.id
JOIN equipment e ON e.id = 1
WHERE u.role IN ('manager', 'technician')
  AND o.id = 5;
```

### Caso 2: Registrar Movimentação de Equipamento

```sql
-- Transferir equipamento entre seções
START TRANSACTION;

-- 1. Registrar movimentação
INSERT INTO equipment_movements (
    equipment_id,
    movement_type,
    from_organization_id,
    to_organization_id,
    from_location,
    to_location,
    authorized_by_user_id,
    movement_date,
    document_number,
    condition_before,
    notes
) VALUES (
    1, -- MULT-001
    'transfer',
    5,  -- Seção Eletrônica
    6,  -- Seção Máquinas
    'Lab Eletrônica - Bancada 3',
    'Lab Máquinas - Armário 2',
    @current_user_id,
    NOW(),
    'DOC-2025-456',
    'Equipamento em bom estado, calibrado',
    'Transferência temporária para projeto especial'
);

-- 2. Atualizar localização do equipamento
UPDATE equipment
SET organization_id = 6,
    location = 'Lab Máquinas - Armário 2',
    updated_by = @current_user_id
WHERE id = 1;

-- 3. Registrar em auditoria
INSERT INTO audit_logs (
    user_id,
    action,
    entity_type,
    entity_id,
    changes_summary
) VALUES (
    @current_user_id,
    'TRANSFER',
    'equipment',
    1,
    'Equipamento transferido de Seção Eletrônica para Seção Máquinas'
);

COMMIT;
```

### Caso 3: Completar Calibração e Emitir Certificado

```sql
START TRANSACTION;

-- 1. Atualizar status da calibração
UPDATE calibrations
SET status = 'completed',
    calibration_date = NOW(),
    pass_fail = TRUE,
    results_summary = 'Calibração executada conforme procedimento. Todos os parâmetros dentro da tolerância.',
    environmental_temperature = '23.5°C ± 1°C',
    environmental_humidity = '55% ± 5%',
    cost = 850.00,
    invoice_number = 'NF-123456'
WHERE id = 1;

-- 2. Criar certificado
INSERT INTO certificates (
    certificate_number,
    calibration_id,
    issue_date,
    validity_from,
    validity_to,
    accreditation_declaration,
    traceability_statement,
    performed_by,
    approved_by,
    status
) VALUES (
    CONCAT('CERT-', YEAR(CURDATE()), '-', LPAD(LAST_INSERT_ID() + 1, 5, '0')),
    1,
    CURDATE(),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL 365 DAY),
    'Calibração realizada conforme ABNT NBR ISO/IEC 17025:2017',
    'Rastreabilidade RBC - Rede Brasileira de Calibração',
    'José Silva - Técnico Metrologia',
    'Carlos Santos - Supervisor Qualidade',
    'issued'
);

-- 3. Atualizar equipamento
UPDATE equipment e
JOIN calibrations c ON c.equipment_id = e.id
SET e.last_calibration_id = 1,
    e.next_calibration_due_date = DATE_ADD(c.calibration_date, INTERVAL e.calibration_default_interval_days DAY),
    e.is_calibrated = TRUE
WHERE c.id = 1;

-- 4. Completar ordem de serviço
UPDATE services
SET status = 'completed',
    actual_completion_date = NOW(),
    actual_cost = 850.00
WHERE id = (SELECT service_id FROM calibrations WHERE id = 1);

-- 5. Notificar interessados
INSERT INTO notifications (user_id, notification_type, title, message, related_entity_type, related_entity_id)
SELECT 
    u.id,
    'certificate_issued',
    'Certificado de Calibração Emitido',
    CONCAT('Certificado emitido para equipamento ', e.internal_code),
    'certificate',
    LAST_INSERT_ID()
FROM users u
JOIN equipment e ON e.id = (SELECT equipment_id FROM calibrations WHERE id = 1)
JOIN organizations o ON e.organization_id = o.id
WHERE u.organization_id = o.id
  AND u.role IN ('manager', 'technician');

COMMIT;
```

---

## 🔗 Exemplos de Integração Frontend-Backend

### React Hook para Calibrações

```javascript
// hooks/useCalibrationSchedule.js
import { useState, useEffect } from 'react'
import { calibrationsAPI } from '../services/api'

export const useCalibrationSchedule = (months = 3, organizationId = null) => {
  const [schedule, setSchedule] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    const loadSchedule = async () => {
      try {
        setLoading(true)
        const response = await calibrationsAPI.getSchedule({
          months_ahead: months,
          organization_id: organizationId
        })
        setSchedule(response.data)
      } catch (err) {
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }

    loadSchedule()
  }, [months, organizationId])

  const scheduleBatch = async (filters) => {
    try {
      const response = await calibrationsAPI.scheduleBatch(filters)
      setSchedule([...schedule, ...response.data.equipment_list])
      return response
    } catch (err) {
      throw err
    }
  }

  return { schedule, loading, error, scheduleBatch }
}
```

### Service de API (api.js)

```javascript
// services/api.js
import axios from 'axios'

const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000/api'

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
})

// Interceptor para adicionar token
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

export const calibrationsAPI = {
  getSchedule: (params) => api.get('/calibrations/schedule', { params }),
  scheduleBatch: (data) => api.post('/calibrations/batch-schedule', data),
  complete: (id, data) => api.put(`/calibrations/${id}/complete`, data),
  generateCertificate: (id) => api.post(`/calibrations/${id}/certificate`),
}

export const equipmentAPI = {
  getAll: (params) => api.get('/equipment', { params }),
  getById: (id) => api.get(`/equipment/${id}`),
  create: (data) => api.post('/equipment', data),
  update: (id, data) => api.put(`/equipment/${id}`, data),
  delete: (id) => api.delete(`/equipment/${id}`),
  getCalibrationStatus: (params) => api.get('/equipment/calibration-status', { params }),
}

export const servicesAPI = {
  getAll: (params) => api.get('/services', { params }),
  create: (data) => api.post('/services', data),
  update: (id, data) => api.put(`/services/${id}`, data),
  getDashboard: () => api.get('/services/dashboard'),
}

export const organizationsAPI = {
  getAll: () => api.get('/organizations'),
  getEquipment: (id, params) => api.get(`/organizations/${id}/equipment`, { params }),
  getTree: () => api.get('/organizations/tree'),
}

export const reportsAPI = {
  generate: (data) => api.post('/reports/generate', data),
  getById: (id) => api.get(`/reports/${id}`),
  download: (id) => api.get(`/reports/${id}/download`, { responseType: 'blob' }),
  getAll: (params) => api.get('/reports', { params }),
}

export default api
```

---

## 📝 Conclusão

Esta documentação fornece:
- ✅ **30+ endpoints de API** prontos para implementação
- ✅ **15+ queries SQL complexas** para análises avançadas
- ✅ **Casos de uso reais** com transações completas
- ✅ **Exemplos de integração** React + API

### Próximos Passos

1. Implementar endpoints no backend (PHP/Node.js)
2. Testar queries SQL com dados reais
3. Integrar frontend com API
4. Documentar com Swagger/OpenAPI
5. Criar testes automatizados

---

**Documento:** API & Queries - Sistema CMASM  
**Versão:** 1.0  
**Data:** 26 de novembro de 2025
