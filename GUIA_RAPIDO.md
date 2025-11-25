# Guia Rápido - Plataforma Administrativa

## 🚀 Início Rápido

### 1. Instalação
```bash
npm install
```

### 2. Executar
```bash
npm start
```

### 3. Acessar
Abra `http://localhost:3000` no navegador

## 📋 Módulos Disponíveis

### Usuários (`/users`)
- ✅ Listar, criar, editar e excluir usuários
- ✅ Busca e filtros (status, função)
- ✅ Paginação automática

### Tarefas (`/tasks`)
- ✅ Gerenciamento completo de tarefas
- ✅ Atribuição de responsáveis
- ✅ Prioridades e status
- ✅ Filtros avançados

### Calendário (`/calendar`)
- ✅ Visualização de eventos
- ✅ Criação e edição de eventos
- ✅ Tipos de eventos com cores
- ✅ Participantes

## 🎨 Componentes Principais

### DataTable
Tabela completa com busca, filtros e paginação:
```jsx
<DataTable
  data={data}
  columns={columns}
  onCreate={handleCreate}
  onEdit={handleEdit}
  onDelete={handleDelete}
/>
```

### ModalForm
Modal para formulários:
```jsx
<ModalForm
  visible={showModal}
  onClose={() => setShowModal(false)}
  title="Título"
  onSubmit={handleSubmit}
>
  {/* Formulário */}
</ModalForm>
```

### Notificações
```jsx
const { showSuccess, showError, NotificationContainer } = useNotification()

showSuccess('Operação realizada com sucesso!')
showError('Erro ao processar')

// No render:
<NotificationContainer />
```

## 🔧 Adicionar Novo Módulo (5 passos)

### 1. Criar estrutura
```
src/views/novo-modulo/
├── NovoModulo.js
└── NovoModuloForm.js
```

### 2. Adicionar serviço em `services/mockData.js`
```javascript
novoModulo: {
  getAll: () => Promise.resolve([...]),
  create: (data) => { /* ... */ },
  update: (id, data) => { /* ... */ },
  delete: (id) => { /* ... */ },
}
```

### 3. Adicionar rota em `src/routes.js`
```javascript
const NovoModulo = React.lazy(() => import('./views/novo-modulo/NovoModulo'))
{ path: '/novo-modulo', name: 'Novo Módulo', element: NovoModulo }
```

### 4. Adicionar menu em `src/_nav.js`
```javascript
{
  component: CNavItem,
  name: 'Novo Módulo',
  to: '/novo-modulo',
  icon: <CIcon icon={cilIcon} />,
}
```

### 5. Criar componente seguindo padrão existente
Use `Users.js` ou `Tasks.js` como referência.

## 📝 Padrões de Código

### Estrutura de Componente
```jsx
import React, { useState, useEffect } from 'react'
import { CCard, CCardBody } from '@coreui/react'
import { DataTable, ModalForm } from '../../components/common'
import { mockDataService } from '../../services/mockData'

const MeuModulo = () => {
  const [data, setData] = useState([])
  const [loading, setLoading] = useState(true)
  const [showModal, setShowModal] = useState(false)

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    setLoading(true)
    try {
      const result = await mockDataService.meuModulo.getAll()
      setData(result)
    } finally {
      setLoading(false)
    }
  }

  return (
    <CCard>
      <CCardBody>
        <DataTable
          data={data}
          columns={columns}
          loading={loading}
          onCreate={() => setShowModal(true)}
        />
      </CCardBody>
    </CCard>
  )
}
```

### Colunas da Tabela
```jsx
const columns = [
  {
    key: 'id',
    label: 'ID',
    sortable: true,
  },
  {
    key: 'name',
    label: 'Nome',
    sortable: true,
  },
  {
    key: 'status',
    label: 'Status',
    type: 'badge',
    sortable: true,
  },
  {
    key: 'createdAt',
    label: 'Data',
    type: 'date',
    sortable: true,
  },
]
```

## 🎯 Dicas

1. **Use os componentes reutilizáveis** - Mantém consistência
2. **Siga os padrões existentes** - Facilita manutenção
3. **Use constantes** - Não hardcode valores
4. **Valide formulários** - Use `validators.js`
5. **Mostre feedback** - Use notificações

## 📚 Recursos

- [Documentação CoreUI](https://coreui.io/react/docs/)
- [ESTRUTURA.md](./ESTRUTURA.md) - Documentação completa
- Componentes existentes como referência

## 🐛 Troubleshooting

### Erro ao iniciar
```bash
# Limpar cache e reinstalar
rm -rf node_modules package-lock.json
npm install
```

### Porta já em uso
```bash
# Usar outra porta
PORT=3001 npm start
```

### Erros de lint
```bash
npm run lint
```


