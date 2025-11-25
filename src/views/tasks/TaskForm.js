import React from 'react'
import { CFormInput, CFormSelect, CFormTextarea, CFormLabel, CRow, CCol } from '@coreui/react'
import { SELECT_OPTIONS, LABELS } from '../../utils/constants'
import { formatDate } from '../../utils/helpers'

const TaskForm = ({ task, users = [] }) => {
  const formatDateForInput = (dateString) => {
    if (!dateString) return ''
    return formatDate(dateString, 'yyyy-mm-dd')
  }

  return (
    <>
      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="title">{LABELS.title} *</CFormLabel>
          <CFormInput
            type="text"
            id="title"
            name="title"
            defaultValue={task?.title || ''}
            required
            placeholder="Digite o título da tarefa"
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="description">{LABELS.description}</CFormLabel>
          <CFormTextarea
            id="description"
            name="description"
            rows="3"
            defaultValue={task?.description || ''}
            placeholder="Digite a descrição da tarefa"
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="status">{LABELS.status} *</CFormLabel>
          <CFormSelect id="status" name="status" defaultValue={task?.status || 'pending'} required>
            {SELECT_OPTIONS.taskStatus.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="priority">{LABELS.priority} *</CFormLabel>
          <CFormSelect id="priority" name="priority" defaultValue={task?.priority || 'medium'} required>
            {SELECT_OPTIONS.taskPriority.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="assigneeId">{LABELS.assignee} *</CFormLabel>
          <CFormSelect id="assigneeId" name="assigneeId" defaultValue={task?.assigneeId || ''} required>
            <option value="">Selecione...</option>
            {users.map((user) => (
              <option key={user.id} value={user.id}>
                {user.name}
              </option>
            ))}
          </CFormSelect>
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="dueDate">{LABELS.dueDate}</CFormLabel>
          <CFormInput
            type="date"
            id="dueDate"
            name="dueDate"
            defaultValue={formatDateForInput(task?.dueDate)}
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="tags">{LABELS.tags}</CFormLabel>
          <CFormInput
            type="text"
            id="tags"
            name="tags"
            defaultValue={task?.tags?.join(', ') || ''}
            placeholder="Digite as tags separadas por vírgula"
          />
        </CCol>
      </CRow>
    </>
  )
}

export default TaskForm

