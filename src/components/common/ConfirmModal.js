import React from 'react'
import {
  CModal,
  CModalHeader,
  CModalTitle,
  CModalBody,
  CModalFooter,
  CButton,
} from '@coreui/react'

const ConfirmModal = ({
  visible,
  onClose,
  onConfirm,
  title = 'Confirmar ação',
  message = 'Tem certeza que deseja realizar esta ação?',
  confirmLabel = 'Confirmar',
  cancelLabel = 'Cancelar',
  confirmColor = 'danger',
  loading = false,
}) => {
  return (
    <CModal visible={visible} onClose={onClose}>
      <CModalHeader>
        <CModalTitle>{title}</CModalTitle>
      </CModalHeader>
      <CModalBody>{message}</CModalBody>
      <CModalFooter>
        <CButton color="secondary" onClick={onClose} disabled={loading}>
          {cancelLabel}
        </CButton>
        <CButton color={confirmColor} onClick={onConfirm} disabled={loading}>
          {loading ? 'Processando...' : confirmLabel}
        </CButton>
      </CModalFooter>
    </CModal>
  )
}

export default ConfirmModal

