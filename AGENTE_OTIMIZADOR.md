# 🤖 Agente Inteligente de Otimização de Calibrações

## Visão Geral

O **Agente Otimizador de Calibrações** é um sistema de inteligência artificial que analisa equipamentos, identifica redundâncias e cria cronogramas otimizados para maximizar tempo de disponibilidade e minimizar custos.

## 🎯 Objetivos

1. **Maximizar Tempo Calibrado**
   - Garantir que sempre haja equipamentos válidos disponíveis
   - Escalonar calibrações de equipamentos redundantes
   - Evitar indisponibilidade operacional

2. **Minimizar Custos**
   - Agrupar calibrações para obter descontos por volume
   - Otimizar distribuição ao longo do tempo
   - Reduzir calibrações de urgência

3. **Garantir Continuidade**
   - Identificar equipamentos críticos sem backup
   - Criar cronograma rotativo para equipamentos duplicados
   - Antecipar vencimentos com buffers de segurança

## 🧠 Como Funciona

### 1. Análise de Equipamentos

O agente agrupa equipamentos similares baseado em:
- Tipo de ativo (fonte DC, multímetro, osciloscópio, etc.)
- Classificação (elétrico, eletrônico, dimensional, etc.)
- Fabricante e modelo (para equipamentos idênticos)

**Exemplo:**
```javascript
// Grupo 1: Multímetros Agilent 34461A
{
  type: 'multimetro',
  classification: 'eletronico',
  manufacturer: 'Agilent',
  model: '34461A',
  items: [
    { id: 1, internalCode: 'LAB-MULT-001', ... },
    { id: 2, internalCode: 'LAB-MULT-002', ... },
  ]
}
```

### 2. Identificação de Redundância

**Níveis de Redundância:**
- **Alta (3+ equipamentos):** Permite calibração rotativa sem impacto
- **Média (2 equipamentos):** Permite calibração alternada
- **Nenhuma (1 equipamento):** Calibração causa indisponibilidade

### 3. Estratégias de Escalonamento

#### Estratégia Rotativa (3+ equipamentos)

Para equipamentos com alta redundância:

```
Equipamento A: Calibra em Jan → Válido até Jan+1ano
Equipamento B: Calibra em Mai → Válido até Mai+1ano  
Equipamento C: Calibra em Set → Válido até Set+1ano
```

**Benefício:** Sempre 2 de 3 equipamentos calibrados e disponíveis

#### Estratégia Alternada (2 equipamentos)

Para pares de equipamentos:

```
Equipamento A: Calibra em Jan → Válido até Jan+1ano
Equipamento B: Calibra em Jul → Válido até Jul+1ano
```

**Benefício:** Intervalos de 6 meses garantem pelo menos 1 sempre válido

### 4. Otimização de Custos

**Descontos por Volume:**
- 3+ calibrações no mesmo mês: **10% de desconto**
- Negociação anual: Economia adicional de **15-20%**

**Exemplo de Economia:**
```
Custo individual: R$ 800/equipamento
3 equipamentos agrupados: R$ 2.400
Com desconto 10%: R$ 2.160
Economia: R$ 240
```

### 5. Priorização Inteligente

**Níveis de Prioridade:**
- 🔴 **CRÍTICA:** Vencido (calibrar em 3 dias)
- 🟠 **URGENTE:** Vence em < 15 dias (calibrar em 1 semana)
- 🟡 **ALTA:** Vence em < 30 dias
- 🔵 **MÉDIA:** Vence em < 60 dias
- 🟢 **NORMAL:** Vence em > 60 dias

## 📊 Métricas Calculadas

### Cobertura
```javascript
coveragePercent = (equipamentos_calibrados / total_equipamentos) × 100
```

### Redundância
```javascript
redundancyPercent = (grupos_com_backup / total_grupos) × 100
```

### Economia
```javascript
economia = soma(descontos_volume) + otimizacao_cronograma
```

## 🚀 Como Usar

### 1. Interface Web

Acesse: `http://localhost:3001/calibration/optimizer`

**Passos:**
1. Clique em "Executar Otimização"
2. Visualize métricas e cronograma
3. Revise recomendações
4. Exporte para CSV ou JSON

### 2. API Programática

```javascript
import { CalibrationOptimizerAgent } from './services/calibrationOptimizer'

// Criar instância do agente
const agent = new CalibrationOptimizerAgent()

// Executar otimização
const result = agent.optimizeSchedule(equipmentList, providers, {
  planningHorizonDays: 365,    // 1 ano
  minCoveragePercent: 80,      // 80% mínimo calibrado
  maxConcurrentCalibrations: 3,
  bufferDays: 30,              // Calibrar 30 dias antes
})

// Resultado
console.log(result.schedule)          // Cronograma otimizado
console.log(result.metrics)           // Métricas calculadas
console.log(result.savings)           // Economia estimada
console.log(result.recommendations)   // Recomendações
```

### 3. Exportação

**CSV:**
```javascript
const csv = agent.exportSchedule('csv')
// Código,Vencimento,Recomendado,Prioridade,Custo,Redundância,Razão
```

**JSON:**
```javascript
const json = agent.exportSchedule('json')
// { schedule: [...], metrics: {...}, recommendations: [...] }
```

## 📋 Exemplo de Saída

### Cronograma Otimizado

```javascript
{
  equipmentId: 1,
  equipmentCode: 'LAB-MULT-001',
  groupKey: 'multimetro_eletronico',
  currentDueDate: '2026-01-15',
  recommendedDate: '2025-12-15',      // 30 dias antes
  priority: 'MÉDIA',
  reason: 'Escalonamento otimizado: 1/3 no grupo. Garante 2 equipamentos disponíveis.',
  estimatedCost: 450,                  // R$ 500 com 10% desconto
  volumeDiscount: true,
  groupInfo: {
    totalInGroup: 3,
    position: 1,
    redundancyLevel: 'Alta'
  }
}
```

### Recomendações

```javascript
{
  type: 'REDUNDÂNCIA',
  priority: 'ALTA',
  title: 'Equipamentos críticos sem backup',
  description: '5 tipos de equipamento não possuem redundância.',
  action: 'Considerar aquisição de equipamentos backup.',
  impact: 'Redução de risco operacional.'
}
```

## 🎨 Visualizações

### Dashboard Principal

- **Card de Cobertura:** % de equipamentos calibrados
- **Card de Redundância:** % de grupos com backup
- **Card de Custos:** Custo total estimado
- **Card de Economia:** Economia por otimização

### Cronograma por Grupo

Equipamentos agrupados por tipo/classificação com:
- Badge de nível de redundância
- Custo total do grupo
- Lista expandível de equipamentos

### Análise de Grupos

Tabela completa mostrando:
- Tipo e classificação
- Quantidade de equipamentos
- Nível de redundância
- Status operacional

## ⚙️ Configurações Avançadas

### Horizonte de Planejamento

```javascript
planningHorizonDays: 365  // Planejar para 1 ano
```

### Cobertura Mínima

```javascript
minCoveragePercent: 80    // 80% dos equipamentos devem estar calibrados
```

### Buffer de Antecedência

```javascript
bufferDays: 30           // Calibrar 30 dias antes do vencimento
```

### Calibrações Simultâneas

```javascript
maxConcurrentCalibrations: 3  // Máximo de 3 calibrações por vez
```

## 🔍 Algoritmos Utilizados

### 1. Agrupamento de Equipamentos

```
Para cada equipamento:
  chave = tipo + classificação + fabricante + modelo
  grupos[chave].adicionar(equipamento)
```

### 2. Cálculo de Intervalo Ótimo

```
Para grupo com N equipamentos:
  intervalo_base = calibration_interval
  offset = (intervalo_base × posição) / N
  data_otimizada = vencimento - buffer - offset
```

### 3. Otimização de Custos

```
Para cada mês:
  Se calibrações_mes >= 3:
    aplicar_desconto_volume(10%)
    economia += custo_total × 0.10
```

## 📈 Casos de Uso

### Caso 1: Laboratório com Múltiplos Multímetros

**Situação:**
- 5 multímetros Agilent 34461A
- Todos vencem em datas próximas

**Solução do Agente:**
```
MULT-001: Calibra imediatamente
MULT-002: Calibra em 2 meses
MULT-003: Calibra em 4 meses
MULT-004: Calibra em 6 meses
MULT-005: Calibra em 8 meses
```

**Resultado:**
- ✅ Sempre 4 de 5 multímetros disponíveis
- ✅ Distribuição uniforme ao longo do ano
- ✅ Desconto por agendar múltiplos no mesmo período

### Caso 2: Equipamento Crítico Sem Backup

**Situação:**
- 1 osciloscópio único no laboratório
- Vencimento em 45 dias

**Solução do Agente:**
```
Prioridade: ALTA
Data recomendada: Em 15 dias (30 dias antes do vencimento)
Recomendação: Adquirir equipamento backup
```

**Resultado:**
- ✅ Calibração antecipada evita vencimento
- ✅ Alerta sobre risco operacional
- ✅ Recomendação de aquisição de backup

### Caso 3: Otimização de Custos

**Situação:**
- 15 equipamentos diversos
- Datas de vencimento espalhadas

**Solução do Agente:**
```
Mês 1: 5 equipamentos → Desconto 10% = R$ 450
Mês 4: 4 equipamentos → Desconto 10% = R$ 360
Mês 8: 3 equipamentos → Desconto 10% = R$ 270
Outros: 3 equipamentos individuais
```

**Resultado:**
- ✅ Economia total: R$ 1.080
- ✅ Melhor distribuição de caixa
- ✅ Oportunidade de contrato anual

## 🧪 Testes e Validação

### Teste 1: Redundância Alta

```javascript
const equipment = [
  { id: 1, assetType: 'multimetro', model: 'A', dueDate: '2026-01-01' },
  { id: 2, assetType: 'multimetro', model: 'A', dueDate: '2026-01-05' },
  { id: 3, assetType: 'multimetro', model: 'A', dueDate: '2026-01-10' },
]

const result = agent.optimizeSchedule(equipment)

// Expectativa: Datas escalonadas em 4 meses de intervalo
```

### Teste 2: Equipamento Vencido

```javascript
const equipment = [
  { id: 1, assetType: 'fonte_dc', dueDate: '2024-11-01' }, // Vencido
]

const result = agent.optimizeSchedule(equipment)

// Expectativa: Prioridade CRÍTICA, agendamento imediato
```

## 🔮 Melhorias Futuras

### Versão 2.0
- [ ] Machine Learning para prever custos
- [ ] Integração com calendário do fornecedor
- [ ] Alertas automáticos por e-mail/WhatsApp
- [ ] Otimização multi-objetivo (custo + tempo + qualidade)

### Versão 3.0
- [ ] Previsão de demanda de calibração
- [ ] Análise de tendências históricas
- [ ] Recomendação de aquisição baseada em IA
- [ ] Dashboard em tempo real

## 📚 Referências

- ISO/IEC 17025:2017 - Requisitos gerais para competência de laboratórios
- VIM (Vocabulário Internacional de Metrologia)
- INMETRO NIT-DICLA-035 - Calibração de equipamentos

## 💡 Dicas de Uso

1. **Execute regularmente:** Rode a otimização mensalmente
2. **Revise recomendações:** Preste atenção aos alertas críticos
3. **Exporte e compartilhe:** Use CSV para planejamento com equipe
4. **Ajuste parâmetros:** Customize bufferDays conforme necessidade
5. **Monitore economia:** Acompanhe savings para justificar investimentos

---

**Desenvolvido para:** Sistema de Gestão de Calibração - CoreUI React  
**Versão:** 1.0.0  
**Data:** 25/11/2025
