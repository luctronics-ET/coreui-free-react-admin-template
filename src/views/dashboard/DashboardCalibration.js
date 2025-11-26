import React, { useEffect, useState } from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CBadge,
  CProgress,
  CButton,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import {
  cilWarning,
  cilCheckCircle,
  cilClock,
  cilSettings,
  cilCalendar,
  cilArrowRight,
} from '@coreui/icons'
import { mockDataService } from '../../services/mockData'
import redisService from '../../services/redis'
import { formatDate, getBadgeColor } from '../../utils/helpers'
import { useNavigate } from 'react-router-dom'

const DashboardCalibration = () => {
  const [equipment, setEquipment] = useState([])
  const [calibrations, setCalibrations] = useState([])
  const [loading, setLoading] = useState(true)
  const navigate = useNavigate()

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      // Tentar carregar do cache primeiro
      const cachedDashboard = await redisService.getDashboardCache()
      
      if (cachedDashboard) {
        console.log('[Dashboard] Dados carregados do cache Redis')
        setEquipment(cachedDashboard.equipment || [])
        setCalibrations(cachedDashboard.calibrations || [])
        setLoading(false)
        return
      }

      // Buscar do serviço
      const [equipmentData, calibrationsData] = await Promise.all([
        mockDataService.equipment.getAll(),
        mockDataService.calibrations.getAll(),
      ])
      
      setEquipment(equipmentData)
      setCalibrations(calibrationsData)
      
      // Cachear os dados
      await redisService.cacheDashboard({
        equipment: equipmentData,
        calibrations: calibrationsData,
      })
      
    } catch (error) {
      console.error('Erro ao carregar dados:', error)
    } finally {
      setLoading(false)
    }
  }

  // Calcular estatísticas
  const stats = React.useMemo(() => {
    const today = new Date()
    const thirtyDaysFromNow = new Date(today.getTime() + 30 * 24 * 60 * 60 * 1000)

    // Equipamentos ativos (status = 'active')
    const activeEquipment = equipment.filter((eq) => eq.status === 'active')

    const overdue = equipment.filter((eq) => {
      const dueDate = eq.nextCalibrationDueDate
      return dueDate && new Date(dueDate) < today
    })

    const upcoming = equipment.filter((eq) => {
      const dueDate = eq.nextCalibrationDueDate
      return dueDate && new Date(dueDate) >= today && new Date(dueDate) <= thirtyDaysFromNow
    })

    const calibrated = equipment.filter((eq) => eq.status === 'calibrated')
    const pending = calibrations.filter((cal) => cal.status === 'pending')
    const approved = calibrations.filter((cal) => cal.status === 'approved')

    return {
      total: equipment.length,
      active: activeEquipment.length,
      overdue: overdue.length,
      upcoming: upcoming.length,
      calibrated: calibrated.length,
      pending: pending.length,
      approved: approved.length,
      overdueItems: overdue.slice(0, 5),
      upcomingItems: upcoming.slice(0, 5),
    }
  }, [equipment, calibrations])

  if (loading) {
    return (
      <CCard>
        <CCardBody className="text-center py-5">
          <div className="spinner-border" role="status">
            <span className="visually-hidden">Carregando...</span>
          </div>
        </CCardBody>
      </CCard>
    )
  }

  return (
    <>
      {/* Cards de Estatísticas */}
      <CRow className="mb-4">
        {/* Primeiro Card: Equipamentos Ativos */}
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-primary">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.active}</div>
                <div>Equipamentos Ativos</div>
              </div>
              <CIcon icon={cilSettings} size="xl" />
            </CCardBody>
            <CCardBody className="p-0 mt-2">
              <CProgress thin color="primary" value={100} />
            </CCardBody>
          </CCard>
        </CCol>
        
        {/* Segundo Card: Atrasadas */}
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-danger">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.overdue}</div>
                <div>Atrasadas</div>
              </div>
              <CIcon icon={cilWarning} size="xl" />
            </CCardBody>
            <CCardBody className="p-0 mt-2">
              <CProgress thin color="danger" value={100} />
            </CCardBody>
          </CCard>
        </CCol>
        
        {/* Terceiro Card: Próximas 30 dias */}
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-warning">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.upcoming}</div>
                <div>Próximas 30 dias</div>
              </div>
              <CIcon icon={cilClock} size="xl" />
            </CCardBody>
            <CCardBody className="p-0 mt-2">
              <CProgress
                thin
                color="warning"
                value={(stats.upcoming / stats.active) * 100}
              />
            </CCardBody>
          </CCard>
        </CCol>
        
        {/* Quarto Card: Calibrados */}
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-success">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.calibrated}</div>
                <div>Calibrados</div>
              </div>
              <CIcon icon={cilCheckCircle} size="xl" />
            </CCardBody>
            <CCardBody className="p-0 mt-2">
              <CProgress
                thin
                color="success"
                value={(stats.calibrated / stats.active) * 100}
              />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      {/* Tabelas de Calibrações */}
      <CRow>
        {/* Calibrações Atrasadas */}
        <CCol lg={6}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div>
                <strong>Calibrações Atrasadas</strong>
                <CBadge color="danger" className="ms-2">
                  {stats.overdue}
                </CBadge>
              </div>
              <CButton
                color="primary"
                variant="outline"
                size="sm"
                onClick={() => navigate('/calibration/equipment')}
              >
                Ver Todos
              </CButton>
            </CCardHeader>
            <CCardBody>
              {stats.overdueItems.length === 0 ? (
                <div className="text-center text-muted py-3">
                  <CIcon icon={cilCheckCircle} size="3xl" className="mb-2" />
                  <div>Nenhuma calibração atrasada!</div>
                </div>
              ) : (
                <CTable hover responsive>
                  <CTableHead>
                    <CTableRow>
                      <CTableHeaderCell>Código</CTableHeaderCell>
                      <CTableHeaderCell>Equipamento</CTableHeaderCell>
                      <CTableHeaderCell>Vencimento</CTableHeaderCell>
                      <CTableHeaderCell>Status</CTableHeaderCell>
                    </CTableRow>
                  </CTableHead>
                  <CTableBody>
                    {stats.overdueItems.map((item) => (
                      <CTableRow key={item.id}>
                        <CTableDataCell>
                          <strong>{item.internalCode}</strong>
                        </CTableDataCell>
                        <CTableDataCell>
                          {item.manufacturer} {item.model}
                        </CTableDataCell>
                        <CTableDataCell>
                          <span className="text-danger">
                            {formatDate(item.nextCalibrationDueDate)}
                          </span>
                        </CTableDataCell>
                        <CTableDataCell>
                          <CBadge color="danger">Atrasada</CBadge>
                        </CTableDataCell>
                      </CTableRow>
                    ))}
                  </CTableBody>
                </CTable>
              )}
            </CCardBody>
          </CCard>
        </CCol>

        {/* Próximas Calibrações */}
        <CCol lg={6}>
          <CCard className="mb-4">
            <CCardHeader className="d-flex justify-content-between align-items-center">
              <div>
                <strong>Próximas Calibrações (30 dias)</strong>
                <CBadge color="warning" className="ms-2">
                  {stats.upcoming}
                </CBadge>
              </div>
              <CButton
                color="primary"
                variant="outline"
                size="sm"
                onClick={() => navigate('/calendar')}
              >
                Ver Calendário
              </CButton>
            </CCardHeader>
            <CCardBody>
              {stats.upcomingItems.length === 0 ? (
                <div className="text-center text-muted py-3">
                  <CIcon icon={cilCalendar} size="3xl" className="mb-2" />
                  <div>Nenhuma calibração próxima</div>
                </div>
              ) : (
                <CTable hover responsive>
                  <CTableHead>
                    <CTableRow>
                      <CTableHeaderCell>Código</CTableHeaderCell>
                      <CTableHeaderCell>Equipamento</CTableHeaderCell>
                      <CTableHeaderCell>Vencimento</CTableHeaderCell>
                      <CTableHeaderCell>Dias</CTableHeaderCell>
                    </CTableRow>
                  </CTableHead>
                  <CTableBody>
                    {stats.upcomingItems.map((item) => {
                      const daysUntilDue = Math.ceil(
                        (new Date(item.nextCalibrationDueDate) - new Date()) /
                          (1000 * 60 * 60 * 24),
                      )
                      return (
                        <CTableRow key={item.id}>
                          <CTableDataCell>
                            <strong>{item.internalCode}</strong>
                          </CTableDataCell>
                          <CTableDataCell>
                            {item.manufacturer} {item.model}
                          </CTableDataCell>
                          <CTableDataCell>
                            {formatDate(item.nextCalibrationDueDate)}
                          </CTableDataCell>
                          <CTableDataCell>
                            <CBadge
                              color={daysUntilDue <= 7 ? 'danger' : 'warning'}
                            >
                              {daysUntilDue} dias
                            </CBadge>
                          </CTableDataCell>
                        </CTableRow>
                      )
                    })}
                  </CTableBody>
                </CTable>
              )}
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      {/* Ações Rápidas */}
      <CRow>
        <CCol>
          <CCard>
            <CCardHeader>
              <strong>Ações Rápidas</strong>
            </CCardHeader>
            <CCardBody>
              <div className="d-flex gap-3 flex-wrap">
                <CButton
                  color="primary"
                  onClick={() => navigate('/calibration/equipment')}
                >
                  <CIcon icon={cilSettings} className="me-2" />
                  Gerenciar Equipamentos
                </CButton>
                <CButton
                  color="success"
                  onClick={() => navigate('/calibration/events')}
                >
                  <CIcon icon={cilCheckCircle} className="me-2" />
                  Nova Calibração
                </CButton>
                <CButton color="info" onClick={() => navigate('/calendar')}>
                  <CIcon icon={cilCalendar} className="me-2" />
                  Ver Calendário
                </CButton>
                <CButton
                  color="warning"
                  onClick={() => navigate('/calibration/certificates')}
                >
                  <CIcon icon={cilArrowRight} className="me-2" />
                  Certificados
                </CButton>
              </div>
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </>
  )
}

export default DashboardCalibration
