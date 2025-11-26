import React, { useState, useEffect, useMemo } from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCardTitle,
  CButton,
  CBadge,
  CRow,
  CCol,
  CFormSelect,
  CAlert,
} from '@coreui/react'
import { ModalForm, ConfirmModal } from '../../components/common'
import EventForm from './EventForm'
import FullCalendarComponent from '../../components/calendar/FullCalendarComponent'
import { mockDataService } from '../../services/mockData'
import { LABELS, SELECT_OPTIONS, EVENT_COLORS } from '../../utils/constants'
import { formatDateTime, formatDate } from '../../utils/helpers'
import CIcon from '@coreui/icons-react'
import {
  cilPlus,
  cilPencil,
  cilTrash,
  cilCalendar,
  cilWarning,
  cilCheckCircle,
} from '@coreui/icons'
import redisService from '../../services/redis'

const Calendar = () => {
  const [events, setEvents] = useState([])
  const [calibrations, setCalibrations] = useState([])
  const [equipment, setEquipment] = useState([])
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [showModal, setShowModal] = useState(false)
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [selectedEvent, setSelectedEvent] = useState(null)
  const [viewMode, setViewMode] = useState('all') // all, events, calibrations, upcoming

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      const [eventsData, usersData, calibrationsData, equipmentData] = await Promise.all([
        mockDataService.events.getAll(),
        mockDataService.users.getAll(),
        mockDataService.calibrations.getAll(),
        mockDataService.equipment.getAll(),
      ])
      setEvents(eventsData)
      setUsers(usersData)
      setCalibrations(calibrationsData)
      setEquipment(equipmentData)
    } catch (error) {
      console.error('Erro ao carregar dados:', error)
    } finally {
      setLoading(false)
    }
  }

  // Converter calibrações em eventos de calendário
  const calibrationEvents = useMemo(() => {
    return calibrations.map((cal) => {
      const eq = equipment.find((e) => e.id === cal.equipmentId)
      const dueDate = eq?.nextCalibrationDueDate
      const isOverdue = dueDate && new Date(dueDate) < new Date()
      
      return {
        id: `cal-${cal.id}`,
        title: `Calibração: ${eq?.internalCode || 'N/A'}`,
        description: `${eq?.manufacturer || ''} ${eq?.model || ''} - Status: ${cal.status}`,
        start: cal.calibrationDate,
        end: cal.calibrationDate,
        type: 'calibration',
        color: isOverdue ? '#dc3545' : cal.status === 'approved' ? '#28a745' : '#ffc107',
        isCalibration: true,
        calibrationData: cal,
        equipmentData: eq,
      }
    })
  }, [calibrations, equipment])

  // Converter eventos para formato FullCalendar
  const fullCalendarEvents = useMemo(() => {
    let items = []

    if (viewMode === 'all' || viewMode === 'events') {
      items = [
        ...items,
        ...events.map((event) => ({
          id: event.id,
          title: event.title,
          start: event.start,
          end: event.end,
          backgroundColor: event.color || EVENT_COLORS.other,
          borderColor: event.color || EVENT_COLORS.other,
          extendedProps: {
            description: event.description,
            type: event.type,
            attendees: event.attendees,
            isCalibration: false,
          },
          className: 'fc-event-primary',
        })),
      ]
    }

    if (viewMode === 'all' || viewMode === 'calibrations') {
      items = [
        ...items,
        ...calibrationEvents.map((event) => ({
          id: event.id,
          title: event.title,
          start: event.start,
          end: event.end,
          backgroundColor: event.color,
          borderColor: event.color,
          extendedProps: {
            description: event.description,
            calibrationData: event.calibrationData,
            equipmentData: event.equipmentData,
            isCalibration: true,
          },
          className:
            event.color === '#dc3545'
              ? 'fc-event-danger'
              : event.color === '#28a745'
                ? 'fc-event-success'
                : 'fc-event-warning',
        })),
      ]
    }

    if (viewMode === 'upcoming') {
      const today = new Date()
      const thirtyDaysFromNow = new Date(today.getTime() + 30 * 24 * 60 * 60 * 1000)
      const allItems = [...events, ...calibrationEvents]
      items = allItems
        .filter((item) => {
          const itemDate = new Date(item.start)
          return itemDate >= today && itemDate <= thirtyDaysFromNow
        })
        .map((event) => ({
          id: event.id,
          title: event.title,
          start: event.start,
          end: event.end,
          backgroundColor: event.color || EVENT_COLORS.other,
          borderColor: event.color || EVENT_COLORS.other,
          extendedProps: event.isCalibration
            ? {
                description: event.description,
                calibrationData: event.calibrationData,
                equipmentData: event.equipmentData,
                isCalibration: true,
              }
            : {
                description: event.description,
                type: event.type,
                attendees: event.attendees,
                isCalibration: false,
              },
          className: event.isCalibration
            ? event.color === '#dc3545'
              ? 'fc-event-danger'
              : event.color === '#28a745'
                ? 'fc-event-success'
                : 'fc-event-warning'
            : 'fc-event-primary',
        }))
    }

    return items
  }, [events, calibrationEvents, viewMode])

  const handleEventClick = (eventInfo) => {
    if (eventInfo.extendedProps.isCalibration) {
      // Eventos de calibração não são editáveis via calendário
      alert(
        `Calibração: ${eventInfo.title}\n${eventInfo.extendedProps.description}\n\nPara editar, acesse a página de Calibrações.`,
      )
    } else {
      // Encontrar o evento original
      const originalEvent = events.find((e) => e.id === eventInfo.id)
      if (originalEvent) {
        handleEdit(originalEvent)
      }
    }
  }

  const handleDateClick = (date) => {
    // Criar novo evento na data clicada
    setSelectedEvent({
      start: date.toISOString(),
      end: new Date(date.getTime() + 60 * 60 * 1000).toISOString(), // 1 hora depois
    })
    setShowModal(true)
  }

  const handleCreate = () => {
    setSelectedEvent(null)
    setShowModal(true)
  }

  const handleEdit = (event) => {
    setSelectedEvent(event)
    setShowModal(true)
  }

  const handleDelete = (event) => {
    setSelectedEvent(event)
    setShowDeleteModal(true)
  }

  const handleSave = async (eventData) => {
    try {
      if (selectedEvent) {
        await mockDataService.events.update(selectedEvent.id, eventData)
      } else {
        await mockDataService.events.create(eventData)
      }
      setShowModal(false)
      setSelectedEvent(null)
      loadData()
    } catch (error) {
      console.error('Erro ao salvar evento:', error)
      alert('Erro ao salvar evento')
    }
  }

  const handleConfirmDelete = async () => {
    try {
      await mockDataService.events.delete(selectedEvent.id)
      setShowDeleteModal(false)
      setSelectedEvent(null)
      loadData()
    } catch (error) {
      console.error('Erro ao excluir evento:', error)
      alert('Erro ao excluir evento')
    }
  }

  // Estatísticas
  const stats = useMemo(() => {
    const today = new Date()
    const upcoming = calibrationEvents.filter((e) => {
      const date = new Date(e.start)
      return date >= today && date <= new Date(today.getTime() + 30 * 24 * 60 * 60 * 1000)
    })
    const overdue = calibrationEvents.filter((e) => {
      const eq = e.equipmentData
      const dueDate = eq?.nextCalibrationDueDate
      return dueDate && new Date(dueDate) < today
    })
    
    return {
      totalEvents: events.length,
      totalCalibrations: calibrations.length,
      upcomingCalibrations: upcoming.length,
      overdueCalibrations: overdue.length,
    }
  }, [events, calibrations, calibrationEvents])

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
      {/* Estatísticas do Calendário */}
      <CRow className="mb-4">
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-primary">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.totalEvents}</div>
                <div>Eventos</div>
              </div>
              <CIcon icon={cilCalendar} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-info">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.totalCalibrations}</div>
                <div>Calibrações</div>
              </div>
              <CIcon icon={cilCheckCircle} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-warning">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.upcomingCalibrations}</div>
                <div>Próximas 30 dias</div>
              </div>
              <CIcon icon={cilCalendar} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-danger">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.overdueCalibrations}</div>
                <div>Atrasadas</div>
              </div>
              <CIcon icon={cilWarning} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      <CCard>
        <CCardHeader className="d-flex justify-content-between align-items-center">
          <CCardTitle>Calendário de Calibrações e Eventos</CCardTitle>
          <div className="d-flex gap-2">
            <CFormSelect
              value={viewMode}
              onChange={(e) => setViewMode(e.target.value)}
              style={{ width: '200px' }}
            >
              <option value="all">Todos</option>
              <option value="events">Apenas Eventos</option>
              <option value="calibrations">Apenas Calibrações</option>
              <option value="upcoming">Próximos 30 dias</option>
            </CFormSelect>
            <CButton color="primary" onClick={handleCreate}>
              <CIcon icon={cilPlus} className="me-2" />
              Novo Evento
            </CButton>
          </div>
        </CCardHeader>
        <CCardBody>
          <FullCalendarComponent
            events={fullCalendarEvents}
            onEventClick={handleEventClick}
            onDateClick={handleDateClick}
          />
        </CCardBody>
      </CCard>

      <ModalForm
        visible={showModal}
        onClose={() => {
          setShowModal(false)
          setSelectedEvent(null)
        }}
        title={selectedEvent ? `Editar ${LABELS.event}` : `Criar ${LABELS.event}`}
        onSubmit={(e) => {
          e.preventDefault()
          const formData = new FormData(e.target)
          const eventData = {
            title: formData.get('title'),
            description: formData.get('description'),
            start: new Date(formData.get('start')).toISOString(),
            end: new Date(formData.get('end')).toISOString(),
            type: formData.get('type'),
            color: EVENT_COLORS[formData.get('type')] || EVENT_COLORS.other,
            attendees: formData.getAll('attendees').map((id) => parseInt(id)),
          }
          handleSave(eventData)
        }}
      >
        <EventForm event={selectedEvent} users={users} />
      </ModalForm>

      <ConfirmModal
        visible={showDeleteModal}
        onClose={() => {
          setShowDeleteModal(false)
          setSelectedEvent(null)
        }}
        onConfirm={handleConfirmDelete}
        title={`Excluir ${LABELS.event}`}
        message={`Tem certeza que deseja excluir o evento "${selectedEvent?.title}"?`}
        confirmColor="danger"
      />
    </>
  )
}

export default Calendar

