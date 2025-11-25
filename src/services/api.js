// Serviço de API para comunicação com backend
// Por enquanto usa dados mock, mas pode ser facilmente adaptado para API real

const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:3001/api'

// Função genérica para requisições HTTP
const request = async (endpoint, options = {}) => {
  const url = `${API_BASE_URL}${endpoint}`
  const config = {
    headers: {
      'Content-Type': 'application/json',
      ...options.headers,
    },
    ...options,
  }

  // Se tiver token de autenticação, adicionar ao header
  const token = localStorage.getItem('authToken')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }

  try {
    const response = await fetch(url, config)
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }
    return await response.json()
  } catch (error) {
    console.error('API Error:', error)
    throw error
  }
}

// Métodos HTTP
export const api = {
  get: (endpoint) => request(endpoint, { method: 'GET' }),
  post: (endpoint, data) =>
    request(endpoint, {
      method: 'POST',
      body: JSON.stringify(data),
    }),
  put: (endpoint, data) =>
    request(endpoint, {
      method: 'PUT',
      body: JSON.stringify(data),
    }),
  delete: (endpoint) => request(endpoint, { method: 'DELETE' }),
  patch: (endpoint, data) =>
    request(endpoint, {
      method: 'PATCH',
      body: JSON.stringify(data),
    }),
}

export default api

