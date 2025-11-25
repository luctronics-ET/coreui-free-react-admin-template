import React, { useState, useEffect } from 'react'
import { CCard, CCardBody, CCardHeader, CCardTitle } from '@coreui/react'
import { DataTable, ModalForm, ConfirmModal } from '../../components/common'
import UserForm from './UserForm'
import { mockDataService } from '../../services/mockData'
import { LABELS, SELECT_OPTIONS, USER_STATUS } from '../../utils/constants'
import { formatDate } from '../../utils/helpers'

const Users = () => {
  const [users, setUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [showModal, setShowModal] = useState(false)
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [selectedUser, setSelectedUser] = useState(null)
  const [filters, setFilters] = useState({ status: '', role: '' })

  useEffect(() => {
    loadUsers()
  }, [])

  const loadUsers = async () => {
    setLoading(true)
    try {
      const data = await mockDataService.users.getAll()
      setUsers(data)
    } catch (error) {
      console.error('Erro ao carregar usuários:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleCreate = () => {
    setSelectedUser(null)
    setShowModal(true)
  }

  const handleEdit = (user) => {
    setSelectedUser(user)
    setShowModal(true)
  }

  const handleDelete = (user) => {
    setSelectedUser(user)
    setShowDeleteModal(true)
  }

  const handleSave = async (userData) => {
    try {
      if (selectedUser) {
        await mockDataService.users.update(selectedUser.id, userData)
      } else {
        await mockDataService.users.create(userData)
      }
      setShowModal(false)
      setSelectedUser(null)
      loadUsers()
    } catch (error) {
      console.error('Erro ao salvar usuário:', error)
      alert('Erro ao salvar usuário')
    }
  }

  const handleConfirmDelete = async () => {
    try {
      await mockDataService.users.delete(selectedUser.id)
      setShowDeleteModal(false)
      setSelectedUser(null)
      loadUsers()
    } catch (error) {
      console.error('Erro ao excluir usuário:', error)
      alert('Erro ao excluir usuário')
    }
  }

  const columns = [
    {
      key: 'id',
      label: 'ID',
      sortable: true,
    },
    {
      key: 'name',
      label: LABELS.name,
      sortable: true,
    },
    {
      key: 'email',
      label: LABELS.email,
      sortable: true,
    },
    {
      key: 'role',
      label: LABELS.role,
      type: 'badge',
      badgeType: 'role',
      sortable: true,
    },
    {
      key: 'status',
      label: LABELS.status,
      type: 'badge',
      sortable: true,
    },
    {
      key: 'createdAt',
      label: LABELS.createdAt,
      type: 'date',
      sortable: true,
    },
  ]

  // Filtrar dados localmente
  const filteredUsers = users.filter((user) => {
    if (filters.status && user.status !== filters.status) return false
    if (filters.role && user.role !== filters.role) return false
    return true
  })

  return (
    <>
      <CCard>
        <CCardHeader>
          <CCardTitle>{LABELS.users}</CCardTitle>
        </CCardHeader>
        <CCardBody>
          <DataTable
            data={filteredUsers}
            columns={columns}
            loading={loading}
            onCreate={handleCreate}
            onEdit={handleEdit}
            onDelete={handleDelete}
            filterable={true}
            filters={filters}
            onFilterChange={setFilters}
            emptyMessage="Nenhum usuário encontrado"
          />
        </CCardBody>
      </CCard>

      <ModalForm
        visible={showModal}
        onClose={() => {
          setShowModal(false)
          setSelectedUser(null)
        }}
        title={selectedUser ? `Editar ${LABELS.user}` : `Criar ${LABELS.user}`}
        onSubmit={(e) => {
          e.preventDefault()
          const formData = new FormData(e.target)
          const userData = {
            name: formData.get('name'),
            email: formData.get('email'),
            role: formData.get('role'),
            status: formData.get('status'),
          }
          handleSave(userData)
        }}
      >
        <UserForm user={selectedUser} />
      </ModalForm>

      <ConfirmModal
        visible={showDeleteModal}
        onClose={() => {
          setShowDeleteModal(false)
          setSelectedUser(null)
        }}
        onConfirm={handleConfirmDelete}
        title={`Excluir ${LABELS.user}`}
        message={`Tem certeza que deseja excluir o usuário "${selectedUser?.name}"?`}
        confirmColor="danger"
      />
    </>
  )
}

export default Users

