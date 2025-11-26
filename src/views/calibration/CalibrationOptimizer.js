import React, { useState, useEffect, useMemo } from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CRow,
  CCol,
  CButton,
  CTable,
  CTableHead,
  CTableRow,
  CTableHeaderCell,
  CTableBody,
  CTableDataCell,
  CBadge,
  CAlert,
  CSpinner,
  CProgress,
  CProgressBar,
  CNav,
  CNavItem,
  CNavLink,
  CTabContent,
  CTabPane,
  CCollapse,
  CListGroup,
  CListGroupItem,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import {
  cilCheckCircle,
  cilWarning,
  cilXCircle,
  cilCalendar,
  cilMoney,
  cilChart,
  cilCloudDownload,
  cilReload,
} from '@coreui/icons'
import { PageHeader } from '../../components/common'
import { mockDataService } from '../../services/mockData'
import { CalibrationOptimizerAgent } from '../../services/calibrationOptimizer'
import { formatDate, exportToCSV } from '../../utils/helpers'

const CalibrationOptimizer = () => {
  const [loading, setLoading] = useState(false)
  const [equipment, setEquipment] = useState([])
  const [providers, setProviders] = useState([])
  const [optimizationResult, setOptimizationResult] = useState(null)
  const [activeTab, setActiveTab] = useState('schedule')
  const [expandedGroups, setExpandedGroups] = useState(new Set())

  const agent = useMemo(() => new CalibrationOptimizerAgent(), [])

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      const [equipmentData, providersData] = await Promise.all([
        mockDataService.equipment.getAll(),
        mockDataService.providers.getAll(),
      ])
      setEquipment(equipmentData)
      setProviders(providersData)
    } catch (err) {
      console.error('Erro ao carregar dados:', err)
    } finally {
      setLoading(false)
    }
  }

  const runOptimization = () => {
    setLoading(true)
    try {
      const result = agent.optimizeSchedule(equipment, providers, {
        planningHorizonDays: 365,
        minCoveragePercent: 80,
        maxConcurrentCalibrations: 3,
        bufferDays: 30,
      })
      setOptimizationResult(result)
    } catch (err) {
      console.error('Erro na otimização:', err)
    } finally {
      setLoading(false)
    }
  }

  const handleExportCSV = () => {
    if (!optimizationResult) return
    const csv = agent.exportSchedule('csv')
    const blob = new Blob([csv], { type: 'text/csv' })
    const url = URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.href = url
    link.download = `cronograma_otimizado_${new Date().toISOString().split('T')[0]}.csv`
    link.click()
  }

  const handleExportJSON = () => {
    if (!optimizationResult) return
    const json = agent.exportSchedule('json')
    const blob = new Blob([json], { type: 'application/json' })
    const url = URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.href = url
    link.download = `cronograma_otimizado_${new Date().toISOString().split('T')[0]}.json`
    link.click()
  }

  const toggleGroupExpanded = (groupKey) => {
    const newExpanded = new Set(expandedGroups)
    if (newExpanded.has(groupKey)) {
      newExpanded.delete(groupKey)
    } else {
      newExpanded.add(groupKey)
    }
    setExpandedGroups(newExpanded)
  }

  const getPriorityColor = (priority) => {
    const colors = {
      CRÍTICA: 'danger',
      URGENTE: 'warning',
      ALTA: 'warning',
      MÉDIA: 'info',
      NORMAL: 'success',
    }
    return colors[priority] || 'secondary'
  }

  const getRedundancyColor = (level) => {
    const colors = {
      Alta: 'success',
      Média: 'warning',
      Nenhuma: 'danger',
    }
    return colors[level] || 'secondary'
  }

  // Agrupar cronograma por grupo de equipamentos
  const groupedSchedule = useMemo(() => {
    if (!optimizationResult?.schedule) return new Map()

    const grouped = new Map()
    optimizationResult.schedule.forEach((item) => {
      const key = item.groupKey || 'outros'
      if (!grouped.has(key)) {
        grouped.set(key, [])
      }
      grouped.get(key).push(item)
    })

    return grouped
  }, [optimizationResult])

  return (
    <>
      <PageHeader
        title="Otimizador Inteligente de Calibrações"
        description="Agente de IA para maximizar tempo calibrado e minimizar custos através de agendamento estratégico"
        showAction={false}
      />

      {/* Controles */}
      <CCard className="mb-4">
        <CCardBody>
          <CRow className="align-items-center">
            <CCol md={6}>
              <h5 className="mb-0">
                <CIcon icon={cilChart} className="me-2" />
                Análise Preditiva de Calibrações
              </h5>
              <small className="text-medium-emphasis">
                {equipment.length} equipamentos · {providers.length} fornecedores
              </small>
            </CCol>
            <CCol md={6} className="text-end">
              <CButton
                color="primary"
                onClick={runOptimization}
                disabled={loading || equipment.length === 0}
                className="me-2"
              >
                {loading ? (
                  <>
                    <CSpinner size="sm" className="me-2" />
                    Otimizando...
                  </>
                ) : (
                  <>
                    <CIcon icon={cilReload} className="me-2" />
                    Executar Otimização
                  </>
                )}
              </CButton>
              {optimizationResult && (
                <>
                  <CButton
                    color="secondary"
                    variant="outline"
                    onClick={handleExportCSV}
                    className="me-2"
                  >
                    <CIcon icon={cilCloudDownload} className="me-2" />
                    CSV
                  </CButton>
                  <CButton color="secondary" variant="outline" onClick={handleExportJSON}>
                    <CIcon icon={cilCloudDownload} className="me-2" />
                    JSON
                  </CButton>
                </>
              )}
            </CCol>
          </CRow>
        </CCardBody>
      </CCard>

      {/* Métricas */}
      {optimizationResult?.metrics && (
        <CRow className="mb-4">
          <CCol md={3}>
            <CCard className="text-center">
              <CCardBody>
                <div className="text-medium-emphasis small">Cobertura Atual</div>
                <div className="fs-4 fw-semibold">
                  {optimizationResult.metrics.coveragePercent}%
                </div>
                <CProgress className="mt-2" height={8}>
                  <CProgressBar
                    value={optimizationResult.metrics.coveragePercent}
                    color={
                      optimizationResult.metrics.coveragePercent >= 80
                        ? 'success'
                        : optimizationResult.metrics.coveragePercent >= 60
                          ? 'warning'
                          : 'danger'
                    }
                  />
                </CProgress>
                <small className="text-medium-emphasis">
                  {optimizationResult.metrics.currentlyValid} de{' '}
                  {optimizationResult.metrics.totalEquipment} equipamentos
                </small>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol md={3}>
            <CCard className="text-center">
              <CCardBody>
                <div className="text-medium-emphasis small">Redundância</div>
                <div className="fs-4 fw-semibold">
                  {optimizationResult.metrics.redundancyPercent}%
                </div>
                <CProgress className="mt-2" height={8}>
                  <CProgressBar
                    value={optimizationResult.metrics.redundancyPercent}
                    color="info"
                  />
                </CProgress>
                <small className="text-medium-emphasis">
                  {optimizationResult.metrics.groupsWithRedundancy} de{' '}
                  {optimizationResult.metrics.totalGroups} grupos
                </small>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol md={3}>
            <CCard className="text-center">
              <CCardBody>
                <div className="text-medium-emphasis small">Custo Total Estimado</div>
                <div className="fs-4 fw-semibold text-primary">
                  R$ {parseFloat(optimizationResult.metrics.totalEstimatedCost).toLocaleString()}
                </div>
                <small className="text-medium-emphasis">
                  {optimizationResult.metrics.scheduledCalibrations} calibrações
                </small>
              </CCardBody>
            </CCard>
          </CCol>
          <CCol md={3}>
            <CCard className="text-center">
              <CCardBody>
                <div className="text-medium-emphasis small">Economia Estimada</div>
                <div className="fs-4 fw-semibold text-success">
                  R$ {parseFloat(optimizationResult.metrics.estimatedSavings).toLocaleString()}
                </div>
                <small className="text-medium-emphasis">Desconto por volume</small>
              </CCardBody>
            </CCard>
          </CCol>
        </CRow>
      )}

      {/* Alertas */}
      {optimizationResult?.metrics && (
        <CRow className="mb-4">
          {optimizationResult.metrics.overdue > 0 && (
            <CCol md={6}>
              <CAlert color="danger">
                <CIcon icon={cilXCircle} className="me-2" />
                <strong>{optimizationResult.metrics.overdue} equipamentos</strong> com calibração
                vencida
              </CAlert>
            </CCol>
          )}
          {optimizationResult.metrics.coveragePercent < 80 && (
            <CCol md={6}>
              <CAlert color="warning">
                <CIcon icon={cilWarning} className="me-2" />
                Cobertura abaixo do ideal (meta: 80%)
              </CAlert>
            </CCol>
          )}
        </CRow>
      )}

      {/* Conteúdo Principal */}
      {optimizationResult && (
        <CCard>
          <CCardHeader>
            <CNav variant="tabs" role="tablist">
              <CNavItem>
                <CNavLink
                  active={activeTab === 'schedule'}
                  onClick={() => setActiveTab('schedule')}
                  style={{ cursor: 'pointer' }}
                >
                  <CIcon icon={cilCalendar} className="me-2" />
                  Cronograma Otimizado
                </CNavLink>
              </CNavItem>
              <CNavItem>
                <CNavLink
                  active={activeTab === 'recommendations'}
                  onClick={() => setActiveTab('recommendations')}
                  style={{ cursor: 'pointer' }}
                >
                  <CIcon icon={cilCheckCircle} className="me-2" />
                  Recomendações
                </CNavLink>
              </CNavItem>
              <CNavItem>
                <CNavLink
                  active={activeTab === 'analysis'}
                  onClick={() => setActiveTab('analysis')}
                  style={{ cursor: 'pointer' }}
                >
                  <CIcon icon={cilChart} className="me-2" />
                  Análise de Grupos
                </CNavLink>
              </CNavItem>
            </CNav>
          </CCardHeader>
          <CCardBody>
            <CTabContent>
              {/* Aba: Cronograma */}
              <CTabPane visible={activeTab === 'schedule'}>
                {Array.from(groupedSchedule.entries()).map(([groupKey, items]) => (
                  <div key={groupKey} className="mb-3">
                    <div
                      className="d-flex justify-content-between align-items-center p-3 bg-light rounded cursor-pointer"
                      onClick={() => toggleGroupExpanded(groupKey)}
                      style={{ cursor: 'pointer' }}
                    >
                      <div>
                        <strong>{groupKey.replace(/_/g, ' ').toUpperCase()}</strong>
                        <span className="ms-2">
                          <CBadge color={getRedundancyColor(items[0]?.groupInfo?.redundancyLevel)}>
                            {items[0]?.groupInfo?.redundancyLevel || 'N/A'}
                          </CBadge>
                        </span>
                        <span className="ms-2 text-medium-emphasis">
                          {items.length} equipamento(s)
                        </span>
                      </div>
                      <div>
                        <small className="text-medium-emphasis me-3">
                          Custo: R${' '}
                          {items
                            .reduce((sum, item) => sum + item.estimatedCost, 0)
                            .toLocaleString()}
                        </small>
                        {expandedGroups.has(groupKey) ? '▼' : '▶'}
                      </div>
                    </div>

                    <CCollapse visible={expandedGroups.has(groupKey)}>
                      <CTable hover responsive className="mt-2">
                        <CTableHead>
                          <CTableRow>
                            <CTableHeaderCell>Equipamento</CTableHeaderCell>
                            <CTableHeaderCell>Vencimento Atual</CTableHeaderCell>
                            <CTableHeaderCell>Data Recomendada</CTableHeaderCell>
                            <CTableHeaderCell>Prioridade</CTableHeaderCell>
                            <CTableHeaderCell>Custo</CTableHeaderCell>
                            <CTableHeaderCell>Razão</CTableHeaderCell>
                          </CTableRow>
                        </CTableHead>
                        <CTableBody>
                          {items.map((item, idx) => (
                            <CTableRow key={idx}>
                              <CTableDataCell>
                                <strong>{item.equipmentCode}</strong>
                                {item.groupInfo.pairedWith && (
                                  <div className="small text-medium-emphasis">
                                    Par: {item.groupInfo.pairedWith}
                                  </div>
                                )}
                              </CTableDataCell>
                              <CTableDataCell>{formatDate(item.currentDueDate)}</CTableDataCell>
                              <CTableDataCell>
                                <strong>{formatDate(item.recommendedDate)}</strong>
                              </CTableDataCell>
                              <CTableDataCell>
                                <CBadge color={getPriorityColor(item.priority)}>
                                  {item.priority}
                                </CBadge>
                              </CTableDataCell>
                              <CTableDataCell>
                                R$ {item.estimatedCost.toLocaleString()}
                                {item.volumeDiscount && (
                                  <div className="small text-success">-10% volume</div>
                                )}
                              </CTableDataCell>
                              <CTableDataCell>
                                <small>{item.reason}</small>
                              </CTableDataCell>
                            </CTableRow>
                          ))}
                        </CTableBody>
                      </CTable>
                    </CCollapse>
                  </div>
                ))}
              </CTabPane>

              {/* Aba: Recomendações */}
              <CTabPane visible={activeTab === 'recommendations'}>
                {optimizationResult.recommendations.length === 0 ? (
                  <CAlert color="success">
                    <CIcon icon={cilCheckCircle} className="me-2" />
                    Nenhuma recomendação crítica. O cronograma está otimizado!
                  </CAlert>
                ) : (
                  <CListGroup>
                    {optimizationResult.recommendations.map((rec, idx) => (
                      <CListGroupItem key={idx}>
                        <div className="d-flex justify-content-between align-items-start">
                          <div className="flex-grow-1">
                            <div className="d-flex align-items-center mb-2">
                              <CBadge color={getPriorityColor(rec.priority)} className="me-2">
                                {rec.priority}
                              </CBadge>
                              <CBadge color="info" className="me-2">
                                {rec.type}
                              </CBadge>
                              <strong>{rec.title}</strong>
                            </div>
                            <p className="mb-2">{rec.description}</p>
                            <div className="mb-2">
                              <strong>Ação recomendada:</strong> {rec.action}
                            </div>
                            <div className="text-success">
                              <strong>Impacto:</strong> {rec.impact}
                            </div>
                          </div>
                        </div>
                      </CListGroupItem>
                    ))}
                  </CListGroup>
                )}
              </CTabPane>

              {/* Aba: Análise de Grupos */}
              <CTabPane visible={activeTab === 'analysis'}>
                <CTable hover responsive>
                  <CTableHead>
                    <CTableRow>
                      <CTableHeaderCell>Tipo de Equipamento</CTableHeaderCell>
                      <CTableHeaderCell>Classificação</CTableHeaderCell>
                      <CTableHeaderCell>Quantidade</CTableHeaderCell>
                      <CTableHeaderCell>Nível de Redundância</CTableHeaderCell>
                      <CTableHeaderCell>Status</CTableHeaderCell>
                    </CTableRow>
                  </CTableHead>
                  <CTableBody>
                    {Array.from(agent.equipmentGroups.entries()).map(([key, group]) => (
                      <CTableRow key={key}>
                        <CTableDataCell>{group.type}</CTableDataCell>
                        <CTableDataCell>{group.classification}</CTableDataCell>
                        <CTableDataCell>
                          <strong>{group.items.length}</strong> unidade(s)
                        </CTableDataCell>
                        <CTableDataCell>
                          <CBadge
                            color={getRedundancyColor(
                              agent.getRedundancyLevel(group.items.length),
                            )}
                          >
                            {agent.getRedundancyLevel(group.items.length)}
                          </CBadge>
                        </CTableDataCell>
                        <CTableDataCell>
                          {group.items.length > 1 ? (
                            <span className="text-success">
                              <CIcon icon={cilCheckCircle} className="me-1" />
                              Calibração escalonada possível
                            </span>
                          ) : (
                            <span className="text-warning">
                              <CIcon icon={cilWarning} className="me-1" />
                              Equipamento crítico
                            </span>
                          )}
                        </CTableDataCell>
                      </CTableRow>
                    ))}
                  </CTableBody>
                </CTable>
              </CTabPane>
            </CTabContent>
          </CCardBody>
        </CCard>
      )}

      {/* Placeholder quando não há resultado */}
      {!optimizationResult && !loading && (
        <CCard>
          <CCardBody className="text-center py-5">
            <CIcon icon={cilChart} size="3xl" className="text-medium-emphasis mb-3" />
            <h4>Otimizador de Calibrações</h4>
            <p className="text-medium-emphasis">
              Clique em "Executar Otimização" para analisar seus equipamentos e gerar um
              cronograma inteligente.
            </p>
            <div className="mt-4">
              <h6>O agente irá:</h6>
              <ul className="list-unstyled mt-3">
                <li className="mb-2">
                  <CIcon icon={cilCheckCircle} className="text-success me-2" />
                  Identificar equipamentos redundantes
                </li>
                <li className="mb-2">
                  <CIcon icon={cilCheckCircle} className="text-success me-2" />
                  Escalonar calibrações para maximizar disponibilidade
                </li>
                <li className="mb-2">
                  <CIcon icon={cilCheckCircle} className="text-success me-2" />
                  Reduzir custos através de agendamento estratégico
                </li>
                <li className="mb-2">
                  <CIcon icon={cilCheckCircle} className="text-success me-2" />
                  Gerar recomendações para melhoria contínua
                </li>
              </ul>
            </div>
          </CCardBody>
        </CCard>
      )}
    </>
  )
}

export default CalibrationOptimizer
