// Funções auxiliares reutilizáveis

// Formatar data para exibição
export const formatDate = (dateString, format = 'dd/mm/yyyy') => {
  if (!dateString) return '-'
  const date = new Date(dateString)
  if (isNaN(date.getTime())) return dateString

  const day = String(date.getDate()).padStart(2, '0')
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const year = date.getFullYear()
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')

  switch (format) {
    case 'dd/mm/yyyy':
      return `${day}/${month}/${year}`
    case 'dd/mm/yyyy hh:mm':
      return `${day}/${month}/${year} ${hours}:${minutes}`
    case 'yyyy-mm-dd':
      return `${year}-${month}-${day}`
    default:
      return dateString
  }
}

// Formatar data e hora
export const formatDateTime = (dateString) => {
  return formatDate(dateString, 'dd/mm/yyyy hh:mm')
}

// Obter cor baseada no status
export const getStatusColor = (status) => {
  const colors = {
    active: 'success',
    inactive: 'secondary',
    pending: 'warning',
    completed: 'success',
    in_progress: 'info',
    cancelled: 'danger',
    high: 'danger',
    medium: 'warning',
    low: 'info',
    urgent: 'danger',
  }
  return colors[status] || 'secondary'
}

// Obter badge color baseado em valor
export const getBadgeColor = (value, type = 'status') => {
  if (type === 'priority') {
    const priorityColors = {
      low: 'info',
      medium: 'warning',
      high: 'danger',
      urgent: 'danger',
    }
    return priorityColors[value] || 'secondary'
  }
  return getStatusColor(value)
}

// Capitalizar primeira letra
export const capitalize = (str) => {
  if (!str) return ''
  return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase()
}

// Truncar texto
export const truncate = (text, maxLength = 50) => {
  if (!text) return ''
  if (text.length <= maxLength) return text
  return text.substring(0, maxLength) + '...'
}

// Validar email
export const isValidEmail = (email) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return emailRegex.test(email)
}

// Debounce function
export const debounce = (func, wait) => {
  let timeout
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout)
      func(...args)
    }
    clearTimeout(timeout)
    timeout = setTimeout(later, wait)
  }
}

// Filtrar array por múltiplos critérios
export const filterArray = (array, filters) => {
  return array.filter((item) => {
    return Object.keys(filters).every((key) => {
      const filterValue = filters[key]
      if (!filterValue || filterValue === '') return true

      const itemValue = item[key]
      if (typeof itemValue === 'string') {
        return itemValue.toLowerCase().includes(filterValue.toLowerCase())
      }
      return itemValue === filterValue
    })
  })
}

// Ordenar array
export const sortArray = (array, key, direction = 'asc') => {
  return [...array].sort((a, b) => {
    let aVal = a[key]
    let bVal = b[key]

    // Tratar strings
    if (typeof aVal === 'string') {
      aVal = aVal.toLowerCase()
      bVal = bVal.toLowerCase()
    }

    // Tratar datas
    if (key.includes('Date') || key.includes('date') || key === 'createdAt') {
      aVal = new Date(aVal).getTime()
      bVal = new Date(bVal).getTime()
    }

    if (direction === 'asc') {
      return aVal > bVal ? 1 : aVal < bVal ? -1 : 0
    } else {
      return aVal < bVal ? 1 : aVal > bVal ? -1 : 0
    }
  })
}

// Exportar dados para CSV
export const exportToCSV = (data, filename = 'export') => {
  if (!data || data.length === 0) return

  const headers = Object.keys(data[0])
  const csvContent = [
    headers.join(','),
    ...data.map((row) => headers.map((header) => `"${row[header] || ''}"`).join(',')),
  ].join('\n')

  const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
  const link = document.createElement('a')
  const url = URL.createObjectURL(blob)
  link.setAttribute('href', url)
  link.setAttribute('download', `${filename}.csv`)
  link.style.visibility = 'hidden'
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

// Calcular próxima calibração
export const calculateNextCalibrationDate = (issueDate, intervalDays = 365) => {
  if (!issueDate) return null
  const date = new Date(issueDate)
  if (isNaN(date.getTime())) return null
  date.setDate(date.getDate() + Number(intervalDays || 0))
  return date.toISOString()
}

// Gerar número de certificado simples
export const formatCertificateNumber = (equipmentCode, sequence = 1) => {
  const year = new Date().getFullYear()
  const sanitizedCode = (equipmentCode || 'EQP').replace(/[^A-Za-z0-9]/g, '').toUpperCase()
  return `CERT-${sanitizedCode}-${String(sequence).padStart(3, '0')}-${year}`
}

// Agrupar dados por chave
export const groupBy = (array, key) => {
  return array.reduce((acc, item) => {
    const groupKey = typeof key === 'function' ? key(item) : item[key]
    if (!acc[groupKey]) {
      acc[groupKey] = []
    }
    acc[groupKey].push(item)
    return acc
  }, {})
}

