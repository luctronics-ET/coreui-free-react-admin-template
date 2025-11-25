# 🔬 Roteiro de Desenvolvimento - Módulo de Calibração

## 📊 Status do Projeto

**Data de criação:** 25 de novembro de 2025  
**Ambiente:** React 19.2.0 + CoreUI 5.9.1 + Vite 7.1.12  
**Node.js:** v22.19.0  
**npm:** 11.6.0

---

## ✅ Análise do Ambiente Atual

### Estrutura do Projeto
```
✅ Frontend: React com CoreUI (Material Design)
✅ Bundler: Vite (desenvolvimento rápido)
✅ Roteamento: React Router v7
✅ Estado: Redux + Context API
✅ Dados: Mock Data (pronto para integração com API)
```

### Módulo de Calibração - Status Atual

#### ✅ **Componentes Já Implementados**

1. **Equipment.js** - Gestão de Equipamentos
   - ✅ CRUD completo (criar, editar, listar, excluir)
   - ✅ Filtros por status e tipo de ativo
   - ✅ Integração com fornecedores
   - ✅ Cálculo automático de próxima calibração
   - ✅ Campos conforme ISO/IEC 17025

2. **Calibrations.js** - Agenda de Calibrações
   - ✅ Visualização de eventos de calibração
   - ✅ Criação e edição de calibrações
   - ✅ Associação com equipamentos
   - ✅ Vinculação a fornecedores/laboratórios
   - ✅ Gestão de padrões de referência

3. **Certificates.js** - Certificados
   - ✅ Listagem de certificados emitidos
   - ✅ Filtros por status
   - ✅ Exportação para CSV
   - ✅ Rastreabilidade completa

4. **CalibrationModal.js** - Modal Completo de Calibração
   - ✅ Formulário de dados da calibração
   - ✅ Tabela dinâmica de parâmetros de medição
   - ✅ Seção de certificado integrada
   - ✅ Seleção de padrões de referência
   - ✅ Condições ambientais

5. **EquipmentForm.js** - Formulário de Equipamento
   - ✅ Todos os campos necessários
   - ✅ Validações
   - ✅ Integração com fornecedores

#### ✅ **Serviços e Dados Mock**

- ✅ Mock completo de equipamentos, calibrações, certificados
- ✅ Mock de fornecedores e padrões de referência
- ✅ CRUD simulado para todos os recursos
- ✅ Lógica de cálculo de próxima calibração
- ✅ Geração automática de números de certificado

#### ✅ **Navegação e Rotas**

- ✅ Menu lateral com grupo "Calibração"
- ✅ Rotas configuradas:
  - `/calibration/equipment` - Equipamentos
  - `/calibration/events` - Calibrações
  - `/calibration/certificates` - Certificados

---

## 🎯 Roteiro de Desenvolvimento

### **FASE 1: Configuração e Validação do Ambiente** ⏱️ 1-2 horas

#### 1.1 Instalação de Dependências
```bash
cd /home/luciano/coreui-free-react-admin-template
npm install
```

#### 1.2 Verificação de Funcionamento
```bash
npm start
```
- ✅ Verificar se o servidor inicia em `http://localhost:3000`
- ✅ Testar navegação para módulos de calibração
- ✅ Verificar console do navegador para erros

#### 1.3 Validação dos Componentes Existentes
- [ ] Acessar `/calibration/equipment` e testar CRUD
- [ ] Acessar `/calibration/events` e criar calibração
- [ ] Acessar `/calibration/certificates` e verificar listagem
- [ ] Testar filtros e busca em cada módulo

**Resultado esperado:** Sistema rodando sem erros, todos os componentes renderizando corretamente.

---

### **FASE 2: Melhorias de UX/UI** ⏱️ 2-3 horas

#### 2.1 Dashboard de Calibração
**Arquivo:** `src/views/calibration/CalibrationDashboard.js` (CRIAR)

**Funcionalidades:**
- [ ] Cards com KPIs:
  - Total de equipamentos ativos
  - Calibrações vencidas
  - Calibrações próximas do vencimento (30 dias)
  - Taxa de conformidade (%)
- [ ] Gráfico de barras: calibrações por mês
- [ ] Lista de alertas: equipamentos com calibração vencida
- [ ] Calendário visual de próximas calibrações

**Componentes reutilizáveis:**
- `CCard`, `CCardBody` - Cards
- `CChartBar` - Gráficos
- `CBadge` - Badges de status

**Mock Data necessário:**
```javascript
// Adicionar em mockData.js
export const calibrationStats = {
  totalEquipment: mockEquipment.length,
  overdue: /* calcular */,
  upcoming: /* calcular */,
  conformityRate: /* calcular */
}
```

#### 2.2 Melhorias no Equipment.js
- [ ] **Adicionar indicadores visuais:**
  - Badge vermelho para calibração vencida
  - Badge amarelo para vencimento em 30 dias
  - Badge verde para equipamentos em dia
  
- [ ] **Ações em lote:**
  - Seleção múltipla de equipamentos
  - Agendar calibração para vários itens
  - Exportar selecionados para Excel/PDF

- [ ] **Visualização de histórico:**
  - Modal com histórico de calibrações do equipamento
  - Timeline visual com eventos

#### 2.3 Melhorias no Calibrations.js
- [ ] **Visualização de calendário:**
  - Adicionar toggle entre lista e calendário
  - Usar componente de calendário do CoreUI
  - Marcar datas com cores por status

- [ ] **Workflow visual:**
  - Adicionarステータス steps: Agendada → Em execução → Concluída
  - Botões de ação contextuais por status

---

### **FASE 3: Funcionalidades Avançadas** ⏱️ 4-6 horas

#### 3.1 Sistema de Notificações
**Arquivo:** `src/services/notificationService.js` (CRIAR)

**Funcionalidades:**
- [ ] Verificação automática de calibrações vencidas
- [ ] Alertas 30, 15 e 7 dias antes do vencimento
- [ ] Notificações in-app (toast)
- [ ] Badge de contador no menu lateral

**Implementação:**
```javascript
// useEffect no DefaultLayout.js
useEffect(() => {
  const checkCalibrations = () => {
    const upcoming = getUpcomingCalibrations(30)
    const overdue = getOverdueCalibrations()
    
    if (overdue.length > 0) {
      showWarning(`${overdue.length} calibrações vencidas`)
    }
    
    if (upcoming.length > 0) {
      showInfo(`${upcoming.length} calibrações próximas do vencimento`)
    }
  }
  
  checkCalibrations()
  const interval = setInterval(checkCalibrations, 3600000) // 1 hora
  
  return () => clearInterval(interval)
}, [])
```

#### 3.2 Gestão de Fornecedores/Laboratórios
**Arquivo:** `src/views/calibration/Providers.js` (CRIAR)

**Funcionalidades:**
- [ ] CRUD de fornecedores
- [ ] Campos: nome, contato, acreditação, escopo
- [ ] Avaliação de desempenho (opcional)
- [ ] Histórico de calibrações por fornecedor

#### 3.3 Gestão de Padrões de Referência
**Arquivo:** `src/views/calibration/ReferenceStandards.js` (CRIAR)

**Funcionalidades:**
- [ ] CRUD de padrões de referência
- [ ] Rastreabilidade (cadeia metrológica)
- [ ] Controle de calibração dos próprios padrões
- [ ] Certificados dos padrões

#### 3.4 Geração de Relatórios
**Arquivo:** `src/views/calibration/Reports.js` (CRIAR)

**Tipos de relatórios:**
- [ ] **Relatório de Status:**
  - Equipamentos por status de calibração
  - Filtros por período, local, tipo
  - Exportar PDF/Excel
  
- [ ] **Relatório de Conformidade:**
  - Taxa de conformidade ao longo do tempo
  - Equipamentos não conformes
  - Análise de tendências

- [ ] **Relatório Gerencial:**
  - Custos de calibração
  - Desempenho de fornecedores
  - Tempo médio de calibração

**Bibliotecas necessárias:**
```bash
npm install jspdf jspdf-autotable xlsx
```

---

### **FASE 4: Integração com Backend** ⏱️ 6-8 horas

#### 4.1 Preparação do Backend (PHP/Node.js)

**Opção 1: PHP (recomendado para integração com SISCHAMADOS)**

**Estrutura sugerida:**
```
backend/
├── config/
│   └── database.php
├── api/
│   ├── equipment.php
│   ├── calibrations.php
│   ├── certificates.php
│   ├── providers.php
│   └── reference_standards.php
├── models/
│   ├── Equipment.php
│   ├── Calibration.php
│   └── Certificate.php
└── index.php
```

**Endpoints necessários:**
```php
// equipment.php
GET    /api/equipment          // Listar todos
GET    /api/equipment/{id}     // Buscar por ID
POST   /api/equipment          // Criar
PUT    /api/equipment/{id}     // Atualizar
DELETE /api/equipment/{id}     // Excluir

// calibrations.php
GET    /api/calibrations       // Listar todos
GET    /api/calibrations/{id}  // Buscar por ID
POST   /api/calibrations       // Criar
PUT    /api/calibrations/{id}  // Atualizar
DELETE /api/calibrations/{id}  // Excluir

// certificates.php
GET    /api/certificates       // Listar todos
GET    /api/certificates/{id}  // Buscar por ID
POST   /api/certificates       // Criar
PUT    /api/certificates/{id}  // Atualizar

// providers.php
GET    /api/providers          // Listar todos
POST   /api/providers          // Criar
PUT    /api/providers/{id}     // Atualizar

// reference_standards.php
GET    /api/reference-standards // Listar todos
POST   /api/reference-standards // Criar
PUT    /api/reference-standards/{id} // Atualizar
```

#### 4.2 Banco de Dados

**Script SQL:** `backend/database/calibration_schema.sql`

```sql
-- Tabela de equipamentos
CREATE TABLE IF NOT EXISTS equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    internal_code VARCHAR(50) NOT NULL UNIQUE,
    manufacturer VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    asset_type VARCHAR(50) NOT NULL,
    classification VARCHAR(50),
    location VARCHAR(100),
    acquisition_date DATE,
    calibration_default_interval_days INT DEFAULT 365,
    last_calibration_id INT NULL,
    next_calibration_due_date DATE,
    status VARCHAR(20) DEFAULT 'active',
    provider_id INT NULL,
    provider_contact VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_internal_code (internal_code),
    INDEX idx_status (status),
    INDEX idx_next_calibration (next_calibration_due_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de fornecedores/laboratórios
CREATE TABLE IF NOT EXISTS providers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    accreditation_body VARCHAR(100),
    accreditation_number VARCHAR(50),
    accreditation_scope TEXT,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de calibrações
CREATE TABLE IF NOT EXISTS calibrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    provider_id INT NULL,
    performed_by_user_id INT NULL,
    calibration_date DATETIME NOT NULL,
    calibration_type VARCHAR(50) DEFAULT 'routine',
    cost DECIMAL(10, 2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'pending',
    results_summary TEXT,
    certificate_id INT NULL,
    environmental_temperature VARCHAR(50),
    environmental_humidity VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    INDEX idx_equipment (equipment_id),
    INDEX idx_status (status),
    INDEX idx_calibration_date (calibration_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de certificados
CREATE TABLE IF NOT EXISTS certificates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    certificate_number VARCHAR(50) NOT NULL UNIQUE,
    calibration_id INT NOT NULL,
    issue_date DATE NOT NULL,
    validity_from DATE NOT NULL,
    validity_to DATE NOT NULL,
    accreditation_declaration TEXT,
    traceability_statement TEXT,
    performed_by VARCHAR(100),
    approved_by VARCHAR(100),
    status VARCHAR(20) DEFAULT 'draft',
    digital_signature TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    INDEX idx_certificate_number (certificate_number),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de parâmetros de medição
CREATE TABLE IF NOT EXISTS measurement_parameters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    calibration_id INT NOT NULL,
    parameter_name VARCHAR(100) NOT NULL,
    nominal_value DECIMAL(15, 6),
    measured_value DECIMAL(15, 6),
    unit VARCHAR(20),
    tolerance DECIMAL(15, 6),
    uncertainty DECIMAL(15, 6),
    pass_fail BOOLEAN DEFAULT TRUE,
    remarks TEXT,
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    INDEX idx_calibration (calibration_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de padrões de referência
CREATE TABLE IF NOT EXISTS reference_standards (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE,
    last_calibration_date DATE,
    traceability_chain TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de relacionamento calibração-padrões
CREATE TABLE IF NOT EXISTS calibration_reference_standards (
    calibration_id INT NOT NULL,
    reference_standard_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (calibration_id, reference_standard_id),
    FOREIGN KEY (calibration_id) REFERENCES calibrations(id) ON DELETE CASCADE,
    FOREIGN KEY (reference_standard_id) REFERENCES reference_standards(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Trigger para atualizar próxima calibração
DELIMITER $$
CREATE TRIGGER after_calibration_insert
AFTER INSERT ON calibrations
FOR EACH ROW
BEGIN
    IF NEW.status IN ('completed', 'approved') THEN
        UPDATE equipment
        SET last_calibration_id = NEW.id,
            next_calibration_due_date = DATE_ADD(NEW.calibration_date, 
                INTERVAL calibration_default_interval_days DAY)
        WHERE id = NEW.equipment_id;
    END IF;
END$$
DELIMITER ;
```

#### 4.3 Atualização do Frontend

**Arquivo:** `src/services/api.js`

```javascript
import axios from 'axios'

const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000/api'

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
})

// Interceptor para adicionar token
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => Promise.reject(error)
)

// Interceptor para tratamento de erros
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token')
      window.location.href = '/login'
    }
    return Promise.reject(error)
  }
)

export const equipmentAPI = {
  getAll: () => api.get('/equipment'),
  getById: (id) => api.get(`/equipment/${id}`),
  create: (data) => api.post('/equipment', data),
  update: (id, data) => api.put(`/equipment/${id}`, data),
  delete: (id) => api.delete(`/equipment/${id}`),
}

export const calibrationsAPI = {
  getAll: () => api.get('/calibrations'),
  getById: (id) => api.get(`/calibrations/${id}`),
  create: (data) => api.post('/calibrations', data),
  update: (id, data) => api.put(`/calibrations/${id}`, data),
  delete: (id) => api.delete(`/calibrations/${id}`),
}

export const certificatesAPI = {
  getAll: () => api.get('/certificates'),
  getById: (id) => api.get(`/certificates/${id}`),
  create: (data) => api.post('/certificates', data),
  update: (id, data) => api.put(`/certificates/${id}`, data),
}

export const providersAPI = {
  getAll: () => api.get('/providers'),
  create: (data) => api.post('/providers', data),
  update: (id, data) => api.put(`/providers/${id}`, data),
}

export const referenceStandardsAPI = {
  getAll: () => api.get('/reference-standards'),
  create: (data) => api.post('/reference-standards', data),
  update: (id, data) => api.put(`/reference-standards/${id}`, data),
}

export default api
```

**Atualizar componentes para usar API real:**

```javascript
// Exemplo: Equipment.js
import { equipmentAPI, providersAPI } from '../../services/api'

const loadData = async () => {
  setLoading(true)
  setError(null)
  try {
    const [equipmentResponse, providerResponse] = await Promise.all([
      equipmentAPI.getAll(),
      providersAPI.getAll(),
    ])
    setEquipment(equipmentResponse.data)
    setProviders(providerResponse.data)
  } catch (err) {
    setError('Não foi possível carregar os equipamentos.')
    console.error(err)
  } finally {
    setLoading(false)
  }
}
```

---

### **FASE 5: Funcionalidades Extras** ⏱️ 4-6 horas

#### 5.1 Importação/Exportação de Dados

**Funcionalidades:**
- [ ] Importar equipamentos via Excel
- [ ] Exportar relatórios em PDF com logo e cabeçalho
- [ ] Backup/Restauração de dados

**Implementação:**
```javascript
// src/utils/importExport.js
import * as XLSX from 'xlsx'

export const importEquipmentFromExcel = (file) => {
  return new Promise((resolve, reject) => {
    const reader = new FileReader()
    
    reader.onload = (e) => {
      try {
        const data = new Uint8Array(e.target.result)
        const workbook = XLSX.read(data, { type: 'array' })
        const worksheet = workbook.Sheets[workbook.SheetNames[0]]
        const jsonData = XLSX.utils.sheet_to_json(worksheet)
        
        // Validar e transformar dados
        const equipment = jsonData.map(row => ({
          internalCode: row['Código Interno'],
          manufacturer: row['Fabricante'],
          model: row['Modelo'],
          // ... outros campos
        }))
        
        resolve(equipment)
      } catch (error) {
        reject(error)
      }
    }
    
    reader.onerror = () => reject(reader.error)
    reader.readAsArrayBuffer(file)
  })
}

export const exportCertificateToPDF = async (certificate, equipment, calibration) => {
  const { jsPDF } = await import('jspdf')
  await import('jspdf-autotable')
  
  const doc = new jsPDF()
  
  // Cabeçalho
  doc.setFontSize(18)
  doc.text('Certificado de Calibração', 105, 20, { align: 'center' })
  
  doc.setFontSize(12)
  doc.text(`Número: ${certificate.certificateNumber}`, 20, 40)
  doc.text(`Data de Emissão: ${formatDate(certificate.issueDate)}`, 20, 50)
  
  // Informações do equipamento
  doc.setFontSize(14)
  doc.text('Equipamento', 20, 70)
  doc.setFontSize(10)
  doc.text(`Código: ${equipment.internalCode}`, 20, 80)
  doc.text(`Fabricante: ${equipment.manufacturer}`, 20, 90)
  doc.text(`Modelo: ${equipment.model}`, 20, 100)
  
  // Tabela de resultados
  const tableData = calibration.measurementParameters.map(param => [
    param.parameterName,
    param.nominalValue,
    param.measuredValue,
    param.unit,
    param.uncertainty,
    param.passFail ? 'Aprovado' : 'Reprovado'
  ])
  
  doc.autoTable({
    startY: 120,
    head: [['Parâmetro', 'Nominal', 'Medido', 'Unidade', 'Incerteza', 'Resultado']],
    body: tableData,
  })
  
  // Assinaturas
  const finalY = doc.lastAutoTable.finalY + 20
  doc.text(`Executado por: ${certificate.performedBy}`, 20, finalY)
  doc.text(`Aprovado por: ${certificate.approvedBy}`, 20, finalY + 10)
  
  // Salvar
  doc.save(`certificado_${certificate.certificateNumber}.pdf`)
}
```

#### 5.2 Sistema de Auditoria (Logs)

**Tabela de logs:**
```sql
CREATE TABLE IF NOT EXISTS audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50) NOT NULL,
    entity_id INT NOT NULL,
    old_values TEXT,
    new_values TEXT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_entity (entity_type, entity_id),
    INDEX idx_user (user_id),
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

**Implementação no backend:**
```php
// utils/AuditLogger.php
class AuditLogger {
    public static function log($userId, $action, $entityType, $entityId, $oldValues = null, $newValues = null) {
        global $pdo;
        
        $stmt = $pdo->prepare("
            INSERT INTO audit_logs 
            (user_id, action, entity_type, entity_id, old_values, new_values, ip_address)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ");
        
        $stmt->execute([
            $userId,
            $action,
            $entityType,
            $entityId,
            json_encode($oldValues),
            json_encode($newValues),
            $_SERVER['REMOTE_ADDR']
        ]);
    }
}

// Uso:
AuditLogger::log($userId, 'CREATE', 'equipment', $equipmentId, null, $newEquipment);
AuditLogger::log($userId, 'UPDATE', 'calibration', $calibrationId, $oldData, $newData);
```

#### 5.3 Lembretes e E-mails Automáticos

**Cron job para verificar calibrações:**
```php
// cron/check_calibrations.php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../utils/EmailService.php';

// Verificar calibrações que vencem em 30, 15 e 7 dias
$intervals = [30, 15, 7];

foreach ($intervals as $days) {
    $sql = "
        SELECT e.*, u.email as responsible_email
        FROM equipment e
        LEFT JOIN users u ON e.responsible_user_id = u.id
        WHERE e.next_calibration_due_date = DATE_ADD(CURDATE(), INTERVAL ? DAY)
        AND e.status = 'active'
    ";
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$days]);
    $equipment = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($equipment as $eq) {
        EmailService::send(
            $eq['responsible_email'],
            "Calibração vencendo em $days dias",
            "O equipamento {$eq['internal_code']} precisa de calibração em $days dias."
        );
    }
}

// Equipamentos com calibração vencida
$sql = "
    SELECT e.*, u.email as responsible_email
    FROM equipment e
    LEFT JOIN users u ON e.responsible_user_id = u.id
    WHERE e.next_calibration_due_date < CURDATE()
    AND e.status = 'active'
";

$stmt = $pdo->query($sql);
$overdue = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($overdue as $eq) {
    EmailService::send(
        $eq['responsible_email'],
        "Calibração VENCIDA - Ação Urgente",
        "O equipamento {$eq['internal_code']} está com calibração vencida desde " . 
        date('d/m/Y', strtotime($eq['next_calibration_due_date']))
    );
}
```

**Configurar no crontab:**
```bash
# Executar diariamente às 8h
0 8 * * * php /caminho/para/cron/check_calibrations.php
```

---

### **FASE 6: Testes e Validação** ⏱️ 3-4 horas

#### 6.1 Testes Unitários

**Arquivo:** `src/views/calibration/__tests__/Equipment.test.js`

```javascript
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import Equipment from '../Equipment'
import { mockDataService } from '../../../services/mockData'

jest.mock('../../../services/mockData')

describe('Equipment Component', () => {
  test('renders equipment list', async () => {
    mockDataService.equipment.getAll.mockResolvedValue([
      { id: 1, internalCode: 'LAB-001', manufacturer: 'Test' }
    ])
    
    render(<Equipment />)
    
    await waitFor(() => {
      expect(screen.getByText('LAB-001')).toBeInTheDocument()
    })
  })
  
  test('creates new equipment', async () => {
    mockDataService.equipment.create.mockResolvedValue({ id: 2 })
    
    render(<Equipment />)
    
    fireEvent.click(screen.getByText('Novo Equipamento'))
    // ... testar formulário
  })
})
```

#### 6.2 Testes de Integração

**Cenários de teste:**
- [ ] Criar equipamento → Agendar calibração → Gerar certificado
- [ ] Importar equipamentos via Excel
- [ ] Exportar relatórios
- [ ] Verificar notificações de vencimento
- [ ] Testar filtros e busca

#### 6.3 Testes de Performance

**Métricas:**
- [ ] Tempo de carregamento de lista com 1000+ equipamentos
- [ ] Tempo de geração de PDF
- [ ] Tempo de exportação para Excel
- [ ] Responsividade em dispositivos móveis

---

### **FASE 7: Documentação e Deploy** ⏱️ 2-3 horas

#### 7.1 Documentação Técnica

**Arquivo:** `docs/CALIBRACAO_MANUAL_TECNICO.md`

**Conteúdo:**
- [ ] Arquitetura do módulo
- [ ] Estrutura do banco de dados
- [ ] Endpoints da API
- [ ] Fluxo de dados
- [ ] Guia de instalação
- [ ] Troubleshooting

#### 7.2 Documentação do Usuário

**Arquivo:** `docs/CALIBRACAO_MANUAL_USUARIO.md`

**Conteúdo:**
- [ ] Como cadastrar equipamento
- [ ] Como agendar calibração
- [ ] Como gerar certificado
- [ ] Como interpretar relatórios
- [ ] Perguntas frequentes

#### 7.3 Deploy

**Checklist:**
- [ ] Configurar variáveis de ambiente (`.env`)
- [ ] Build de produção: `npm run build`
- [ ] Configurar servidor web (Nginx/Apache)
- [ ] Configurar HTTPS
- [ ] Backup do banco de dados
- [ ] Monitoramento de erros (Sentry, etc.)

**Exemplo de `.env`:**
```env
REACT_APP_API_URL=https://api.empresa.com
REACT_APP_ENV=production
REACT_APP_VERSION=1.0.0
```

**Build de produção:**
```bash
npm run build
# Arquivos gerados em /dist
```

---

## 📋 Checklist Completo de Implementação

### ✅ Fase 1: Configuração
- [ ] Instalar dependências
- [ ] Verificar funcionamento
- [ ] Validar componentes existentes

### 🎨 Fase 2: UX/UI
- [ ] Dashboard de calibração
- [ ] Melhorias em Equipment
- [ ] Melhorias em Calibrations
- [ ] Indicadores visuais

### 🚀 Fase 3: Funcionalidades Avançadas
- [ ] Sistema de notificações
- [ ] Gestão de fornecedores
- [ ] Gestão de padrões de referência
- [ ] Geração de relatórios

### 🔌 Fase 4: Backend
- [ ] Criar estrutura de API
- [ ] Implementar banco de dados
- [ ] Integrar frontend com backend
- [ ] Testes de integração

### ➕ Fase 5: Extras
- [ ] Importação/Exportação
- [ ] Sistema de auditoria
- [ ] E-mails automáticos
- [ ] Cron jobs

### 🧪 Fase 6: Testes
- [ ] Testes unitários
- [ ] Testes de integração
- [ ] Testes de performance
- [ ] Testes de usabilidade

### 📚 Fase 7: Documentação e Deploy
- [ ] Documentação técnica
- [ ] Documentação do usuário
- [ ] Deploy em produção
- [ ] Treinamento de usuários

---

## 🎯 Priorização (MVP)

### **Alta Prioridade (Essencial para MVP)**
1. ✅ CRUD de Equipamentos (JÁ IMPLEMENTADO)
2. ✅ CRUD de Calibrações (JÁ IMPLEMENTADO)
3. ✅ CRUD de Certificados (JÁ IMPLEMENTADO)
4. Dashboard com KPIs
5. Sistema de notificações básico
6. Integração com backend
7. Relatórios básicos

### **Média Prioridade (Importante)**
1. Gestão de fornecedores
2. Gestão de padrões de referência
3. Exportação PDF
4. Sistema de auditoria
5. E-mails automáticos

### **Baixa Prioridade (Desejável)**
1. Importação Excel
2. Relatórios avançados
3. Calendário visual
4. Gráficos avançados

---

## ⏱️ Estimativa Total de Tempo

| Fase | Tempo Estimado | Prioridade |
|------|---------------|------------|
| Fase 1: Configuração | 1-2h | Alta |
| Fase 2: UX/UI | 2-3h | Alta |
| Fase 3: Funcionalidades Avançadas | 4-6h | Alta/Média |
| Fase 4: Backend | 6-8h | Alta |
| Fase 5: Extras | 4-6h | Média/Baixa |
| Fase 6: Testes | 3-4h | Alta |
| Fase 7: Documentação e Deploy | 2-3h | Alta |
| **TOTAL** | **22-32 horas** | |

### MVP (Mínimo Viável)
- **Tempo estimado:** 12-16 horas
- **Fases:** 1, 2 (parcial), 4 (parcial), 6 (parcial), 7 (parcial)

---

## 📞 Próximos Passos Imediatos

### 1. **Iniciar o projeto**
```bash
cd /home/luciano/coreui-free-react-admin-template
npm install
npm start
```

### 2. **Testar módulo atual**
- Acessar http://localhost:3000
- Navegar para /calibration/equipment
- Criar, editar, listar equipamentos
- Testar calibrações e certificados

### 3. **Escolher próximo desenvolvimento**
Opções:
- **A)** Dashboard de calibração (visual, impacto rápido)
- **B)** Integração com backend (funcional, essencial)
- **C)** Sistema de notificações (útil, engajamento)

---

## 💡 Recomendações

1. **Comece pelo MVP:** Foque nas funcionalidades essenciais primeiro
2. **Testes contínuos:** Teste cada feature antes de seguir para a próxima
3. **Documentação incremental:** Documente enquanto desenvolve
4. **Feedback dos usuários:** Apresente protótipos e colete feedback
5. **Backup regular:** Faça commits frequentes no Git
6. **Code review:** Revise o código antes de merge

---

## 🐛 Troubleshooting Comum

### Erro: "Module not found"
```bash
npm install
npm run build
```

### Erro: "Port 3000 already in use"
```bash
killall node
# ou
PORT=3001 npm start
```

### Erro: "CORS"
Configure o backend:
```php
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
```

---

## 📚 Recursos Adicionais

- [CoreUI React Docs](https://coreui.io/react/docs/)
- [React Router Docs](https://reactrouter.com/)
- [ISO/IEC 17025](https://www.iso.org/standard/66912.html)
- [INMETRO - Acreditação](http://www.inmetro.gov.br/credenciamento/)

---

**Documento criado em:** 25/11/2025  
**Versão:** 1.0  
**Status:** ✅ Pronto para desenvolvimento
