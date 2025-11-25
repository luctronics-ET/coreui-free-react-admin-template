import React from 'react'
import { CFormInput, CFormSelect, CFormLabel, CRow, CCol, CFormTextarea } from '@coreui/react'
import { LABELS, SELECT_OPTIONS } from '../../utils/constants'

const EquipmentForm = ({ equipment, providers = [] }) => {
  return (
    <>
      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="internalCode">{LABELS.internalCode} *</CFormLabel>
          <CFormInput
            id="internalCode"
            name="internalCode"
            defaultValue={equipment?.internalCode || ''}
            required
            placeholder="Ex.: LAB-FT-001"
          />
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="assetType">{LABELS.assetType} *</CFormLabel>
          <CFormSelect id="assetType" name="assetType" defaultValue={equipment?.assetType || ''} required>
            <option value="">Selecione...</option>
            {SELECT_OPTIONS.assetTypes.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="manufacturer">{LABELS.manufacturer}</CFormLabel>
          <CFormInput
            id="manufacturer"
            name="manufacturer"
            defaultValue={equipment?.manufacturer || ''}
            placeholder="Fabricante"
          />
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="model">{LABELS.model}</CFormLabel>
          <CFormInput id="model" name="model" defaultValue={equipment?.model || ''} placeholder="Modelo" />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="serialNumber">{LABELS.serialNumber}</CFormLabel>
          <CFormInput id="serialNumber" name="serialNumber" defaultValue={equipment?.serialNumber || ''} />
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="classification">{LABELS.classification}</CFormLabel>
          <CFormSelect id="classification" name="classification" defaultValue={equipment?.classification || ''}>
            <option value="">Selecione...</option>
            {SELECT_OPTIONS.equipmentClassifications.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="providerId">{LABELS.provider}</CFormLabel>
          <CFormSelect id="providerId" name="providerId" defaultValue={equipment?.providerId || ''}>
            <option value="">Selecione...</option>
            {providers.map((provider) => (
              <option key={provider.value || provider.id} value={provider.value || provider.id}>
                {provider.label || provider.name}
              </option>
            ))}
          </CFormSelect>
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="providerContact">{LABELS.providerContact}</CFormLabel>
          <CFormInput id="providerContact" name="providerContact" defaultValue={equipment?.providerContact || ''} />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="location">{LABELS.location}</CFormLabel>
          <CFormInput id="location" name="location" defaultValue={equipment?.location || ''} />
        </CCol>
        <CCol md={3}>
          <CFormLabel htmlFor="acquisitionDate">{LABELS.acquisitionDate}</CFormLabel>
          <CFormInput
            type="date"
            id="acquisitionDate"
            name="acquisitionDate"
            defaultValue={equipment?.acquisitionDate || ''}
          />
        </CCol>
        <CCol md={3}>
          <CFormLabel htmlFor="calibrationDefaultIntervalDays">{LABELS.defaultInterval}</CFormLabel>
          <CFormInput
            type="number"
            min="30"
            id="calibrationDefaultIntervalDays"
            name="calibrationDefaultIntervalDays"
            defaultValue={equipment?.calibrationDefaultIntervalDays || 365}
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol md={6}>
          <CFormLabel htmlFor="status">{LABELS.status}</CFormLabel>
          <CFormSelect id="status" name="status" defaultValue={equipment?.status || 'active'}>
            {SELECT_OPTIONS.equipmentStatus.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </CFormSelect>
        </CCol>
        <CCol md={6}>
          <CFormLabel htmlFor="nextCalibrationDueDate">{LABELS.nextCalibration}</CFormLabel>
          <CFormInput
            type="date"
            id="nextCalibrationDueDate"
            name="nextCalibrationDueDate"
            defaultValue={equipment?.nextCalibrationDueDate?.split('T')[0] || ''}
          />
        </CCol>
      </CRow>

      <CRow className="mb-3">
        <CCol>
          <CFormLabel htmlFor="notes">{LABELS.notes || 'Observações'}</CFormLabel>
          <CFormTextarea id="notes" name="notes" rows="3" defaultValue={equipment?.notes || ''} />
        </CCol>
      </CRow>
    </>
  )
}

export default EquipmentForm