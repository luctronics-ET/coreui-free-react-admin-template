import { useState, useCallback } from 'react'
import { CToast, CToastBody, CToastHeader, CToaster } from '@coreui/react'

/**
 * Hook para gerenciar notificações/toasts
 * @returns {object} { showToast, NotificationContainer }
 */
export const useNotification = () => {
  const [toasts, setToasts] = useState([])

  const showToast = useCallback((message, title = 'Notificação', color = 'primary', duration = 5000) => {
    const id = Date.now()
    const toast = {
      id,
      message,
      title,
      color,
      duration,
    }

    setToasts((prev) => [...prev, toast])

    // Remover automaticamente após a duração
    if (duration > 0) {
      setTimeout(() => {
        setToasts((prev) => prev.filter((t) => t.id !== id))
      }, duration)
    }

    return id
  })

  const removeToast = useCallback((id) => {
    setToasts((prev) => prev.filter((t) => t.id !== id))
  }, [])

  const showSuccess = useCallback((message, title = 'Sucesso') => {
    return showToast(message, title, 'success')
  }, [showToast])

  const showError = useCallback((message, title = 'Erro') => {
    return showToast(message, title, 'danger')
  }, [showToast])

  const showWarning = useCallback((message, title = 'Aviso') => {
    return showToast(message, title, 'warning')
  }, [showToast])

  const showInfo = useCallback((message, title = 'Informação') => {
    return showToast(message, title, 'info')
  }, [showToast])

  const NotificationContainer = () => (
    <CToaster placement="top-end">
      {toasts.map((toast) => (
        <CToast
          key={toast.id}
          autohide={toast.duration > 0}
          delay={toast.duration}
          visible={true}
          color={toast.color}
          onClose={() => removeToast(toast.id)}
        >
          <CToastHeader closeButton>
            <strong className="me-auto">{toast.title}</strong>
          </CToastHeader>
          <CToastBody>{toast.message}</CToastBody>
        </CToast>
      ))}
    </CToaster>
  )

  return {
    showToast,
    showSuccess,
    showError,
    showWarning,
    showInfo,
    removeToast,
    NotificationContainer,
  }
}

export default useNotification


