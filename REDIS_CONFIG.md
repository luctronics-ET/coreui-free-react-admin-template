# Configuração Redis - CMASM

## Container Existente
O projeto utiliza o container Redis do sistema Aguada:
- **Container**: `aguada_redis`
- **Imagem**: `redis:7-alpine`
- **Porta**: `6379` (mapeada para localhost:6379)
- **Status**: ✅ Rodando (healthy)

## Teste de Conexão
```bash
docker exec aguada_redis redis-cli PING
# Resultado esperado: PONG
```

## Configuração no React

### Variáveis de Ambiente (.env)
```env
VITE_REDIS_HOST=localhost
VITE_REDIS_PORT=6379
VITE_REDIS_PASSWORD=
VITE_REDIS_DB=0
```

### Serviço Redis (`src/services/redis.js`)
Cliente Redis implementado com:
- ✅ Cache de equipamentos (TTL: 30 min)
- ✅ Cache de calibrações (TTL: 30 min)
- ✅ Cache de dashboard (TTL: 10 min)
- ✅ Sessão de usuário (TTL: 24h)
- ✅ Fallback para localStorage (navegador)

### Configuração (`src/config/redis.config.js`)
Configurações centralizadas com:
- Prefixo de chaves: `cmasm:`
- TTLs configuráveis por tipo de dado
- Estratégias de retry e reconexão

## Uso no Código

### Exemplo 1: Cache de Equipamentos
```javascript
import redisService from '@/services/redis'

// Armazenar
await redisService.cacheEquipment(equipmentList)

// Recuperar
const cached = await redisService.getEquipmentCache()
if (cached) {
  setEquipment(cached)
} else {
  // Buscar do banco e cachear
  const data = await api.get('/equipment')
  await redisService.cacheEquipment(data)
}
```

### Exemplo 2: Sessão do Usuário
```javascript
// Login
const user = await api.post('/login', credentials)
await redisService.cacheUserSession(user)

// Verificar sessão
const session = await redisService.getUserSession()
if (!session) {
  navigate('/login')
}

// Logout
await redisService.clearUserSession()
```

### Exemplo 3: Cache Genérico
```javascript
// Armazenar com TTL customizado (5 minutos)
await redisService.set('my-key', data, 300)

// Recuperar
const data = await redisService.get('my-key')

// Deletar
await redisService.delete('my-key')

// Limpar todo cache do sistema
await redisService.flush()
```

## Comandos Úteis

### Verificar dados no Redis
```bash
# Listar todas as chaves do sistema
docker exec aguada_redis redis-cli KEYS "cmasm:*"

# Ver valor de uma chave
docker exec aguada_redis redis-cli GET "cmasm:equipment:all"

# Ver TTL de uma chave
docker exec aguada_redis redis-cli TTL "cmasm:dashboard:stats"

# Limpar todas as chaves do sistema
docker exec aguada_redis redis-cli KEYS "cmasm:*" | xargs docker exec aguada_redis redis-cli DEL
```

### Monitorar Redis
```bash
# Ver comandos em tempo real
docker exec -it aguada_redis redis-cli MONITOR

# Informações do servidor
docker exec aguada_redis redis-cli INFO

# Estatísticas
docker exec aguada_redis redis-cli INFO stats
```

## Estrutura de Chaves

```
cmasm:
├── dashboard:stats              # Estatísticas do dashboard
├── equipment:all                # Lista de equipamentos
├── equipment:{id}               # Detalhes de equipamento específico
├── calibrations:all             # Lista de calibrações
├── calibration:{id}             # Detalhes de calibração específica
├── certificates:all             # Lista de certificados
└── session:user:{id}            # Sessão do usuário
```

## Integração Futura com Backend

Quando o backend estiver disponível, atualizar `src/services/redis.js`:

```javascript
// Substituir localStorage por chamadas HTTP ao backend
async set(key, value, ttl) {
  const response = await fetch(`${API_URL}/cache/set`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ key, value, ttl })
  })
  return response.ok
}
```

## Benefícios

1. **Performance**: Reduz carga no banco de dados MySQL
2. **Velocidade**: Respostas instantâneas para dados frequentes
3. **Escalabilidade**: Desacopla frontend de requisições pesadas
4. **Sessões**: Gerenciamento eficiente de autenticação
5. **Cache Inteligente**: TTLs ajustáveis por tipo de dado

## Próximos Passos

- [ ] Implementar backend API com conexão Redis
- [ ] Adicionar invalidação de cache por eventos
- [ ] Implementar pub/sub para notificações em tempo real
- [ ] Adicionar Redis Sentinel para alta disponibilidade
- [ ] Configurar Redis Cluster para produção
