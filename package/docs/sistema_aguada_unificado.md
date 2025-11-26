# Sistema Supervisório Aguada - Definições Unificadas

## 📋 Visão Geral do Sistema

O **Sistema Supervisório Aguada** é um sistema CMMS (Computerized Maintenance Management System) distribuído baseado em ESP32-C3 para monitoramento inteligente de reservatórios hídricos, com foco no módulo "Aguada" que contempla 6 reservatórios, 5-10 bombas e aproximadamente 20 válvulas.

### Objetivos Principais
- Monitoramento contínuo de sensores (ultrassom, pressão, vazão)
- Registro de telemetria com compressão inteligente de dados
- Detecção automática de eventos (abastecimento, consumo, vazamentos)
- Gerenciamento de manutenção e serviços
- Operação local (sem internet) em servidor próprio
- Relatórios automáticos diários às 06:00h

## 🏗️ Arquitetura do Sistema

### 1. **Camada de Hardware (ESP32-C3)**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   NODES ESP32   │    │  GATEWAY ESP32  │    │  SERVIDOR LOCAL │
│                 │    │                 │    │                 │
│ • Sensores      │◄──►│ • Bridge Mesh   │◄──►│ • MQTT Broker   │
│ • Atuadores     │    │ • WiFi/Ethernet │    │ • Database      │
│ • Cálculos      │    │ • HTTP API      │    │ • Dashboard     │
│ • Armazenamento │    │ • Web Interface │    │ • Relatórios    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 2. **Topologia da Rede Hídrica**

#### Reservatórios Monitorados:
- **Castelo de Consumo**: 81,7 m³ (cilíndrico, Ø 5,10m, h 4,0m)
- **Castelo de Incêndio**: 81,7 m³ (cilíndrico, Ø 5,10m, h 4,0m) 
- **Cisterna IE01**: 254,3 m³ (retangular, 5,85x18,10x2,40m)
- **Cisterna IE02**: 254,3 m³ (retangular, 5,85x18,10x2,40m)
- **Reservatório B03**: 80 m³ (casa de bombas)
- **Reservatório Adicional**: Configurável

#### Elementos de Controle:
- **Bombas**: 5-10 unidades (recalque, transferência, emergência)
- **Válvulas**: ~20 unidades (entrada, saída, bypass, emergência)
- **Sensores**: Nível ultrassom, pressão, temperatura, vazão

## 🔧 Especificações Técnicas

### 1. **Nodes ESP32-C3**

#### Configuração Base:
```cpp
// Parâmetros do Sistema
#define MESH_PREFIX   "aguada"
#define MESH_PASSWORD "agu@da2025"
#define MESH_PORT     5555

// Frequência de Operação
#define READ_INTERVAL    10000  // 10s - leitura sensores
#define PUBLISH_INTERVAL 30000  // 30s - envio dados
#define DEEP_SLEEP       300    // 5min - modo econômico
```

#### Sensores por Node:
```cpp
// Estrutura de configuração por reservatório
struct ReservatorioConfig {
  float hsensor_cm;        // Distância sensor ao nível máximo
  float altura_cm;         // Altura útil do reservatório
  float diametro_cm;       // Para reservatórios cilíndricos
  float comprimento_cm;    // Para reservatórios retangulares
  float largura_cm;        // Para reservatórios retangulares
  int pino_trig;           // Pino Trigger ultrassom
  int pino_echo;           // Pino Echo ultrassom
};
```

#### Cálculo de Volume:
```cpp
// Para reservatório cilíndrico: V = π × r² × h
float calcularVolumeCilindrico(float nivel_cm, float diametro_cm) {
  float raio_m = (diametro_cm / 100.0) / 2.0;
  return M_PI * pow(raio_m, 2) * (nivel_cm / 100.0);
}

// Para reservatório retangular: V = C × L × h
float calcularVolumeRetangular(float nivel_cm, float comprimento_cm, float largura_cm) {
  return (comprimento_cm / 100.0) * (largura_cm / 100.0) * (nivel_cm / 100.0);
}
```

### 2. **Gateway ESP32-C3**

#### Funcionalidades:
- Bridge entre rede mesh e WiFi/Ethernet
- Servidor web para configuração local
- Buffer de dados para operação offline
- Atualização OTA (Over-The-Air)
- Gerenciamento de múltiplos nodes

#### Interface Web Local:
```html
<!-- Dashboard Local -->
- Status dos reservatórios (nível, volume, %)
- Estado das bombas e válvulas
- Configuração de parâmetros
- Logs de eventos e diagnósticos
- Teste de conectividade
```

### 3. **Servidor Local**

#### Stack Tecnológico Recomendado:
```yaml
# Docker Compose
version: "3.8"
services:
  mosquitto:          # Broker MQTT
    image: eclipse-mosquitto:2
    ports: ["1883:1883", "9001:9001"]
  
  postgresql:         # Banco principal
    image: postgres:15
    environment:
      POSTGRES_DB: aguada
      POSTGRES_USER: aguada
      POSTGRES_PASSWORD: senha123
  
  influxdb:          # Séries temporais
    image: influxdb:2
    ports: ["8086:8086"]
  
  grafana:           # Dashboard
    image: grafana/grafana:latest
    ports: ["3000:3000"]
  
  nodered:           # Processamento
    image: nodered/node-red:latest
    ports: ["1880:1880"]
```

## 📊 Modelo de Dados Unificado

### 1. **Esquema do Banco de Dados**

```sql
-- ===========================================
-- TABELAS PRINCIPAIS
-- ===========================================

-- Elementos do sistema (reservatórios, bombas, válvulas)
CREATE TABLE elemento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,      -- 'reservatorio', 'bomba', 'valvula', 'sensor'
    descricao TEXT,
    capacidade_litros NUMERIC,
    coord_x NUMERIC,                -- Coordenada X para mapeamento
    coord_y NUMERIC,                -- Coordenada Y para mapeamento
    coord_z NUMERIC,                -- Coordenada Z (altura)
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT NOW()
);

-- Conexões hidráulicas entre elementos
CREATE TABLE conexao (
    id SERIAL PRIMARY KEY,
    origem_id INT NOT NULL REFERENCES elemento(id) ON DELETE CASCADE,
    destino_id INT NOT NULL REFERENCES elemento(id) ON DELETE CASCADE,
    tipo VARCHAR(20) DEFAULT 'hidraulica',
    descricao TEXT,
    UNIQUE (origem_id, destino_id)
);

-- Configurações físicas dos reservatórios
CREATE TABLE reservatorio_config (
    id SERIAL PRIMARY KEY,
    elemento_id INT NOT NULL REFERENCES elemento(id) ON DELETE CASCADE,
    hsensor_cm NUMERIC NOT NULL,
    altura_cm NUMERIC NOT NULL,
    diametro_cm NUMERIC,            -- Para cilíndricos
    comprimento_cm NUMERIC,         -- Para retangulares
    largura_cm NUMERIC,             -- Para retangulares
    tipo_geometria VARCHAR(20) NOT NULL  -- 'cilindrico' ou 'retangular'
);

-- Sensores associados aos elementos
CREATE TABLE sensor (
    id SERIAL PRIMARY KEY,
    elemento_id INT NOT NULL REFERENCES elemento(id) ON DELETE CASCADE,
    tipo VARCHAR(30) NOT NULL,      -- 'nivel', 'pressao', 'temperatura', 'vazao'
    unidade VARCHAR(10),            -- 'cm', 'bar', '°C', 'L/s'
    precisao VARCHAR(20),           -- '±0.5cm', '±0.1bar'
    fator_calibracao NUMERIC DEFAULT 1.0,
    offset NUMERIC DEFAULT 0.0,
    ativo BOOLEAN DEFAULT TRUE
);

-- Atuadores (bombas e válvulas)
CREATE TABLE atuador (
    id SERIAL PRIMARY KEY,
    elemento_id INT NOT NULL REFERENCES elemento(id) ON DELETE CASCADE,
    tipo VARCHAR(30) NOT NULL,      -- 'bomba', 'valvula'
    modo_controle VARCHAR(20) DEFAULT 'manual', -- 'manual', 'automatico', 'remoto'
    parametros JSONB,               -- Configurações específicas (potência, pressão, etc.)
    ativo BOOLEAN DEFAULT TRUE
);

-- ===========================================
-- TELEMETRIA E DADOS
-- ===========================================

-- Leituras brutas dos sensores
CREATE TABLE leitura_raw (
    id BIGSERIAL PRIMARY KEY,
    sensor_id INT NOT NULL REFERENCES sensor(id) ON DELETE CASCADE,
    timestamp TIMESTAMP DEFAULT NOW(),
    valor_bruto NUMERIC,
    origem VARCHAR(50),             -- 'esp32_node_01', 'usuario', 'sistema'
    qualidade VARCHAR(20) DEFAULT 'ok'  -- 'ok', 'suspeita', 'erro'
);

-- Leituras processadas e filtradas
CREATE TABLE leitura_processada (
    id BIGSERIAL PRIMARY KEY,
    sensor_id INT NOT NULL REFERENCES sensor(id) ON DELETE CASCADE,
    timestamp TIMESTAMP DEFAULT NOW(),
    valor NUMERIC,
    nivel_percent NUMERIC,          -- Para reservatórios (0-100%)
    volume_litros NUMERIC,          -- Volume calculado
    metodo_processamento VARCHAR(50), -- 'mediana_11', 'media_movel', 'filtro_kalman'
    variacao NUMERIC,               -- Variação desde última leitura
    status VARCHAR(20) DEFAULT 'valida'  -- 'valida', 'alerta', 'critica'
);

-- Estados dos atuadores
CREATE TABLE estado_atuador (
    id BIGSERIAL PRIMARY KEY,
    atuador_id INT NOT NULL REFERENCES atuador(id) ON DELETE CASCADE,
    timestamp TIMESTAMP DEFAULT NOW(),
    estado VARCHAR(20),             -- 'ON', 'OFF', 'ABERTA', 'FECHADA'
    origem VARCHAR(50),             -- 'sensor', 'usuario', 'sistema', 'timer'
    registrado_por VARCHAR(50)      -- ID do usuário ou sistema
);

-- ===========================================
-- EVENTOS E ANÁLISES
-- ===========================================

-- Eventos detectados automaticamente
CREATE TABLE evento_hidrico (
    id BIGSERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,      -- 'abastecimento', 'consumo', 'vazamento', 'manutencao'
    reservatorio_id INT REFERENCES elemento(id),
    inicio TIMESTAMP NOT NULL,
    fim TIMESTAMP,
    volume_estimado_l NUMERIC,
    detalhes JSONB,                 -- Dados específicos do evento
    nivel_confianca NUMERIC(4,2),   -- 0.00 a 1.00
    detectado_por VARCHAR(50),      -- 'sistema', 'usuario', 'algoritmo'
    status VARCHAR(20) DEFAULT 'ativo'  -- 'ativo', 'confirmado', 'falso_positivo'
);

-- Alertas e alarmes
CREATE TABLE alerta (
    id BIGSERIAL PRIMARY KEY,
    severidade VARCHAR(20) NOT NULL, -- 'info', 'aviso', 'critico'
    tipo VARCHAR(50) NOT NULL,       -- 'nivel_baixo', 'vazamento', 'falha_bomba'
    elemento_id INT REFERENCES elemento(id),
    mensagem TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT NOW(),
    ativo BOERIC DEFAULT TRUE,
    confirmado_por VARCHAR(50)       -- Usuário que confirmou
);

-- ===========================================
-- MANUTENÇÃO E USUÁRIOS
-- ===========================================

-- Ordens de serviço
CREATE TABLE ordem_servico (
    id SERIAL PRIMARY KEY,
    numero VARCHAR(20) UNIQUE NOT NULL,
    tipo VARCHAR(30) NOT NULL,      -- 'preventiva', 'corretiva', 'preditiva'
    elemento_id INT NOT NULL REFERENCES elemento(id),
    descricao TEXT NOT NULL,
    prioridade VARCHAR(20) DEFAULT 'media',  -- 'baixa', 'media', 'alta', 'urgente'
    data_criacao TIMESTAMP DEFAULT NOW(),
    data_agendamento TIMESTAMP,
    data_execucao TIMESTAMP,
    tecnico_responsavel VARCHAR(50),
    status VARCHAR(20) DEFAULT 'agendada',  -- 'agendada', 'executando', 'concluida', 'cancelada'
    observacoes TEXT
);

-- Histórico de manutenção
CREATE TABLE manutencao_historico (
    id BIGSERIAL PRIMARY KEY,
    elemento_id INT NOT NULL REFERENCES elemento(id),
    ordem_servico_id INT REFERENCES ordem_servico(id),
    tipo VARCHAR(30) NOT NULL,      -- 'limpeza', 'calibracao', 'substituicao', 'ajuste'
    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP,
    tecnico VARCHAR(50) NOT NULL,
    descricao_servico TEXT,
    pecas_trocadas JSONB,           -- Lista de peças substituídas
    custo_total NUMERIC(10,2),
    proxima_manutencao TIMESTAMP
);

-- Usuários do sistema
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    login VARCHAR(30) UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL,
    email VARCHAR(100),
    papel VARCHAR(20) NOT NULL,     -- 'operador', 'tecnico', 'supervisor', 'admin'
    ativo BOOLEAN DEFAULT TRUE,
    ultimo_acesso TIMESTAMP
);

-- Logs de auditoria
CREATE TABLE audit_log (
    id BIGSERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuario(id),
    acao VARCHAR(50) NOT NULL,      -- 'login', 'configuracao', 'comando', 'manutencao'
    tabela VARCHAR(30),             -- Tabela afetada
    registro_id INT,                -- ID do registro
    dados_anteriores JSONB,         -- Estado anterior
    dados_novos JSONB,              -- Estado novo
    timestamp TIMESTAMP DEFAULT NOW()
);

-- ===========================================
-- RELATÓRIOS
-- ===========================================

-- Relatórios diários automáticos
CREATE TABLE relatorio_diario (
    data DATE PRIMARY KEY,
    volume_consumido_total_l NUMERIC(10,2),
    volume_abastecido_total_l NUMERIC(10,2),
    volume_vazado_estimado_l NUMERIC(10,2),
    horas_bomba_ligada NUMERIC(5,2),
    eventos_detectados INT,
    alertas_ativos INT,
    manutencoes_realizadas INT,
    resumo TEXT,                    -- Texto resumo do dia
    gerado_em TIMESTAMP DEFAULT NOW()
);

-- ===========================================
-- ÍNDICES PARA PERFORMANCE
-- ===========================================

CREATE INDEX idx_leitura_raw_timestamp ON leitura_raw(timestamp);
CREATE INDEX idx_leitura_raw_sensor ON leitura_raw(sensor_id);
CREATE INDEX idx_leitura_processada_timestamp ON leitura_processada(timestamp);
CREATE INDEX idx_leitura_processada_sensor ON leitura_processada(sensor_id);
CREATE INDEX idx_evento_hidrico_tipo ON evento_hidrico(tipo);
CREATE INDEX idx_evento_hidrico_reservatorio ON evento_hidrico(reservatorio_id);
CREATE INDEX idx_alerta_timestamp ON alerta(timestamp);
CREATE INDEX idx_alerta_ativo ON alerta(ativo) WHERE ativo = TRUE;
```

### 2. **Compressão Inteligente de Dados**

#### Lógica de Filtragem:
```sql
-- Função para processar janela de leituras
CREATE OR REPLACE FUNCTION processar_leituras_sensor(p_sensor_id INT)
RETURNS VOID AS $$
DECLARE
    v_window INT := 11;           -- Número de amostras para mediana
    v_deadband NUMERIC := 2.0;    -- Tolerância em cm
    v_stability_stddev NUMERIC := 0.5; -- Desvio padrão máximo para estabilidade
    median_val NUMERIC;
    stddev_val NUMERIC;
    last_processed leitura_processada%ROWTYPE;
BEGIN
    -- Calcular mediana das últimas N leituras não processadas
    WITH sample AS (
        SELECT valor
        FROM leitura_raw
        WHERE sensor_id = p_sensor_id 
          AND qualidade = 'ok'
          AND processed = FALSE
        ORDER BY timestamp DESC
        LIMIT v_window
    )
    SELECT 
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor) as median,
        STDDEV_POP(valor) as stddev
    INTO median_val, stddev_val
    FROM sample;
    
    -- Verificar se variação está dentro do deadband
    SELECT * INTO last_processed
    FROM leitura_processada
    WHERE sensor_id = p_sensor_id
    ORDER BY timestamp DESC
    LIMIT 1;
    
    -- Se variação pequena, apenas atualizar timestamp
    IF ABS(median_val - last_processed.valor) <= v_deadband 
       AND (stddev_val IS NULL OR stddev_val <= v_stability_stddev) THEN
        UPDATE leitura_processada
        SET timestamp = NOW()
        WHERE sensor_id = p_sensor_id
          AND valor = last_processed.valor;
    ELSE
        -- Inserir novo registro processado
        INSERT INTO leitura_processada(sensor_id, valor, metodo_processamento, variacao)
        VALUES (p_sensor_id, median_val, 'mediana_11', 
                ABS(median_val - last_processed.valor));
    END IF;
    
    -- Marcar leituras como processadas
    UPDATE leitura_raw 
    SET processed = TRUE 
    WHERE sensor_id = p_sensor_id 
      AND processed = FALSE 
      AND timestamp >= (NOW() - INTERVAL '10 minutes');
END;
$$ LANGUAGE plpgsql;
```

## 🔄 Lógica de Eventos e Detecções

### 1. **Regras de Detecção**

```javascript
// Regras para classificação automática de eventos
const regrasEvento = {
    abastecimento: {
        condicao: "delta_volume > 50L && bomba_ativa && valvula_aberta",
        confianca: 0.95,
        acao: "registrar_evento('abastecimento')"
    },
    
    consumo: {
        condicao: "delta_volume < -deadband && sem_bomba_ativa",
        confianca: 0.80,
        acao: "calcular_taxa_consumo()"
    },
    
    vazamento: {
        condicao: "queda_lenta_contínua > 1h && sem_consumo && valvulas_fechadas",
        confianca: 0.85,
        acao: "gerar_alerta('vazamento_suspeito')"
    },
    
    nivel_critico: {
        condicao: "nivel_percent < 10 || nivel_percent > 95",
        confianca: 1.00,
        acao: "gerar_alerta('nivel_critico')"
    },
    
    falha_bomba: {
        condicao: "bomba_ligada && sem_mudanca_pressao",
        confianca: 0.90,
        acao: "registrar_evento('falha_bomba')"
    }
};
```

### 2. **Cálculo de Métricas**

```javascript
// Função para calcular métricas diárias
function calcularMetricasDiarias(data) {
    const metricas = {
        volumeConsumido: 0,
        volumeAbastecido: 0,
        eventosAbastecimento: 0,
        eventosConsumo: 0,
        alertasGerados: 0,
        tempoOperacaoBombas: 0
    };
    
    // Volume consumido = soma de todos os consumos negativos
    const consumos = db.query(`
        SELECT SUM(ABS(volume_litros)) as total 
        FROM evento_hidrico 
        WHERE tipo = 'consumo' 
        AND DATE(inicio) = ?
    `, [data]);
    metricas.volumeConsumido = consumos[0].total || 0;
    
    // Volume abastecido = soma de todos os abastecimentos
    const abastecimentos = db.query(`
        SELECT SUM(volume_litros) as total 
        FROM evento_hidrico 
        WHERE tipo = 'abastecimento' 
        AND DATE(inicio) = ?
    `, [data]);
    metricas.volumeAbastecido = abastecimentos[0].total || 0;
    
    return metricas;
}
```

## 📱 Interface do Sistema

### 1. **Dashboard Principal (Grafana)**

#### Painéis Principais:
```json
{
  "painel_reservatorios": {
    "tipo": "stat",
    "titulo": "Status dos Reservatórios",
    "metricas": ["nivel_percent", "volume_litros", "tendencia"],
    "thresholds": {
      "critico": 10,
      "aviso": 20,
      "normal": 20
    }
  },
  
  "painel_bombas": {
    "tipo": "state_timeline", 
    "titulo": "Estado das Bombas",
    "metricas": ["estado", "horas_operacao", "consumo_energia"]
  },
  
  "painel_valvulas": {
    "tipo": "discrete",
    "titulo": "Estado das Válvulas", 
    "metricas": ["estado", "ciclos_abertura"]
  },
  
  "painel_eventos": {
    "tipo": "table",
    "titulo": "Eventos Recentes",
    "metricas": ["tipo", "inicio", "fim", "volume", "confianca"]
  }
}
```

### 2. **Interface Web Local (Gateway)**

#### Páginas Principais:
- **Dashboard**: Status geral do sistema
- **Reservatórios**: Detalhes de cada reservatório
- **Equipamentos**: Bombas, válvulas e sensores
- **Configuração**: Parâmetros do sistema
- **Diagnóstico**: Logs e testes de conectividade
- **Manutenção**: Ordens de serviço e histórico

### 3. **API REST**

```javascript
// Endpoints principais
const endpoints = {
    // Telemetria
    "POST /api/leitura": "Inserir leitura de sensor",
    "GET /api/leitura/:sensorId": "Obter leituras de sensor",
    
    // Controle
    "POST /api/atuador/:id/estado": "Alterar estado de atuador",
    "GET /api/atuador/:id/estado": "Obter estado atual",
    
    // Eventos
    "GET /api/eventos": "Listar eventos filtrados",
    "POST /api/eventos": "Registrar evento manual",
    
    // Relatórios
    "GET /api/relatorio/diario": "Relatório diário",
    "GET /api/relatorio/:data": "Relatório de data específica",
    
    // Manutenção
    "GET /api/os": "Listar ordens de serviço",
    "POST /api/os": "Criar nova ordem de serviço",
    "PUT /api/os/:id": "Atualizar ordem de serviço"
};
```

## 🔧 Implementação por Módulos

### 1. **Firmware dos Nodes (ESP32-C3)**

#### Estrutura Principal:
```cpp
#include <Arduino.h>
#include <WiFi.h>
#include <painlessMesh.h>
#include <ArduinoJson.h>
#include <LittleFS.h>
#include <nvs.h>

// Configurações
#define MESH_PREFIX "aguada"
#define MESH_PASSWORD "agu@da2025"
#define MESH_PORT 5555

// Estrutura do node
struct NodeConfig {
    String device_id;
    String tipo;                    // 'reservatorio', 'bomba', 'valvula'
    String reservatorio_tipo;       // 'cilindrico' ou 'retangular'
    float hsensor_cm;
    float altura_cm;
    float diametro_cm;
    float comprimento_cm;
    float largura_cm;
    int pino_trig;
    int pino_echo;
    uint32_t read_interval;
    uint32_t publish_interval;
};

// Função principal de leitura
void lerSensores() {
    float distancia = lerUltrassom();
    float nivel = calcularNivel(distancia);
    float volume = calcularVolume(nivel);
    float percentual = (volume / volume_maximo) * 100;
    
    // Aplicar filtro de mediana
    float nivel_filtrado = aplicarFiltroMediana(nivel);
    
    // Criar payload JSON
    DynamicJsonDocument doc(256);
    doc["device_id"] = config.device_id;
    doc["timestamp"] = getTimestamp();
    doc["nivel_cm"] = nivel_filtrado;
    doc["volume_litros"] = volume;
    doc["percentual"] = percentual;
    doc["qualidade"] = validarLeitura(nivel_filtrado);
    
    // Enviar via mesh
    String payload;
    serializeJson(doc, payload);
    mesh.sendBroadcast(payload);
}
```

### 2. **Gateway (ESP32-C3)**

```cpp
// Gateway com servidor web
#include <ESPAsyncWebServer.h>
#include <AsyncTCP.h>
#include <PubSubClient.h>

// Servidor web para configuração local
AsyncWebServer server(80);
PubSubClient mqtt(client);

// Página web para configuração
const char* html_config = R"(
<!DOCTYPE html>
<html>
<head>
    <title>Aguada Gateway - Configuração</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body { font-family: Arial; margin: 20px; }
        .card { background: #f0f0f0; padding: 15px; margin: 10px 0; border-radius: 5px; }
        input, select { margin: 5px; padding: 8px; width: 200px; }
        button { background: #007bff; color: white; padding: 10px 20px; border: none; cursor: pointer; }
        button:hover { background: #0056b3; }
    </style>
</head>
<body>
    <h1>🚰 Aguada Gateway - Configuração</h1>
    
    <div class="card">
        <h3>Configuração WiFi</h3>
        <input type="text" id="ssid" placeholder="SSID"><br>
        <input type="password" id="password" placeholder="Senha WiFi"><br>
        <button onclick="configurarWiFi()">Conectar WiFi</button>
    </div>
    
    <div class="card">
        <h3>Status do Sistema</h3>
        <div id="status">Carregando...</div>
    </div>
    
    <script>
        // JavaScript para interface
        function carregarStatus() {
            fetch('/api/status')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('status').innerHTML = 
                        `Nodes Conectados: ${data.nodes}<br>` +
                        `Última Leitura: ${data.ultima_leitura}`;
                });
        }
        
        setInterval(carregarStatus, 5000);
    </script>
</body>
</html>
)";
```

### 3. **Backend (Node.js/Python)**

```python
# API REST em Python/Flask
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import paho.mqtt.client as mqtt
from datetime import datetime, timedelta
import json

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://aguada:senha123@localhost/aguada'
db = SQLAlchemy(app)

# Modelos ORM
class LeituraRaw(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sensor_id = db.Column(db.Integer, db.ForeignKey('sensor.id'))
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)
    valor_bruto = db.Column(db.Float)
    origem = db.Column(db.String(50))
    qualidade = db.Column(db.String(20), default='ok')

class LeituraProcessada(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sensor_id = db.Column(db.Integer, db.ForeignKey('sensor.id'))
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)
    valor = db.Column(db.Float)
    volume_litros = db.Column(db.Float)
    percentual = db.Column(db.Float)
    metodo_processamento = db.Column(db.String(50))

# Endpoints API
@app.route('/api/leitura', methods=['POST'])
def inserir_leitura():
    data = request.json
    
    # Validar e processar
    leitura = LeituraRaw(
        sensor_id=data['sensor_id'],
        valor_bruto=data['valor'],
        origem=data.get('origem', 'esp32'),
        qualidade='ok'
    )
    
    db.session.add(leitura)
    db.session.commit()
    
    # Processar compressão
    processar_compressao(data['sensor_id'])
    
    return jsonify({'status': 'ok'}), 201

@app.route('/api/relatorio/diario', methods=['GET'])
def relatorio_diario():
    data = request.args.get('data', datetime.now().date().isoformat())
    
    # Calcular métricas
    metricas = calcular_metricas_diarias(data)
    
    # Gerar relatório
    relatorio = {
        'data': data,
        'volume_consumido_l': metricas['consumo'],
        'volume_abastecido_l': metricas['abastecimento'],
        'eventos_detectados': metricas['eventos'],
        'alertas_ativos': contar_alertas_ativos(),
        'resumo': gerar_resumo(metricas)
    }
    
    # Salvar no banco
    relatorio_db = RelatorioDiario(**relatorio)
    db.session.add(relatorio_db)
    db.session.commit()
    
    return jsonify(relatorio)

# Função para processar compressão de dados
def processar_compressao(sensor_id):
    # Buscar últimas 11 leituras não processadas
    leituras = LeituraRaw.query.filter_by(
        sensor_id=sensor_id, 
        processed=False
    ).order_by(LeituraRaw.timestamp.desc()).limit(11).all()
    
    if len(leituras) < 11:
        return
    
    # Calcular mediana e desvio padrão
    valores = [l.valor_bruto for l in leituras]
    mediana = calcular_mediana(valores)
    desvio = calcular_desvio_padrao(valores)
    
    # Verificar se está dentro do deadband
    ultima_processada = LeituraProcessada.query.filter_by(
        sensor_id=sensor_id
    ).order_by(LeituraProcessada.timestamp.desc()).first()
    
    if ultima_processada and abs(mediana - ultima_processada.valor) <= 2.0:
        # Apenas atualizar timestamp
        ultima_processada.timestamp = datetime.utcnow()
    else:
        # Nova leitura processada
        processada = LeituraProcessada(
            sensor_id=sensor_id,
            valor=mediana,
            metodo_processamento='mediana_11',
            variacao=abs(mediana - ultima_processada.valor) if ultima_processada else 0
        )
        db.session.add(processada)
    
    # Marcar como processadas
    for leitura in leituras:
        leitura.processed = True
    
    db.session.commit()
```

## 📈 Relatório Diário Automático

### 1. **Geração Automática (Cron Job)**

```bash
# Crontab para execução às 06:00h
0 6 * * * /usr/bin/python3 /opt/aguada/scripts/gerar_relatorio_diario.py
```

### 2. **Script de Relatório**

```python
#!/usr/bin/env python3
# gerar_relatorio_diario.py

import psycopg2
from datetime import datetime, timedelta
import smtplib
from email.mime.text import MIMEText
import matplotlib.pyplot as plt
import io
import base64

def gerar_relatorio_diario():
    # Conectar ao banco
    conn = psycopg2.connect("dbname=aguada user=aguada password=senha123")
    cur = conn.cursor()
    
    # Data do relatório (ontem)
    data_relatorio = (datetime.now() - timedelta(days=1)).date()
    
    # Consulta 1: Volume consumido
    cur.execute("""
        SELECT SUM(ABS(volume_estimado_l)) as total
        FROM evento_hidrico 
        WHERE tipo = 'consumo' 
        AND DATE(inicio) = %s
    """, (data_relatorio,))
    volume_consumido = cur.fetchone()[0] or 0
    
    # Consulta 2: Volume abastecido
    cur.execute("""
        SELECT SUM(volume_estimado_l) as total
        FROM evento_hidrico 
        WHERE tipo = 'abastecimento' 
        AND DATE(inicio) = %s
    """, (data_relatorio,))
    volume_abastecido = cur.fetchone()[0] or 0
    
    # Consulta 3: Eventos por tipo
    cur.execute("""
        SELECT tipo, COUNT(*) as quantidade
        FROM evento_hidrico 
        WHERE DATE(inicio) = %s
        GROUP BY tipo
    """, (data_relatorio,))
    eventos_por_tipo = dict(cur.fetchall())
    
    # Consulta 4: Alertas ativos
    cur.execute("""
        SELECT COUNT(*) FROM alerta 
        WHERE DATE(timestamp) = %s AND ativo = true
    """, (data_relatorio,))
    alertas_ativos = cur.fetchone()[0]
    
    # Calcular métricas
    eficiencia_sistema = (volume_consumido / volume_abastecido * 100) if volume_abastecido > 0 else 0
    vazamento_estimado = max(0, volume_abastecido - volume_consumido)
    
    # Gerar resumo textual
    resumo = f"""
RELATÓRIO DIÁRIO SISTEMA AGUADA - {data_relatorio}

=== VOLUMES ===
• Volume Consumido: {volume_consumido:,.1f} L
• Volume Abastecido: {volume_abastecido:,.1f} L
• Eficiência do Sistema: {eficiencia_sistema:.1f}%
• Vazamento Estimado: {vazamento_estimado:,.1f} L

=== EVENTOS DETECTADOS ===
• Abastecimentos: {eventos_por_tipo.get('abastecimento', 0)} eventos
• Consumos: {eventos_por_tipo.get('consumo', 0)} eventos
• Vazamentos: {eventos_por_tipo.get('vazamento', 0)} eventos
• Alertas Ativos: {alertas_ativos} alertas

=== STATUS GERAL ===
{'🟢 NORMAL' if vazamento_estimado < 100 else '🟡 ATENÇÃO' if vazamento_estimado < 500 else '🔴 CRÍTICO'}

Sistema gerado automaticamente em {datetime.now().strftime('%d/%m/%Y às %H:%M')}
"""
    
    # Salvar relatório no banco
    cur.execute("""
        INSERT INTO relatorio_diario (data, volume_consumido_total_l, 
                                    volume_abastecido_total_l, volume_vazado_estimado_l,
                                    eventos_registrados, alertas_ativos, resumo)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (data) DO UPDATE SET
        volume_consumido_total_l = EXCLUDED.volume_consumido_total_l,
        volume_abastecido_total_l = EXCLUDED.volume_abastecido_total_l,
        volume_vazado_estimado_l = EXCLUDED.volume_vazado_estimado_l,
        eventos_registrados = EXCLUDED.eventos_registrados,
        alertas_ativos = EXCLUDED.alertas_ativos,
        resumo = EXCLUDED.resumo,
        gerado_em = EXCLUDED.gerado_em
    """, (
        data_relatorio, volume_consumido, volume_abastecido, vazamento_estimado,
        sum(eventos_por_tipo.values()), alertas_ativos, resumo
    ))
    
    conn.commit()
    cur.close()
    conn.close()
    
    # Enviar por email (opcional)
    enviar_por_email(resumo, data_relatorio)
    
    print(f"Relatório diário gerado para {data_relatorio}")

def enviar_por_email(resumo, data):
    # Configurações SMTP
    smtp_server = "smtp.gmail.com"
    smtp_port = 587
    email_usuario = "sistema@aguada.com"
    email_senha = "senha_app"
    destinatarios = ["tecnico@empresa.com", "supervisor@empresa.com"]
    
    msg = MIMEText(resumo)
    msg['Subject'] = f"Relatório Diário Aguada - {data}"
    msg['From'] = email_usuario
    msg['To'] = ", ".join(destinatarios)
    
    try:
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(email_usuario, email_senha)
        server.send_message(msg)
        server.quit()
        print("Relatório enviado por email")
    except Exception as e:
        print(f"Erro ao enviar email: {e}")

if __name__ == "__main__":
    gerar_relatorio_diario()
```

## 🚀 Plano de Implementação

### Fase 1: Estrutura Base (Semanas 1-2)
- [ ] Configurar banco de dados com schema unificado
- [ ] Implementar firmware básico dos nodes ESP32-C3
- [ ] Desenvolver gateway com servidor web
- [ ] Configurar broker MQTT e InfluxDB

### Fase 2: Monitoramento (Semanas 3-4)
- [ ] Implementar leitura de sensores ultrassom
- [ ] Desenvolver sistema de compressão de dados
- [ ] Criar dashboard básico no Grafana
- [ ] Implementar detecção de eventos automática

### Fase 3: Interface e Controle (Semanas 5-6)
- [ ] Desenvolver interface web para configuração
- [ ] Implementar controle remoto de bombas/válvulas
- [ ] Criar sistema de alertas e notificações
- [ ] Integrar coordenadas e mapeamento

### Fase 4: Manutenção e Relatórios (Semanas 7-8)
- [ ] Implementar módulo de ordens de serviço
- [ ] Desenvolver relatórios automáticos diários
- [ ] Criar sistema de usuários e permissões
- [ ] Testes finais e documentação

## 📋 Checklist de Funcionalidades

### ✅ Must Have (Essencial)
- [x] Monitoramento de 6 reservatórios com sensores ultrassom
- [x] Controle de 5-10 bombas e ~20 válvulas
- [x] Cálculo automático de volume e percentual
- [x] Compressão inteligente de dados (tabela raw/processada)
- [x] Detecção automática de eventos (abastecimento, consumo, vazamento)
- [x] Relatório diário automático às 06:00h
- [x] Interface web local para configuração
- [x] Dashboard Grafana para supervisão
- [x] Sistema de usuários e logs de auditoria
- [x] Operação offline em servidor local

### 🔄 Should Have (Importante)
- [ ] Coordenadas geográficas para mapeamento
- [ ] Sensores de pressão e temperatura
- [ ] Cálculo de consumo energético das bombas
- [ ] Previsão de manutenção preditiva
- [ ] Integração com sistemas externos
- [ ] Backup automático dos dados
- [ ] Relatórios em PDF/Excel
- [ ] App mobile para supervisão

### 🎯 Could Have (Futuro)
- [ ] Integração com sistemas de billing
- [ ] Alertas por SMS/Telegram
- [ ] Machine learning para detecção de anomalias
- [ ] Simulação de cenários
- [ ] Integração com sistemas SCADA existentes
- [ ] Relatórios customizáveis
- [ ] API para terceiros

## 📞 Próximos Passos

1. **Validar o modelo de dados** com a equipe técnica
2. **Configurar ambiente de desenvolvimento** (Docker, banco, tools)
3. **Desenvolver protótipo** do primeiro node ESP32
4. **Testar conectividade** mesh e gateway
5. **Implementar interface web** básica no gateway
6. **Criar dashboard inicial** no Grafana
7. **Testar relatório automático** com dados simulados

---

*Este documento representa a especificação unificada do Sistema Supervisório Aguada, integrando todos os conceitos de monitoramento IoT, compressão de dados, detecção de eventos, gestão de manutenção e operação local offline.*