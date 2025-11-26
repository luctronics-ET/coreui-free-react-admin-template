import { calculateNextCalibrationDate, formatCertificateNumber } from '../utils/helpers'

// Dados mock para desenvolvimento
// Este arquivo pode ser removido quando a API real estiver disponível

// Gerar IDs únicos
let userIdCounter = 1
let taskIdCounter = 1
let eventIdCounter = 1
let equipmentIdCounter = 1
let providerIdCounter = 1
let calibrationIdCounter = 1
let certificateIdCounter = 1
let measurementParameterIdCounter = 1

// Mock de usuários
export const mockUsers = [
  {
    id: userIdCounter++,
    name: 'João Silva',
    email: 'joao.silva@example.com',
    role: 'admin',
    status: 'active',
    createdAt: '2024-01-15',
    avatar: null,
  },
  {
    id: userIdCounter++,
    name: 'Maria Santos',
    email: 'maria.santos@example.com',
    role: 'user',
    status: 'active',
    createdAt: '2024-01-20',
    avatar: null,
  },
  {
    id: userIdCounter++,
    name: 'Pedro Oliveira',
    email: 'pedro.oliveira@example.com',
    role: 'user',
    status: 'inactive',
    createdAt: '2024-02-01',
    avatar: null,
  },
]

// Mock de tarefas
export const mockTasks = [
  {
    id: taskIdCounter++,
    title: 'Implementar sistema de autenticação',
    description: 'Criar login e registro de usuários',
    status: 'in_progress',
    priority: 'high',
    assigneeId: 1,
    assigneeName: 'João Silva',
    dueDate: '2024-12-31',
    createdAt: '2024-01-10',
    tags: ['backend', 'security'],
  },
  {
    id: taskIdCounter++,
    title: 'Criar dashboard de métricas',
    description: 'Desenvolver painel com gráficos e estatísticas',
    status: 'pending',
    priority: 'medium',
    assigneeId: 2,
    assigneeName: 'Maria Santos',
    dueDate: '2024-12-25',
    createdAt: '2024-01-15',
    tags: ['frontend', 'dashboard'],
  },
  {
    id: taskIdCounter++,
    title: 'Revisar código do módulo de usuários',
    description: 'Fazer code review e aplicar melhorias',
    status: 'completed',
    priority: 'low',
    assigneeId: 1,
    assigneeName: 'João Silva',
    dueDate: '2024-12-20',
    createdAt: '2024-01-05',
    tags: ['review', 'quality'],
  },
]

// Mock de eventos do calendário
const today = new Date()
const tomorrow = new Date(today)
tomorrow.setDate(tomorrow.getDate() + 1)
const nextWeek = new Date(today)
nextWeek.setDate(nextWeek.getDate() + 7)

export const mockEvents = [
  {
    id: eventIdCounter++,
    title: 'Reunião de equipe',
    description: 'Reunião semanal para alinhamento',
    start: new Date(today.setHours(10, 0, 0, 0)).toISOString(),
    end: new Date(today.setHours(11, 0, 0, 0)).toISOString(),
    type: 'meeting',
    color: '#0d6efd',
    attendees: [1, 2],
  },
  {
    id: eventIdCounter++,
    title: 'Apresentação do projeto',
    description: 'Apresentar progresso do projeto para stakeholders',
    start: new Date(tomorrow.setHours(14, 0, 0, 0)).toISOString(),
    end: new Date(tomorrow.setHours(15, 30, 0, 0)).toISOString(),
    type: 'presentation',
    color: '#198754',
    attendees: [1, 2, 3],
  },
  {
    id: eventIdCounter++,
    title: 'Deadline do sprint',
    description: 'Finalização das tarefas do sprint atual',
    start: new Date(nextWeek.setHours(17, 0, 0, 0)).toISOString(),
    end: new Date(nextWeek.setHours(18, 0, 0, 0)).toISOString(),
    type: 'deadline',
    color: '#dc3545',
    attendees: [1, 2, 3],
  },
]

// Mock de fornecedores/laboratórios
export const mockProviders = [
  {
    id: providerIdCounter++,
    name: 'Alpha Calibrações',
    contact: 'contato@alphacalibra.com',
    phone: '+55 11 3333-4444',
    accreditationBody: 'CGCRE/INMETRO',
    accreditationNumber: 'CRL 0123',
    accreditationScope: ['ISO/IEC 17025'],
    address: 'Av. Paulista, 1000 - São Paulo/SP',
  },
  {
    id: providerIdCounter++,
    name: 'Laboratório Interno',
    contact: 'lab.interno@empresa.com',
    phone: '+55 11 2222-1111',
    accreditationBody: 'Interno',
    accreditationNumber: 'LAB-INT-001',
    accreditationScope: ['ISO 10012'],
    address: 'Planta Industrial - Guarulhos/SP',
  },
]

// Mock de padrões de referência
export const mockReferenceStandards = [
  {
    id: 'STD-001',
    name: 'Fonte Padrão 10V',
    code: 'FP-10V-001',
    lastCalibrationDate: '2024-06-10',
    traceabilityChain: 'INMETRO -> PTB -> NIST',
  },
  {
    id: 'STD-002',
    name: 'Multímetro Fluke 8588A',
    code: 'FLUKE-8588A-002',
    lastCalibrationDate: '2024-05-05',
    traceabilityChain: 'INMETRO -> NIST',
  },
]

// Mock de equipamentos - DADOS SERÃO IMPORTADOS DE XLS OU INSERIDOS MANUALMENTE
export const mockEquipment = [
  {
    id: equipmentIdCounter++,
    internalCode: 'LAB-FT-001',
    manufacturer: 'FontePower',
    model: 'FP-3000',
    serialNumber: 'SN123456',
    assetType: 'fonte_dc',
    classification: 'eletrico',
    location: 'Laboratório Metrologia',
    acquisitionDate: '2022-05-15',
    calibrationDefaultIntervalDays: 365,
    lastCalibrationId: null,
    nextCalibrationDueDate: calculateNextCalibrationDate(new Date().toISOString(), 90),
    status: 'active',
    notes: 'Fonte DC utilizada em bancada principal',
  },
  {
    id: equipmentIdCounter++,
    internalCode: 'LAB-MULT-010',
    manufacturer: 'Agilent',
    model: '34461A',
    serialNumber: 'MY12345678',
    assetType: 'multimetro',
    classification: 'eletronico',
    location: 'Oficina A',
    acquisitionDate: '2021-09-10',
    calibrationDefaultIntervalDays: 365,
    lastCalibrationId: null,
    nextCalibrationDueDate: calculateNextCalibrationDate(new Date().toISOString(), 180),
    status: 'active',
    notes: 'Utilizado para verificações em campo',
  },
  {
    id: equipmentIdCounter++,
    internalCode: 'LAB-OSCI-005',
    manufacturer: 'Tektronix',
    model: 'MSO54',
    serialNumber: 'B0123456',
    assetType: 'osciloscopio',
    classification: 'eletronico',
    location: 'Laboratório Metrologia',
    acquisitionDate: '2020-03-01',
    calibrationDefaultIntervalDays: 730,
    lastCalibrationId: null,
    nextCalibrationDueDate: calculateNextCalibrationDate(new Date().toISOString(), 365),
    status: 'quarantined',
    notes: 'Aguardando reparo no canal 2',
  },
]


// Mock de certificados
export const mockCertificates = [
  {
    id: certificateIdCounter++,
    certificateNumber: formatCertificateNumber('LAB-FT-001', 1),
    calibrationId: null,
    issueDate: '2024-10-15',
    validityFrom: '2024-10-15',
    validityTo: '2025-10-15',
    accreditationDeclaration: 'Laboratório acreditado ISO/IEC 17025 pela CGCRE',
    traceabilityStatement: 'Rastreado ao SI através do INMETRO/CGCRE',
    environmentalConditions: {
      temperature: '23 ± 2 °C',
      humidity: '45 ± 5 %RH',
    },
    performedBy: 'Tecnico A',
    approvedBy: 'Responsável Metrologia',
    status: 'issued',
    referenceStandards: [mockReferenceStandards[0]],
    measurementResults: [
      {
        parameterName: 'Tensão 5 V',
        nominalValue: 5,
        measuredValue: 4.998,
        unit: 'V',
        uncertainty: 0.003,
        tolerance: 0.05,
        passFail: true,
      },
    ],
  },
]

// Mock de eventos de calibração
export const mockCalibrationEvents = [
  {
    id: calibrationIdCounter++,
    equipmentId: 1,
    providerId: 1,
    performedByUserId: 1,
    calibrationDate: '2024-10-15T10:00:00Z',
    calibrationType: 'routine',
    cost: 1500,
    status: 'approved',
    resultsSummary: 'Fonte atendeu aos critérios especificados.',
    certificateId: 1,
    createdAt: '2024-10-10T09:00:00Z',
    updatedAt: '2024-10-16T09:00:00Z',
  },
  {
    id: calibrationIdCounter++,
    equipmentId: 2,
    providerId: 2,
    performedByUserId: 2,
    calibrationDate: '2024-11-05T14:00:00Z',
    calibrationType: 'verification',
    cost: 0,
    status: 'scheduled',
    resultsSummary: '',
    certificateId: null,
    createdAt: '2024-10-25T08:30:00Z',
    updatedAt: '2024-10-25T08:30:00Z',
  },
]

// Mock de parâmetros de medição
export const mockMeasurementParameters = [
  {
    id: measurementParameterIdCounter++,
    calibrationId: 1,
    parameterName: 'Tensão de saída 5V',
    nominalValue: 5,
    measuredValue: 4.998,
    unit: 'V',
    tolerance: 0.05,
    uncertainty: 0.003,
    passFail: true,
    remarks: 'Dentro da tolerância',
  },
  {
    id: measurementParameterIdCounter++,
    calibrationId: 1,
    parameterName: 'Tensão de saída 12V',
    nominalValue: 12,
    measuredValue: 11.992,
    unit: 'V',
    tolerance: 0.05,
    uncertainty: 0.006,
    passFail: true,
    remarks: 'Ok',
  },
]

const updateEquipmentCalibrationInfo = (equipmentId, calibrationDate) => {
  const equipmentIndex = mockEquipment.findIndex((eq) => eq.id === equipmentId)
  if (equipmentIndex === -1) return
  const equipment = mockEquipment[equipmentIndex]
  const interval = equipment.calibrationDefaultIntervalDays || 365
  equipment.lastCalibrationId = calibrationIdCounter - 1
  equipment.nextCalibrationDueDate = calculateNextCalibrationDate(calibrationDate, interval)
  mockEquipment[equipmentIndex] = { ...equipment }
}

const createCertificateRecord = (data = {}) => {
  const newCertificate = {
    id: certificateIdCounter++,
    certificateNumber:
      data.certificateNumber || formatCertificateNumber(data.equipmentCode || 'EQP', certificateIdCounter),
    calibrationId: data.calibrationId || null,
    issueDate: data.issueDate || new Date().toISOString(),
    validityFrom: data.validityFrom || data.issueDate || new Date().toISOString(),
    validityTo:
      data.validityTo ||
      calculateNextCalibrationDate(data.issueDate || new Date().toISOString(), data.validityIntervalDays || 365),
    accreditationDeclaration: data.accreditationDeclaration || '',
    traceabilityStatement: data.traceabilityStatement || '',
    environmentalConditions: data.environmentalConditions || {},
    performedBy: data.performedBy || '',
    approvedBy: data.approvedBy || '',
    status: data.status || 'issued',
    referenceStandards: data.referenceStandards || [],
    measurementResults: data.measurementResults || [],
    digitalSignature: data.digitalSignature || '',
    attachments: data.attachments || [],
  }
  mockCertificates.push(newCertificate)
  return newCertificate
}


// Funções para simular operações CRUD
export const mockDataService = {
  users: {
    getAll: () => Promise.resolve([...mockUsers]),
    getById: (id) => Promise.resolve(mockUsers.find((u) => u.id === id)),
    create: (user) => {
      const newUser = { ...user, id: userIdCounter++, createdAt: new Date().toISOString().split('T')[0] }
      mockUsers.push(newUser)
      return Promise.resolve(newUser)
    },
    update: (id, updates) => {
      const index = mockUsers.findIndex((u) => u.id === id)
      if (index !== -1) {
        mockUsers[index] = { ...mockUsers[index], ...updates }
        return Promise.resolve(mockUsers[index])
      }
      return Promise.reject(new Error('User not found'))
    },
    delete: (id) => {
      const index = mockUsers.findIndex((u) => u.id === id)
      if (index !== -1) {
        mockUsers.splice(index, 1)
        return Promise.resolve(true)
      }
      return Promise.reject(new Error('User not found'))
    },
  },

  tasks: {
    getAll: () => Promise.resolve([...mockTasks]),
    getById: (id) => Promise.resolve(mockTasks.find((t) => t.id === id)),
    create: (task) => {
      const newTask = {
        ...task,
        id: taskIdCounter++,
        createdAt: new Date().toISOString().split('T')[0],
      }
      mockTasks.push(newTask)
      return Promise.resolve(newTask)
    },
    update: (id, updates) => {
      const index = mockTasks.findIndex((t) => t.id === id)
      if (index !== -1) {
        mockTasks[index] = { ...mockTasks[index], ...updates }
        return Promise.resolve(mockTasks[index])
      }
      return Promise.reject(new Error('Task not found'))
    },
    delete: (id) => {
      const index = mockTasks.findIndex((t) => t.id === id)
      if (index !== -1) {
        mockTasks.splice(index, 1)
        return Promise.resolve(true)
      }
      return Promise.reject(new Error('Task not found'))
    },
  },

  events: {
    getAll: () => Promise.resolve([...mockEvents]),
    getById: (id) => Promise.resolve(mockEvents.find((e) => e.id === id)),
    create: (event) => {
      const newEvent = { ...event, id: eventIdCounter++ }
      mockEvents.push(newEvent)
      return Promise.resolve(newEvent)
    },
    update: (id, updates) => {
      const index = mockEvents.findIndex((e) => e.id === id)
      if (index !== -1) {
        mockEvents[index] = { ...mockEvents[index], ...updates }
        return Promise.resolve(mockEvents[index])
      }
      return Promise.reject(new Error('Event not found'))
    },
    delete: (id) => {
      const index = mockEvents.findIndex((e) => e.id === id)
      if (index !== -1) {
        mockEvents.splice(index, 1)
        return Promise.resolve(true)
      }
      return Promise.reject(new Error('Event not found'))
    },
  },

  providers: {
    getAll: () => Promise.resolve([...mockProviders]),
    getById: (id) => Promise.resolve(mockProviders.find((p) => p.id === id)),
    create: (provider) => {
      const newProvider = { ...provider, id: providerIdCounter++ }
      mockProviders.push(newProvider)
      return Promise.resolve(newProvider)
    },
    update: (id, updates) => {
      const index = mockProviders.findIndex((p) => p.id === id)
      if (index !== -1) {
        mockProviders[index] = { ...mockProviders[index], ...updates }
        return Promise.resolve(mockProviders[index])
      }
      return Promise.reject(new Error('Provider not found'))
    },
  },

  equipment: {
    getAll: async () => {
      try {
        // Fetch from backend API (474 imported CMASM equipment)
        const response = await fetch('http://localhost:5000/api/equipment')
        if (!response.ok) {
          throw new Error(`API error: ${response.status}`)
        }
        const equipment = await response.json()
        console.log(`✅ Loaded ${equipment.length} equipment records from database`)
        return equipment
      } catch (error) {
        console.warn('⚠️ Failed to fetch from API, using mock data:', error.message)
        return [...mockEquipment]
      }
    },
    getById: (id) => Promise.resolve(mockEquipment.find((eq) => eq.id === id)),
    create: (equipment) => {
      const newEquipment = {
        ...equipment,
        id: equipmentIdCounter++,
        nextCalibrationDueDate: calculateNextCalibrationDate(
          equipment.nextCalibrationDueDate || new Date().toISOString(),
          equipment.calibrationDefaultIntervalDays || 365,
        ),
      }
      mockEquipment.push(newEquipment)
      return Promise.resolve(newEquipment)
    },
    update: (id, updates) => {
      const index = mockEquipment.findIndex((eq) => eq.id === id)
      if (index !== -1) {
        mockEquipment[index] = { ...mockEquipment[index], ...updates }
        return Promise.resolve(mockEquipment[index])
      }
      return Promise.reject(new Error('Equipment not found'))
    },
    delete: (id) => {
      const index = mockEquipment.findIndex((eq) => eq.id === id)
      if (index !== -1) {
        mockEquipment.splice(index, 1)
        return Promise.resolve(true)
      }
      return Promise.reject(new Error('Equipment not found'))
    },
  },

  calibrations: {
    getAll: async () => {
      try {
        // Fetch from backend API (426 imported CMASM calibrations)
        const response = await fetch('http://localhost:5000/api/calibrations')
        if (!response.ok) {
          throw new Error(`API error: ${response.status}`)
        }
        const calibrations = await response.json()
        console.log(`✅ Loaded ${calibrations.length} calibration records from database`)
        return calibrations
      } catch (error) {
        console.warn('⚠️ Failed to fetch from API, using mock data:', error.message)
        return mockCalibrationEvents.map((cal) => ({
          ...cal,
          measurementParameters: mockMeasurementParameters.filter((param) => param.calibrationId === cal.id),
        }))
      }
    },
    getById: (id) => {
      const calibration = mockCalibrationEvents.find((cal) => cal.id === id)
      if (!calibration) {
        return Promise.resolve(null)
      }
      return Promise.resolve({
        ...calibration,
        measurementParameters: mockMeasurementParameters.filter((param) => param.calibrationId === calibration.id),
      })
    },
    create: (calibration) => {
      const { certificateData, ...calibrationData } = calibration
      const newCalibration = {
        ...calibrationData,
        id: calibrationIdCounter++,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
      }
      mockCalibrationEvents.push(newCalibration)

      if (calibration.measurementParameters && calibration.measurementParameters.length > 0) {
        calibration.measurementParameters.forEach((param) => {
          mockMeasurementParameters.push({
            ...param,
            id: measurementParameterIdCounter++,
            calibrationId: newCalibration.id,
          })
        })
      }

      if (calibration.referenceStandards) {
        newCalibration.referenceStandards = calibration.referenceStandards
      }

      if (newCalibration.status === 'completed' || newCalibration.status === 'approved') {
        updateEquipmentCalibrationInfo(newCalibration.equipmentId, newCalibration.calibrationDate)
      }

      if (certificateData) {
        const certificate = createCertificateRecord({
          ...certificateData,
          calibrationId: newCalibration.id,
          equipmentCode: calibration.equipmentCode,
        })
        newCalibration.certificateId = certificate.id
      }

      return Promise.resolve(newCalibration)
    },
    update: (id, updates) => {
      const index = mockCalibrationEvents.findIndex((cal) => cal.id === id)
      if (index !== -1) {
        const updated = {
          ...mockCalibrationEvents[index],
          ...updates,
          updatedAt: new Date().toISOString(),
        }
        mockCalibrationEvents[index] = updated

        if (updates.measurementParameters) {
          // Remove antigos
          for (let i = mockMeasurementParameters.length - 1; i >= 0; i -= 1) {
            if (mockMeasurementParameters[i].calibrationId === updated.id) {
              mockMeasurementParameters.splice(i, 1)
            }
          }
          updates.measurementParameters.forEach((param) => {
            mockMeasurementParameters.push({
              ...param,
              id: measurementParameterIdCounter++,
              calibrationId: updated.id,
            })
          })
        }

        if (updates.referenceStandards) {
          updated.referenceStandards = updates.referenceStandards
        }

        if (updated.status === 'completed' || updated.status === 'approved') {
          updateEquipmentCalibrationInfo(updated.equipmentId, updated.calibrationDate)
        }

        return Promise.resolve(updated)
      }
      return Promise.reject(new Error('Calibration not found'))
    },
    delete: (id) => {
      const index = mockCalibrationEvents.findIndex((cal) => cal.id === id)
      if (index !== -1) {
        mockCalibrationEvents.splice(index, 1)
        for (let i = mockMeasurementParameters.length - 1; i >= 0; i -= 1) {
          if (mockMeasurementParameters[i].calibrationId === id) {
            mockMeasurementParameters.splice(i, 1)
          }
        }
        for (let i = mockCertificates.length - 1; i >= 0; i -= 1) {
          if (mockCertificates[i].calibrationId === id) {
            mockCertificates.splice(i, 1)
          }
        }
        return Promise.resolve(true)
      }
      return Promise.reject(new Error('Calibration not found'))
    },
  },

  certificates: {
    getAll: () => Promise.resolve([...mockCertificates]),
    getById: (id) => Promise.resolve(mockCertificates.find((cert) => cert.id === id)),
    create: (certificate) => {
      const newCertificate = createCertificateRecord(certificate)
      return Promise.resolve(newCertificate)
    },
    update: (id, updates) => {
      const index = mockCertificates.findIndex((cert) => cert.id === id)
      if (index !== -1) {
        mockCertificates[index] = { ...mockCertificates[index], ...updates }
        return Promise.resolve(mockCertificates[index])
      }
      return Promise.reject(new Error('Certificate not found'))
    },
  },

  measurementParameters: {
    getAll: () => Promise.resolve([...mockMeasurementParameters]),
    getByCalibrationId: (calibrationId) =>
      Promise.resolve(mockMeasurementParameters.filter((param) => param.calibrationId === calibrationId)),
    create: (param) => {
      const newParam = { ...param, id: measurementParameterIdCounter++ }
      mockMeasurementParameters.push(newParam)
      return Promise.resolve(newParam)
    },
    update: (id, updates) => {
      const index = mockMeasurementParameters.findIndex((param) => param.id === id)
      if (index !== -1) {
        mockMeasurementParameters[index] = { ...mockMeasurementParameters[index], ...updates }
        return Promise.resolve(mockMeasurementParameters[index])
      }
      return Promise.reject(new Error('Measurement parameter not found'))
    },
    delete: (id) => {
      const index = mockMeasurementParameters.findIndex((param) => param.id === id)
      if (index !== -1) {
        mockMeasurementParameters.splice(index, 1)
        return Promise.resolve(true)
      }
      return Promise.reject(new Error('Measurement parameter not found'))
    },
  },

  referenceStandards: {
    getAll: () => Promise.resolve([...mockReferenceStandards]),
  },
}

