import React, { useEffect, useState } from 'react'
import { CCard, CCardBody, CRow, CCol, CWidgetStatsD } from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilUser, cilTask, cilCalendar, cilCheckCircle } from '@coreui/icons'
import { mockDataService } from '../../services/mockData'
import { TASK_STATUS } from '../../utils/constants'

const DashboardStats = () => {
  const [stats, setStats] = useState({
    totalUsers: 0,
    activeUsers: 0,
    totalTasks: 0,
    completedTasks: 0,
    pendingTasks: 0,
    totalEvents: 0,
    upcomingEvents: 0,
  })
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadStats()
  }, [])

  const loadStats = async () => {
    try {
      const [users, tasks, events] = await Promise.all([
        mockDataService.users.getAll(),
        mockDataService.tasks.getAll(),
        mockDataService.events.getAll(),
      ])

      const now = new Date()
      const upcomingEvents = events.filter((event) => new Date(event.start) >= now)

      setStats({
        totalUsers: users.length,
        activeUsers: users.filter((u) => u.status === 'active').length,
        totalTasks: tasks.length,
        completedTasks: tasks.filter((t) => t.status === TASK_STATUS.COMPLETED).length,
        pendingTasks: tasks.filter((t) => t.status === TASK_STATUS.PENDING).length,
        totalEvents: events.length,
        upcomingEvents: upcomingEvents.length,
      })
    } catch (error) {
      console.error('Erro ao carregar estatísticas:', error)
    } finally {
      setLoading(false)
    }
  }

  if (loading) {
    return null
  }

  const completionRate = stats.totalTasks > 0 
    ? Math.round((stats.completedTasks / stats.totalTasks) * 100) 
    : 0

  return (
    <CRow>
      <CCol xs={6} sm={6} lg={3}>
        <CWidgetStatsD
          className="mb-4"
          color="primary"
          icon={<CIcon icon={cilUser} height={52} className="my-4 text-white" />}
          values={[
            { title: 'Total', value: stats.totalUsers },
            { title: 'Ativos', value: stats.activeUsers },
          ]}
          title="Usuários"
        />
      </CCol>
      <CCol xs={6} sm={6} lg={3}>
        <CWidgetStatsD
          className="mb-4"
          color="info"
          icon={<CIcon icon={cilTask} height={52} className="my-4 text-white" />}
          values={[
            { title: 'Total', value: stats.totalTasks },
            { title: 'Concluídas', value: stats.completedTasks },
            { title: 'Pendentes', value: stats.pendingTasks },
          ]}
          title="Tarefas"
        />
      </CCol>
      <CCol xs={6} sm={6} lg={3}>
        <CWidgetStatsD
          className="mb-4"
          color="success"
          icon={<CIcon icon={cilCheckCircle} height={52} className="my-4 text-white" />}
          values={[
            { title: 'Taxa de Conclusão', value: `${completionRate}%` },
          ]}
          title="Produtividade"
        />
      </CCol>
      <CCol xs={6} sm={6} lg={3}>
        <CWidgetStatsD
          className="mb-4"
          color="warning"
          icon={<CIcon icon={cilCalendar} height={52} className="my-4 text-white" />}
          values={[
            { title: 'Total', value: stats.totalEvents },
            { title: 'Próximos', value: stats.upcomingEvents },
          ]}
          title="Eventos"
        />
      </CCol>
    </CRow>
  )
}

export default DashboardStats


