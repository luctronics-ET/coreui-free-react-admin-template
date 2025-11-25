import React from 'react'
import { CCard, CCardBody, CRow, CCol } from '@coreui/react'
import { CButton } from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilPlus } from '@coreui/icons'

const PageHeader = ({ title, description, actionLabel, onAction, showAction = false }) => {
  return (
    <CCard className="mb-4">
      <CCardBody>
        <CRow className="align-items-center">
          <CCol>
            <h4 className="mb-1">{title}</h4>
            {description && <p className="text-muted mb-0">{description}</p>}
          </CCol>
          {showAction && onAction && (
            <CCol xs="auto">
              <CButton color="primary" onClick={onAction}>
                <CIcon icon={cilPlus} className="me-2" />
                {actionLabel || 'Novo'}
              </CButton>
            </CCol>
          )}
        </CRow>
      </CCardBody>
    </CCard>
  )
}

export default PageHeader


