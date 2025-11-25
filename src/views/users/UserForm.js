import React from 'react'
import { CFormInput, CFormSelect, CFormLabel, CRow, CCol } from '@coreui/react'
import { SELECT_OPTIONS, LABELS } from '../../utils/constants'

const UserForm = ({ user }) => {
  return (
    <>
      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="name">{LABELS.name} *</CFormLabel>
          <CFormInput
            type="text"
            id="name"
            name="name"
            defaultValue={user?.name || ''}
            required
            placeholder="Digite o nome"
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="email">{LABELS.email} *</CFormLabel>
          <CFormInput
            type="email"
            id="email"
            name="email"
            defaultValue={user?.email || ''}
            required
            placeholder="Digite o e-mail"
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="role">{LABELS.role} *</CFormLabel>
          <CFormSelect id="role" name="role" defaultValue={user?.role || ''} required>
            <option value="">Selecione...</option>
            {SELECT_OPTIONS.userRoles.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="status">{LABELS.status} *</CFormLabel>
          <CFormSelect id="status" name="status" defaultValue={user?.status || 'active'} required>
            {SELECT_OPTIONS.userStatus.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
      </CRow>
    </>
  )
}

export default UserForm

