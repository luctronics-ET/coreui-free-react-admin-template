import React, { useState, useEffect } from 'react'
import { CCard, CCardBody, CCardHeader, CCardTitle } from '@coreui/react'
import { DataTable, ModalForm, ConfirmModal } from '../../components/common'
import TaskForm from './TaskForm'
import { mockDataService } from '../../services/mockData'
import { LABELS, SELECT_OPTIONS, TASK_STATUS } from '../../utils/constants'
import { formatDate } from '../../utils/helpers'

const Tasks = () => {
  const [tasks, setTasks] = useState([])
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [showModal, setShowModal] = useState(false)
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [selectedTask, setSelectedTask] = useState(null)
  const [filters, setFilters] = useState({ status: '', priority: '' })

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      const [tasksData, usersData] = await Promise.all([
        mockDataService.tasks.getAll(),
        mockDataService.users.getAll(),
      ])
      setTasks(tasksData)
      setUsers(usersData)
    } catch (error) {
      console.error('Erro ao carregar dados:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleCreate = () => {
    setSelectedTask(null)
    setShowModal(true)
  }

  const handleEdit = (task) => {
    setSelectedTask(task)
    setShowModal(true)
  }

  const handleDelete = (task) => {
    setSelectedTask(task)
    setShowDeleteModal(true)
  }

  const handleSave = async (taskData) => {
    try {
      if (selectedTask) {
        await mockDataService.tasks.update(selectedTask.id, taskData)
      } else {
        await mockDataService.tasks.create(taskData)
      }
      setShowModal(false)
      setSelectedTask(null)
      loadData()
    } catch (error) {
      console.error('Erro ao salvar tarefa:', error)
      alert('Erro ao salvar tarefa')
    }
  }

  const handleConfirmDelete = async () => {
    try {
      await mockDataService.tasks.delete(selectedTask.id)
      setShowDeleteModal(false)
      setSelectedTask(null)
      loadData()
    } catch (error) {
      console.error('Erro ao excluir tarefa:', error)
      alert('Erro ao excluir tarefa')
    }
  }

  const columns = [
    {
      key: 'id',
      label: 'ID',
      sortable: true,
    },
    {
      key: 'title',
      label: LABELS.title,
      sortable: true,
    },
    {
      key: 'status',
      label: LABELS.status,
      type: 'badge',
      sortable: true,
    },
    {
      key: 'priority',
      label: LABELS.priority,
      type: 'badge',
      badgeType: 'priority',
      sortable: true,
    },
    {
      key: 'assigneeName',
      label: LABELS.assignee,
      sortable: true,
    },
    {
      key: 'dueDate',
      label: LABELS.dueDate,
      type: 'date',
      sortable: true,
    },
  ]

  // Filtrar dados localmente
  const filteredTasks = tasks.filter((task) => {
    if (filters.status && task.status !== filters.status) return false
    if (filters.priority && task.priority !== filters.priority) return false
    return true
  })

  return (
    <>
      <CCard>
        <CCardHeader>
          <CCardTitle>{LABELS.tasks}</CCardTitle>
        </CCardHeader>
        <CCardBody>
          <DataTable
            data={filteredTasks}
            columns={columns}
            loading={loading}
            onCreate={handleCreate}
            onEdit={handleEdit}
            onDelete={handleDelete}
            filterable={true}
            filters={filters}
            onFilterChange={setFilters}
            emptyMessage="Nenhuma tarefa encontrada"
          />
        </CCardBody>
      </CCard>

      <ModalForm
        visible={showModal}
        onClose={() => {
          setShowModal(false)
          setSelectedTask(null)
        }}
        title={selectedTask ? `Editar ${LABELS.task}` : `Criar ${LABELS.task}`}
        onSubmit={(e) => {
          e.preventDefault()
          const formData = new FormData(e.target)
          const taskData = {
            title: formData.get('title'),
            description: formData.get('description'),
            status: formData.get('status'),
            priority: formData.get('priority'),
            assigneeId: parseInt(formData.get('assigneeId')),
            dueDate: formData.get('dueDate'),
            tags: formData.get('tags')?.split(',').map((t) => t.trim()) || [],
          }
          // Buscar nome do responsável
          const assignee = users.find((u) => u.id === taskData.assigneeId)
          taskData.assigneeName = assignee?.name || ''
          handleSave(taskData)
        }}
      >
        <TaskForm task={selectedTask} users={users} />
      </ModalForm>

      <ConfirmModal
        visible={showDeleteModal}
        onClose={() => {
          setShowDeleteModal(false)
          setSelectedTask(null)
        }}
        onConfirm={handleConfirmDelete}
        title={`Excluir ${LABELS.task}`}
        message={`Tem certeza que deseja excluir a tarefa "${selectedTask?.title}"?`}
        confirmColor="danger"
      />
    </>
  )
}

export default Tasks

