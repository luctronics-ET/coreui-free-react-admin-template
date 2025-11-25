import React from 'react'
import { CFormInput, CFormSelect, CFormTextarea, CFormLabel, CRow, CCol, CFormCheck } from '@coreui/react'
import { SELECT_OPTIONS, LABELS, EVENT_COLORS } from '../../utils/constants'
import { formatDate } from '../../utils/helpers'

const EventForm = ({ event, users = [] }) => {
  const formatDateTimeForInput = (dateString) => {
    if (!dateString) return ''
    const date = new Date(dateString)
    const year = date.getFullYear()
    const month = String(date.getMonth() + 1).padStart(2, '0')
    const day = String(date.getDate()).padStart(2, '0')
    const hours = String(date.getHours()).padStart(2, '0')
    const minutes = String(date.getMinutes()).padStart(2, '0')
    return `${year}-${month}-${day}T${hours}:${minutes}`
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
            defaultValue={event?.title || ''}
            required
            placeholder="Digite o título do evento"
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
            defaultValue={event?.description || ''}
            placeholder="Digite a descrição do evento"
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="start">{LABELS.start} *</CFormLabel>
          <CFormInput
            type="datetime-local"
            id="start"
            name="start"
            defaultValue={formatDateTimeForInput(event?.start)}
            required
          />
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="end">{LABELS.end} *</CFormLabel>
          <CFormInput
            type="datetime-local"
            id="end"
            name="end"
            defaultValue={formatDateTimeForInput(event?.end)}
            required
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="type">{LABELS.type} *</CFormLabel>
          <CFormSelect id="type" name="type" defaultValue={event?.type || 'other'} required>
            {SELECT_OPTIONS.eventTypes.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel>{LABELS.attendees}</CFormLabel>
          <div className="border rounded p-3" style={{ maxHeight: '200px', overflowY: 'auto' }}>
            {users.map((user) => (
              <CFormCheck
                key={user.id}
                type="checkbox"
                id={`attendee-${user.id}`}
                name="attendees"
                value={user.id}
                defaultChecked={event?.attendees?.includes(user.id)}
                label={user.name}
              />
            ))}
            {users.length === 0 && (
              <div className="text-muted small">Nenhum usuário disponível</div>
            )}
          </div>
        </CCol>
      </CRow>
    </>
  )
}

export default EventForm

