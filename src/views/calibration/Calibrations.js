import React, { useEffect, useMemo, useState } from 'react'
import { CCard, CCardBody, CAlert } from '@coreui/react'
import { DataTable, ConfirmModal, PageHeader } from '../../components/common'
import CalibrationModal from './CalibrationModal'
import { mockDataService } from '../../services/mockData'
import { LABELS } from '../../utils/constants'
import { formatDateTime, getBadgeColor } from '../../utils/helpers'
import redisService from '../../services/redis'

const Calibrations = () => {
  const [calibrations, setCalibrations] = useState([])
  const [equipment, setEquipment] = useState([])
  const [providers, setProviders] = useState([])
  const [referenceStandards, setReferenceStandards] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [showModal, setShowModal] = useState(false)
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [selectedCalibration, setSelectedCalibration] = useState(null)

  const equipmentMap = useMemo(() => {
    const map = {}
    equipment.forEach((item) => {
      map[item.id] = item
    })
    return map
  }, [equipment])

  const providerMap = useMemo(() => {
    const map = {}
    providers.forEach((item) => {
      map[item.id] = item
    })
    return map
  }, [providers])

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    setError(null)
    try {
      // Tentar carregar do cache primeiro
      const cachedData = await redisService.getCalibrationsCache()
      
      if (cachedData) {
        console.log('[Calibrations] Dados carregados do cache Redis')
        setCalibrations(cachedData.calibrations || [])
        setEquipment(cachedData.equipment || [])
        setProviders(cachedData.providers || [])
        setReferenceStandards(cachedData.standards || [])
        setLoading(false)
        return
      }

      // Se não houver cache, buscar do serviço
      const [calibrationData, equipmentData, providerData, standards] = await Promise.all([
        mockDataService.calibrations.getAll(),
        mockDataService.equipment.getAll(),
        mockDataService.providers.getAll(),
        mockDataService.referenceStandards.getAll(),
      ])
      
      setCalibrations(calibrationData)
      setEquipment(equipmentData)
      setProviders(providerData)
      setReferenceStandards(standards)
      
      // Cachear os dados
      await redisService.cacheCalibrations({
        calibrations: calibrationData,
        equipment: equipmentData,
        providers: providerData,
        standards: standards,
      })
      
    } catch (err) {
      setError('Não foi possível carregar as calibrações.')
    } finally {
      setLoading(false)
    }
  }

  const handleCreate = () => {
    setSelectedCalibration(null)
    setShowModal(true)
  }

  const handleEdit = (calibration) => {
    setSelectedCalibration(calibration)
    setShowModal(true)
  }

  const handleDelete = (calibration) => {
    setSelectedCalibration(calibration)
    setShowDeleteModal(true)
  }

  const confirmDelete = async () => {
    if (!selectedCalibration) return
    try {
      await mockDataService.calibrations.delete(selectedCalibration.id)
      setShowDeleteModal(false)
      setSelectedCalibration(null)
      loadData()
    } catch (err) {
      setError('Erro ao excluir calibração.')
    }
  }

  const handleSave = async (data) => {
    try {
      if (selectedCalibration) {
        await mockDataService.calibrations.update(selectedCalibration.id, data)
      } else {
        await mockDataService.calibrations.create(data)
      }
      setShowModal(false)
      setSelectedCalibration(null)
      loadData()
    } catch (err) {
      setError('Erro ao salvar calibração.')
    }
  }

  const columns = [
    {
      key: 'equipmentId',
      label: LABELS.equipment,
      render: (_, item) =>
        equipmentMap[item.equipmentId]
          ? `${equipmentMap[item.equipmentId].internalCode} - ${equipmentMap[item.equipmentId].manufacturer}`
          : '-',
    },
    {
      key: 'calibrationDate',
      label: LABELS.calibrationDate,
      render: (value) => formatDateTime(value),
      sortable: true,
    },
    {
      key: 'status',
      label: LABELS.calibrationStatus,
      type: 'badge',
      render: (value) => (
        <span className={`badge bg-${getBadgeColor(value)}`}>{value ? value.replace('_', ' ') : '-'}</span>
      ),
    },
    {
      key: 'providerId',
      label: LABELS.provider,
      render: (value) => providerMap[value]?.name || 'Interno',
    },
    {
      key: 'certificateId',
      label: LABELS.certificate,
      render: (value) => (value ? 'Emitido' : 'Pendente'),
    },
  ]

  return (
    <>
      <PageHeader
        title="Agenda de Calibrações"
        description="Controle completo de eventos, certificados e padrões rastreáveis."
        onAction={handleCreate}
        actionLabel="Nova Calibração"
        showAction
      />
      <CCard>
        <CCardBody>
          {error && (
            <CAlert color="danger" className="mb-3">
              {error}
            </CAlert>
          )}
          <DataTable
            data={calibrations}
            columns={columns}
            loading={loading}
            onCreate={handleCreate}
            onEdit={handleEdit}
            onDelete={handleDelete}
            emptyMessage="Nenhuma calibração encontrada"
          />
        </CCardBody>
      </CCard>

      <CalibrationModal
        visible={showModal}
        onClose={() => {
          setShowModal(false)
          setSelectedCalibration(null)
        }}
        onSave={handleSave}
        calibration={selectedCalibration}
        equipmentList={equipment}
        providers={providers}
        referenceStandards={referenceStandards}
      />

      <ConfirmModal
        visible={showDeleteModal}
        onClose={() => {
          setShowDeleteModal(false)
          setSelectedCalibration(null)
        }}
        onConfirm={confirmDelete}
        title="Excluir calibração"
        message={
          selectedCalibration
            ? `Confirmar exclusão da calibração do equipamento ${
                equipmentMap[selectedCalibration.equipmentId]?.internalCode || ''
              }?`
            : 'Confirmar exclusão da calibração?'
        }
        confirmColor="danger"
      />
    </>
  )
}

export default Calibrations

