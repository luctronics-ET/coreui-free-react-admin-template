import React, { useState } from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CButton,
  CAlert,
  CSpinner,
  CRow,
  CCol,
  CTable,
  CTableHead,
  CTableRow,
  CTableHeaderCell,
  CTableBody,
  CTableDataCell,
  CProgress,
  CFormInput,
  CBadge,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import {
  cilCloudDownload,
  cilCloudUpload,
  cilCheckCircle,
  cilWarning,
  cilSpreadsheet,
} from '@coreui/icons'
import * as XLSX from 'xlsx'

const DataImportExport = () => {
  const [importing, setImporting] = useState(false)
  const [exporting, setExporting] = useState(false)
  const [importResult, setImportResult] = useState(null)
  const [exportResult, setExportResult] = useState(null)
  const [importProgress, setImportProgress] = useState(0)
  const [previewData, setPreviewData] = useState([])

  // Mapeia colunas do ODS para campos do banco
  const columnMapping = {
    // Variações de "Patrimônio/Código Interno"
    patrimonio: 'internal_code',
    codigo: 'internal_code',
    'codigo_interno': 'internal_code',
    'cod_interno': 'internal_code',
    
    // Variações de "Equipamento/Descrição"
    equipamento: 'asset_type',
    instrumento: 'asset_type',
    descricao: 'asset_type',
    tipo: 'asset_type',
    
    // Variações de "Fabricante/Marca"
    fabricante: 'manufacturer',
    marca: 'manufacturer',
    
    // Modelo
    modelo: 'model',
    
    // Variações de "Número de Série"
    serie: 'serial_number',
    'numero_serie': 'serial_number',
    'n_serie': 'serial_number',
    'serial': 'serial_number',
    'ns': 'serial_number',
    
    // Localização
    localizacao: 'location',
    local: 'location',
    setor: 'location',
    
    // Datas de calibração
    'ultima_calibracao': 'last_calibration_date',
    'data_calibracao': 'last_calibration_date',
    'dt_calibracao': 'last_calibration_date',
    
    'proxima_calibracao': 'next_calibration_due_date',
    'vencimento': 'next_calibration_due_date',
    'validade': 'next_calibration_due_date',
    
    // Responsável
    responsavel: 'responsible_officer',
    resp: 'responsible_officer',
    
    // Observações
    observacoes: 'observations',
    obs: 'observations',
    notas: 'observations',
  }

  // Normaliza nome de coluna
  const normalizeColumnName = (name) => {
    return name
      .toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '') // Remove acentos
      .replace(/[^a-z0-9_]/g, '_')
      .replace(/_+/g, '_')
      .replace(/^_|_$/g, '')
  }

  // Parse de data em vários formatos
  const parseDate = (dateValue) => {
    if (!dateValue) return null

    // Se já é Date object
    if (dateValue instanceof Date) {
      return dateValue.toISOString().split('T')[0]
    }

    // Se é número (Excel date serial)
    if (typeof dateValue === 'number') {
      const excelEpoch = new Date(1899, 11, 30)
      const date = new Date(excelEpoch.getTime() + dateValue * 86400000)
      return date.toISOString().split('T')[0]
    }

    // Se é string
    const dateStr = String(dateValue).trim()
    if (!dateStr) return null

    // Tentar vários formatos
    const formats = [
      /^(\d{2})\/(\d{2})\/(\d{4})$/, // DD/MM/YYYY
      /^(\d{2})\/(\d{2})\/(\d{2})$/, // DD/MM/YY
      /^(\d{4})-(\d{2})-(\d{2})$/, // YYYY-MM-DD
    ]

    for (const format of formats) {
      const match = dateStr.match(format)
      if (match) {
        if (format === formats[0]) {
          // DD/MM/YYYY
          return `${match[3]}-${match[2]}-${match[1]}`
        } else if (format === formats[1]) {
          // DD/MM/YY
          const year = parseInt(match[3])
          const fullYear = year < 50 ? 2000 + year : 1900 + year
          return `${fullYear}-${match[2]}-${match[1]}`
        } else {
          // YYYY-MM-DD
          return dateStr
        }
      }
    }

    return null
  }

  // Importar arquivo ODS/XLSX
  const handleFileImport = async (e) => {
    const file = e.target.files[0]
    if (!file) return

    setImporting(true)
    setImportProgress(0)
    setImportResult(null)

    try {
      const data = await file.arrayBuffer()
      const workbook = XLSX.read(data)

      // Primeira planilha
      const sheetName = workbook.SheetNames[0]
      const worksheet = workbook.Sheets[sheetName]

      // Converter para JSON
      const jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1 })

      // Encontrar linha de cabeçalho
      let headerRowIndex = -1
      for (let i = 0; i < Math.min(10, jsonData.length); i++) {
        const row = jsonData[i]
        const rowText = row.join(' ').toLowerCase()
        if (
          rowText.includes('patrimonio') ||
          rowText.includes('codigo') ||
          rowText.includes('equipamento')
        ) {
          headerRowIndex = i
          break
        }
      }

      if (headerRowIndex === -1) {
        headerRowIndex = 0 // Usar primeira linha
      }

      const headers = jsonData[headerRowIndex].map((h) => normalizeColumnName(String(h || '')))

      // Processar dados
      const equipments = []
      const errors = []

      for (let i = headerRowIndex + 1; i < jsonData.length; i++) {
        const row = jsonData[i]

        // Pular linhas vazias
        if (!row || row.every((cell) => !cell)) continue

        const equipment = {}
        let hasData = false

        headers.forEach((header, idx) => {
          const fieldName = columnMapping[header]
          if (fieldName && row[idx]) {
            const value = row[idx]

            // Parse de datas
            if (fieldName.includes('date')) {
              equipment[fieldName] = parseDate(value)
            } else {
              equipment[fieldName] = String(value).trim()
            }

            hasData = true
          }
        })

        if (hasData) {
          // Validar dados mínimos
          if (!equipment.internal_code && !equipment.asset_type) {
            errors.push({
              line: i + 1,
              error: 'Linha sem código interno nem descrição',
              data: row,
            })
          } else {
            equipment.lineNumber = i + 1
            equipments.push(equipment)
          }
        }

        // Atualizar progresso
        setImportProgress(Math.floor(((i - headerRowIndex) / jsonData.length) * 100))
      }

      setPreviewData(equipments.slice(0, 10)) // Preview dos primeiros 10

      setImportResult({
        success: true,
        total: equipments.length,
        errors: errors.length,
        data: equipments,
        errorDetails: errors,
      })

      setImportProgress(100)
    } catch (error) {
      setImportResult({
        success: false,
        error: error.message,
      })
    } finally {
      setImporting(false)
    }
  }

  // Confirmar importação (enviar para API)
  const confirmImport = async () => {
    if (!importResult?.data) return

    try {
      // TODO: Enviar para API
      // await api.post('/equipment/import', importResult.data)

      // Por enquanto, apenas simular
      console.log('Importando equipamentos:', importResult.data)

      setImportResult({
        ...importResult,
        imported: true,
        message: `${importResult.total} equipamentos importados com sucesso!`,
      })
    } catch (error) {
      setImportResult({
        ...importResult,
        error: error.message,
      })
    }
  }

  // Exportar dados para ODS/XLSX
  const handleExport = async () => {
    setExporting(true)
    setExportResult(null)

    try {
      // TODO: Buscar dados da API
      // const response = await api.get('/equipment')
      // const equipments = response.data

      // Mock data para exemplo
      const equipments = [
        {
          internal_code: 'MULT-001',
          asset_type: 'Multímetro Digital',
          manufacturer: 'Fluke',
          model: '87V',
          serial_number: '12345678',
          location: 'Bancada 01',
          last_calibration_date: '2024-06-15',
          next_calibration_due_date: '2025-06-15',
        },
      ]

      // Criar workbook
      const ws_data = [
        [
          'Código Interno',
          'Equipamento',
          'Fabricante',
          'Modelo',
          'Nº Série',
          'Localização',
          'Última Calibração',
          'Próxima Calibração',
          'Status',
        ],
      ]

      equipments.forEach((eq) => {
        ws_data.push([
          eq.internal_code || '',
          eq.asset_type || '',
          eq.manufacturer || '',
          eq.model || '',
          eq.serial_number || '',
          eq.location || '',
          eq.last_calibration_date || '',
          eq.next_calibration_due_date || '',
          eq.status || 'active',
        ])
      })

      const ws = XLSX.utils.aoa_to_sheet(ws_data)
      const wb = XLSX.utils.book_new()
      XLSX.utils.book_append_sheet(wb, ws, 'Equipamentos')

      // Baixar arquivo
      const fileName = `equipamentos_cmasm_${new Date().toISOString().split('T')[0]}.xlsx`
      XLSX.writeFile(wb, fileName)

      setExportResult({
        success: true,
        total: equipments.length,
        fileName,
      })
    } catch (error) {
      setExportResult({
        success: false,
        error: error.message,
      })
    } finally {
      setExporting(false)
    }
  }

  return (
    <div>
      <CRow>
        <CCol md={6}>
          {/* IMPORTAÇÃO */}
          <CCard className="mb-4">
            <CCardHeader>
              <strong>
                <CIcon icon={cilCloudUpload} className="me-2" />
                Importar Equipamentos (.ods / .xlsx)
              </strong>
            </CCardHeader>
            <CCardBody>
              <p className="text-medium-emphasis small">
                Faça upload de uma planilha ODS ou XLSX com os dados dos equipamentos. O sistema
                reconhece automaticamente as colunas: Patrimônio, Equipamento, Fabricante, Modelo,
                Nº Série, Localização, Datas de Calibração, etc.
              </p>

              <CFormInput
                type="file"
                accept=".ods,.xlsx,.xls"
                onChange={handleFileImport}
                disabled={importing}
                className="mb-3"
              />

              {importing && (
                <div className="mb-3">
                  <CProgress value={importProgress} className="mb-2" />
                  <div className="text-center small text-medium-emphasis">
                    Processando... {importProgress}%
                  </div>
                </div>
              )}

              {importResult && (
                <>
                  {importResult.success ? (
                    <CAlert color="success" className="d-flex align-items-center">
                      <CIcon icon={cilCheckCircle} className="flex-shrink-0 me-2" />
                      <div>
                        <strong>Arquivo processado!</strong>
                        <div className="small">
                          {importResult.total} equipamentos encontrados
                          {importResult.errors > 0 && ` (${importResult.errors} erros)`}
                        </div>
                      </div>
                    </CAlert>
                  ) : (
                    <CAlert color="danger">
                      <CIcon icon={cilWarning} className="me-2" />
                      Erro: {importResult.error}
                    </CAlert>
                  )}

                  {importResult.success && !importResult.imported && (
                    <CButton color="primary" onClick={confirmImport} className="mt-2">
                      Confirmar e Importar {importResult.total} Equipamentos
                    </CButton>
                  )}

                  {importResult.imported && (
                    <CAlert color="info" className="mt-3">
                      {importResult.message}
                    </CAlert>
                  )}
                </>
              )}
            </CCardBody>
          </CCard>
        </CCol>

        <CCol md={6}>
          {/* EXPORTAÇÃO */}
          <CCard className="mb-4">
            <CCardHeader>
              <strong>
                <CIcon icon={cilCloudDownload} className="me-2" />
                Exportar Equipamentos
              </strong>
            </CCardHeader>
            <CCardBody>
              <p className="text-medium-emphasis small">
                Exporta todos os equipamentos cadastrados no sistema para uma planilha XLSX,
                incluindo dados de calibração e análises.
              </p>

              <CButton
                color="success"
                onClick={handleExport}
                disabled={exporting}
                className="w-100"
              >
                {exporting ? (
                  <>
                    <CSpinner size="sm" className="me-2" />
                    Exportando...
                  </>
                ) : (
                  <>
                    <CIcon icon={cilSpreadsheet} className="me-2" />
                    Exportar para Excel
                  </>
                )}
              </CButton>

              {exportResult && (
                <>
                  {exportResult.success ? (
                    <CAlert color="success" className="mt-3">
                      <CIcon icon={cilCheckCircle} className="me-2" />
                      <strong>{exportResult.total} equipamentos</strong> exportados para{' '}
                      <code>{exportResult.fileName}</code>
                    </CAlert>
                  ) : (
                    <CAlert color="danger" className="mt-3">
                      <CIcon icon={cilWarning} className="me-2" />
                      Erro: {exportResult.error}
                    </CAlert>
                  )}
                </>
              )}
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      {/* Preview dos dados importados */}
      {previewData.length > 0 && (
        <CCard>
          <CCardHeader>
            <strong>Preview dos Dados Importados</strong>
            <CBadge color="info" className="ms-2">
              Mostrando {previewData.length} de {importResult?.total}
            </CBadge>
          </CCardHeader>
          <CCardBody>
            <div className="table-responsive">
              <CTable striped hover>
                <CTableHead>
                  <CTableRow>
                    <CTableHeaderCell>Linha</CTableHeaderCell>
                    <CTableHeaderCell>Código</CTableHeaderCell>
                    <CTableHeaderCell>Equipamento</CTableHeaderCell>
                    <CTableHeaderCell>Fabricante</CTableHeaderCell>
                    <CTableHeaderCell>Modelo</CTableHeaderCell>
                    <CTableHeaderCell>Série</CTableHeaderCell>
                    <CTableHeaderCell>Local</CTableHeaderCell>
                  </CTableRow>
                </CTableHead>
                <CTableBody>
                  {previewData.map((item, idx) => (
                    <CTableRow key={idx}>
                      <CTableDataCell>{item.lineNumber}</CTableDataCell>
                      <CTableDataCell>{item.internal_code || '-'}</CTableDataCell>
                      <CTableDataCell>{item.asset_type || '-'}</CTableDataCell>
                      <CTableDataCell>{item.manufacturer || '-'}</CTableDataCell>
                      <CTableDataCell>{item.model || '-'}</CTableDataCell>
                      <CTableDataCell>{item.serial_number || '-'}</CTableDataCell>
                      <CTableDataCell>{item.location || '-'}</CTableDataCell>
                    </CTableRow>
                  ))}
                </CTableBody>
              </CTable>
            </div>
          </CCardBody>
        </CCard>
      )}
    </div>
  )
}

export default DataImportExport
