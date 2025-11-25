import React, { createContext, useContext, useState, useEffect } from 'react'
import { mockDataService } from '../services/mockData'

const AppContext = createContext()

export const useApp = () => {
  const context = useContext(AppContext)
  if (!context) {
    throw new Error('useApp deve ser usado dentro de AppProvider')
  }
  return context
}

export const AppProvider = ({ children }) => {
  const [users, setUsers] = useState([])
  const [tasks, setTasks] = useState([])
  const [events, setEvents] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadAllData()
  }, [])

  const loadAllData = async () => {
    setLoading(true)
    try {
      const [usersData, tasksData, eventsData] = await Promise.all([
        mockDataService.users.getAll(),
        mockDataService.tasks.getAll(),
        mockDataService.events.getAll(),
      ])
      setUsers(usersData)
      setTasks(tasksData)
      setEvents(eventsData)
    } catch (error) {
      console.error('Erro ao carregar dados:', error)
    } finally {
      setLoading(false)
    }
  }

  const refreshUsers = async () => {
    const data = await mockDataService.users.getAll()
    setUsers(data)
  }

  const refreshTasks = async () => {
    const data = await mockDataService.tasks.getAll()
    setTasks(data)
  }

  const refreshEvents = async () => {
    const data = await mockDataService.events.getAll()
    setEvents(data)
  }

  const refreshAll = async () => {
    await loadAllData()
  }

  const value = {
    users,
    tasks,
    events,
    loading,
    refreshUsers,
    refreshTasks,
    refreshEvents,
    refreshAll,
  }

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>
}


