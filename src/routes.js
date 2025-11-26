import React from 'react'

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'))

// Módulos da aplicação
const Users = React.lazy(() => import('./views/users/Users'))
const Tasks = React.lazy(() => import('./views/tasks/Tasks'))
const Calendar = React.lazy(() => import('./views/calendar/Calendar'))
const Equipment = React.lazy(() => import('./views/calibration/Equipment'))
const Calibrations = React.lazy(() => import('./views/calibration/Calibrations'))
const Certificates = React.lazy(() => import('./views/calibration/Certificates'))
const DataImportExport = React.lazy(() => import('./views/calibration/DataImportExport'))
const ODSView = React.lazy(() => import('./views/calibration/ODSView'))
const DatabaseSchema = React.lazy(() => import('./views/database/DatabaseSchema'))

const routes = [
  { path: '/', exact: true, name: 'Home' },
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },
  { path: '/users', name: 'Usuários', element: Users },
  { path: '/tasks', name: 'Serviços', element: Tasks },
  { path: '/calendar', name: 'Calendário', element: Calendar },
  { path: '/calibration/equipment', name: 'Equipamentos', element: Equipment },
  { path: '/calibration/events', name: 'Calibrações', element: Calibrations },
  { path: '/calibration/certificates', name: 'Certificados', element: Certificates },
  { path: '/calibration/import-export', name: 'Importar/Exportar', element: DataImportExport },
  { path: '/calibration/ods-view', name: 'Visualização ODS', element: ODSView },
  { path: '/database/schema', name: 'Estrutura do Banco', element: DatabaseSchema },
]

export default routes
