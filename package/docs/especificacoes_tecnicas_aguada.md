# Especificações Técnicas Detalhadas - Sistema Aguada

## 🔧 Configurações Físicas dos Reservatórios

### Dados Geométricos Precisos

#### Castelo de Consumo (Cilíndrico)
```cpp
// Configuração física
reservatorio.hsensor = 40;      // Distância do nível máximo da água até o sensor (cm)
reservatorio.altura = 400;      // Altura do nível máximo da água (cm)
reservatorio.diametro = 510;    // Diâmetro do reservatório (cm)

// Cálculos
volume_maximo = π × (2.55)² × 4.00 = 81.7 m³ = 81.700 L
```

#### Castelo de Incêndio (Cilíndrico)  
```cpp
// Configuração física
reservatorio.hsensor = 20;      // Distância do nível máximo da água até o sensor (cm)
reservatorio.altura = 400;      // Altura do nível máximo da água (cm)  
reservatorio.diametro = 510;    // Diâmetro do reservatório (cm)

// Cálculos
volume_maximo = π × (2.55)² × 4.00 = 81.7 m³ = 81.700 L
```

#### Cisterna IE01 (Retangular)
```cpp
// Configuração física
reservatorio.hsensor = 20;      // Distância do nível máximo da água até o sensor (cm)
reservatorio.altura = 240;      // Altura do nível máximo da água (cm)
reservatorio.comprimento = 585; // Comprimento do reservatório (cm)
reservatorio.largura = 1810;    // Largura do reservatório (cm)

// Cálculos
volume_maximo = 5.85 × 18.10 × 2.40 = 254.3 m³ = 254.300 L
```

#### Cisterna IE02 (Retangular)
```cpp
// Configuração física (mesma da IE01)
reservatorio.hsensor = 20;
reservatorio.altura = 240;
reservatorio.comprimento = 585;
reservatorio.largura = 1810;

// Cálculos
volume_maximo = 5.85 × 18.10 × 2.40 = 254.3 m³ = 254.300 L
```

## 📡 Configuração MQTT e Topologia

### Tópicos MQTT Estruturados
```
# Estrutura de tópicos
xaguada/site-a/{node_id}/telemetry      // Telemetria dos nodes
xaguada/site-a/{node_id}/events         // Eventos e alarmes
xaguada/site-a/{node_id}/cmd            // Comandos para nodes
xaguada/site-a/{node_id}/status         // Status do node

# Exemplos específicos
xaguada/site-a/consumo/telemetry
xaguada/site-a/incendio/telemetry  
xaguada/site-a/cisternas/telemetry
xaguada/site-a/gateway/bridge
```

### Payloads JSON Padrão

#### Telemetria - Reservatório de Consumo
```json
{
  "device_id": "consumo",
  "ts": "2025-11-10T11:29:29Z",
  "nivel_cm": 245,
  "volume_litros": 62300,
  "percentual": 76.3,
  "valvulas": {
    "entrada": 1,
    "saida_az": 0,
    "saida_av": 1
  },
  "bombas": {
    "principal": 1,
    "auxiliar": 0
  },
  "rssi": -65,
  "fw_version": "1.0.0",
  "battery_percent": 89
}
```

#### Telemetria - Cisternas IE
```json
{
  "device_id": "cisternas",
  "ts": "2025-11-10T11:29:29Z",
  "cisternas": {
    "ie01": {
      "nivel_cm": 290,
      "volume_litros": 210500,
      "percentual": 82.8
    },
    "ie02": {
      "nivel_cm": 275,
      "volume_litros": 199200,
      "percentual": 78.3
    }
  },
  "valvulas": {
    "saida_con": 1,
    "saida_cav": 0,
    "entrada_01": 1,
    "entrada_02": 0
  },
  "rssi": -60,
  "fw_version": "1.0.0"
}
```

## 🏗️ Docker Compose Completo

### Stack de Produção
```yaml
# docker-compose.yml
version: "3.8"

services:
  # Broker MQTT
  mosquitto:
    image: eclipse-mosquitto:2
    container_name: aguada-mosquitto
    ports:
      - "1883:1883"
      - "9001:9001"
    volumes:
      - ./config/mosquitto.conf:/mosquitto/config/mosquitto.conf:ro
      - mosquitto_data:/mosquitto/data
      - mosquitto_log:/mosquitto/log
    restart: unless-stopped
    networks:
      - aguada-net

  # Banco de dados principal
  postgresql:
    image: postgres:15
    container_name: aguada-postgres
    environment:
      POSTGRES_DB: aguada
      POSTGRES_USER: aguada_user
      POSTGRES_PASSWORD: agu@da2025
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./sql/init.sql:/docker-entrypoint-initdb.d/init.sql:ro
    ports:
      - "5432:5432"
    restart: unless-stopped
    networks:
      - aguada-net

  # Base de dados de séries temporais
  influxdb:
    image: influxdb:2.7
    container_name: aguada-influxdb
    ports:
      - "8086:8086"
    environment:
      DOCKER_INFLUXDB_INIT_MODE: setup
      DOCKER_INFLUXDB_INIT_USERNAME: admin
      DOCKER_INFLUXDB_INIT_PASSWORD: agu@da2025
      DOCKER_INFLUXDB_INIT_ORG: aguada
      DOCKER_INFLUXDB_INIT_BUCKET: telemetry
      DOCKER_INFLUXDB_INIT_RETENTION: 180d
    volumes:
      - influxdb_data:/var/lib/influxdb2
    restart: unless-stopped
    networks:
      - aguada-net

  # Node-RED para processamento
  nodered:
    image: nodered/node-red:latest
    container_name: aguada-nodered
    ports:
      - "1880:1880"
    volumes:
      - nodered_data:/data
      - ./nodered/flows:/data/flows.json:ro
    environment:
      - TZ=America/Sao_Paulo
    restart: unless-stopped
    networks:
      - aguada-net
    depends_on:
      - mosquitto
      - postgresql
      - influxdb

  # Dashboard Grafana
  grafana:
    image: grafana/grafana:latest
    container_name: aguada-grafana
    ports:
      - "3000:3000"
    volumes:
      - grafana_data:/var/lib/grafana
      - ./grafana/dashboards:/var/lib/grafana/dashboards
      - ./grafana/provisioning:/etc/grafana/provisioning
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=agu@da2025
      - GF_INSTALL_PLUGINS=grafana-piechart-panel
    restart: unless-stopped
    networks:
      - aguada-net
    depends_on:
      - influxdb

  # API Backend
  aguada-api:
    build: 
      context: ./backend
      dockerfile: Dockerfile
    container_name: aguada-api
    ports:
      - "8000:8000"
    environment:
      - DB_HOST=postgresql
      - DB_PORT=5432
      - DB_NAME=aguada
      - DB_USER=aguada_user
      - DB_PASSWORD=agu@da2025
      - MQTT_BROKER=mosquitto
      - MQTT_PORT=1883
    volumes:
      - ./backend/logs:/app/logs
    restart: unless-stopped
    networks:
      - aguada-net
    depends_on:
      - postgresql
      - mosquitto

  # Cron para relatórios diários
  aguada-cron:
    build:
      context: ./scripts
      dockerfile: Dockerfile.cron
    container_name: aguada-cron
    volumes:
      - ./scripts:/scripts:ro
      - ./reports:/reports
    environment:
      - DB_HOST=postgresql
      - DB_PORT=5432
      - DB_NAME=aguada
      - DB_USER=aguada_user
      - DB_PASSWORD=agu@da2025
    networks:
      - aguada-net
    depends_on:
      - postgresql
    restart: unless-stopped

volumes:
  mosquitto_data:
  mosquitto_log:
  postgres_data:
  influxdb_data:
  nodered_data:
  grafana_data:

networks:
  aguada-net:
    driver: bridge
```

### Configuração do Mosquitto
```conf
# config/mosquitto.conf

# Configurações básicas
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
log_type error
log_type warning
log_type notice
log_type information

# Conexões de clientes
connection_messages true
log_timestamp true

# Configuração de listener
listener 1883
protocol mqtt

# Configuração WebSocket (para navegador)
listener 9001
protocol websockets

# Configurações de segurança
allow_anonymous true
#allow_zero_length_clientid false

# Configurações de QoS
max_inflight_messages 20
max_queued_messages 1000

# Configurações de retenção
retained_persistence true
```

## 🔄 Node-RED Flows

### Flow Principal de Processamento
```json
[
  {
    "id": "mqtt_in",
    "type": "mqtt in",
    "topic": "xaguada/site-a/+/telemetry",
    "name": "MQTT Telemetria",
    "broker": "mosquitto",
    "x": 100,
    "y": 100,
    "wires": [["processamento"]]
  },
  {
    "id": "processamento",
    "type": "function",
    "name": "Processar Telemetria",
    "func": "const msg = JSON.parse(msg.payload);\n\n// Validar dados\nif (!msg.device_id || !msg.ts) {\n    return null;\n}\n\n// Calcular métricas adicionais\nif (msg.volume_litros && msg.percentual === undefined) {\n    // Determinar capacidade máxima baseada no device_id\n    const capacidades = {\n        'consumo': 81700,\n        'incendio': 81700,\n        'cisternas': 254300\n    };\n    \n    const capacidade = capacidades[msg.device_id] || 81700;\n    msg.percentual = (msg.volume_litros / capacidade) * 100;\n}\n\n// Detectar eventos\nmsg.eventos = detectarEventos(msg);\n\n// Adicionar timestamp de processamento\nmsg.processado_em = new Date().toISOString();\n\nreturn msg;",
    "outputs": 1,
    "x": 350,
    "y": 100,
    "wires": [["postgres_insert", "influxdb_insert", "detectar_eventos"]]
  },
  {
    "id": "detectar_eventos",
    "type": "function", 
    "name": "Detectar Eventos",
    "func": "// Lógica de detecção de eventos\nconst eventos = [];\n\n// Verificar mudança de nível\nif (msg.nivel_anterior && msg.nivel_cm) {\n    const delta = msg.nivel_cm - msg.nivel_anterior;\n    \n    if (delta > 50) { // Aumento significativo\n        eventos.push({\n            tipo: 'abastecimento',\n            nivel_confianca: 0.95,\n            detalhes: {\n                delta_nivel: delta,\n                volume_estimado_l: delta * 0.785 // Para reservatório cilíndrico\n            }\n        });\n    } else if (delta < -10) { // Redução significativa\n        eventos.push({\n            tipo: 'consumo',\n            nivel_confianca: 0.80,\n            detalhes: {\n                delta_nivel: delta,\n                volume_estimado_l: Math.abs(delta) * 0.785\n            }\n        });\n    }\n}\n\n// Verificar nível crítico\nif (msg.percentual < 10) {\n    eventos.push({\n        tipo: 'nivel_critico',\n        nivel_confianca: 1.00,\n        detalhes: {\n            percentual_atual: msg.percentual,
            volume_atual: msg.volume_litros\n        }\n    });\n} else if (msg.percentual > 95) {\n    eventos.push({\n        tipo: 'nivel_alto',\n        nivel_confianca: 1.00,\n        detalhes: {\n            percentual_atual: msg.percentual\n        }\n    });\n}\n\nmsg.eventos = eventos;\nreturn msg;",
    "outputs": 1,
    "x": 600,
    "y": 100,
    "wires": [["eventos_db"]]
  }
]
```

## 📊 Dashboard Grafana - Painéis Específicos

### Painel de Status dos Reservatórios
```json
{
  "dashboard": {
    "id": null,
    "title": "Aguada - Status Geral",
    "panels": [
      {
        "id": 1,
        "title": "Nível dos Reservatórios (%)",
        "type": "stat",
        "targets": [
          {
            "expr": "aguada_nivel_percent{reservatorio=\"consumo\"}",
            "refId": "A"
          },
          {
            "expr": "aguada_nivel_percent{reservatorio=\"incendio\"}", 
            "refId": "B"
          }
        ],
        "fieldConfig": {
          "defaults": {
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {"color": "red", "value": null},
                {"color": "orange", "value": 20},
                {"color": "green", "value": 50}
              ]
            },
            "unit": "percent"
          }
        }
      },
      {
        "id": 2,
        "title": "Volume dos Reservatórios (L)",
        "type": "bargauge",
        "targets": [
          {
            "expr": "aguada_volume_litros{reservatorio=\"consumo\"}",
            "refId": "A"
          }
        ],
        "fieldConfig": {
          "defaults": {
            "min": 0,
            "max": 81700,
            "unit": "short"
          }
        }
      }
    ]
  }
}
```

## 🔐 Sistema de Autenticação e Usuários

### Estrutura de Usuários
```sql
-- Inserir usuários padrão
INSERT INTO usuario (nome, login, senha_hash, papel, email) VALUES
('Administrador', 'admin', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewQq5uz3ElS8H9aK', 'admin', 'admin@aguada.com'),
('Técnico', 'tecnico', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewQq5uz3ElS8H9aK', 'tecnico', 'tecnico@aguada.com'),
('Operador', 'operador', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewQq5uz3ElS8H9aK', 'operador', 'operador@aguada.com');

-- Permissões por papel
CREATE TABLE permissao (
    id SERIAL PRIMARY KEY,
    papel VARCHAR(20) NOT NULL,
    recurso VARCHAR(50) NOT NULL,  -- 'leitura_reservatorio', 'controle_bomba', 'configuracao'
    acao VARCHAR(20) NOT NULL      -- 'read', 'write', 'admin'
);

INSERT INTO permissao (papel, recurso, acao) VALUES
('admin', 'all', 'admin'),
('tecnico', 'leitura_reservatorio', 'read'),
('tecnico', 'controle_bomba', 'write'),
('tecnico', 'configuracao', 'read'),
('operador', 'leitura_reservatorio', 'read'),
('operador', 'estado_atuador', 'read');
```

### API de Autenticação
```python
# auth.py
from flask import Flask, request, jsonify
from flask_jwt_extended import JWTManager, create_access_token
import hashlib

app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'aguada-secret-key-2025'
jwt = JWTManager(app)

@app.route('/api/auth/login', methods=['POST'])
def login():
    data = request.json
    login = data.get('login')
    senha = data.get('senha')
    
    # Buscar usuário
    usuario = buscar_usuario_por_login(login)
    if not usuario or not verificar_senha(senha, usuario['senha_hash']):
        return jsonify({'error': 'Credenciais inválidas'}), 401
    
    # Gerar token
    access_token = create_access_token(identity=usuario['id'])
    
    return jsonify({
        'access_token': access_token,
        'usuario': {
            'id': usuario['id'],
            'nome': usuario['nome'],
            'papel': usuario['papel']
        }
    })

@app.route('/api/auth/verificar', methods=['GET'])
@jwt_required()
def verificar_token():
    return jsonify({'status': 'ok'})

def verificar_senha(senha, hash_armazenado):
    # Implementar verificação segura de senha
    return hash_armazenado == hashlib.sha256(senha.encode()).hexdigest()
```

## 📈 Cálculos de Performance do Sistema

### Fórmulas de Eficiência
```sql
-- Função para calcular eficiência diária
CREATE OR REPLACE FUNCTION calcular_eficiencia_diaria(p_data DATE)
RETURNS TABLE (
    data DATE,
    volume_consumido NUMERIC,
    volume_abastecido NUMERIC,
    eficiencia_percent NUMERIC,
    vazamento_estimado NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    WITH metricas AS (
        SELECT 
            COUNT(CASE WHEN eh.tipo = 'consumo' THEN 1 END) as qtd_consumo,
            COALESCE(SUM(CASE WHEN eh.tipo = 'consumo' THEN ABS(eh.volume_estimado_l) END), 0) as volume_consumido,
            COUNT(CASE WHEN eh.tipo = 'abastecimento' THEN 1 END) as qtd_abastecimento,
            COALESCE(SUM(CASE WHEN eh.tipo = 'abastecimento' THEN eh.volume_estimado_l END), 0) as volume_abastecido
        FROM evento_hidrico eh
        WHERE DATE(eh.inicio) = p_data
    )
    SELECT 
        p_data,
        m.volume_consumido,
        m.volume_abastecido,
        CASE 
            WHEN m.volume_abastecido > 0 THEN 
                ROUND((m.volume_consumido / m.volume_abastecido * 100), 2)
            ELSE 0 
        END as eficiencia_percent,
        GREATEST(0, m.volume_abastecido - m.volume_consumido) as vazamento_estimado
    FROM metricas m;
END;
$$ LANGUAGE plpgsql;
```

### Alertas Automáticos
```sql
-- Trigger para alertas automáticos
CREATE OR REPLACE FUNCTION verificar_alertas_automaticos()
RETURNS TRIGGER AS $$
DECLARE
    reserv_config RECORD;
    nivel_percent NUMERIC;
BEGIN
    -- Buscar configuração do reservatório
    SELECT rc.*, e.nome
    INTO reserv_config
    FROM reservatorio_config rc
    JOIN elemento e ON e.id = rc.elemento_id
    WHERE e.id = NEW.elemento_id;
    
    IF FOUND THEN
        -- Calcular percentual
        nivel_percent = (NEW.valor / 100.0) * 100; -- Assumindo valor em cm
        
        -- Alerta de nível baixo
        IF nivel_percent < 20 THEN
            INSERT INTO alerta (severidade, tipo, elemento_id, mensagem)
            VALUES (
                CASE 
                    WHEN nivel_percent < 10 THEN 'critico'
                    ELSE 'aviso'
                END,
                'nivel_baixo',
                NEW.elemento_id,
                format('Nível baixo detectado: %.1f%% no reservatório %s', 
                       nivel_percent, reserv_config.nome)
            );
        END IF;
        
        -- Alerta de nível alto
        IF nivel_percent > 90 THEN
            INSERT INTO alerta (severidade, tipo, elemento_id, mensagem)
            VALUES (
                'aviso',
                'nivel_alto',
                NEW.elemento_id,
                format('Nível alto detectado: %.1f%% no reservatório %s', 
                       nivel_percent, reserv_config.nome)
            );
        END IF;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_alertas_nivel
    AFTER INSERT ON leitura_processada
    FOR EACH ROW
    WHEN (NEW.atributo = 'nivel_cm')
    EXECUTE FUNCTION verificar_alertas_automaticos();
```

## 🚀 Script de Deploy Automatizado

### Deploy do Sistema Completo
```bash
#!/bin/bash
# deploy_aguada.sh

set -e

echo "🚀 Iniciando deploy do Sistema Supervisório Aguada..."

# Verificar dependências
command -v docker >/dev/null 2>&1 || { echo "Docker é obrigatório" >&2; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { echo "Docker Compose é obrigatório" >&2; exit 1; }

# Criar diretórios necessários
mkdir -p {config,sql,scripts,backend,nodered,grafana,reports,logs}

# Copiar arquivos de configuração
echo "📁 Configurando arquivos..."
cp config/mosquitto.conf.example config/mosquitto.conf
cp sql/init.sql.example sql/init.sql
cp backend/.env.example backend/.env

# Ajustar permissões
chmod 755 scripts/*.sh
chmod 600 backend/.env

# Build das imagens customizadas
echo "🔨 Construindo imagens Docker..."
docker-compose build

# Iniciar serviços
echo "🟢 Iniciando serviços..."
docker-compose up -d

# Aguardar serviços ficarem prontos
echo "⏳ Aguardando serviços ficarem prontos..."
sleep 30

# Verificar status dos serviços
echo "🔍 Verificando status dos serviços..."
docker-compose ps

# Executar migrações do banco
echo "🗄️ Executando migrações do banco..."
docker-compose exec postgresql psql -U aguada_user -d aguada -f /docker-entrypoint-initdb.d/init.sql

# Verificar conectividade MQTT
echo "📡 Testando conectividade MQTT..."
if docker-compose exec -T mosquitto mosquitto_pub -h localhost -t test/topic -m "teste-conectividade"; then
    echo "✅ MQTT funcionando"
else
    echo "❌ Problema no MQTT"
fi

# Configurar Grafana (se necessário)
echo "📊 Configurando Grafana..."
# Aquí podem ser adicionados comandos para configurar datasources

echo "✅ Deploy concluído com sucesso!"
echo ""
echo "🌐 Acesso aos serviços:"
echo "  • Dashboard Grafana: http://localhost:3000 (admin/agu@da2025)"
echo "  • Node-RED: http://localhost:1880"
echo "  • API Backend: http://localhost:8000"
echo "  • Broker MQTT: localhost:1883"
echo ""
echo "📱 Para monitorar logs:"
echo "  docker-compose logs -f [servico]"
```

## 📋 Checklist de Validação

### Validação de Hardware
- [ ] ESP32-C3 SuperMini com firmware carregado
- [ ] Sensores ultrassom JSN-SR04T conectados
- [ ] Módulos de relé para controle de bombas
- [ ] Sensores de pressão (se aplicável)
- [ ] Rede WiFi configurada

### Validação de Software
- [ ] Banco de dados PostgreSQL funcionando
- [ ] Broker MQTT接收 dados
- [ ] Dashboard Grafana carregando
- [ ] API REST respondendo
- [ ] Relatórios automáticos sendo gerados

### Validação Funcional
- [ ] Leituras sendo processadas corretamente
- [ ] Cálculos de volume precisos
- [ ] Eventos sendo detectados
- [ ] Alertas funcionando
- [ ] Controle remoto operacional

---

*Este documento contém as especificações técnicas detalhadas para implementação prática do Sistema Supervisório Aguada, incluindo configurações precisas, códigos de exemplo e procedimentos de deploy.*