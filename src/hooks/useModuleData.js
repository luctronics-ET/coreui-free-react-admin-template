// Hook customizado para gerenciar dados dos módulos
import { useEffect, useState } from 'react'
import { useDispatch, useSelector } from 'react-redux'

/**
 * Hook para gerenciar dados de um módulo específico
 * @param {string} moduleName - Nome do módulo ('users', 'tasks', 'events')
 * @param {object} service - Serviço com métodos getAll, getById, create, update, delete
 */
export const useModuleData = (moduleName, service) => {
  const dispatch = useDispatch()
  const moduleState = useSelector((state) => state[moduleName] || { list: [], loading: false, error: null })
  const [localLoading, setLocalLoading] = useState(false)

  const loadData = async () => {
    setLocalLoading(true)
    dispatch({ type: `SET_${moduleName.toUpperCase()}`, loading: true, error: null })
    try {
      const data = await service.getAll()
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, [moduleName]: data, loading: false })
      return data
    } catch (error) {
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, loading: false, error: error.message })
      throw error
    } finally {
      setLocalLoading(false)
    }
  }

  const createItem = async (itemData) => {
    try {
      const newItem = await service.create(itemData)
      const updatedList = [...moduleState.list, newItem]
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, [moduleName]: updatedList })
      return newItem
    } catch (error) {
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, error: error.message })
      throw error
    }
  }

  const updateItem = async (id, updates) => {
    try {
      const updatedItem = await service.update(id, updates)
      const updatedList = moduleState.list.map((item) => (item.id === id ? updatedItem : item))
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, [moduleName]: updatedList })
      return updatedItem
    } catch (error) {
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, error: error.message })
      throw error
    }
  }

  const deleteItem = async (id) => {
    try {
      await service.delete(id)
      const updatedList = moduleState.list.filter((item) => item.id !== id)
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, [moduleName]: updatedList })
      return true
    } catch (error) {
      dispatch({ type: `SET_${moduleName.toUpperCase()}`, error: error.message })
      throw error
    }
  }

  useEffect(() => {
    if (moduleState.list.length === 0 && !moduleState.loading) {
      loadData()
    }
  }, [])

  return {
    data: moduleState.list,
    loading: moduleState.loading || localLoading,
    error: moduleState.error,
    loadData,
    createItem,
    updateItem,
    deleteItem,
  }
}

export default useModuleData

