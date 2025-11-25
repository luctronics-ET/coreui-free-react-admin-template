import React, { useEffect, useState } from 'react'
import { CCard, CCardBody, CCardHeader, CCardTitle, CListGroup, CListGroupItem, CRow, CCol } from '@coreui/react'
import { Link } from 'react-router-dom'
import { mockDataService } from '../../services/mockData'
import { formatDateTime, truncate } from '../../utils/helpers'
import { TASK_STATUS } from '../../utils/constants'

const RecentActivity = () => {
  const [recentTasks, setRecentTasks] = useState([])
  const [upcomingEvents, setUpcomingEvents] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadRecentActivity()
  }, [])

  const loadRecentActivity = async () => {
    try {
      const [tasks, events] = await Promise.all([
        mockDataService.tasks.getAll(),
        mockDataService.events.getAll(),
      ])

      // Tarefas recentes (pendentes ou em progresso, ordenadas por data de criação)
      const recent = tasks
        .filter((t) => t.status !== TASK_STATUS.COMPLETED && t.status !== TASK_STATUS.CANCELLED)
        .sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt))
        .slice(0, 5)

      // Próximos eventos (ordenados por data)
      const now = new Date()
      const upcoming = events
        .filter((e) => new Date(e.start) >= now)
        .sort((a, b) => new Date(a.start) - new Date(b.start))
        .slice(0, 5)

      setRecentTasks(recent)
      setUpcomingEvents(upcoming)
    } catch (error) {
      console.error('Erro ao carregar atividades recentes:', error)
    } finally {
      setLoading(false)
    }
  }

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
    <CRow>
      <CCol md={6}>
        <CCard className="mb-4">
          <CCardHeader className="d-flex justify-content-between align-items-center">
            <CCardTitle className="mb-0">Tarefas Recentes</CCardTitle>
            <Link to="/tasks" className="btn btn-sm btn-outline-primary">
              Ver todas
            </Link>
          </CCardHeader>
          <CCardBody>
            {recentTasks.length === 0 ? (
              <p className="text-muted text-center py-3">Nenhuma tarefa recente</p>
            ) : (
              <CListGroup flush>
                {recentTasks.map((task) => (
                  <CListGroupItem key={task.id} className="d-flex justify-content-between align-items-start">
                    <div className="ms-2 me-auto flex-grow-1">
                      <div className="fw-bold">{truncate(task.title, 40)}</div>
                      <small className="text-muted">{truncate(task.description, 50)}</small>
                      <div className="mt-1">
                        <small className="text-muted">
                          Responsável: {task.assigneeName} | Prioridade: {task.priority}
                        </small>
                      </div>
                    </div>
                    <div className="text-end">
                      <small className="text-muted d-block">
                        {task.dueDate ? `Vence: ${formatDateTime(task.dueDate)}` : 'Sem data'}
                      </small>
                    </div>
                  </CListGroupItem>
                ))}
              </CListGroup>
            )}
          </CCardBody>
        </CCard>
      </CCol>
      <CCol md={6}>
        <CCard className="mb-4">
          <CCardHeader className="d-flex justify-content-between align-items-center">
            <CCardTitle className="mb-0">Próximos Eventos</CCardTitle>
            <Link to="/calendar" className="btn btn-sm btn-outline-primary">
              Ver calendário
            </Link>
          </CCardHeader>
          <CCardBody>
            {upcomingEvents.length === 0 ? (
              <p className="text-muted text-center py-3">Nenhum evento próximo</p>
            ) : (
              <CListGroup flush>
                {upcomingEvents.map((event) => (
                  <CListGroupItem
                    key={event.id}
                    className="d-flex justify-content-between align-items-start"
                    style={{ borderLeft: `4px solid ${event.color || '#6c757d'}` }}
                  >
                    <div className="ms-2 me-auto flex-grow-1">
                      <div className="fw-bold">{event.title}</div>
                      {event.description && (
                        <small className="text-muted">{truncate(event.description, 50)}</small>
                      )}
                      <div className="mt-1">
                        <small className="text-muted">
                          {formatDateTime(event.start)} - {formatDateTime(event.end)}
                        </small>
                      </div>
                    </div>
                  </CListGroupItem>
                ))}
              </CListGroup>
            )}
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  )
}

export default RecentActivity

