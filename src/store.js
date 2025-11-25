import { legacy_createStore as createStore } from 'redux'

const initialState = {
  sidebarShow: true,
  theme: 'light',
  // Estado dos módulos
  users: {
    list: [],
    loading: false,
    error: null,
  },
  tasks: {
    list: [],
    loading: false,
    error: null,
  },
  events: {
    list: [],
    loading: false,
    error: null,
  },
  equipment: {
    list: [],
    loading: false,
    error: null,
  },
  providers: {
    list: [],
    loading: false,
    error: null,
  },
  calibrations: {
    list: [],
    loading: false,
    error: null,
  },
  certificates: {
    list: [],
    loading: false,
    error: null,
  },
  measurementParameters: {
    list: [],
    loading: false,
    error: null,
  },
  // Estado de autenticação
  auth: {
    user: null,
    token: null,
    isAuthenticated: false,
  },
}

const changeState = (state = initialState, { type, ...rest }) => {
  switch (type) {
    case 'set':
      return { ...state, ...rest }
    case 'SET_USERS':
      return {
        ...state,
        users: {
          ...state.users,
          list: rest.users || state.users.list,
          loading: rest.loading !== undefined ? rest.loading : state.users.loading,
          error: rest.error !== undefined ? rest.error : state.users.error,
        },
      }
    case 'SET_TASKS':
      return {
        ...state,
        tasks: {
          ...state.tasks,
          list: rest.tasks || state.tasks.list,
          loading: rest.loading !== undefined ? rest.loading : state.tasks.loading,
          error: rest.error !== undefined ? rest.error : state.tasks.error,
        },
      }
    case 'SET_EVENTS':
      return {
        ...state,
        events: {
          ...state.events,
          list: rest.events || state.events.list,
          loading: rest.loading !== undefined ? rest.loading : state.events.loading,
          error: rest.error !== undefined ? rest.error : state.events.error,
        },
      }
    case 'SET_EQUIPMENT':
      return {
        ...state,
        equipment: {
          ...state.equipment,
          list: rest.equipment || state.equipment.list,
          loading: rest.loading !== undefined ? rest.loading : state.equipment.loading,
          error: rest.error !== undefined ? rest.error : state.equipment.error,
        },
      }
    case 'SET_PROVIDERS':
      return {
        ...state,
        providers: {
          ...state.providers,
          list: rest.providers || state.providers.list,
          loading: rest.loading !== undefined ? rest.loading : state.providers.loading,
          error: rest.error !== undefined ? rest.error : state.providers.error,
        },
      }
    case 'SET_CALIBRATIONS':
      return {
        ...state,
        calibrations: {
          ...state.calibrations,
          list: rest.calibrations || state.calibrations.list,
          loading: rest.loading !== undefined ? rest.loading : state.calibrations.loading,
          error: rest.error !== undefined ? rest.error : state.calibrations.error,
        },
      }
    case 'SET_CERTIFICATES':
      return {
        ...state,
        certificates: {
          ...state.certificates,
          list: rest.certificates || state.certificates.list,
          loading: rest.loading !== undefined ? rest.loading : state.certificates.loading,
          error: rest.error !== undefined ? rest.error : state.certificates.error,
        },
      }
    case 'SET_MEASUREMENT_PARAMETERS':
      return {
        ...state,
        measurementParameters: {
          ...state.measurementParameters,
          list: rest.measurementParameters || state.measurementParameters.list,
          loading:
            rest.loading !== undefined ? rest.loading : state.measurementParameters.loading,
          error: rest.error !== undefined ? rest.error : state.measurementParameters.error,
        },
      }
    case 'SET_AUTH':
      return {
        ...state,
        auth: {
          ...state.auth,
          ...rest,
        },
      }
    default:
      return state
  }
}

const store = createStore(changeState)
export default store
