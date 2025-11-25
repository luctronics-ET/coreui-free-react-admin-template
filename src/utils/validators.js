// Validadores reutilizáveis para formulários

export const validators = {
  required: (value, message = 'Este campo é obrigatório') => {
    if (!value || (typeof value === 'string' && value.trim() === '')) {
      return message
    }
    return null
  },

  email: (value, message = 'E-mail inválido') => {
    if (!value) return null // Se vazio, deixar o required tratar
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (!emailRegex.test(value)) {
      return message
    }
    return null
  },

  minLength: (min, message) => (value) => {
    if (!value) return null
    if (value.length < min) {
      return message || `Mínimo de ${min} caracteres`
    }
    return null
  },

  maxLength: (max, message) => (value) => {
    if (!value) return null
    if (value.length > max) {
      return message || `Máximo de ${max} caracteres`
    }
    return null
  },

  pattern: (regex, message) => (value) => {
    if (!value) return null
    if (!regex.test(value)) {
      return message || 'Formato inválido'
    }
    return null
  },

  date: (value, message = 'Data inválida') => {
    if (!value) return null
    const date = new Date(value)
    if (isNaN(date.getTime())) {
      return message
    }
    return null
  },

  dateAfter: (minDate, message) => (value) => {
    if (!value) return null
    const date = new Date(value)
    const min = new Date(minDate)
    if (date <= min) {
      return message || `Data deve ser posterior a ${minDate}`
    }
    return null
  },

  number: (value, message = 'Deve ser um número') => {
    if (!value) return null
    if (isNaN(Number(value))) {
      return message
    }
    return null
  },

  min: (min, message) => (value) => {
    if (!value) return null
    const num = Number(value)
    if (isNaN(num) || num < min) {
      return message || `Valor mínimo: ${min}`
    }
    return null
  },

  max: (max, message) => (value) => {
    if (!value) return null
    const num = Number(value)
    if (isNaN(num) || num > max) {
      return message || `Valor máximo: ${max}`
    }
    return null
  },
}

// Função para validar um formulário completo
export const validateForm = (formData, rules) => {
  const errors = {}

  Object.keys(rules).forEach((field) => {
    const fieldRules = Array.isArray(rules[field]) ? rules[field] : [rules[field]]
    const value = formData[field]

    for (const rule of fieldRules) {
      let error = null

      if (typeof rule === 'function') {
        error = rule(value)
      } else if (typeof rule === 'object' && rule.validator) {
        error = rule.validator(value, rule.message)
      }

      if (error) {
        errors[field] = error
        break // Para na primeira validação que falhar
      }
    }
  })

  return {
    isValid: Object.keys(errors).length === 0,
    errors,
  }
}

export default validators


