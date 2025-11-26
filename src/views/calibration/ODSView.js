import React, { useState, useEffect } from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CTable,
  CTableHead,
  CTableRow,
  CTableHeaderCell,
  CTableBody,
  CTableDataCell,
  CButton,
  CBadge,
  CSpinner,
  CFormInput,
  CInputGroup,
  CInputGroupText,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilSearch, cilCloudDownload, cilCloudUpload, cilReload } from '@coreui/icons'
import { PageHeader } from '../../components/common'
import { mockDataService } from '../../services/mockData'
import { formatDate } from '../../utils/helpers'
import './ODSView.scss'

const ODSView = () => {
  const [data, setData] = useState([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      console.log('🔄 ODSView: Fetching equipment and calibrations...')
      const [equipmentData, calibrationsData] = await Promise.all([
        mockDataService.equipment.getAll(),
        mockDataService.calibrations.getAll(),
      ])
      
      console.log(`📊 ODSView: Loaded ${equipmentData.length} equipment, ${calibrationsData.length} calibrations`)

      // Combinar dados de equipamento com última calibração
      const combined = equipmentData.map((eq) => {
        const lastCal = calibrationsData
          .filter((cal) => cal.equipmentId === eq.id)
          .sort((a, b) => new Date(b.calibrationDate) - new Date(a.calibrationDate))[0]

        return {
          // Campos de equipamento (mapped from API response)
          id: eq.id,
          type: eq.category1 || eq.assetType || '-',  // category1 = eletrico/mecanico
          name: eq.assetType || '-',                   // assetType = equipment name
          manufacturer: eq.manufacturer || '-',
          model: eq.model || '-',
          measurementRange: eq.measurementRange || eq.range || '-',
          unit: eq.unit || eq.rangeUnit || '-',
          internalCode: eq.internalCode,
          serialNumber: eq.serialNumber || '-',
          division: eq.division || '-',
          priority: eq.priority || '-',
          location: eq.location || '-',
          
          // Campos de calibração (mapped from API response)
          entryDate: eq.workshopEntryDate ? formatDate(eq.workshopEntryDate) : '-',
          exitToCalDate: eq.sentToCalibrationDate ? formatDate(eq.sentToCalibrationDate) : '-',
          returnFromCalDate: eq.returnedFromCalibrationDate ? formatDate(eq.returnedFromCalibrationDate) : '-',
          calibrationDate: eq.lastCalibrationDate ? formatDate(eq.lastCalibrationDate) : '-',
          calibrationInterval: eq.calibrationDefaultIntervalDays 
            ? `${Math.round(eq.calibrationDefaultIntervalDays / 30)} meses` 
            : '-',
          nextCalibrationDate: eq.nextCalibrationDueDate ? formatDate(eq.nextCalibrationDueDate) : '-',
          validUntil: eq.validUntil ? formatDate(eq.validUntil) : '-',
          certificateNumber: eq.certificateNumber || '-',
          comments: eq.calibrationNotes || eq.notes || '-',
          cost: eq.estimatedCost ? `R$ ${parseFloat(eq.estimatedCost).toFixed(2)}` : '-',
          budgetNumber: eq.budgetNumber || '-',
          paymentDate: eq.paymentDate ? formatDate(eq.paymentDate) : '-',
          laboratory: eq.providerName || '-',
          
          // Status calculado
          status: getStatus(eq.nextCalibrationDueDate, eq.certificateNumber),
        }
      })

      setData(combined)
    } catch (error) {
      console.error('Erro ao carregar dados:', error)
    } finally {
      setLoading(false)
    }
  }

  const getStatus = (nextDate, certificate) => {
    if (!nextDate) return 'SEM DATA'
    const today = new Date()
    const next = new Date(nextDate)
    
    if (!certificate) return 'PENDENTE'
    if (next < today) return 'ATRASADO'
    if (next <= new Date(today.getTime() + 30 * 24 * 60 * 60 * 1000)) return 'URGENTE'
    return 'CALIBRADO'
  }

  const getStatusColor = (status) => {
    switch (status) {
      case 'CALIBRADO': return 'success'
      case 'URGENTE': return 'warning'
      case 'ATRASADO': return 'danger'
      case 'PENDENTE': return 'secondary'
      default: return 'dark'
    }
  }

  const filteredData = data.filter((item) => {
    const search = searchTerm.toLowerCase()
    return (
      item.name.toLowerCase().includes(search) ||
      item.internalCode.toLowerCase().includes(search) ||
      item.manufacturer.toLowerCase().includes(search) ||
      item.model.toLowerCase().includes(search) ||
      item.serialNumber.toLowerCase().includes(search) ||
      item.division.toLowerCase().includes(search)
    )
  })

  if (loading) {
    return (
      <CCard>
        <CCardBody className="text-center py-5">
          <CSpinner color="primary" />
          <div className="mt-3">Carregando dados...</div>
        </CCardBody>
      </CCard>
    )
  }

  return (
    <>
      <PageHeader
        title="Controle de Calibração"
        subtitle="Visualização completa estilo planilha ODS"
      />

      <CCard>
        <CCardHeader className="d-flex justify-content-between align-items-center">
          <div className="d-flex gap-2 align-items-center flex-grow-1">
            <CInputGroup style={{ maxWidth: '400px' }}>
              <CInputGroupText>
                <CIcon icon={cilSearch} />
              </CInputGroupText>
              <CFormInput
                placeholder="Buscar por nome, código, marca, modelo..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
              />
            </CInputGroup>
            <CBadge color="info" className="ms-2">
              {filteredData.length} registros
            </CBadge>
          </div>
          <div className="d-flex gap-2">
            <CButton color="secondary" variant="outline" onClick={loadData}>
              <CIcon icon={cilReload} className="me-1" />
              Atualizar
            </CButton>
            <CButton color="success" variant="outline">
              <CIcon icon={cilCloudDownload} className="me-1" />
              Exportar ODS
            </CButton>
            <CButton color="primary">
              <CIcon icon={cilCloudUpload} className="me-1" />
              Importar ODS
            </CButton>
          </div>
        </CCardHeader>
        <CCardBody className="p-0">
          <div className="ods-table-wrapper">
            <CTable striped hover className="ods-table mb-0">
              <CTableHead>
                <CTableRow>
                  <CTableHeaderCell className="text-center sticky-col">#</CTableHeaderCell>
                  <CTableHeaderCell>Status</CTableHeaderCell>
                  <CTableHeaderCell>ELE/MEC</CTableHeaderCell>
                  <CTableHeaderCell>Equipamento</CTableHeaderCell>
                  <CTableHeaderCell>Marca</CTableHeaderCell>
                  <CTableHeaderCell>Modelo</CTableHeaderCell>
                  <CTableHeaderCell>Range</CTableHeaderCell>
                  <CTableHeaderCell>Unidade</CTableHeaderCell>
                  <CTableHeaderCell>Cód. Interno</CTableHeaderCell>
                  <CTableHeaderCell>Serial</CTableHeaderCell>
                  <CTableHeaderCell>Divisão</CTableHeaderCell>
                  <CTableHeaderCell>PS</CTableHeaderCell>
                  <CTableHeaderCell>Entrada Oficina</CTableHeaderCell>
                  <CTableHeaderCell>Saída p/ Cal.</CTableHeaderCell>
                  <CTableHeaderCell>Retorno Cal.</CTableHeaderCell>
                  <CTableHeaderCell>Última Calibração</CTableHeaderCell>
                  <CTableHeaderCell>Ciclo (meses)</CTableHeaderCell>
                  <CTableHeaderCell>Próxima Calibração</CTableHeaderCell>
                  <CTableHeaderCell>Validade</CTableHeaderCell>
                  <CTableHeaderCell>Certificado</CTableHeaderCell>
                  <CTableHeaderCell>Localização</CTableHeaderCell>
                  <CTableHeaderCell>Comentários</CTableHeaderCell>
                  <CTableHeaderCell>Custo Estimado</CTableHeaderCell>
                  <CTableHeaderCell>Orçamento</CTableHeaderCell>
                  <CTableHeaderCell>Pagamento</CTableHeaderCell>
                  <CTableHeaderCell>Local Calibração</CTableHeaderCell>
                </CTableRow>
              </CTableHead>
              <CTableBody>
                {filteredData.map((item, index) => (
                  <CTableRow key={item.id}>
                    <CTableDataCell className="text-center sticky-col bg-light">
                      {index + 1}
                    </CTableDataCell>
                    <CTableDataCell>
                      <CBadge color={getStatusColor(item.status)}>{item.status}</CBadge>
                    </CTableDataCell>
                    <CTableDataCell>{item.type}</CTableDataCell>
                    <CTableDataCell className="text-nowrap">{item.name}</CTableDataCell>
                    <CTableDataCell>{item.manufacturer}</CTableDataCell>
                    <CTableDataCell>{item.model}</CTableDataCell>
                    <CTableDataCell>{item.measurementRange}</CTableDataCell>
                    <CTableDataCell>{item.unit}</CTableDataCell>
                    <CTableDataCell className="text-nowrap fw-bold">
                      {item.internalCode}
                    </CTableDataCell>
                    <CTableDataCell>{item.serialNumber}</CTableDataCell>
                    <CTableDataCell>{item.division}</CTableDataCell>
                    <CTableDataCell>{item.priority}</CTableDataCell>
                    <CTableDataCell className="text-nowrap">{item.entryDate}</CTableDataCell>
                    <CTableDataCell className="text-nowrap">{item.exitToCalDate}</CTableDataCell>
                    <CTableDataCell className="text-nowrap">
                      {item.returnFromCalDate}
                    </CTableDataCell>
                    <CTableDataCell className="text-nowrap">
                      {item.calibrationDate}
                    </CTableDataCell>
                    <CTableDataCell className="text-center">
                      {item.calibrationInterval}
                    </CTableDataCell>
                    <CTableDataCell className="text-nowrap">
                      {item.nextCalibrationDate}
                    </CTableDataCell>
                    <CTableDataCell className="text-nowrap">{item.validUntil}</CTableDataCell>
                    <CTableDataCell>{item.certificateNumber}</CTableDataCell>
                    <CTableDataCell>{item.location}</CTableDataCell>
                    <CTableDataCell className="small">{item.comments}</CTableDataCell>
                    <CTableDataCell className="text-end">{item.cost}</CTableDataCell>
                    <CTableDataCell>{item.budgetNumber}</CTableDataCell>
                    <CTableDataCell className="text-nowrap">{item.paymentDate}</CTableDataCell>
                    <CTableDataCell>{item.laboratory}</CTableDataCell>
                  </CTableRow>
                ))}
              </CTableBody>
            </CTable>
          </div>
        </CCardBody>
      </CCard>
    </>
  )
}

export default ODSView
