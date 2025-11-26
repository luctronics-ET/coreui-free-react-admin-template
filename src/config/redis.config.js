/**
 * Configuração do Redis
 * Container: aguada_redis (porta 6379)
 */

export const redisConfig = {
  host: import.meta.env.VITE_REDIS_HOST || 'localhost',
  port: parseInt(import.meta.env.VITE_REDIS_PORT || '6379', 10),
  password: import.meta.env.VITE_REDIS_PASSWORD || '',
  db: parseInt(import.meta.env.VITE_REDIS_DB || '0', 10),
  
  // Prefixo para chaves do sistema
  keyPrefix: 'cmasm:',
  
  // TTL padrão para diferentes tipos de dados (em segundos)
  ttl: {
    dashboard: 600, // 10 minutos
    equipment: 1800, // 30 minutos
    calibrations: 1800, // 30 minutos
    certificates: 3600, // 1 hora
    session: 86400, // 24 horas
    reports: 7200, // 2 horas
  },
  
  // Configurações de conexão
  connection: {
    retryStrategy: (times) => {
      const delay = Math.min(times * 50, 2000)
      return delay
    },
    reconnectOnError: (err) => {
      const targetError = 'READONLY'
      if (err.message.includes(targetError)) {
        return true
      }
      return false
    },
    enableReadyCheck: true,
    maxRetriesPerRequest: 3,
  },
  
  // Cache keys
  keys: {
    dashboard: 'dashboard:stats',
    equipment: 'equipment:all',
    calibrations: 'calibrations:all',
    certificates: 'certificates:all',
    userSession: (userId) => `session:user:${userId}`,
    equipmentDetail: (id) => `equipment:${id}`,
    calibrationDetail: (id) => `calibration:${id}`,
  },
}

export default redisConfig
