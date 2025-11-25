# Estrutura do Projeto - Plataforma Administrativa

Este documento descreve a estrutura modular da plataforma administrativa construída com CoreUI React.

## 📁 Estrutura de Diretórios

```
src/
├── components/          # Componentes reutilizáveis
│   ├── common/         # Componentes comuns (DataTable, ModalForm, ConfirmModal)
│   └── ...             # Outros componentes do CoreUI
├── hooks/              # Hooks customizados
│   └── useModuleData.js
├── layout/             # Layouts da aplicação
│   └── DefaultLayout.js
├── services/           # Serviços e APIs
│   ├── api.js         # Cliente HTTP genérico
│   └── mockData.js    # Dados mock para desenvolvimento
├── utils/              # Utilitários e constantes
│   ├── constants.js   # Constantes da aplicação
│   └── helpers.js     # Funções auxiliares
├── views/              # Views/Módulos da aplicação
│   ├── users/         # Módulo de Usuários
│   ├── tasks/         # Módulo de Tarefas
│   ├── calendar/      # Módulo de Calendário
│   └── ...            # Outros módulos do template
├── _nav.js            # Configuração de navegação
├── routes.js          # Configuração de rotas
├── store.js           # Redux store
└── App.js             # Componente principal
```

## 🧩 Módulos da Aplicação

### 1. Usuários (`/users`)

- **Localização**: `src/views/users/`
- **Componentes**:
  - `Users.js` - Lista e gerenciamento de usuários
  - `UserForm.js` - Formulário de criação/edição
- **Funcionalidades**:
  - Listar usuários com busca e filtros
  - Criar, editar e excluir usuários
  - Filtros por status e função
  - Paginação

### 2. Tarefas (`/tasks`)

- **Localização**: `src/views/tasks/`
- **Componentes**:
  - `Tasks.js` - Lista e gerenciamento de tarefas
  - `TaskForm.js` - Formulário de criação/edição
- **Funcionalidades**:
  - Listar tarefas com busca e filtros
  - Criar, editar e excluir tarefas
  - Atribuir responsáveis
  - Definir prioridades e status
  - Filtros por status e prioridade

### 3. Calendário (`/calendar`)

- **Localização**: `src/views/calendar/`
- **Componentes**:
  - `Calendar.js` - Visualização de eventos
  - `EventForm.js` - Formulário de criação/edição de eventos
- **Funcionalidades**:
  - Visualizar eventos agrupados por data
  - Criar, editar e excluir eventos
  - Adicionar participantes
  - Diferentes tipos de eventos com cores

## 🔧 Componentes Reutilizáveis

### DataTable

Componente de tabela genérico com:

- Busca
- Filtros
- Ordenação
- Paginação
- Ações (editar/excluir)

**Uso:**

```jsx
<DataTable
  data={users}
  columns={columns}
  onCreate={handleCreate}
  onEdit={handleEdit}
  onDelete={handleDelete}
  loading={loading}
/>
```

### ModalForm

Modal genérico para formulários.

**Uso:**

```jsx
<ModalForm
  visible={showModal}
  onClose={() => setShowModal(false)}
  title="Criar Usuário"
  onSubmit={handleSubmit}
>
  {/* Conteúdo do formulário */}
</ModalForm>
```

### ConfirmModal

Modal de confirmação para ações destrutivas.

**Uso:**

```jsx
<ConfirmModal
  visible={showDeleteModal}
  onClose={() => setShowDeleteModal(false)}
  onConfirm={handleDelete}
  title="Excluir Usuário"
  message="Tem certeza?"
/>
```

### PageHeader

Cabeçalho de página com título, descrição e ação opcional.

**Uso:**

```jsx
<PageHeader
  title="Usuários"
  description="Gerencie os usuários do sistema"
  actionLabel="Novo Usuário"
  onAction={handleCreate}
  showAction={true}
/>
```

## 📦 Serviços

### API Service (`services/api.js`)

Cliente HTTP genérico para comunicação com backend.

**Métodos:**

- `api.get(endpoint)`
- `api.post(endpoint, data)`
- `api.put(endpoint, data)`
- `api.delete(endpoint)`
- `api.patch(endpoint, data)`

### Mock Data Service (`services/mockData.js`)

Dados mock e serviços simulados para desenvolvimento.

**Serviços disponíveis:**

- `mockDataService.users`
- `mockDataService.tasks`
- `mockDataService.events`

## 🎯 Utilitários

### Constants (`utils/constants.js`)

Constantes reutilizáveis:

- Status e roles de usuários
- Status e prioridades de tarefas
- Tipos de eventos
- Labels traduzidos
- Opções para selects

### Helpers (`utils/helpers.js`)

Funções auxiliares:

- `formatDate()` - Formatação de datas
- `getStatusColor()` - Cores baseadas em status
- `capitalize()` - Capitalização
- `truncate()` - Truncar texto
- `isValidEmail()` - Validação de email
- `filterArray()` - Filtrar arrays
- `sortArray()` - Ordenar arrays
- `exportToCSV()` - Exportar para CSV

### Validators (`utils/validators.js`)

Validadores reutilizáveis para formulários:

```jsx
import { validators, validateForm } from '../utils/validators'

const rules = {
  email: [validators.required(), validators.email()],
  name: [validators.required(), validators.minLength(3)],
}

const { isValid, errors } = validateForm(formData, rules)
```

## 🔄 Gerenciamento de Estado

### Redux Store (`store.js`)

Estado global da aplicação:

- `sidebarShow` - Visibilidade da sidebar
- `theme` - Tema atual
- `users` - Estado do módulo de usuários
- `tasks` - Estado do módulo de tarefas
- `events` - Estado do módulo de eventos
- `auth` - Estado de autenticação

### App Context (`context/AppContext.js`)

Contexto React para compartilhar dados entre componentes:

```jsx
import { useApp } from '../context/AppContext'

const { users, tasks, events, loading, refreshUsers, refreshAll } = useApp()
```

### Hook useModuleData (`hooks/useModuleData.js`)

Hook customizado para gerenciar dados de módulos:

```jsx
const { data, loading, error, loadData, createItem, updateItem, deleteItem } = 
  useModuleData('users', mockDataService.users)
```

### Hook useNotification (`hooks/useNotification.js`)

Hook para exibir notificações/toasts:

```jsx
const { showSuccess, showError, showWarning, showInfo, NotificationContainer } = useNotification()

// No componente:
showSuccess('Usuário criado com sucesso!')
showError('Erro ao salvar dados')

// No render:
<NotificationContainer />
```

## ➕ Como Adicionar um Novo Módulo

### 1. Criar estrutura de pastas

```
src/views/novo-modulo/
├── NovoModulo.js
└── NovoModuloForm.js
```

### 2. Criar componentes

- **NovoModulo.js**: Componente principal com lista e gerenciamento
- **NovoModuloForm.js**: Formulário de criação/edição

### 3. Adicionar serviço

Em `services/mockData.js`:

```javascript
export const mockNovoModulo = [...]
export const mockDataService = {
  // ... outros serviços
  novoModulo: {
    getAll: () => Promise.resolve([...mockNovoModulo]),
    getById: (id) => Promise.resolve(mockNovoModulo.find(item => item.id === id)),
    create: (data) => { /* ... */ },
    update: (id, data) => { /* ... */ },
    delete: (id) => { /* ... */ },
  }
}
```

### 4. Adicionar rotas

Em `src/routes.js`:

```javascript
const NovoModulo = React.lazy(() => import('./views/novo-modulo/NovoModulo'))

// No array routes:
{ path: '/novo-modulo', name: 'Novo Módulo', element: NovoModulo },
```

### 5. Adicionar navegação

Em `src/_nav.js`:

```javascript
import { cilIcon } from '@coreui/icons'

// No array _nav:
{
  component: CNavItem,
  name: 'Novo Módulo',
  to: '/novo-modulo',
  icon: <CIcon icon={cilIcon} customClassName="nav-icon" />,
}
```

### 6. Adicionar constantes (se necessário)

Em `utils/constants.js`:

```javascript
export const NOVO_MODULO_STATUS = {
  ATIVO: 'ativo',
  INATIVO: 'inativo',
}
```

## 🚀 Executando o Projeto

```bash
# Instalar dependências
npm install

# Executar em desenvolvimento
npm start

# Build para produção
npm run build
```

## 📝 Notas Importantes

1. **Dados Mock**: Os dados estão sendo simulados em `mockData.js`. Para usar uma API real, substitua as chamadas em `mockDataService` por chamadas ao `api` service.

2. **Componentes Reutilizáveis**: Sempre que possível, use os componentes em `components/common/` para manter consistência.

3. **Constantes**: Use as constantes em `utils/constants.js` ao invés de valores hardcoded.

4. **Helpers**: Utilize as funções em `utils/helpers.js` para operações comuns.

5. **Estado Global**: Para dados compartilhados entre módulos, use o Redux store. Para estado local, use `useState`.

## 🔐 Autenticação

O sistema está preparado para autenticação. O token é armazenado em `localStorage` e adicionado automaticamente nas requisições via `api.js`.

## 🎨 Personalização

- **Temas**: Configurado em `store.js` e gerenciado pelo CoreUI
- **Cores**: Definidas em `utils/constants.js` (EVENT_COLORS)
- **Labels**: Traduzidos em `utils/constants.js` (LABELS)

## 📚 Documentação Adicional

- [CoreUI React Documentation](https://coreui.io/react/docs/)
- [React Router](https://reactrouter.com/)
- [Redux](https://redux.js.org/)
