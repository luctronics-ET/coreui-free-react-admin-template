/**
 * Redis Service - Cliente para cache e sessões
 * Utiliza o container Redis do projeto Aguada (porta 6379)
 */

class RedisService {
  constructor() {
    this.host = import.meta.env.VITE_REDIS_HOST || 'localhost'
    this.port = import.meta.env.VITE_REDIS_PORT || 6379
    this.prefix = 'cmasm:'
    this.defaultTTL = 3600 // 1 hora em segundos
  }

  /**
   * Gera chave com prefixo do sistema
   */
  getKey(key) {
    return `${this.prefix}${key}`
  }

  /**
   * Armazena dados no cache
   * @param {string} key - Chave do cache
   * @param {any} value - Valor a ser armazenado
   * @param {number} ttl - Tempo de vida em segundos (padrão: 1 hora)
   */
  async set(key, value, ttl = this.defaultTTL) {
    try {
      const cacheKey = this.getKey(key)
      const data = JSON.stringify({
        value,
        timestamp: Date.now(),
        ttl,
      })

      // Armazena no localStorage como fallback (navegador)
      localStorage.setItem(cacheKey, data)
      
      // TODO: Implementar conexão HTTP com backend Redis quando disponível
      console.log(`[Redis] SET ${cacheKey} (TTL: ${ttl}s)`)
      return true
    } catch (error) {
      console.error('[Redis] Erro ao armazenar:', error)
      return false
    }
  }

  /**
   * Recupera dados do cache
   * @param {string} key - Chave do cache
   * @returns {any|null} - Valor armazenado ou null se expirado/inexistente
   */
  async get(key) {
    try {
      const cacheKey = this.getKey(key)
      const stored = localStorage.getItem(cacheKey)
      
      if (!stored) {
        return null
      }

      const { value, timestamp, ttl } = JSON.parse(stored)
      const age = (Date.now() - timestamp) / 1000 // idade em segundos

      // Verifica se expirou
      if (age > ttl) {
        await this.delete(key)
        return null
      }

      console.log(`[Redis] GET ${cacheKey} (age: ${age.toFixed(0)}s/${ttl}s)`)
      return value
    } catch (error) {
      console.error('[Redis] Erro ao recuperar:', error)
      return null
    }
  }

  /**
   * Remove dados do cache
   * @param {string} key - Chave do cache
   */
  async delete(key) {
    try {
      const cacheKey = this.getKey(key)
      localStorage.removeItem(cacheKey)
      console.log(`[Redis] DELETE ${cacheKey}`)
      return true
    } catch (error) {
      console.error('[Redis] Erro ao deletar:', error)
      return false
    }
  }

  /**
   * Limpa todo o cache do sistema
   */
  async flush() {
    try {
      const keys = Object.keys(localStorage)
      const systemKeys = keys.filter((k) => k.startsWith(this.prefix))
      
      systemKeys.forEach((key) => localStorage.removeItem(key))
      console.log(`[Redis] FLUSH ${systemKeys.length} chaves removidas`)
      return true
    } catch (error) {
      console.error('[Redis] Erro ao limpar cache:', error)
      return false
    }
  }

  /**
   * Cache de equipamentos
   */
  async cacheEquipment(equipment) {
    return this.set('equipment:all', equipment, 1800) // 30 minutos
  }

  async getEquipmentCache() {
    return this.get('equipment:all')
  }

  /**
   * Cache de calibrações
   */
  async cacheCalibrations(calibrations) {
    return this.set('calibrations:all', calibrations, 1800) // 30 minutos
  }

  async getCalibrationsCache() {
    return this.get('calibrations:all')
  }

  /**
   * Cache de dashboard
   */
  async cacheDashboard(stats) {
    return this.set('dashboard:stats', stats, 600) // 10 minutos
  }

  async getDashboardCache() {
    return this.get('dashboard:stats')
  }

  /**
   * Cache de sessão do usuário
   */
  async cacheUserSession(user) {
    return this.set('session:user', user, 86400) // 24 horas
  }

  async getUserSession() {
    return this.get('session:user')
  }

  async clearUserSession() {
    return this.delete('session:user')
  }
}

// Exporta instância única (Singleton)
const redisService = new RedisService()
export default redisService
