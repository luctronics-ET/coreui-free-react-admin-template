import React from 'react'
import CIcon from '@coreui/icons-react'
import {
  cilSpeedometer,
  cilSettings,
  cilTask,
  cilListNumbered,
  cilCalendar,
  cilDataTransferDown,
  cilStorage,
} from '@coreui/icons'
import { CNavItem } from '@coreui/react'

const _nav = [
  {
    component: CNavItem,
    name: 'Dashboard',
    to: '/dashboard',
    icon: <CIcon icon={cilSpeedometer} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Equipamentos',
    to: '/calibration/equipment',
    icon: <CIcon icon={cilSettings} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Calibrações',
    to: '/calibration/events',
    icon: <CIcon icon={cilTask} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Certificados',
    to: '/calibration/certificates',
    icon: <CIcon icon={cilListNumbered} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Serviços',
    to: '/tasks',
    icon: <CIcon icon={cilTask} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Calendário',
    to: '/calendar',
    icon: <CIcon icon={cilCalendar} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Visualização ODS',
    to: '/calibration/ods-view',
    icon: <CIcon icon={cilStorage} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Importar/Exportar',
    to: '/calibration/import-export',
    icon: <CIcon icon={cilDataTransferDown} customClassName="nav-icon" />,
  },
  {
    component: CNavItem,
    name: 'Banco de Dados',
    to: '/database/schema',
    icon: <CIcon icon={cilStorage} customClassName="nav-icon" />,
  },
]

export default _nav
