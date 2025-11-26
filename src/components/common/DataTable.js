import React, { useState, useMemo } from 'react'
import {
  CTable,
  CTableBody,
  CTableDataCell,
  CTableHead,
  CTableHeaderCell,
  CTableRow,
  CButton,
  CInputGroup,
  CFormInput,
  CFormSelect,
  CPagination,
  CPaginationItem,
  CBadge,
  CSpinner,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilMagnifyingGlass, cilPencil, cilTrash, cilPlus, cilArrowTop, cilArrowBottom, cilSwapVertical } from '@coreui/icons'
import { formatDate, getBadgeColor, capitalize } from '../../utils/helpers'

const DataTable = ({
  data = [],
  columns = [],
  onEdit,
  onDelete,
  onCreate,
  onRowClick,
  loading = false,
  searchable = true,
  filterable = false,
  filters = {},
  onFilterChange,
  pagination = true,
  itemsPerPage = 10,
  actions = true,
  emptyMessage = 'Nenhum registro encontrado',
}) => {
  const [searchTerm, setSearchTerm] = useState('')
  const [currentPage, setCurrentPage] = useState(1)
  const [sortConfig, setSortConfig] = useState({ key: null, direction: 'asc' })

  // Filtrar dados
  const filteredData = useMemo(() => {
    let result = [...data]

    // Aplicar busca
    if (searchTerm) {
      result = result.filter((item) => {
        return columns.some((col) => {
          const value = col.accessor ? col.accessor(item) : item[col.key]
          return value?.toString().toLowerCase().includes(searchTerm.toLowerCase())
        })
      })
    }

    // Aplicar filtros
    if (filterable && filters) {
      Object.keys(filters).forEach((key) => {
        if (filters[key]) {
          result = result.filter((item) => {
            const value = item[key]
            return value === filters[key] || value?.toString().toLowerCase().includes(filters[key].toLowerCase())
          })
        }
      })
    }

    // Aplicar ordenação
    if (sortConfig.key) {
      result.sort((a, b) => {
        const aVal = sortConfig.accessor ? sortConfig.accessor(a) : a[sortConfig.key]
        const bVal = sortConfig.accessor ? sortConfig.accessor(b) : b[sortConfig.key]

        if (typeof aVal === 'string') {
          return sortConfig.direction === 'asc'
            ? aVal.localeCompare(bVal)
            : bVal.localeCompare(aVal)
        }

        return sortConfig.direction === 'asc' ? aVal - bVal : bVal - aVal
      })
    }

    return result
  }, [data, searchTerm, filters, sortConfig, columns, filterable])

  // Paginação
  const totalPages = Math.ceil(filteredData.length / itemsPerPage)
  const startIndex = (currentPage - 1) * itemsPerPage
  const endIndex = startIndex + itemsPerPage
  const paginatedData = pagination ? filteredData.slice(startIndex, endIndex) : filteredData

  const handleSort = (column) => {
    if (!column.sortable) return

    setSortConfig({
      key: column.key,
      accessor: column.accessor,
      direction: sortConfig.key === column.key && sortConfig.direction === 'asc' ? 'desc' : 'asc',
    })
  }

  const renderCell = (item, column) => {
    let value = column.accessor ? column.accessor(item) : item[column.key]

    if (column.render) {
      return column.render(value, item)
    }

    if (column.type === 'date') {
      return formatDate(value)
    }

    if (column.type === 'badge') {
      return (
        <CBadge color={getBadgeColor(value, column.badgeType)}>
          {capitalize(value)}
        </CBadge>
      )
    }

    if (column.type === 'boolean') {
      return value ? 'Sim' : 'Não'
    }

    return value || '-'
  }

  if (loading) {
    return (
      <div className="text-center py-5">
        <CSpinner color="primary" />
      </div>
    )
  }

  return (
    <div>
      {/* Barra de busca e ações */}
      <div className="d-flex justify-content-between align-items-center mb-3">
        <div className="d-flex gap-2" style={{ flex: 1 }}>
          {searchable && (
            <CInputGroup style={{ maxWidth: '300px' }}>
              <CFormInput
                placeholder="Buscar..."
                value={searchTerm}
                onChange={(e) => {
                  setSearchTerm(e.target.value)
                  setCurrentPage(1)
                }}
              />
              <CButton color="secondary" variant="outline">
                <CIcon icon={cilMagnifyingGlass} />
              </CButton>
            </CInputGroup>
          )}

          {filterable && onFilterChange && (
            <div className="d-flex gap-2">
              {Object.keys(filters).map((key) => (
                <CFormSelect
                  key={key}
                  value={filters[key] || ''}
                  onChange={(e) => onFilterChange({ ...filters, [key]: e.target.value })}
                  style={{ minWidth: '150px' }}
                >
                  <option value="">Todos</option>
                  {/* Opções de filtro devem ser passadas via props */}
                </CFormSelect>
              ))}
            </div>
          )}
        </div>

        {onCreate && (
          <CButton color="primary" onClick={onCreate}>
            <CIcon icon={cilPlus} className="me-2" />
            Novo
          </CButton>
        )}
      </div>

      {/* Tabela */}
      <CTable hover responsive>
        <CTableHead color="light">
          <CTableRow>
            {columns.map((column) => (
              <CTableHeaderCell
                key={column.key}
                style={{ 
                  cursor: column.sortable ? 'pointer' : 'default',
                  userSelect: 'none',
                }}
                onClick={() => handleSort(column)}
              >
                <div className="d-flex align-items-center justify-content-between">
                  <span>{column.label}</span>
                  {column.sortable && (
                    <CIcon 
                      icon={
                        sortConfig.key === column.key 
                          ? (sortConfig.direction === 'asc' ? cilArrowTop : cilArrowBottom)
                          : cilSwapVertical
                      } 
                      size="sm"
                      className={sortConfig.key === column.key ? 'text-primary' : 'text-muted'}
                    />
                  )}
                </div>
              </CTableHeaderCell>
            ))}
            {actions && (onEdit || onDelete) && (
              <CTableHeaderCell className="text-center">Ações</CTableHeaderCell>
            )}
          </CTableRow>
        </CTableHead>
        <CTableBody>
          {paginatedData.length === 0 ? (
            <CTableRow>
              <CTableDataCell colSpan={columns.length + (actions ? 1 : 0)} className="text-center py-5">
                {emptyMessage}
              </CTableDataCell>
            </CTableRow>
          ) : (
            paginatedData.map((item, index) => (
              <CTableRow
                key={item.id || index}
                style={{ cursor: onRowClick ? 'pointer' : 'default' }}
                onClick={() => onRowClick && onRowClick(item)}
              >
                {columns.map((column) => (
                  <CTableDataCell key={column.key}>
                    {renderCell(item, column)}
                  </CTableDataCell>
                ))}
                {actions && (onEdit || onDelete) && (
                  <CTableDataCell className="text-center">
                    <div className="d-flex gap-2 justify-content-center">
                      {onEdit && (
                        <CButton
                          color="primary"
                          variant="outline"
                          size="sm"
                          onClick={(e) => {
                            e.stopPropagation()
                            onEdit(item)
                          }}
                          title="Editar"
                        >
                          <CIcon icon={cilPencil} />
                        </CButton>
                      )}
                      {onDelete && (
                        <CButton
                          color="danger"
                          variant="outline"
                          size="sm"
                          onClick={(e) => {
                            e.stopPropagation()
                            onDelete(item)
                          }}
                          title="Excluir"
                        >
                          <CIcon icon={cilTrash} />
                        </CButton>
                      )}
                    </div>
                  </CTableDataCell>
                )}
              </CTableRow>
            ))
          )}
        </CTableBody>
      </CTable>

      {/* Paginação */}
      {pagination && totalPages > 1 && (
        <div className="d-flex justify-content-center mt-3">
          <CPagination>
            <CPaginationItem
              disabled={currentPage === 1}
              onClick={() => setCurrentPage(currentPage - 1)}
            >
              Anterior
            </CPaginationItem>
            {[...Array(totalPages)].map((_, i) => (
              <CPaginationItem
                key={i + 1}
                active={currentPage === i + 1}
                onClick={() => setCurrentPage(i + 1)}
              >
                {i + 1}
              </CPaginationItem>
            ))}
            <CPaginationItem
              disabled={currentPage === totalPages}
              onClick={() => setCurrentPage(currentPage + 1)}
            >
              Próxima
            </CPaginationItem>
          </CPagination>
        </div>
      )}

      {/* Info de resultados */}
      <div className="mt-2 text-muted small">
        Mostrando {startIndex + 1} - {Math.min(endIndex, filteredData.length)} de {filteredData.length} registros
      </div>
    </div>
  )
}

export default DataTable

