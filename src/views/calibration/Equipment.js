import React, { useEffect, useMemo, useState } from 'react'
import { CCard, CCardBody, CRow, CCol, CFormSelect, CAlert, CBadge } from '@coreui/react'
import { DataTable, ModalForm, ConfirmModal, PageHeader } from '../../components/common'
import EquipmentForm from './EquipmentForm'
import { LABELS, SELECT_OPTIONS } from '../../utils/constants'
import { mockDataService } from '../../services/mockData'
import { formatDate, getBadgeColor } from '../../utils/helpers'
import redisService from '../../services/redis'

const Equipment = () => {
  const [equipment, setEquipment] = useState([])
  const [providers, setProviders] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  const [showModal, setShowModal] = useState(false)
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [selectedEquipment, setSelectedEquipment] = useState(null)
  const [filters, setFilters] = useState({ status: '', assetType: '' })

  const providerOptions = useMemo(
    () =>
      providers.map((provider) => ({
        value: provider.id,
        label: provider.name,
      })),
    [providers],
  )

  const filteredEquipment = useMemo(() => {
    return equipment.filter((item) => {
      if (filters.status && item.status !== filters.status) return false
      if (filters.assetType && item.assetType !== filters.assetType) return false
      return true
    })
  }, [equipment, filters])

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    setError(null)
    try {
      // Tentar carregar do cache primeiro
      const cachedEquipment = await redisService.getEquipmentCache()
      
      if (cachedEquipment) {
        console.log('[Equipment] Dados carregados do cache Redis')
        setEquipment(cachedEquipment.equipment || [])
        setProviders(cachedEquipment.providers || [])
        setLoading(false)
        return
      }

      // Se não houver cache, buscar do serviço
      const [equipmentData, providerData] = await Promise.all([
        mockDataService.equipment.getAll(),
        mockDataService.providers.getAll(),
      ])
      
      setEquipment(equipmentData)
      setProviders(providerData)
      
      // Cachear os dados
      await redisService.cacheEquipment({
        equipment: equipmentData,
        providers: providerData,
      })
      
    } catch (err) {
      setError('Não foi possível carregar os equipamentos.')
    } finally {
      setLoading(false)
    }
  }

  const handleCreate = () => {
    setSelectedEquipment(null)
    setShowModal(true)
  }

  const handleEdit = (equipmentRow) => {
    setSelectedEquipment(equipmentRow)
    setShowModal(true)
  }

  const handleDelete = (equipmentRow) => {
    setSelectedEquipment(equipmentRow)
    setShowDeleteModal(true)
  }

  const handleSave = async (formData) => {
    const payload = Object.fromEntries(formData.entries())
    payload.calibrationDefaultIntervalDays = Number(payload.calibrationDefaultIntervalDays || 365)
    if (payload.providerId) {
      payload.providerId = Number(payload.providerId)
    }
    if (payload.nextCalibrationDueDate) {
      payload.nextCalibrationDueDate = new Date(payload.nextCalibrationDueDate).toISOString()
    }

    try {
      if (selectedEquipment) {
        await mockDataService.equipment.update(selectedEquipment.id, payload)
      } else {
        await mockDataService.equipment.create(payload)
      }
      setShowModal(false)
      setSelectedEquipment(null)
      loadData()
    } catch (err) {
      setError('Erro ao salvar equipamento.')
    }
  }

  const confirmDelete = async () => {
    if (!selectedEquipment) return
    try {
      await mockDataService.equipment.delete(selectedEquipment.id)
      setShowDeleteModal(false)
      setSelectedEquipment(null)
      loadData()
    } catch (err) {
      setError('Erro ao excluir equipamento.')
    }
  }

  const columns = [
    {
      key: 'internalCode',
      label: LABELS.internalCode,
      sortable: true,
    },
    {
      key: 'manufacturer',
      label: LABELS.manufacturer,
      render: (value, item) => `${value || '-'} ${item.model ? `(${item.model})` : ''}`,
    },
    {
      key: 'assetType',
      label: LABELS.assetType,
      render: (value) => SELECT_OPTIONS.assetTypes.find((opt) => opt.value === value)?.label || value,
    },
    {
      key: 'status',
      label: LABELS.status,
      type: 'badge',
      render: (value) => (
        <CBadge color={getBadgeColor(value)}>
          {SELECT_OPTIONS.equipmentStatus.find((opt) => opt.value === value)?.label || value}
        </CBadge>
      ),
    },
    {
      key: 'providerId',
      label: LABELS.provider,
      render: (value) => providerOptions.find((opt) => opt.value === value)?.label || '-',
    },
    {
      key: 'nextCalibrationDueDate',
      label: LABELS.nextCalibration,
      render: (value) => formatDate(value),
    },
    {
      key: 'location',
      label: LABELS.location,
    },
  ]

  return (
    <>
      <PageHeader
        title="Gestão de Equipamentos"
        description="Controle dos ativos sujeitos à calibração conforme ISO/IEC 17025."
        onAction={handleCreate}
        actionLabel="Novo Equipamento"
        showAction
      />
      <CCard>
        <CCardBody>
          {error && (
            <CAlert color="danger" className="mb-3">
              {error}
            </CAlert>
          )}

          <CRow className="g-3 mb-3">
            <CCol md={4}>
              <CFormSelect
                value={filters.status}
                onChange={(e) => setFilters((prev) => ({ ...prev, status: e.target.value }))}
              >
                <option value="">Status - Todos</option>
                {SELECT_OPTIONS.equipmentStatus.map((option) => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </CFormSelect>
            </CCol>
            <CCol md={4}>
              <CFormSelect
                value={filters.assetType}
                onChange={(e) => setFilters((prev) => ({ ...prev, assetType: e.target.value }))}
              >
                <option value="">Tipo de ativo - Todos</option>
                {SELECT_OPTIONS.assetTypes.map((option) => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </CFormSelect>
            </CCol>
          </CRow>

          <DataTable
            data={filteredEquipment}
            columns={columns}
            loading={loading}
            onCreate={handleCreate}
            onEdit={handleEdit}
            onDelete={handleDelete}
            emptyMessage="Nenhum equipamento encontrado"
          />
        </CCardBody>
      </CCard>

      <ModalForm
        visible={showModal}
        onClose={() => {
          setShowModal(false)
          setSelectedEquipment(null)
        }}
        title={selectedEquipment ? 'Editar Equipamento' : 'Novo Equipamento'}
        onSubmit={(e) => {
          e.preventDefault()
          const formData = new FormData(e.target)
          handleSave(formData)
        }}
      >
        <EquipmentForm equipment={selectedEquipment} providers={providerOptions} />
      </ModalForm>

      <ConfirmModal
        visible={showDeleteModal}
        onClose={() => {
          setShowDeleteModal(false)
          setSelectedEquipment(null)
        }}
        onConfirm={confirmDelete}
        title="Excluir equipamento"
        message={
          selectedEquipment
            ? `Tem certeza que deseja excluir o equipamento ${selectedEquipment.internalCode}?`
            : 'Confirmar exclusão do equipamento?'
        }
        confirmColor="danger"
      />
    </>
  )
}

export default Equipment

