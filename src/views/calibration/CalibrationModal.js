import React, { useEffect, useState } from 'react'
import {
  CModal,
  CModalHeader,
  CModalTitle,
  CModalBody,
  CModalFooter,
  CButton,
  CRow,
  CCol,
  CFormInput,
  CFormSelect,
  CFormTextarea,
  CCard,
  CCardHeader,
  CCardBody,
  CTable,
  CTableHead,
  CTableRow,
  CTableHeaderCell,
  CTableBody,
  CTableDataCell,
  CBadge,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilPlus, cilTrash } from '@coreui/icons'
import { LABELS, SELECT_OPTIONS } from '../../utils/constants'

const defaultState = {
  equipmentId: '',
  providerId: '',
  calibrationDate: '',
  calibrationType: 'routine',
  status: 'pending',
  cost: '',
  resultsSummary: '',
  performedByUserId: '',
  environmentalConditions: {
    temperature: '',
    humidity: '',
  },
  certificateData: {
    issueDate: '',
    validityIntervalDays: 365,
    accreditationDeclaration: '',
    traceabilityStatement: '',
    performedBy: '',
    approvedBy: '',
    status: 'draft',
  },
}

const defaultParameter = {
  parameterName: '',
  nominalValue: '',
  measuredValue: '',
  unit: '',
  tolerance: '',
  uncertainty: '',
  passFail: true,
  remarks: '',
}

const CalibrationModal = ({
  visible,
  onClose,
  onSave,
  calibration,
  equipmentList = [],
  providers = [],
  referenceStandards = [],
}) => {
  const [formState, setFormState] = useState(defaultState)
  const [parameters, setParameters] = useState([defaultParameter])
  const [selectedStandards, setSelectedStandards] = useState([])

  useEffect(() => {
    if (calibration) {
      setFormState({
        ...defaultState,
        ...calibration,
        certificateData: {
          ...defaultState.certificateData,
          ...(calibration.certificateData || {}),
        },
      })
      setParameters(
        calibration.measurementParameters && calibration.measurementParameters.length > 0
          ? calibration.measurementParameters
          : [defaultParameter],
      )
      setSelectedStandards(calibration.referenceStandards || [])
    } else {
      setFormState(defaultState)
      setParameters([defaultParameter])
      setSelectedStandards([])
    }
  }, [calibration, visible])

  const handleChange = (field, value) => {
    setFormState((prev) => ({ ...prev, [field]: value }))
  }

  const handleCertificateChange = (field, value) => {
    setFormState((prev) => ({
      ...prev,
      certificateData: {
        ...prev.certificateData,
        [field]: value,
      },
    }))
  }

  const handleParameterChange = (index, field, value) => {
    setParameters((prev) => {
      const clone = [...prev]
      clone[index] = { ...clone[index], [field]: value }
      return clone
    })
  }

  const addParameter = () => {
    setParameters((prev) => [...prev, { ...defaultParameter }])
  }

  const removeParameter = (index) => {
    setParameters((prev) => prev.filter((_, idx) => idx !== index))
  }

  const toggleStandard = (standard) => {
    setSelectedStandards((prev) => {
      const exists = prev.find((item) => item.id === standard.id)
      if (exists) {
        return prev.filter((item) => item.id !== standard.id)
      }
      return [...prev, standard]
    })
  }

  const handleSubmit = () => {
    onSave({
      ...formState,
      equipmentId: Number(formState.equipmentId),
      providerId: formState.providerId ? Number(formState.providerId) : null,
      cost: formState.cost ? Number(formState.cost) : 0,
      measurementParameters: parameters.filter((param) => param.parameterName?.trim()),
      referenceStandards: selectedStandards,
    })
  }

  return (
    <CModal visible={visible} onClose={onClose} size="xl">
      <CModalHeader>
        <CModalTitle>{calibration ? 'Editar Calibração' : 'Nova Calibração'}</CModalTitle>
      </CModalHeader>
      <CModalBody>
        <CRow className="mb-3">
          <CCol md={6}>
            <CFormSelect
              label={`${LABELS.equipment} *`}
              value={formState.equipmentId}
              onChange={(e) => handleChange('equipmentId', e.target.value)}
              required
            >
              <option value="">Selecione...</option>
              {equipmentList.map((equipment) => (
                <option key={equipment.id} value={equipment.id}>
                  {equipment.internalCode} - {equipment.manufacturer} {equipment.model}
                </option>
              ))}
            </CFormSelect>
          </CCol>
          <CCol md={6}>
            <CFormSelect
              label={LABELS.provider}
              value={formState.providerId}
              onChange={(e) => handleChange('providerId', e.target.value)}
            >
              <option value="">Selecione...</option>
              {providers.map((provider) => (
                <option key={provider.id} value={provider.id}>
                  {provider.name}
                </option>
              ))}
            </CFormSelect>
          </CCol>
        </CRow>

        <CRow className="mb-3">
          <CCol md={4}>
            <CFormInput
              type="datetime-local"
              label={LABELS.calibrationDate}
              value={formState.calibrationDate}
              onChange={(e) => handleChange('calibrationDate', e.target.value)}
              required
            />
          </CCol>
          <CCol md={4}>
            <CFormSelect
              label={LABELS.calibrationType}
              value={formState.calibrationType}
              onChange={(e) => handleChange('calibrationType', e.target.value)}
            >
              {SELECT_OPTIONS.calibrationTypes.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </CFormSelect>
          </CCol>
          <CCol md={4}>
            <CFormSelect
              label={LABELS.calibrationStatus}
              value={formState.status}
              onChange={(e) => handleChange('status', e.target.value)}
            >
              {SELECT_OPTIONS.calibrationStatus.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </CFormSelect>
          </CCol>
        </CRow>

        <CRow className="mb-3">
          <CCol md={4}>
            <CFormInput
              type="number"
              label="Custo (R$)"
              value={formState.cost}
              onChange={(e) => handleChange('cost', e.target.value)}
              min="0"
              step="0.01"
            />
          </CCol>
          <CCol md={4}>
            <CFormInput
              label="Temperatura (°C)"
              value={formState.environmentalConditions.temperature || ''}
              onChange={(e) =>
                setFormState((prev) => ({
                  ...prev,
                  environmentalConditions: { ...prev.environmentalConditions, temperature: e.target.value },
                }))
              }
            />
          </CCol>
          <CCol md={4}>
            <CFormInput
              label="Umidade (%RH)"
              value={formState.environmentalConditions.humidity || ''}
              onChange={(e) =>
                setFormState((prev) => ({
                  ...prev,
                  environmentalConditions: { ...prev.environmentalConditions, humidity: e.target.value },
                }))
              }
            />
          </CCol>
        </CRow>

        <CFormTextarea
          label={LABELS.resultsSummary || 'Resumo dos Resultados'}
          rows={3}
          className="mb-4"
          value={formState.resultsSummary}
          onChange={(e) => handleChange('resultsSummary', e.target.value)}
        />

        <CCard className="mb-4">
          <CCardHeader className="d-flex justify-content-between align-items-center">
            <strong>{LABELS.measurementResults}</strong>
            <CButton size="sm" color="secondary" variant="outline" onClick={addParameter}>
              <CIcon icon={cilPlus} className="me-2" />
              Adicionar parâmetro
            </CButton>
          </CCardHeader>
          <CCardBody>
            <CTable hover responsive>
              <CTableHead>
                <CTableRow>
                  <CTableHeaderCell>{LABELS.measurementParameter}</CTableHeaderCell>
                  <CTableHeaderCell>{LABELS.nominalValue}</CTableHeaderCell>
                  <CTableHeaderCell>{LABELS.measuredValue}</CTableHeaderCell>
                  <CTableHeaderCell>{LABELS.unit}</CTableHeaderCell>
                  <CTableHeaderCell>{LABELS.tolerance}</CTableHeaderCell>
                  <CTableHeaderCell>{LABELS.uncertainty}</CTableHeaderCell>
                  <CTableHeaderCell>{LABELS.passFail}</CTableHeaderCell>
                  <CTableHeaderCell></CTableHeaderCell>
                </CTableRow>
              </CTableHead>
              <CTableBody>
                {parameters.map((param, index) => (
                  <CTableRow key={index}>
                    <CTableDataCell>
                      <CFormInput
                        value={param.parameterName}
                        onChange={(e) => handleParameterChange(index, 'parameterName', e.target.value)}
                        placeholder="Parâmetro"
                      />
                    </CTableDataCell>
                    <CTableDataCell>
                      <CFormInput
                        type="number"
                        value={param.nominalValue}
                        onChange={(e) => handleParameterChange(index, 'nominalValue', e.target.value)}
                      />
                    </CTableDataCell>
                    <CTableDataCell>
                      <CFormInput
                        type="number"
                        value={param.measuredValue}
                        onChange={(e) => handleParameterChange(index, 'measuredValue', e.target.value)}
                      />
                    </CTableDataCell>
                    <CTableDataCell>
                      <CFormInput value={param.unit} onChange={(e) => handleParameterChange(index, 'unit', e.target.value)} />
                    </CTableDataCell>
                    <CTableDataCell>
                      <CFormInput
                        type="number"
                        value={param.tolerance}
                        onChange={(e) => handleParameterChange(index, 'tolerance', e.target.value)}
                      />
                    </CTableDataCell>
                    <CTableDataCell>
                      <CFormInput
                        type="number"
                        value={param.uncertainty}
                        onChange={(e) => handleParameterChange(index, 'uncertainty', e.target.value)}
                      />
                    </CTableDataCell>
                    <CTableDataCell>
                      <CFormSelect
                        value={param.passFail ? 'true' : 'false'}
                        onChange={(e) => handleParameterChange(index, 'passFail', e.target.value === 'true')}
                      >
                        <option value="true">Aprovado</option>
                        <option value="false">Reprovado</option>
                      </CFormSelect>
                    </CTableDataCell>
                    <CTableDataCell>
                      <CButton
                        size="sm"
                        color="danger"
                        variant="ghost"
                        disabled={parameters.length === 1}
                        onClick={() => removeParameter(index)}
                      >
                        <CIcon icon={cilTrash} />
                      </CButton>
                    </CTableDataCell>
                  </CTableRow>
                ))}
              </CTableBody>
            </CTable>
          </CCardBody>
        </CCard>

        <CCard className="mb-4">
          <CCardHeader>
            <strong>Certificado</strong>
          </CCardHeader>
          <CCardBody>
            <CRow className="mb-3">
              <CCol md={4}>
                <CFormInput
                  type="date"
                  label={LABELS.issueDate}
                  value={formState.certificateData.issueDate}
                  onChange={(e) => handleCertificateChange('issueDate', e.target.value)}
                />
              </CCol>
              <CCol md={4}>
                <CFormInput
                  type="number"
                  label={LABELS.defaultInterval}
                  value={formState.certificateData.validityIntervalDays}
                  onChange={(e) => handleCertificateChange('validityIntervalDays', e.target.value)}
                />
              </CCol>
              <CCol md={4}>
                <CFormSelect
                  label={LABELS.statusCertificate}
                  value={formState.certificateData.status}
                  onChange={(e) => handleCertificateChange('status', e.target.value)}
                >
                  {SELECT_OPTIONS.certificateStatus.map((option) => (
                    <option key={option.value} value={option.value}>
                      {option.label}
                    </option>
                  ))}
                </CFormSelect>
              </CCol>
            </CRow>
            <CRow className="mb-3">
              <CCol md={6}>
                <CFormInput
                  label={LABELS.performedBy}
                  value={formState.certificateData.performedBy}
                  onChange={(e) => handleCertificateChange('performedBy', e.target.value)}
                />
              </CCol>
              <CCol md={6}>
                <CFormInput
                  label={LABELS.approvedBy || 'Aprovado por'}
                  value={formState.certificateData.approvedBy}
                  onChange={(e) => handleCertificateChange('approvedBy', e.target.value)}
                />
              </CCol>
            </CRow>
            <CFormTextarea
              label={LABELS.traceability}
              rows={2}
              className="mb-3"
              value={formState.certificateData.traceabilityStatement}
              onChange={(e) => handleCertificateChange('traceabilityStatement', e.target.value)}
            />
            <CFormTextarea
              label={LABELS.accreditation || 'Declaração de acreditação'}
              rows={2}
              value={formState.certificateData.accreditationDeclaration}
              onChange={(e) => handleCertificateChange('accreditationDeclaration', e.target.value)}
            />
          </CCardBody>
        </CCard>

        <CCard>
          <CCardHeader>
            <strong>Padrões de referência</strong>
          </CCardHeader>
          <CCardBody>
            <div className="d-flex flex-wrap gap-2">
              {referenceStandards.map((standard) => {
                const active = selectedStandards.find((item) => item.id === standard.id)
                return (
                  <CBadge
                    key={standard.id}
                    color={active ? 'primary' : 'secondary'}
                    style={{ cursor: 'pointer' }}
                    onClick={() => toggleStandard(standard)}
                  >
                    {standard.name}
                  </CBadge>
                )
              })}
            </div>
          </CCardBody>
        </CCard>
      </CModalBody>
      <CModalFooter>
        <CButton color="secondary" variant="ghost" onClick={onClose}>
          {LABELS.cancel}
        </CButton>
        <CButton color="primary" onClick={handleSubmit}>
          {LABELS.save}
        </CButton>
      </CModalFooter>
    </CModal>
  )
}

export default CalibrationModal

