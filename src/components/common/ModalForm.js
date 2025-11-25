import React from 'react'
import {
  CModal,
  CModalHeader,
  CModalTitle,
  CModalBody,
  CModalFooter,
  CButton,
  CForm,
} from '@coreui/react'

const ModalForm = ({
  visible,
  onClose,
  title,
  children,
  onSubmit,
  submitLabel = 'Salvar',
  cancelLabel = 'Cancelar',
  size = 'lg',
  loading = false,
  submitColor = 'primary',
}) => {
  const handleSubmit = (e) => {
    e.preventDefault()
    if (onSubmit) {
      onSubmit(e)
    }
  }

  return (
    <CModal visible={visible} onClose={onClose} size={size}>
      <CForm onSubmit={handleSubmit}>
        <CModalHeader>
          <CModalTitle>{title}</CModalTitle>
        </CModalHeader>
        <CModalBody>{children}</CModalBody>
        <CModalFooter>
          <CButton color="secondary" onClick={onClose} disabled={loading}>
            {cancelLabel}
          </CButton>
          {onSubmit && (
            <CButton type="submit" color={submitColor} disabled={loading}>
              {loading ? 'Salvando...' : submitLabel}
            </CButton>
          )}
        </CModalFooter>
      </CForm>
    </CModal>
  )
}

export default ModalForm

