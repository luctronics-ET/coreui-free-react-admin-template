import React, { useEffect, useMemo, useState } from 'react'
import { CCard, CCardBody, CRow, CCol, CFormSelect, CAlert, CBadge, CButton } from '@coreui/react'
import { DataTable, PageHeader } from '../../components/common'
import { mockDataService } from '../../services/mockData'
import { LABELS, SELECT_OPTIONS } from '../../utils/constants'
import { formatDate, exportToCSV } from '../../utils/helpers'

const Certificates = () => {
  const [certificates, setCertificates] = useState([])
  const [equipment, setEquipment] = useState([])
  const [calibrations, setCalibrations] = useState([])
  const [statusFilter, setStatusFilter] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const equipmentMap = useMemo(() => {
    const map = {}
    equipment.forEach((item) => {
      map[item.id] = item
    })
    return map
  }, [equipment])

  const calibrationMap = useMemo(() => {
    const map = {}
    calibrations.forEach((cal) => {
      map[cal.id] = cal
    })
    return map
  }, [calibrations])

  const filteredCertificates = useMemo(() => {
    return certificates.filter((certificate) => {
      if (statusFilter && certificate.status !== statusFilter) return false
      return true
    })
  }, [certificates, statusFilter])

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    setError(null)
    try {
      const [certificateData, equipmentData, calibrationData] = await Promise.all([
        mockDataService.certificates.getAll(),
        mockDataService.equipment.getAll(),
        mockDataService.calibrations.getAll(),
      ])
      setCertificates(certificateData)
      setEquipment(equipmentData)
      setCalibrations(calibrationData)
    } catch (err) {
      setError('Não foi possível carregar os certificados.')
    } finally {
      setLoading(false)
    }
  }

  const handleExport = () => {
    exportToCSV(
      filteredCertificates.map((cert) => ({
        numero: cert.certificateNumber,
        equipamento: equipmentMap[calibrationMap[cert.calibrationId]?.equipmentId || '']?.internalCode || '-',
        emissao: formatDate(cert.issueDate),
        validade: formatDate(cert.validityTo),
        status: cert.status,
      })),
      'certificados',
    )
  }

  const getCertificateBadgeColor = (status) => {
    const colors = {
      issued: 'success',
      draft: 'secondary',
      expired: 'danger',
      cancelled: 'warning',
    }
    return colors[status] || 'info'
  }

  const columns = [
    {
      key: 'certificateNumber',
      label: LABELS.certificateNumber,
      sortable: true,
    },
    {
      key: 'equipmentId',
      label: LABELS.equipment,
      render: (_, item) => {
        const calibration = calibrationMap[item.calibrationId]
        if (!calibration) return '-'
        const eq = equipmentMap[calibration.equipmentId]
        return eq ? `${eq.internalCode} - ${eq.manufacturer}` : '-'
      },
    },
    {
      key: 'issueDate',
      label: LABELS.issueDate,
      render: (value) => formatDate(value),
    },
    {
      key: 'validityTo',
      label: LABELS.validityTo,
      render: (value) => formatDate(value),
    },
    {
      key: 'status',
      label: LABELS.statusCertificate,
      render: (value) => <CBadge color={getCertificateBadgeColor(value)}>{value || '-'}</CBadge>,
    },
  ]

  return (
    <>
      <PageHeader
        title="Certificados de Calibração"
        description="Registro completo de certificados emitidos com rastreabilidade e validade."
        actionLabel="Exportar CSV"
        showAction
        onAction={handleExport}
      />
      <CCard>
        <CCardBody>
          {error && (
            <CAlert color="danger" className="mb-3">
              {error}
            </CAlert>
          )}
          <CRow className="mb-3">
            <CCol md={4}>
              <CFormSelect value={statusFilter} onChange={(e) => setStatusFilter(e.target.value)}>
                <option value="">Status - Todos</option>
                {SELECT_OPTIONS.certificateStatus.map((option) => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </CFormSelect>
            </CCol>
            <CCol md={8} className="text-end">
              <CButton color="secondary" variant="outline" onClick={loadData}>
                Atualizar
              </CButton>
            </CCol>
          </CRow>
          <DataTable
            data={filteredCertificates}
            columns={columns}
            loading={loading}
            actions={false}
            emptyMessage="Nenhum certificado encontrado"
          />
        </CCardBody>
      </CCard>
    </>
  )
}

export default Certificates

