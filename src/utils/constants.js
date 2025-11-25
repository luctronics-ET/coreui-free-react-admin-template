// Constantes reutilizáveis da aplicação

// Status de usuários
export const USER_STATUS = {
  ACTIVE: 'active',
  INACTIVE: 'inactive',
  PENDING: 'pending',
}

// Roles de usuários
export const USER_ROLES = {
  ADMIN: 'admin',
  USER: 'user',
  MANAGER: 'manager',
}

// Status de tarefas
export const TASK_STATUS = {
  PENDING: 'pending',
  IN_PROGRESS: 'in_progress',
  COMPLETED: 'completed',
  CANCELLED: 'cancelled',
}

// Prioridades de tarefas
export const TASK_PRIORITY = {
  LOW: 'low',
  MEDIUM: 'medium',
  HIGH: 'high',
  URGENT: 'urgent',
}

// Tipos de eventos do calendário
export const EVENT_TYPES = {
  MEETING: 'meeting',
  PRESENTATION: 'presentation',
  DEADLINE: 'deadline',
  REMINDER: 'reminder',
  OTHER: 'other',
}

// Cores para eventos
export const EVENT_COLORS = {
  meeting: '#0d6efd',
  presentation: '#198754',
  deadline: '#dc3545',
  reminder: '#ffc107',
  other: '#6c757d',
}

// Equipamentos e calibração
export const EQUIPMENT_STATUS = {
  ACTIVE: 'active',
  QUARANTINED: 'quarantined',
  DECOMMISSIONED: 'decommissioned',
}

export const CALIBRATION_STATUS = {
  PENDING: 'pending',
  SCHEDULED: 'scheduled',
  IN_PROGRESS: 'in_progress',
  COMPLETED: 'completed',
  APPROVED: 'approved',
  REJECTED: 'rejected',
}

export const CALIBRATION_TYPES = {
  INITIAL: 'initial',
  ROUTINE: 'routine',
  REPAIR: 'repair',
  VERIFICATION: 'verification',
}

export const CERTIFICATE_STATUS = {
  DRAFT: 'draft',
  ISSUED: 'issued',
  EXPIRED: 'expired',
  CANCELLED: 'cancelled',
}

export const ASSET_TYPES = [
  { value: 'fonte_dc', label: 'Fonte DC' },
  { value: 'multimetro', label: 'Multímetro' },
  { value: 'osciloscopio', label: 'Osciloscópio' },
  { value: 'paquimetro', label: 'Paquímetro' },
  { value: 'termometro', label: 'Termômetro' },
  { value: 'outro', label: 'Outro' },
]

export const EQUIPMENT_CLASSIFICATIONS = [
  { value: 'eletrico', label: 'Elétrico' },
  { value: 'eletronico', label: 'Eletrônico' },
  { value: 'mecanico', label: 'Mecânico' },
  { value: 'dimensional', label: 'Dimensional' },
  { value: 'temperatura', label: 'Temperatura' },
]

// Labels traduzidos
export const LABELS = {
  // Usuários
  users: 'Usuários',
  user: 'Usuário',
  name: 'Nome',
  email: 'E-mail',
  role: 'Função',
  status: 'Status',
  active: 'Ativo',
  inactive: 'Inativo',
  pending: 'Pendente',
  admin: 'Administrador',
  user_role: 'Usuário',
  manager: 'Gerente',
  createdAt: 'Data de Criação',
  actions: 'Ações',
  edit: 'Editar',
  delete: 'Excluir',
  create: 'Criar',
  save: 'Salvar',
  cancel: 'Cancelar',
  search: 'Buscar',
  filter: 'Filtrar',
  clear: 'Limpar',

  // Tarefas
  tasks: 'Tarefas',
  task: 'Tarefa',
  title: 'Título',
  description: 'Descrição',
  priority: 'Prioridade',
  assignee: 'Responsável',
  dueDate: 'Data de Vencimento',
  tags: 'Tags',
  low: 'Baixa',
  medium: 'Média',
  high: 'Alta',
  urgent: 'Urgente',
  completed: 'Concluída',
  notes: 'Observações',

  // Calendário
  calendar: 'Calendário',
  event: 'Evento',
  start: 'Início',
  end: 'Fim',
  type: 'Tipo',
  attendees: 'Participantes',

  // Equipamentos
  equipment: 'Equipamento',
  equipments: 'Equipamentos',
  internalCode: 'Código Interno',
  manufacturer: 'Fabricante',
  model: 'Modelo',
  serialNumber: 'Número de Série',
  assetType: 'Tipo de Ativo',
  classification: 'Classificação',
  location: 'Localização',
  acquisitionDate: 'Data de Aquisição',
  defaultInterval: 'Intervalo Padrão (dias)',
  nextCalibration: 'Próxima Calibração',
  provider: 'Fornecedor/Laboratório',
  providerContact: 'Contato do Fornecedor',
  accreditation: 'Acreditação',
  accreditationBody: 'Órgão Acreditador',
  accreditationNumber: 'Número de Acreditação',
  contractTerms: 'Condições Contratuais',

  // Calibração
  calibration: 'Calibração',
  calibrations: 'Calibrações',
  calibrationDate: 'Data da Calibração',
  calibrationType: 'Tipo de Calibração',
  calibrationStatus: 'Status da Calibração',
  performedBy: 'Executado por',
  approvedBy: 'Aprovado por',
  measurementResults: 'Resultados de Medição',
  resultsSummary: 'Resumo dos Resultados',
  measurementParameter: 'Parâmetro',
  nominalValue: 'Valor Nominal',
  measuredValue: 'Valor Medido',
  unit: 'Unidade',
  tolerance: 'Tolerância',
  uncertainty: 'Incerteza',
  passFail: 'Conformidade',
  referenceStandards: 'Padrões de Referência',
  traceability: 'Rastreabilidade',
  environmentalConditions: 'Condições Ambientais',
  certificate: 'Certificado',
  certificates: 'Certificados',
  certificateNumber: 'Número do Certificado',
  issueDate: 'Data de Emissão',
  validityFrom: 'Validade (início)',
  validityTo: 'Validade (fim)',
  digitalSignature: 'Assinatura Digital',
  statusCertificate: 'Status do Certificado',
}

// Opções para selects
export const SELECT_OPTIONS = {
  userStatus: [
    { value: USER_STATUS.ACTIVE, label: LABELS.active },
    { value: USER_STATUS.INACTIVE, label: LABELS.inactive },
    { value: USER_STATUS.PENDING, label: LABELS.pending },
  ],
  userRoles: [
    { value: USER_ROLES.ADMIN, label: LABELS.admin },
    { value: USER_ROLES.USER, label: LABELS.user_role },
    { value: USER_ROLES.MANAGER, label: LABELS.manager },
  ],
  taskStatus: [
    { value: TASK_STATUS.PENDING, label: LABELS.pending },
    { value: TASK_STATUS.IN_PROGRESS, label: 'Em Progresso' },
    { value: TASK_STATUS.COMPLETED, label: LABELS.completed },
    { value: TASK_STATUS.CANCELLED, label: 'Cancelada' },
  ],
  taskPriority: [
    { value: TASK_PRIORITY.LOW, label: LABELS.low },
    { value: TASK_PRIORITY.MEDIUM, label: LABELS.medium },
    { value: TASK_PRIORITY.HIGH, label: LABELS.high },
    { value: TASK_PRIORITY.URGENT, label: LABELS.urgent },
  ],
  eventTypes: [
    { value: EVENT_TYPES.MEETING, label: 'Reunião' },
    { value: EVENT_TYPES.PRESENTATION, label: 'Apresentação' },
    { value: EVENT_TYPES.DEADLINE, label: 'Prazo' },
    { value: EVENT_TYPES.REMINDER, label: 'Lembrete' },
    { value: EVENT_TYPES.OTHER, label: 'Outro' },
  ],
  equipmentStatus: [
    { value: EQUIPMENT_STATUS.ACTIVE, label: 'Ativo' },
    { value: EQUIPMENT_STATUS.QUARANTINED, label: 'Quarentenado' },
    { value: EQUIPMENT_STATUS.DECOMMISSIONED, label: 'Desativado' },
  ],
  calibrationStatus: [
    { value: CALIBRATION_STATUS.PENDING, label: 'Pendente' },
    { value: CALIBRATION_STATUS.SCHEDULED, label: 'Agendada' },
    { value: CALIBRATION_STATUS.IN_PROGRESS, label: 'Em Progresso' },
    { value: CALIBRATION_STATUS.COMPLETED, label: 'Concluída' },
    { value: CALIBRATION_STATUS.APPROVED, label: 'Aprovada' },
    { value: CALIBRATION_STATUS.REJECTED, label: 'Rejeitada' },
  ],
  calibrationTypes: [
    { value: CALIBRATION_TYPES.INITIAL, label: 'Inicial' },
    { value: CALIBRATION_TYPES.ROUTINE, label: 'Rotina' },
    { value: CALIBRATION_TYPES.REPAIR, label: 'Pós-reparo' },
    { value: CALIBRATION_TYPES.VERIFICATION, label: 'Verificação' },
  ],
  certificateStatus: [
    { value: CERTIFICATE_STATUS.DRAFT, label: 'Rascunho' },
    { value: CERTIFICATE_STATUS.ISSUED, label: 'Emitido' },
    { value: CERTIFICATE_STATUS.EXPIRED, label: 'Expirado' },
    { value: CERTIFICATE_STATUS.CANCELLED, label: 'Cancelado' },
  ],
  assetTypes: ASSET_TYPES,
  equipmentClassifications: EQUIPMENT_CLASSIFICATIONS,
}

