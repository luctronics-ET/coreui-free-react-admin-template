import React, { useState, useEffect } from 'react'
import { CCard, CCardBody, CCardHeader, CCardTitle, CButton, CBadge } from '@coreui/react'
import { ModalForm, ConfirmModal } from '../../components/common'
import EventForm from './EventForm'
import { mockDataService } from '../../services/mockData'
import { LABELS, SELECT_OPTIONS, EVENT_COLORS } from '../../utils/constants'
import { formatDateTime } from '../../utils/helpers'
import CIcon from '@coreui/icons-react'
import { cilPlus, cilPencil, cilTrash } from '@coreui/icons'

const Calendar = () => {
  const [events, setEvents] = useState([])
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [showModal, setShowModal] = useState(false)
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [selectedEvent, setSelectedEvent] = useState(null)
  const [selectedDate, setSelectedDate] = useState(new Date())

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      const [eventsData, usersData] = await Promise.all([
        mockDataService.events.getAll(),
        mockDataService.users.getAll(),
      ])
      setEvents(eventsData)
      setUsers(usersData)
    } catch (error) {
      console.error('Erro ao carregar dados:', error)
    } finally {
      setLoading(false)
    }
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

  // Agrupar eventos por data
  const eventsByDate = events.reduce((acc, event) => {
    const date = new Date(event.start).toDateString()
    if (!acc[date]) {
      acc[date] = []
    }
    acc[date].push(event)
    return acc
  }, {})

  // Ordenar eventos por data
  const sortedDates = Object.keys(eventsByDate).sort((a, b) => new Date(a) - new Date(b))

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
      <CCard>
        <CCardHeader className="d-flex justify-content-between align-items-center">
          <CCardTitle>{LABELS.calendar}</CCardTitle>
          <CButton color="primary" onClick={handleCreate}>
            <CIcon icon={cilPlus} className="me-2" />
            Novo Evento
          </CButton>
        </CCardHeader>
        <CCardBody>
          {sortedDates.length === 0 ? (
            <div className="text-center py-5 text-muted">
              Nenhum evento encontrado
            </div>
          ) : (
            <div className="calendar-events">
              {sortedDates.map((date) => (
                <div key={date} className="mb-4">
                  <h5 className="mb-3">{formatDateTime(date)}</h5>
                  <div className="row g-3">
                    {eventsByDate[date].map((event) => (
                      <div key={event.id} className="col-md-6 col-lg-4">
                        <div
                          className="card h-100"
                          style={{
                            borderLeft: `4px solid ${event.color || EVENT_COLORS.other}`,
                          }}
                        >
                          <div className="card-body">
                            <div className="d-flex justify-content-between align-items-start mb-2">
                              <h6 className="card-title mb-0">{event.title}</h6>
                              <div className="d-flex gap-1">
                                <CButton
                                  color="primary"
                                  variant="outline"
                                  size="sm"
                                  onClick={() => handleEdit(event)}
                                >
                                  <CIcon icon={cilPencil} />
                                </CButton>
                                <CButton
                                  color="danger"
                                  variant="outline"
                                  size="sm"
                                  onClick={() => handleDelete(event)}
                                >
                                  <CIcon icon={cilTrash} />
                                </CButton>
                              </div>
                            </div>
                            {event.description && (
                              <p className="card-text small text-muted mb-2">{event.description}</p>
                            )}
                            <div className="small">
                              <div>
                                <strong>Início:</strong> {formatDateTime(event.start)}
                              </div>
                              <div>
                                <strong>Fim:</strong> {formatDateTime(event.end)}
                              </div>
                              {event.attendees && event.attendees.length > 0 && (
                                <div className="mt-2">
                                  <strong>Participantes:</strong>{' '}
                                  {event.attendees
                                    .map((id) => {
                                      const user = users.find((u) => u.id === id)
                                      return user?.name || `ID: ${id}`
                                    })
                                    .join(', ')}
                                </div>
                              )}
                            </div>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )}
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

