/**
 * Agente Inteligente de Otimização de Calibrações
 * 
 * Responsabilidades:
 * 1. Analisar equipamentos e suas datas de vencimento
 * 2. Identificar equipamentos redundantes/duplicados
 * 3. Otimizar cronograma para maximizar tempo calibrado
 * 4. Minimizar custos através de agendamento inteligente
 * 5. Garantir continuidade operacional
 */

import { addDays, differenceInDays, parseISO, format, isBefore, isAfter, startOfDay } from 'date-fns'

/**
 * Classe do Agente Otimizador de Calibrações
 */
export class CalibrationOptimizerAgent {
  constructor() {
    this.equipmentGroups = new Map() // Grupos de equipamentos similares
    this.calibrationSchedule = [] // Cronograma otimizado
    this.costSavings = 0 // Economia estimada
    this.coverageMetrics = {} // Métricas de cobertura
  }

  /**
   * Analisa equipamentos e cria grupos de redundância
   * Equipamentos do mesmo tipo/função são agrupados
   */
  analyzeEquipment(equipmentList) {
    this.equipmentGroups.clear()
    
    equipmentList.forEach(equipment => {
      // Criar chave única baseada em tipo, função e especificações
      const groupKey = this.generateGroupKey(equipment)
      
      if (!this.equipmentGroups.has(groupKey)) {
        this.equipmentGroups.set(groupKey, {
          type: equipment.assetType,
          classification: equipment.classification,
          manufacturer: equipment.manufacturer,
          model: equipment.model,
          items: [],
          requiredCoverage: 1, // Mínimo de equipamentos calibrados necessários
        })
      }
      
      const group = this.equipmentGroups.get(groupKey)
      group.items.push({
        id: equipment.id,
        internalCode: equipment.internalCode,
        nextCalibrationDue: equipment.nextCalibrationDueDate,
        calibrationInterval: equipment.calibrationDefaultIntervalDays || 365,
        status: equipment.status,
        location: equipment.location,
        lastCalibration: equipment.lastCalibrationId,
      })
    })

    return this.getAnalysisReport()
  }

  /**
   * Gera chave de grupo para equipamentos similares
   */
  generateGroupKey(equipment) {
    // Equipamentos são considerados similares se:
    // - Mesmo tipo de ativo
    // - Mesma classificação
    // - Mesmo fabricante e modelo (opcional)
    
    const typeKey = equipment.assetType || 'unknown'
    const classKey = equipment.classification || 'unknown'
    
    // Para equipamentos idênticos (mesmo fabricante/modelo)
    if (equipment.manufacturer && equipment.model) {
      return `${typeKey}_${classKey}_${equipment.manufacturer}_${equipment.model}`.toLowerCase()
    }
    
    // Para equipamentos do mesmo tipo/classe
    return `${typeKey}_${classKey}`.toLowerCase()
  }

  /**
   * Otimiza o cronograma de calibrações
   */
  optimizeSchedule(equipmentList, providers = [], options = {}) {
    const {
      planningHorizonDays = 365, // Horizonte de planejamento
      minCoveragePercent = 80, // % mínimo de equipamentos calibrados
      maxConcurrentCalibrations = 3, // Máximo de calibrações simultâneas
      preferredProvider = null,
      bufferDays = 30, // Dias de antecedência para calibração
    } = options

    this.analyzeEquipment(equipmentList)
    this.calibrationSchedule = []

    const today = startOfDay(new Date())
    const planningEnd = addDays(today, planningHorizonDays)

    // Para cada grupo de equipamentos redundantes
    this.equipmentGroups.forEach((group, groupKey) => {
      if (group.items.length === 0) return

      // Ordenar por data de vencimento
      const sortedItems = [...group.items].sort((a, b) => {
        const dateA = a.nextCalibrationDue ? new Date(a.nextCalibrationDue) : new Date()
        const dateB = b.nextCalibrationDue ? new Date(b.nextCalibrationDue) : new Date()
        return dateA - dateB
      })

      // Calcular cobertura requerida
      const totalItems = group.items.length
      const requiredCoverage = Math.max(1, Math.ceil(totalItems * (minCoveragePercent / 100)))
      group.requiredCoverage = requiredCoverage

      // Estratégia de escalonamento
      if (totalItems > 1) {
        this.applyStaggeredStrategy(group, sortedItems, {
          today,
          planningEnd,
          bufferDays,
          requiredCoverage,
        })
      } else {
        // Equipamento único - agendar normalmente
        this.scheduleStandardCalibration(sortedItems[0], {
          today,
          bufferDays,
          groupKey,
        })
      }
    })

    // Otimizar distribuição de custos
    this.optimizeCostDistribution(providers)

    // Calcular métricas
    this.calculateMetrics(equipmentList)

    return {
      schedule: this.calibrationSchedule,
      metrics: this.coverageMetrics,
      savings: this.costSavings,
      recommendations: this.generateRecommendations(),
    }
  }

  /**
   * Aplica estratégia de escalonamento para equipamentos redundantes
   * Garante que sempre haja equipamentos calibrados enquanto outros estão vencendo
   */
  applyStaggeredStrategy(group, sortedItems, options) {
    const { today, planningEnd, bufferDays, requiredCoverage } = options

    // Se há 3+ equipamentos idênticos, podemos criar um cronograma rotativo
    if (sortedItems.length >= 3) {
      this.applyRotatingSchedule(group, sortedItems, options)
    } else if (sortedItems.length === 2) {
      // Para 2 equipamentos, alternar calibrações
      this.applyAlternatingSchedule(group, sortedItems, options)
    }
  }

  /**
   * Cronograma rotativo para 3+ equipamentos
   */
  applyRotatingSchedule(group, items, options) {
    const { today, bufferDays } = options
    const interval = items[0].calibrationInterval

    items.forEach((item, index) => {
      const dueDate = item.nextCalibrationDue ? new Date(item.nextCalibrationDue) : today
      const daysUntilDue = differenceInDays(dueDate, today)

      let scheduledDate

      if (daysUntilDue < bufferDays) {
        // Vencido ou próximo do vencimento - agendar imediatamente
        scheduledDate = addDays(today, 7) // 1 semana a partir de hoje
      } else {
        // Distribuir calibrações ao longo do período
        // Calcular offset baseado na posição no grupo
        const offsetDays = Math.floor((interval * index) / items.length)
        scheduledDate = addDays(dueDate, -bufferDays - offsetDays)
      }

      this.calibrationSchedule.push({
        equipmentId: item.id,
        equipmentCode: item.internalCode,
        groupKey: this.getGroupKeyForItem(item, group),
        currentDueDate: item.nextCalibrationDue,
        recommendedDate: format(scheduledDate, 'yyyy-MM-dd'),
        priority: this.calculatePriority(item, today),
        reason: this.getSchedulingReason(item, items, index, today),
        estimatedCost: this.estimateCost(item),
        groupInfo: {
          totalInGroup: items.length,
          position: index + 1,
          redundancyLevel: items.length > 1 ? 'Alta' : 'Nenhuma',
        },
      })
    })
  }

  /**
   * Cronograma alternado para 2 equipamentos
   */
  applyAlternatingSchedule(group, items, options) {
    const { today, bufferDays } = options
    const [item1, item2] = items

    const due1 = item1.nextCalibrationDue ? new Date(item1.nextCalibrationDue) : today
    const due2 = item2.nextCalibrationDue ? new Date(item2.nextCalibrationDue) : today

    const interval = item1.calibrationInterval

    // Calcular intervalo ótimo entre calibrações
    const optimalOffset = Math.floor(interval / 2) // 6 meses se calibração anual

    items.forEach((item, index) => {
      const dueDate = index === 0 ? due1 : due2
      const otherDueDate = index === 0 ? due2 : due1
      const daysUntilDue = differenceInDays(dueDate, today)

      let scheduledDate

      if (daysUntilDue < bufferDays) {
        // Equipamento 1 vencendo - calibrar imediatamente
        scheduledDate = addDays(today, 7)
      } else {
        // Verificar se há sobreposição com outro equipamento
        const daysBetween = Math.abs(differenceInDays(dueDate, otherDueDate))
        
        if (daysBetween < optimalOffset) {
          // Ajustar para criar intervalo ótimo
          if (index === 0) {
            scheduledDate = addDays(dueDate, -bufferDays)
          } else {
            scheduledDate = addDays(due1, optimalOffset - bufferDays)
          }
        } else {
          // Manter agendamento normal
          scheduledDate = addDays(dueDate, -bufferDays)
        }
      }

      this.calibrationSchedule.push({
        equipmentId: item.id,
        equipmentCode: item.internalCode,
        groupKey: this.getGroupKeyForItem(item, group),
        currentDueDate: item.nextCalibrationDue,
        recommendedDate: format(scheduledDate, 'yyyy-MM-dd'),
        priority: this.calculatePriority(item, today),
        reason: this.getSchedulingReason(item, items, index, today),
        estimatedCost: this.estimateCost(item),
        groupInfo: {
          totalInGroup: 2,
          position: index + 1,
          redundancyLevel: 'Média',
          pairedWith: items[1 - index].internalCode,
        },
      })
    })
  }

  /**
   * Agendamento padrão para equipamento único
   */
  scheduleStandardCalibration(item, options) {
    const { today, bufferDays, groupKey } = options
    const dueDate = item.nextCalibrationDue ? new Date(item.nextCalibrationDue) : today
    const daysUntilDue = differenceInDays(dueDate, today)

    let scheduledDate
    let priority

    if (daysUntilDue < 0) {
      // Vencido
      scheduledDate = addDays(today, 3)
      priority = 'CRÍTICA'
    } else if (daysUntilDue < bufferDays) {
      // Próximo do vencimento
      scheduledDate = addDays(today, 7)
      priority = 'ALTA'
    } else {
      // Normal
      scheduledDate = addDays(dueDate, -bufferDays)
      priority = 'NORMAL'
    }

    this.calibrationSchedule.push({
      equipmentId: item.id,
      equipmentCode: item.internalCode,
      groupKey: groupKey,
      currentDueDate: item.nextCalibrationDue,
      recommendedDate: format(scheduledDate, 'yyyy-MM-dd'),
      priority: priority,
      reason: daysUntilDue < 0 ? 'Calibração vencida' : 'Equipamento sem redundância',
      estimatedCost: this.estimateCost(item),
      groupInfo: {
        totalInGroup: 1,
        position: 1,
        redundancyLevel: 'Nenhuma',
      },
    })
  }

  /**
   * Otimiza distribuição de custos ao longo do tempo
   */
  optimizeCostDistribution(providers) {
    // Agrupar calibrações por mês
    const monthlySchedule = new Map()

    this.calibrationSchedule.forEach(cal => {
      const month = cal.recommendedDate.substring(0, 7) // YYYY-MM
      if (!monthlySchedule.has(month)) {
        monthlySchedule.set(month, [])
      }
      monthlySchedule.get(month).push(cal)
    })

    // Identificar oportunidades de desconto por volume
    monthlySchedule.forEach((calibrations, month) => {
      if (calibrations.length >= 3) {
        const totalCost = calibrations.reduce((sum, cal) => sum + cal.estimatedCost, 0)
        const discount = totalCost * 0.1 // 10% de desconto para 3+ calibrações
        this.costSavings += discount

        calibrations.forEach(cal => {
          cal.volumeDiscount = true
          cal.estimatedCost = cal.estimatedCost * 0.9
        })
      }
    })
  }

  /**
   * Calcula prioridade da calibração
   */
  calculatePriority(item, today) {
    const dueDate = item.nextCalibrationDue ? new Date(item.nextCalibrationDue) : today
    const daysUntilDue = differenceInDays(dueDate, today)

    if (daysUntilDue < 0) return 'CRÍTICA'
    if (daysUntilDue < 15) return 'URGENTE'
    if (daysUntilDue < 30) return 'ALTA'
    if (daysUntilDue < 60) return 'MÉDIA'
    return 'NORMAL'
  }

  /**
   * Gera razão para o agendamento
   */
  getSchedulingReason(item, groupItems, index, today) {
    const dueDate = item.nextCalibrationDue ? new Date(item.nextCalibrationDue) : today
    const daysUntilDue = differenceInDays(dueDate, today)

    if (daysUntilDue < 0) {
      return `Calibração vencida há ${Math.abs(daysUntilDue)} dias - URGENTE`
    }

    if (groupItems.length > 1) {
      const position = index + 1
      const total = groupItems.length
      return `Escalonamento otimizado: ${position}/${total} no grupo. Garante ${total - 1} equipamento(s) disponível(is) durante calibração.`
    }

    if (daysUntilDue < 30) {
      return `Aproximando-se do vencimento (${daysUntilDue} dias)`
    }

    return 'Agendamento preventivo otimizado'
  }

  /**
   * Estima custo da calibração
   */
  estimateCost(item) {
    // Custos base por tipo de equipamento
    const baseCosts = {
      fonte_dc: 800,
      multimetro: 500,
      osciloscopio: 1200,
      analisador_espectro: 1500,
      gerador_sinais: 900,
      default: 600,
    }

    return baseCosts[item.assetType] || baseCosts.default
  }

  /**
   * Obtém chave de grupo para um item
   */
  getGroupKeyForItem(item, group) {
    return `${group.type}_${group.classification}`.toLowerCase()
  }

  /**
   * Calcula métricas de cobertura e otimização
   */
  calculateMetrics(equipmentList) {
    const today = new Date()
    const totalEquipment = equipmentList.length

    // Equipamentos calibrados atualmente
    const currentlyValid = equipmentList.filter(eq => {
      if (!eq.nextCalibrationDue) return false
      return isAfter(new Date(eq.nextCalibrationDue), today)
    }).length

    // Equipamentos vencidos
    const overdue = equipmentList.filter(eq => {
      if (!eq.nextCalibrationDue) return true
      return isBefore(new Date(eq.nextCalibrationDue), today)
    }).length

    // Grupos com redundância
    const groupsWithRedundancy = Array.from(this.equipmentGroups.values())
      .filter(g => g.items.length > 1).length

    // Total de grupos
    const totalGroups = this.equipmentGroups.size

    // Economia projetada
    const totalEstimatedCost = this.calibrationSchedule.reduce(
      (sum, cal) => sum + cal.estimatedCost,
      0
    )

    this.coverageMetrics = {
      totalEquipment,
      currentlyValid,
      overdue,
      coveragePercent: ((currentlyValid / totalEquipment) * 100).toFixed(1),
      totalGroups,
      groupsWithRedundancy,
      redundancyPercent: ((groupsWithRedundancy / totalGroups) * 100).toFixed(1),
      scheduledCalibrations: this.calibrationSchedule.length,
      totalEstimatedCost: totalEstimatedCost.toFixed(2),
      estimatedSavings: this.costSavings.toFixed(2),
      averageCostPerCalibration: (totalEstimatedCost / this.calibrationSchedule.length).toFixed(2),
    }
  }

  /**
   * Gera relatório de análise
   */
  getAnalysisReport() {
    const report = {
      totalGroups: this.equipmentGroups.size,
      groups: [],
      redundancyOpportunities: [],
      criticalGaps: [],
    }

    this.equipmentGroups.forEach((group, key) => {
      const groupReport = {
        key,
        type: group.type,
        classification: group.classification,
        totalItems: group.items.length,
        redundancyLevel: this.getRedundancyLevel(group.items.length),
        items: group.items.map(item => ({
          code: item.internalCode,
          dueDate: item.nextCalibrationDue,
          status: item.status,
        })),
      }

      report.groups.push(groupReport)

      // Identificar oportunidades de redundância
      if (group.items.length > 1) {
        report.redundancyOpportunities.push({
          group: key,
          count: group.items.length,
          benefit: 'Permite calibração escalonada sem interrupção operacional',
        })
      } else if (group.items.length === 1) {
        // Equipamento crítico sem backup
        report.criticalGaps.push({
          group: key,
          equipment: group.items[0].internalCode,
          risk: 'Sem redundância - calibração causará indisponibilidade',
          recommendation: 'Considerar aquisição de equipamento backup',
        })
      }
    })

    return report
  }

  /**
   * Determina nível de redundância
   */
  getRedundancyLevel(count) {
    if (count >= 3) return 'Alta'
    if (count === 2) return 'Média'
    return 'Nenhuma'
  }

  /**
   * Gera recomendações estratégicas
   */
  generateRecommendations() {
    const recommendations = []

    // Recomendações baseadas em redundância
    const criticalGroups = Array.from(this.equipmentGroups.values())
      .filter(g => g.items.length === 1)

    if (criticalGroups.length > 0) {
      recommendations.push({
        type: 'REDUNDÂNCIA',
        priority: 'ALTA',
        title: 'Equipamentos críticos sem backup',
        description: `${criticalGroups.length} tipos de equipamento não possuem redundância.`,
        action: 'Considerar aquisição de equipamentos backup para garantir continuidade operacional.',
        impact: 'Redução de risco operacional e maior flexibilidade de manutenção.',
      })
    }

    // Recomendações baseadas em custos
    const monthlySchedule = new Map()
    this.calibrationSchedule.forEach(cal => {
      const month = cal.recommendedDate.substring(0, 7)
      monthlySchedule.set(month, (monthlySchedule.get(month) || 0) + 1)
    })

    const maxMonthly = Math.max(...monthlySchedule.values())
    if (maxMonthly >= 5) {
      recommendations.push({
        type: 'CUSTO',
        priority: 'MÉDIA',
        title: 'Oportunidade de negociação em volume',
        description: `Há meses com ${maxMonthly} calibrações agendadas.`,
        action: 'Negociar contrato anual com desconto por volume com fornecedor preferencial.',
        impact: `Economia estimada de 15-20% (R$ ${(this.coverageMetrics.totalEstimatedCost * 0.175).toFixed(2)})`,
      })
    }

    // Recomendações baseadas em vencimentos
    const urgentCount = this.calibrationSchedule.filter(
      cal => cal.priority === 'CRÍTICA' || cal.priority === 'URGENTE'
    ).length

    if (urgentCount > 3) {
      recommendations.push({
        type: 'PLANEJAMENTO',
        priority: 'ALTA',
        title: 'Muitas calibrações urgentes',
        description: `${urgentCount} calibrações com prioridade crítica/urgente.`,
        action: 'Revisar processo de planejamento preventivo e aumentar antecedência de agendamento.',
        impact: 'Redução de custos de urgência e melhor distribuição de carga de trabalho.',
      })
    }

    return recommendations
  }

  /**
   * Exporta cronograma otimizado
   */
  exportSchedule(format = 'json') {
    if (format === 'json') {
      return JSON.stringify({
        generatedAt: new Date().toISOString(),
        schedule: this.calibrationSchedule,
        metrics: this.coverageMetrics,
        recommendations: this.generateRecommendations(),
      }, null, 2)
    }

    if (format === 'csv') {
      const headers = [
        'Código Equipamento',
        'Data Atual Vencimento',
        'Data Recomendada',
        'Prioridade',
        'Custo Estimado',
        'Redundância',
        'Razão',
      ]

      const rows = this.calibrationSchedule.map(cal => [
        cal.equipmentCode,
        cal.currentDueDate || 'N/A',
        cal.recommendedDate,
        cal.priority,
        `R$ ${cal.estimatedCost.toFixed(2)}`,
        cal.groupInfo.redundancyLevel,
        cal.reason,
      ])

      return [headers, ...rows]
        .map(row => row.map(cell => `"${cell}"`).join(','))
        .join('\n')
    }

    return this.calibrationSchedule
  }
}

// Função helper para uso direto
export const optimizeCalibrations = (equipmentList, providers = [], options = {}) => {
  const agent = new CalibrationOptimizerAgent()
  return agent.optimizeSchedule(equipmentList, providers, options)
}

export default CalibrationOptimizerAgent
