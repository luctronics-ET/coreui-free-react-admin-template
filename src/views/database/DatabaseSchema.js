import React, { useState, useEffect } from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CRow,
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CBadge,
  CFormSelect,
  CButton,
  CCollapse,
  CAlert,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilArrowTop, cilArrowBottom, cilStorage, cilList } from '@coreui/icons'
import { PageHeader } from '../../components/common'

const DatabaseSchema = () => {
  const [selectedTable, setSelectedTable] = useState('')
  const [expandedTables, setExpandedTables] = useState([])
  
  // Estrutura completa do banco de dados (obtida do MySQL)
  const databaseSchema = {
    audit_logs: [
      { name: 'id', type: 'bigint', key: 'PRI', extra: 'auto_increment' },
      { name: 'user_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'username', type: 'varchar', key: '', extra: '' },
      { name: 'action', type: 'varchar', key: 'MUL', extra: '' },
      { name: 'entity_type', type: 'varchar', key: 'MUL', extra: '' },
      { name: 'entity_id', type: 'int', key: '', extra: '' },
      { name: 'organization_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'ip_address', type: 'varchar', key: '', extra: '' },
      { name: 'user_agent', type: 'text', key: '', extra: '' },
      { name: 'old_values', type: 'json', key: '', extra: '' },
      { name: 'new_values', type: 'json', key: '', extra: '' },
      { name: 'changes_summary', type: 'text', key: '', extra: '' },
      { name: 'status', type: 'enum', key: '', extra: '' },
      { name: 'error_message', type: 'text', key: '', extra: '' },
      { name: 'created_at', type: 'timestamp', key: 'MUL', extra: 'DEFAULT_GENERATED' },
    ],
    calibrations: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'equipment_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'provider_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'laboratory_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'service_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'performed_by_user_id', type: 'int', key: '', extra: '' },
      { name: 'calibration_date', type: 'datetime', key: 'MUL', extra: '' },
      { name: 'scheduled_date', type: 'datetime', key: 'MUL', extra: '' },
      { name: 'calibration_type', type: 'enum', key: '', extra: '' },
      { name: 'calibration_method', type: 'varchar', key: '', extra: '' },
      { name: 'cost', type: 'decimal', key: '', extra: '' },
      { name: 'invoice_number', type: 'varchar', key: '', extra: '' },
      { name: 'status', type: 'enum', key: 'MUL', extra: '' },
      { name: 'results_summary', type: 'text', key: '', extra: '' },
      { name: 'pass_fail', type: 'tinyint', key: '', extra: '' },
      { name: 'certificate_id', type: 'int', key: '', extra: '' },
      { name: 'environmental_temperature', type: 'varchar', key: '', extra: '' },
      { name: 'environmental_humidity', type: 'varchar', key: '', extra: '' },
      { name: 'environmental_pressure', type: 'varchar', key: '', extra: '' },
      { name: 'notification_sent', type: 'tinyint', key: '', extra: '' },
      { name: 'notification_sent_at', type: 'datetime', key: '', extra: '' },
      { name: 'notes', type: 'text', key: '', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    certificates: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'certificate_number', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'calibration_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'issue_date', type: 'date', key: '', extra: '' },
      { name: 'validity_from', type: 'date', key: '', extra: '' },
      { name: 'validity_to', type: 'date', key: '', extra: '' },
      { name: 'accreditation_declaration', type: 'text', key: '', extra: '' },
      { name: 'traceability_statement', type: 'text', key: '', extra: '' },
      { name: 'performed_by', type: 'varchar', key: '', extra: '' },
      { name: 'approved_by', type: 'varchar', key: '', extra: '' },
      { name: 'status', type: 'varchar', key: 'MUL', extra: '' },
      { name: 'digital_signature', type: 'text', key: '', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    equipment: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'internal_code', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'manufacturer', type: 'varchar', key: 'MUL', extra: '' },
      { name: 'model', type: 'varchar', key: '', extra: '' },
      { name: 'serial_number', type: 'varchar', key: '', extra: '' },
      { name: 'category_1', type: 'enum', key: 'MUL', extra: '' },
      { name: 'category_2', type: 'varchar', key: '', extra: '' },
      { name: 'asset_type', type: 'varchar', key: '', extra: '' },
      { name: 'classification', type: 'varchar', key: '', extra: '' },
      { name: 'weight_grams', type: 'decimal', key: '', extra: '' },
      { name: 'dimensions', type: 'varchar', key: '', extra: '' },
      { name: 'accessories', type: 'text', key: '', extra: '' },
      { name: 'organization_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'location', type: 'varchar', key: '', extra: '' },
      { name: 'acquisition_date', type: 'date', key: '', extra: '' },
      { name: 'calibration_default_interval_days', type: 'int', key: '', extra: '' },
      { name: 'last_calibration_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'next_calibration_due_date', type: 'date', key: 'MUL', extra: '' },
      { name: 'is_calibrated', type: 'tinyint', key: 'MUL', extra: '' },
      { name: 'priority', type: 'enum', key: 'MUL', extra: '' },
      { name: 'status', type: 'enum', key: 'MUL', extra: '' },
      { name: 'provider_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'provider_contact', type: 'varchar', key: '', extra: '' },
      { name: 'notes', type: 'text', key: '', extra: '' },
      { name: 'created_by', type: 'int', key: '', extra: '' },
      { name: 'updated_by', type: 'int', key: '', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    laboratories: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'code', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'name', type: 'varchar', key: '', extra: '' },
      { name: 'type', type: 'enum', key: 'MUL', extra: '' },
      { name: 'contact_person', type: 'varchar', key: '', extra: '' },
      { name: 'phone', type: 'varchar', key: '', extra: '' },
      { name: 'email', type: 'varchar', key: '', extra: '' },
      { name: 'address', type: 'text', key: '', extra: '' },
      { name: 'is_accredited', type: 'tinyint', key: '', extra: '' },
      { name: 'accreditation_body', type: 'varchar', key: '', extra: '' },
      { name: 'accreditation_number', type: 'varchar', key: '', extra: '' },
      { name: 'accreditation_scope', type: 'text', key: '', extra: '' },
      { name: 'accreditation_valid_until', type: 'date', key: '', extra: '' },
      { name: 'specialties', type: 'json', key: '', extra: '' },
      { name: 'default_lead_time_days', type: 'int', key: '', extra: '' },
      { name: 'rating', type: 'decimal', key: '', extra: '' },
      { name: 'is_active', type: 'tinyint', key: 'MUL', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    organizations: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'code', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'name', type: 'varchar', key: '', extra: '' },
      { name: 'type', type: 'enum', key: 'MUL', extra: '' },
      { name: 'parent_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'responsible_officer', type: 'varchar', key: '', extra: '' },
      { name: 'contact_phone', type: 'varchar', key: '', extra: '' },
      { name: 'contact_email', type: 'varchar', key: '', extra: '' },
      { name: 'address', type: 'text', key: '', extra: '' },
      { name: 'is_active', type: 'tinyint', key: 'MUL', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    providers: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'laboratory_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'name', type: 'varchar', key: '', extra: '' },
      { name: 'contact', type: 'varchar', key: '', extra: '' },
      { name: 'phone', type: 'varchar', key: '', extra: '' },
      { name: 'email', type: 'varchar', key: '', extra: '' },
      { name: 'accreditation_body', type: 'varchar', key: '', extra: '' },
      { name: 'accreditation_number', type: 'varchar', key: '', extra: '' },
      { name: 'accreditation_scope', type: 'text', key: '', extra: '' },
      { name: 'address', type: 'text', key: '', extra: '' },
      { name: 'cnpj', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'contract_number', type: 'varchar', key: '', extra: '' },
      { name: 'contract_valid_until', type: 'date', key: '', extra: '' },
      { name: 'payment_terms', type: 'varchar', key: '', extra: '' },
      { name: 'rating', type: 'decimal', key: '', extra: '' },
      { name: 'total_services', type: 'int', key: '', extra: '' },
      { name: 'is_active', type: 'tinyint', key: 'MUL', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    services: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'service_number', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'service_type', type: 'enum', key: 'MUL', extra: '' },
      { name: 'equipment_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'calibration_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'requester_id', type: 'int', key: '', extra: '' },
      { name: 'requester_organization_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'executor_id', type: 'int', key: '', extra: '' },
      { name: 'executor_organization_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'requested_date', type: 'datetime', key: 'MUL', extra: '' },
      { name: 'start_date', type: 'datetime', key: '', extra: '' },
      { name: 'expected_completion_date', type: 'date', key: '', extra: '' },
      { name: 'actual_completion_date', type: 'datetime', key: '', extra: '' },
      { name: 'deadline_days', type: 'int', key: '', extra: '' },
      { name: 'instructions', type: 'text', key: '', extra: '' },
      { name: 'inputs', type: 'text', key: '', extra: '' },
      { name: 'outputs', type: 'text', key: '', extra: '' },
      { name: 'status', type: 'enum', key: 'MUL', extra: '' },
      { name: 'priority', type: 'enum', key: 'MUL', extra: '' },
      { name: 'estimated_cost', type: 'decimal', key: '', extra: '' },
      { name: 'actual_cost', type: 'decimal', key: '', extra: '' },
      { name: 'notes', type: 'text', key: '', extra: '' },
      { name: 'cancellation_reason', type: 'text', key: '', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
    users: [
      { name: 'id', type: 'int', key: 'PRI', extra: 'auto_increment' },
      { name: 'username', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'email', type: 'varchar', key: 'UNI', extra: '' },
      { name: 'password_hash', type: 'varchar', key: '', extra: '' },
      { name: 'full_name', type: 'varchar', key: '', extra: '' },
      { name: 'rank', type: 'varchar', key: '', extra: '' },
      { name: 'registration_number', type: 'varchar', key: '', extra: '' },
      { name: 'organization_id', type: 'int', key: 'MUL', extra: '' },
      { name: 'department', type: 'varchar', key: '', extra: '' },
      { name: 'position', type: 'varchar', key: '', extra: '' },
      { name: 'phone', type: 'varchar', key: '', extra: '' },
      { name: 'mobile', type: 'varchar', key: '', extra: '' },
      { name: 'role', type: 'enum', key: 'MUL', extra: '' },
      { name: 'permissions', type: 'json', key: '', extra: '' },
      { name: 'is_active', type: 'tinyint', key: 'MUL', extra: '' },
      { name: 'last_login', type: 'datetime', key: '', extra: '' },
      { name: 'digital_signature', type: 'text', key: '', extra: '' },
      { name: 'signature_certificate', type: 'text', key: '', extra: '' },
      { name: 'created_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED' },
      { name: 'updated_at', type: 'timestamp', key: '', extra: 'DEFAULT_GENERATED on update CURRENT_TIMESTAMP' },
    ],
  }

  const tableNames = Object.keys(databaseSchema).sort()
  const filteredColumns = selectedTable ? databaseSchema[selectedTable] : []

  const toggleTableExpansion = (tableName) => {
    setExpandedTables((prev) =>
      prev.includes(tableName)
        ? prev.filter((t) => t !== tableName)
        : [...prev, tableName],
    )
  }

  const getKeyBadge = (key) => {
    if (key === 'PRI') return <CBadge color="danger">PK</CBadge>
    if (key === 'UNI') return <CBadge color="info">UNIQUE</CBadge>
    if (key === 'MUL') return <CBadge color="warning">FK/INDEX</CBadge>
    return null
  }

  const stats = {
    totalTables: tableNames.length,
    totalColumns: Object.values(databaseSchema).reduce((sum, cols) => sum + cols.length, 0),
    primaryKeys: Object.values(databaseSchema).reduce(
      (sum, cols) => sum + cols.filter((c) => c.key === 'PRI').length,
      0,
    ),
    foreignKeys: Object.values(databaseSchema).reduce(
      (sum, cols) => sum + cols.filter((c) => c.key === 'MUL').length,
      0,
    ),
  }

  return (
    <>
      <PageHeader
        title="Estrutura do Banco de Dados"
        description="Visualização completa das tabelas e colunas do sistema CMASM"
      />

      {/* Estatísticas */}
      <CRow className="mb-4">
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-primary">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.totalTables}</div>
                <div>Tabelas</div>
              </div>
              <CIcon icon={cilStorage} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-info">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.totalColumns}</div>
                <div>Colunas</div>
              </div>
              <CIcon icon={cilList} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-danger">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.primaryKeys}</div>
                <div>Primary Keys</div>
              </div>
              <CIcon icon={cilArrowTop} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
        <CCol sm={6} lg={3}>
          <CCard className="text-white bg-warning">
            <CCardBody className="pb-0 d-flex justify-content-between align-items-start">
              <div>
                <div className="fs-4 fw-semibold">{stats.foreignKeys}</div>
                <div>Foreign Keys/Índices</div>
              </div>
              <CIcon icon={cilArrowBottom} size="xl" />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      {/* Seletor de Tabela */}
      <CCard className="mb-4">
        <CCardHeader>
          <strong>Selecionar Tabela</strong>
        </CCardHeader>
        <CCardBody>
          <CRow>
            <CCol md={6}>
              <CFormSelect
                value={selectedTable}
                onChange={(e) => setSelectedTable(e.target.value)}
              >
                <option value="">Selecione uma tabela...</option>
                {tableNames.map((table) => (
                  <option key={table} value={table}>
                    {table} ({databaseSchema[table].length} colunas)
                  </option>
                ))}
              </CFormSelect>
            </CCol>
          </CRow>

          {selectedTable && (
            <div className="mt-4">
              <h5>Tabela: {selectedTable}</h5>
              <CAlert color="info">
                Total de colunas: <strong>{filteredColumns.length}</strong>
              </CAlert>
              <CTable hover responsive striped>
                <CTableHead>
                  <CTableRow>
                    <CTableHeaderCell>#</CTableHeaderCell>
                    <CTableHeaderCell>Nome da Coluna</CTableHeaderCell>
                    <CTableHeaderCell>Tipo</CTableHeaderCell>
                    <CTableHeaderCell>Chave</CTableHeaderCell>
                    <CTableHeaderCell>Extra</CTableHeaderCell>
                  </CTableRow>
                </CTableHead>
                <CTableBody>
                  {filteredColumns.map((col, idx) => (
                    <CTableRow key={idx}>
                      <CTableDataCell>{idx + 1}</CTableDataCell>
                      <CTableDataCell>
                        <strong>{col.name}</strong>
                      </CTableDataCell>
                      <CTableDataCell>
                        <CBadge color="secondary">{col.type}</CBadge>
                      </CTableDataCell>
                      <CTableDataCell>{getKeyBadge(col.key)}</CTableDataCell>
                      <CTableDataCell>
                        <small className="text-muted">{col.extra}</small>
                      </CTableDataCell>
                    </CTableRow>
                  ))}
                </CTableBody>
              </CTable>
            </div>
          )}
        </CCardBody>
      </CCard>

      {/* Lista Completa de Tabelas */}
      <CCard>
        <CCardHeader>
          <strong>Todas as Tabelas do Sistema</strong>
        </CCardHeader>
        <CCardBody>
          {tableNames.map((tableName) => {
            const isExpanded = expandedTables.includes(tableName)
            const columns = databaseSchema[tableName]

            return (
              <div key={tableName} className="mb-3">
                <CButton
                  color="light"
                  className="w-100 text-start d-flex justify-content-between align-items-center"
                  onClick={() => toggleTableExpansion(tableName)}
                >
                  <div>
                    <strong>{tableName}</strong>
                    <CBadge color="primary" className="ms-2">
                      {columns.length} colunas
                    </CBadge>
                  </div>
                  <CIcon icon={isExpanded ? cilArrowTop : cilArrowBottom} />
                </CButton>

                <CCollapse visible={isExpanded}>
                  <CCard className="mt-2">
                    <CCardBody>
                      <CTable hover responsive size="sm">
                        <CTableHead>
                          <CTableRow>
                            <CTableHeaderCell>Coluna</CTableHeaderCell>
                            <CTableHeaderCell>Tipo</CTableHeaderCell>
                            <CTableHeaderCell>Chave</CTableHeaderCell>
                            <CTableHeaderCell>Extra</CTableHeaderCell>
                          </CTableRow>
                        </CTableHead>
                        <CTableBody>
                          {columns.map((col, idx) => (
                            <CTableRow key={idx}>
                              <CTableDataCell>
                                <strong>{col.name}</strong>
                              </CTableDataCell>
                              <CTableDataCell>
                                <CBadge color="secondary">{col.type}</CBadge>
                              </CTableDataCell>
                              <CTableDataCell>{getKeyBadge(col.key)}</CTableDataCell>
                              <CTableDataCell>
                                <small className="text-muted">{col.extra}</small>
                              </CTableDataCell>
                            </CTableRow>
                          ))}
                        </CTableBody>
                      </CTable>
                    </CCardBody>
                  </CCard>
                </CCollapse>
              </div>
            )
          })}
        </CCardBody>
      </CCard>
    </>
  )
}

export default DatabaseSchema
