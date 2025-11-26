# Código de Exemplo e Templates - Sistema Aguada

## 🖥️ Firmware ESP32-C3 - Node Principal

### Configuração do Node de Reservatório
```cpp
/*
 * Aguada Node ESP32-C3 - Monitoramento de Reservatório
 * Versão: 1.0.0
 * Autor: Sistema Aguada
 */

#include <Arduino.h>
#include <WiFi.h>
#include <painlessMesh.h>
#include <ArduinoJson.h>
#include <LittleFS.h>
#include <nvs.h>
#include <esp_system.h>
#include <esp_sleep.h>

// =============================================================================
// CONFIGURAÇÕES DO SISTEMA
// =============================================================================
#define MESH_PREFIX   "aguada"
#define MESH_PASSWORD "agu@da2025"
#define MESH_PORT     5555
#define LED_PIN       2
#define BUTTON_PIN    0

// Parâmetros de operação
#define READ_INTERVAL    10000   // 10 segundos - leitura sensores
#define PUBLISH_INTERVAL 30000   // 30 segundos - envio dados
#define DEEP_SLEEP_TIME  300000  // 5 minutos - modo econômico

// =============================================================================
// ESTRUTURAS DE DADOS
// =============================================================================
struct ReservatorioConfig {
    String device_id;
    String nome;
    String tipo;                 // "cilindrico" ou "retangular"
    float hsensor_cm;            // Distância sensor ao nível máximo
    float altura_cm;             // Altura útil do reservatório
    float diametro_cm;           // Para cilíndricos
    float comprimento_cm;        // Para retangulares
    float largura_cm;            // Para retangulares
    float volume_maximo_litros;  // Volume máximo calculado
    int pino_trig;               // Pino Trigger ultrassom
    int pino_echo;               // Pino Echo ultrassom
    float deadband_cm;           // Tolerância para compressão
};

struct TelemetryData {
    String device_id;
    uint32_t timestamp;
    float nivel_cm;
    float volume_litros;
    float percentual;
    int qualidade_sinal;
    int rssi;
    float vdd_volt;              // Tensão da bateria
    uint32_t uptime_seg;
    float temp_celsius;          // Temperatura interna
};

// =============================================================================
// VARIÁVEIS GLOBAIS
// =============================================================================
Scheduler taskScheduler;
painlessMesh mesh;
ReservatorioConfig config;
TelemetryData telemetry;

// Filtro de mediana para leituras estáveis
#define MEDIAN_WINDOW 11
float leituras_nivel[MEDIAN_WINDOW];
int indice_leitura = 0;
bool buffer_preenchido = false;

float ultima_leitura_processada = -1;
uint32_t ultima_leitura_timestamp = 0;

// =============================================================================
// FUNÇÕES DE CONFIGURAÇÃO E INICIALIZAÇÃO
// =============================================================================
bool loadConfig() {
    Serial.println("📁 Carregando configuração...");
    
    if (!LittleFS.begin()) {
        Serial.println("❌ Erro ao inicializar LittleFS");
        return false;
    }
    
    File file = LittleFS.open("/config.json", "r");
    if (!file) {
        Serial.println("❌ Arquivo config.json não encontrado");
        return false;
    }
    
    DynamicJsonDocument doc(1024);
    DeserializationError error = deserializeJson(doc, file);
    if (error) {
        Serial.print("❌ Erro ao ler JSON: ");
        Serial.println(error.c_str());
        return false;
    }
    
    // Carregar configurações
    config.device_id = doc["device_id"].as<String>();
    config.nome = doc["nome"].as<String>();
    config.tipo = doc["tipo"].as<String>();
    config.hsensor_cm = doc["hsensor_cm"];
    config.altura_cm = doc["altura_cm"];
    config.diametro_cm = doc["diametro_cm"];
    config.comprimento_cm = doc["comprimento_cm"];
    config.largura_cm = doc["largura_cm"];
    config.pino_trig = doc["pino_trig"];
    config.pino_echo = doc["pino_echo"];
    config.deadband_cm = doc["deadband_cm"];
    
    // Calcular volume máximo
    if (config.tipo == "cilindrico") {
        float raio_m = (config.diametro_cm / 100.0) / 2.0;
        float volume_m3 = PI * pow(raio_m, 2) * (config.altura_cm / 100.0);
        config.volume_maximo_litros = volume_m3 * 1000.0;
    } else if (config.tipo == "retangular") {
        float volume_m3 = (config.comprimento_cm / 100.0) * 
                         (config.largura_cm / 100.0) * 
                         (config.altura_cm / 100.0);
        config.volume_maximo_litros = volume_m3 * 1000.0;
    }
    
    Serial.println("✅ Configuração carregada:");
    Serial.println("  Device ID: " + config.device_id);
    Serial.println("  Tipo: " + config.tipo);
    Serial.println("  Volume Max: " + String(config.volume_maximo_litros) + " L");
    
    file.close();
    return true;
}

void initHardware() {
    Serial.println("🔧 Inicializando hardware...");
    
    // Configurar pinos
    pinMode(LED_PIN, OUTPUT);
    pinMode(BUTTON_PIN, INPUT_PULLUP);
    pinMode(config.pino_trig, OUTPUT);
    pinMode(config.pino_echo, INPUT);
    
    // Teste inicial dos sensores
    digitalWrite(LED_PIN, HIGH);
    delay(500);
    digitalWrite(LED_PIN, LOW);
    
    Serial.println("✅ Hardware inicializado");
}

void initMesh() {
    Serial.println("📡 Inicializando rede mesh...");
    
    mesh.setDebugMsgTypes(ERROR | STARTUP);
    if (!mesh.init(MESH_PREFIX, MESH_PASSWORD, MESH_PORT)) {
        Serial.println("❌ Erro ao inicializar mesh");
        return;
    }
    
    mesh.onReceive([](uint32_t from, String &msg) {
        Serial.printf("📨 Recebido da mesh: %s\\n", msg.c_str());
        processReceivedMessage(msg);
    });
    
    Serial.println("✅ Rede mesh ativa");
}

// =============================================================================
// FUNÇÕES DE LEITURA E PROCESSAMENTO
// =============================================================================
long readUltrasonicCM() {
    // Limpar o pino trigger
    digitalWrite(config.pino_trig, LOW);
    delayMicroseconds(2);
    
    // Gerar pulso de 10us no trigger
    digitalWrite(config.pino_trig, HIGH);
    delayMicroseconds(10);
    digitalWrite(config.pino_trig, LOW);
    
    // Ler o echo (tempo de resposta em microsegundos)
    long duracao = pulseIn(config.pino_echo, HIGH, 30000); // Timeout 30ms
    
    if (duracao == 0) {
        Serial.println("⚠️ Timeout no sensor ultrassom");
        return -1;
    }
    
    // Calcular distância (velocidade do som ~ 0.034 cm/us)
    long distancia_cm = (duracao * 0.034) / 2;
    
    // Validar leitura
    if (distancia_cm < 0 || distancia_cm > 1000) {
        Serial.println("⚠️ Leitura inválida do sensor: " + String(distancia_cm));
        return -1;
    }
    
    return distancia_cm;
}

float calcularNivel(float distancia_cm) {
    // Nível útil = altura total - (distância medida - offset hsensor)
    float nivel_cm = config.altura_cm - (distancia_cm - config.hsensor_cm);
    
    // Aplicar limites
    if (nivel_cm < 0) nivel_cm = 0;
    if (nivel_cm > config.altura_cm) nivel_cm = config.altura_cm;
    
    return nivel_cm;
}

float calcularVolume(float nivel_cm) {
    float volume_litros = 0;
    
    if (config.tipo == "cilindrico") {
        // V = π × r² × h
        float raio_m = (config.diametro_cm / 100.0) / 2.0;
        float volume_m3 = PI * pow(raio_m, 2) * (nivel_cm / 100.0);
        volume_litros = volume_m3 * 1000.0;
    } else if (config.tipo == "retangular") {
        // V = C × L × h
        float volume_m3 = (config.comprimento_cm / 100.0) * 
                         (config.largura_cm / 100.0) * 
                         (nivel_cm / 100.0);
        volume_litros = volume_m3 * 1000.0;
    }
    
    return volume_litros;
}

float aplicarFiltroMediana(float novo_nivel) {
    // Adicionar nova leitura ao buffer
    leituras_nivel[indice_leitura] = novo_nivel;
    indice_leitura = (indice_leitura + 1) % MEDIAN_WINDOW;
    
    if (indice_leitura == 0) {
        buffer_preenchido = true;
    }
    
    // Calcular mediana apenas se buffer estiver preenchido
    if (!buffer_preenchido) {
        return novo_nivel;
    }
    
    // Criar cópia do buffer para ordenação
    float buffer_temp[MEDIAN_WINDOW];
    for (int i = 0; i < MEDIAN_WINDOW; i++) {
        buffer_temp[i] = leituras_nivel[i];
    }
    
    // Ordenar (bubble sort simples)
    for (int i = 0; i < MEDIAN_WINDOW - 1; i++) {
        for (int j = 0; j < MEDIAN_WINDOW - i - 1; j++) {
            if (buffer_temp[j] > buffer_temp[j + 1]) {
                float temp = buffer_temp[j];
                buffer_temp[j] = buffer_temp[j + 1];
                buffer_temp[j + 1] = temp;
            }
        }
    }
    
    // Retornar mediana (elemento do meio)
    return buffer_temp[MEDIAN_WINDOW / 2];
}

String gerarJsonTelemetry() {
    DynamicJsonDocument doc(512);
    
    doc["device_id"] = config.device_id;
    doc["timestamp"] = millis() / 1000;
    doc["nivel_cm"] = telemetry.nivel_cm;
    doc["volume_litros"] = telemetry.volume_litros;
    doc["percentual"] = telemetry.percentual;
    doc["qualidade_sinal"] = telemetry.qualidade_sinal;
    doc["rssi"] = telemetry.rssi;
    doc["vdd_volt"] = telemetry.vdd_volt;
    doc["uptime_seg"] = telemetry.uptime_seg;
    doc["temp_celsius"] = telemetry.temp_celsius;
    doc["fw_version"] = "1.0.0";
    
    String json;
    serializeJson(doc, json);
    return json;
}

void collectTelemetry() {
    Serial.println("🔍 Coletando telemetria...");
    
    // Ler sensor ultrassom
    long distancia_bruta = readUltrasonicCM();
    if (distancia_bruta < 0) {
        Serial.println("❌ Falha na leitura do sensor");
        return;
    }
    
    // Calcular nível e volume
    float nivel_bruto = calcularNivel(distancia_bruta);
    float nivel_filtrado = aplicarFiltroMediana(nivel_bruto);
    float volume = calcularVolume(nivel_filtrado);
    float percentual = (volume / config.volume_maximo_litros) * 100.0;
    
    // Validar qualidade do sinal
    int qualidade = 100;
    if (abs(nivel_bruto - nivel_filtrado) > 5.0) {
        qualidade = 70; // Sinal com ruído
    }
    
    // Atualizar estrutura de telemetria
    telemetry.nivel_cm = nivel_filtrado;
    telemetry.volume_litros = volume;
    telemetry.percentual = percentual;
    telemetry.qualidade_sinal = qualidade;
    telemetry.rssi = WiFi.RSSI();
    telemetry.vdd_volt = (float)esp_adc_get_cal_raw(ESP_ADC_CHANNEL_0) / 4095.0 * 3.3;
    telemetry.uptime_seg = millis() / 1000;
    telemetry.temp_celsius = temperatureRead();
    
    Serial.println("✅ Telemetria coletada:");
    Serial.println("  Nível: " + String(telemetry.nivel_cm) + " cm");
    Serial.println("  Volume: " + String(telemetry.volume_litros) + " L");
    Serial.println("  Percentual: " + String(telemetry.percentual) + " %");
}

void sendTelemetry() {
    String json = gerarJsonTelemetry();
    
    Serial.println("📤 Enviando telemetria: " + json);
    
    if (mesh.sendBroadcast(json)) {
        digitalWrite(LED_PIN, HIGH);
        delay(100);
        digitalWrite(LED_PIN, LOW);
        Serial.println("✅ Telemetria enviada");
    } else {
        Serial.println("❌ Falha ao enviar telemetria");
    }
}

void processReceivedMessage(String &msg) {
    DynamicJsonDocument doc(256);
    DeserializationError error = deserializeJson(doc, msg);
    
    if (error) {
        Serial.println("❌ Erro ao processar mensagem: " + String(error.c_str()));
        return;
    }
    
    String command = doc["command"];
    
    if (command == "get_config") {
        // Enviar configuração atual
        DynamicJsonDocument response(256);
        response["device_id"] = config.device_id;
        response["config"] = {
            {"hsensor_cm", config.hsensor_cm},
            {"altura_cm", config.altura_cm},
            {"diametro_cm", config.diametro_cm},
            {"volume_max", config.volume_maximo_litros}
        };
        
        String response_json;
        serializeJson(response, response_json);
        mesh.sendBroadcast(response_json);
        
    } else if (command == "reset_config") {
        // Resetar configuração (pode ser usado para reprogramação)
        Serial.println("🔄 Resetando configuração...");
        LittleFS.remove("/config.json");
        ESP.restart();
    }
}

// =============================================================================
// TAREFAS AGENDADAS
// =============================================================================
void taskReadSensors() {
    collectTelemetry();
}

void taskSendTelemetry() {
    sendTelemetry();
}

void taskCheckSystem() {
    // Verificar watchdog e outros aspectos do sistema
    static uint32_t last_check = 0;
    uint32_t now = millis();
    
    if (now - last_check > 60000) { // A cada minuto
        Serial.println("💚 Sistema OK - Uptime: " + String(now / 1000) + "s");
        
        // Verificar memória livre
        size_t free_heap = ESP.getFreeHeap();
        Serial.println("🧠 Memória livre: " + String(free_heap) + " bytes");
        
        if (free_heap < 10000) {
            Serial.println("⚠️ Memória baixa, reiniciando...");
            ESP.restart();
        }
        
        last_check = now;
    }
}

// =============================================================================
// CONFIGURAÇÃO E LOOP PRINCIPAL
// =============================================================================
void setup() {
    Serial.begin(115200);
    Serial.println();
    Serial.println("🚰 Aguada Node ESP32-C3 v1.0.0");
    Serial.println("===================================");
    
    // Inicializar componentes
    if (!loadConfig()) {
        Serial.println("❌ Falha na configuração, reiniciando...");
        delay(5000);
        ESP.restart();
    }
    
    initHardware();
    initMesh();
    
    // Agendar tarefas
    taskScheduler.setInterval(READ_INTERVAL, taskReadSensors);
    taskScheduler.setInterval(PUBLISH_INTERVAL, taskSendTelemetry);
    taskScheduler.setInterval(60000, taskCheckSystem);
    
    // Primeira leitura
    collectTelemetry();
    
    Serial.println("✅ Sistema inicializado e funcionando");
    Serial.println("===================================");
}

void loop() {
    // Atualizar scheduler e mesh
    taskScheduler.execute();
    mesh.update();
    
    // Verificar botão de reset
    static uint32_t last_button_check = 0;
    if (millis() - last_button_check > 100) {
        if (digitalRead(BUTTON_PIN) == LOW) {
            // Botão pressionado - reiniciar
            Serial.println("🔄 Reiniciando por botão...");
            delay(1000);
            ESP.restart();
        }
        last_button_check = millis();
    }
    
    // Modo deep sleep econômico (opcional)
    static uint32_t last_sleep_check = 0;
    if (millis() - last_sleep_check > DEEP_SLEEP_TIME) {
        Serial.println("💤 Entrando em modo econômico...");
        // esp_deep_sleep_start(); // Descomente para ativar
    }
}
```

## 🔌 Configuração JSON do Node
```json
{
  "device_id": "consumo",
  "nome": "Reservatório Castelo de Consumo",
  "tipo": "cilindrico",
  "hsensor_cm": 40,
  "altura_cm": 400,
  "diametro_cm": 510,
  "pino_trig": 4,
  "pino_echo": 5,
  "deadband_cm": 2.0,
  "calibracao": {
    "offset_cm": 1.2,
    "fator_correcao": 0.98
  },
  "comunicacao": {
    "mesh_prefix": "aguada",
    "mesh_password": "agu@da2025",
    "report_interval": 30,
    "read_interval": 10
  },
  "alertas": {
    "nivel_baixo_percent": 20,
    "nivel_critico_percent": 10,
    "nivel_alto_percent": 95
  }
}
```

## 🏗️ Backend Python - API Principal

### Aplicação Flask Completa
```python
#!/usr/bin/env python3
# app.py - API Principal Sistema Aguada

from flask import Flask, request, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager, jwt_required, create_access_token
from flask_mail import Mail, Message
from datetime import datetime, timedelta
import json
import hashlib
import paho.mqtt.client as mqtt
import threading
import time

app = Flask(__name__)

# Configuração
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://aguada_user:agu@da2025@postgresql:5432/aguada'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['JWT_SECRET_KEY'] = 'aguada-jwt-secret-2025'
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'sistema@aguada.com'
app.config['MAIL_PASSWORD'] = 'senha_app'

# Inicializar extensões
db = SQLAlchemy(app)
jwt = JWTManager(app)
mail = Mail(app)

# =============================================================================
# MODELOS DO BANCO
# =============================================================================
class Elemento(db.Model):
    __tablename__ = 'elemento'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(50), nullable=False)
    tipo = db.Column(db.String(30), nullable=False)
    descricao = db.Column(db.Text)
    capacidade_litros = db.Column(db.Numeric)
    coord_x = db.Column(db.Numeric)
    coord_y = db.Column(db.Numeric)
    coord_z = db.Column(db.Numeric)
    ativo = db.Column(db.Boolean, default=True)
    criado_em = db.Column(db.DateTime, default=datetime.utcnow)

class LeituraRaw(db.Model):
    __tablename__ = 'leitura_raw'
    id = db.Column(db.BigInteger, primary_key=True)
    elemento_id = db.Column(db.Integer, db.ForeignKey('elemento.id'), nullable=False)
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)
    valor_bruto = db.Column(db.Numeric)
    origem = db.Column(db.String(50))
    qualidade = db.Column(db.String(20), default='ok')

class LeituraProcessada(db.Model):
    __tablename__ = 'leitura_processada'
    id = db.Column(db.BigInteger, primary_key=True)
    elemento_id = db.Column(db.Integer, db.ForeignKey('elemento.id'), nullable=False)
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)
    valor = db.Column(db.Numeric)
    volume_litros = db.Column(db.Numeric)
    percentual = db.Column(db.Numeric)
    metodo_processamento = db.Column(db.String(50))
    status = db.Column(db.String(20), default='valida')

class EventoHidrico(db.Model):
    __tablename__ = 'evento_hidrico'
    id = db.Column(db.BigInteger, primary_key=True)
    tipo = db.Column(db.String(50), nullable=False)
    elemento_id = db.Column(db.Integer, db.ForeignKey('elemento.id'))
    inicio = db.Column(db.DateTime, nullable=False)
    fim = db.Column(db.DateTime)
    volume_estimado_l = db.Column(db.Numeric)
    detalhes = db.Column(db.Text)
    nivel_confianca = db.Column(db.Numeric(4, 2))
    detectado_por = db.Column(db.String(50))
    status = db.Column(db.String(20), default='ativo')

class Alerta(db.Model):
    __tablename__ = 'alerta'
    id = db.Column(db.BigInteger, primary_key=True)
    severidade = db.Column(db.String(20), nullable=False)
    tipo = db.Column(db.String(50), nullable=False)
    elemento_id = db.Column(db.Integer, db.ForeignKey('elemento.id'))
    mensagem = db.Column(db.Text, nullable=False)
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)
    ativo = db.Column(db.Boolean, default=True)
    confirmado_por = db.Column(db.String(50))

# =============================================================================
# CLIENTE MQTT
# =============================================================================
class MQTTClient:
    def __init__(self):
        self.client = mqtt.Client()
        self.client.on_connect = self.on_connect
        self.client.on_message = self.on_message
        self.client.connect("mosquitto", 1883, 60)
        self.client.subscribe("xaguada/site-a/+/telemetry")
        
    def on_connect(self, client, userdata, flags, rc):
        if rc == 0:
            print("✅ Conectado ao broker MQTT")
        else:
            print("❌ Falha na conexão MQTT: " + str(rc))
    
    def on_message(self, client, userdata, msg):
        try:
            payload = json.loads(msg.payload.decode())
            processar_telemetria(payload)
        except Exception as e:
            print(f"❌ Erro ao processar telemetria: {e}")

# Instância global do cliente MQTT
mqtt_client = MQTTClient()

# =============================================================================
# FUNÇÕES DE PROCESSAMENTO
# =============================================================================
def processar_telemetria(data):
    """Processa dados de telemetria recebidos via MQTT"""
    
    # Buscar elemento pelo device_id
    elemento = Elemento.query.filter_by(nome=data['device_id']).first()
    if not elemento:
        print(f"⚠️ Elemento não encontrado: {data['device_id']}")
        return
    
    # Inserir leitura raw
    leitura_raw = LeituraRaw(
        elemento_id=elemento.id,
        valor_bruto=data.get('nivel_cm', 0),
        origem=data.get('origem', 'esp32'),
        qualidade='ok' if data.get('qualidade_sinal', 100) > 80 else 'suspeita'
    )
    db.session.add(leitura_raw)
    
    # Calcular volume e percentual se não fornecidos
    volume_litros = data.get('volume_litros')
    percentual = data.get('percentual')
    
    if volume_litros is None and percentual is None:
        # Calcular baseado no tipo de elemento
        if elemento.capacidade_litros:
            volume_litros = (data.get('nivel_cm', 0) / 100.0) * elemento.capacidade_litros
            percentual = (volume_litros / elemento.capacidade_litros) * 100
    
    # Aplicar compressão de dados
    processar_compressao(elemento.id, data.get('nivel_cm', 0), volume_litros, percentual)
    
    db.session.commit()
    
    # Detectar eventos
    detectar_eventos(elemento.id, data)

def processar_compressao(elemento_id, nivel_cm, volume_litros, percentual):
    """Aplica compressão inteligente aos dados"""
    
    # Verificar última leitura processada
    ultima_leitura = LeituraProcessada.query.filter_by(
        elemento_id=elemento_id
    ).order_by(LeituraProcessada.timestamp.desc()).first()
    
    # Aplicar deadband (tolerância)
    if ultima_leitura and abs(nivel_cm - float(ultima_leitura.valor)) <= 2.0:
        # Apenas atualizar timestamp da última leitura
        ultima_leitura.timestamp = datetime.utcnow()
    else:
        # Nova leitura processada
        leitura_proc = LeituraProcessada(
            elemento_id=elemento_id,
            valor=nivel_cm,
            volume_litros=volume_litros,
            percentual=percentual,
            metodo_processamento='mediana_11',
            status='valida'
        )
        db.session.add(leitura_proc)

def detectar_eventos(elemento_id, data):
    """Detecta eventos automaticamente"""
    
    eventos_detectados = []
    
    # Obter histórico para análise
    leituras_recentes = LeituraProcessada.query.filter_by(
        elemento_id=elemento_id
    ).order_by(LeituraProcessada.timestamp.desc()).limit(3).all()
    
    if len(leituras_recentes) >= 2:
        nivel_atual = data.get('nivel_cm', 0)
        nivel_anterior = float(leituras_recentes[1].valor)
        delta = nivel_atual - nivel_anterior
        
        # Detectar abastecimento
        if delta > 50:  # Aumento significativo
            eventos_detectados.append({
                'tipo': 'abastecimento',
                'nivel_confianca': 0.95,
                'volume_estimado_l': delta * 0.785 * 1000  # Aproximação
            })
        
        # Detectar consumo
        elif delta < -10:  # Redução significativa
            eventos_detectados.append({
                'tipo': 'consumo',
                'nivel_confianca': 0.80,
                'volume_estimado_l': abs(delta) * 0.785 * 1000
            })
    
    # Verificar nível crítico
    percentual = data.get('percentual', 0)
    if percentual < 10:
        eventos_detectados.append({
            'tipo': 'nivel_critico',
            'nivel_confianca': 1.00,
            'volume_estimado_l': 0
        })
    elif percentual > 95:
        eventos_detectados.append({
            'tipo': 'nivel_alto',
            'nivel_confianca': 1.00,
            'volume_estimado_l': 0
        })
    
    # Inserir eventos detectados
    for evento in eventos_detectados:
        evento_db = EventoHidrico(
            tipo=evento['tipo'],
            elemento_id=elemento_id,
            inicio=datetime.utcnow(),
            volume_estimado_l=evento['volume_estimado_l'],
            nivel_confianca=evento['nivel_confianca'],
            detectado_por='sistema',
            status='ativo'
        )
        db.session.add(evento_db)
    
    # Gerar alertas para eventos críticos
    for evento in eventos_detectados:
        if evento['tipo'] in ['nivel_critico', 'nivel_alto']:
            elemento = Elemento.query.get(elemento_id)
            alerta = Alerta(
                severidade='critico' if evento['tipo'] == 'nivel_critico' else 'aviso',
                tipo=evento['tipo'],
                elemento_id=elemento_id,
                mensagem=f"{evento['tipo']} no reservatório {elemento.nome}: {percentual:.1f}%",
                ativo=True
            )
            db.session.add(alerta)

# =============================================================================
# ROTAS DA API
# =============================================================================
@app.route('/api/health', methods=['GET'])
def health_check():
    """Verificação de saúde da API"""
    return jsonify({
        'status': 'ok',
        'timestamp': datetime.utcnow().isoformat(),
        'version': '1.0.0'
    })

@app.route('/api/leitura', methods=['POST'])
@jwt_required()
def inserir_leitura():
    """Inserir leitura manual"""
    data = request.json
    
    # Validar dados
    if not all(k in data for k in ['elemento_id', 'valor']):
        return jsonify({'error': 'Dados incompletos'}), 400
    
    # Inserir leitura
    leitura = LeituraRaw(
        elemento_id=data['elemento_id'],
        valor_bruto=data['valor'],
        origem='usuario',
        qualidade='ok'
    )
    
    db.session.add(leitura)
    db.session.commit()
    
    return jsonify({'message': 'Leitura inserida com sucesso'}), 201

@app.route('/api/leitura/<int:elelemento_id>', methods=['GET'])
@jwt_required()
def obter_leituras(elemento_id):
    """Obter leituras de um elemento"""
    limite = request.args.get('limite', 100, type=int)
    
    leituras = LeituraProcessada.query.filter_by(
        elemento_id=elemento_id
    ).order_by(LeituraProcessada.timestamp.desc()).limit(limite).all()
    
    return jsonify([{
        'timestamp': l.timestamp.isoformat(),
        'valor': float(l.valor),
        'volume_litros': float(l.volume_litros) if l.volume_litros else None,
        'percentual': float(l.percentual) if l.percentual else None,
        'metodo': l.metodo_processamento
    } for l in leituras])

@app.route('/api/eventos', methods=['GET'])
@jwt_required()
def listar_eventos():
    """Listar eventos com filtros"""
    tipo = request.args.get('tipo')
    limite = request.args.get('limite', 50, type=int)
    data_inicio = request.args.get('data_inicio')
    data_fim = request.args.get('data_fim')
    
    query = EventoHidrico.query
    
    if tipo:
        query = query.filter(EventoHidrico.tipo == tipo)
    if data_inicio:
        query = query.filter(EventoHidrico.inicio >= data_inicio)
    if data_fim:
        query = query.filter(EventoHidrico.inicio <= data_fim)
    
    eventos = query.order_by(EventoHidrico.inicio.desc()).limit(limite).all()
    
    return jsonify([{
        'id': e.id,
        'tipo': e.tipo,
        'elemento_id': e.elemento_id,
        'inicio': e.inicio.isoformat(),
        'fim': e.fim.isoformat() if e.fim else None,
        'volume_estimado_l': float(e.volume_estimado_l) if e.volume_estimado_l else None,
        'nivel_confianca': float(e.nivel_confianca) if e.nivel_confianca else None,
        'status': e.status
    } for e in eventos])

@app.route('/api/relatorio/diario', methods=['GET'])
@jwt_required()
def relatorio_diario():
    """Gerar relatório diário"""
    data_str = request.args.get('data', datetime.now().date().isoformat())
    
    try:
        data = datetime.strptime(data_str, '%Y-%m-%d').date()
    except ValueError:
        return jsonify({'error': 'Data inválida (formato: YYYY-MM-DD)'}), 400
    
    # Calcular métricas do dia
    eventos_dia = EventoHidrico.query.filter(
        EventoHidrico.inicio >= data,
        EventoHidrico.inicio < data + timedelta(days=1)
    ).all()
    
    # Volumes
    volume_consumido = sum(
        e.volume_estimado_l for e in eventos_dia 
        if e.tipo == 'consumo' and e.volume_estimado_l
    )
    volume_abastecido = sum(
        e.volume_estimado_l for e in eventos_dia 
        if e.tipo == 'abastecimento' and e.volume_estimado_l
    )
    
    # Eficiência
    eficiencia = (volume_consumido / volume_abastecido * 100) if volume_abastecido > 0 else 0
    vazamento_estimado = max(0, volume_abastecido - volume_consumido)
    
    # Contar eventos
    eventos_por_tipo = {}
    for e in eventos_dia:
        eventos_por_tipo[e.tipo] = eventos_por_tipo.get(e.tipo, 0) + 1
    
    relatorio = {
        'data': data_str,
        'volume_consumido_l': float(volume_consumido),
        'volume_abastecido_l': float(volume_abastecido),
        'eficiencia_percent': round(eficiencia, 2),
        'vazamento_estimado_l': float(vazamento_estimado),
        'eventos_detectados': len(eventos_dia),
        'eventos_por_tipo': eventos_por_tipo,
        'alertas_ativos': Alerta.query.filter_by(ativo=True).count(),
        'gerado_em': datetime.utcnow().isoformat()
    }
    
    return jsonify(relatorio)

@app.route('/api/auth/login', methods=['POST'])
def login():
    """Autenticação de usuário"""
    data = request.json
    login = data.get('login')
    senha = data.get('senha')
    
    if not login or not senha:
        return jsonify({'error': 'Login e senha são obrigatórios'}), 400
    
    # Buscar usuário (simplificado)
    # Em produção, usar hash seguro
    # usuário = Usuario.query.filter_by(login=login).first()
    
    # Validação simples para exemplo
    if login == 'admin' and senha == 'agu@da2025':
        access_token = create_access_token(identity=1)
        return jsonify({
            'access_token': access_token,
            'usuario': {
                'id': 1,
                'nome': 'Administrador',
                'papel': 'admin'
            }
        })
    
    return jsonify({'error': 'Credenciais inválidas'}), 401

# =============================================================================
# INICIALIZAÇÃO
# =============================================================================
def init_db():
    """Inicializar banco de dados"""
    with app.app_context():
        db.create_all()
        
        # Inserir dados de exemplo se não existirem
        if Elemento.query.count() == 0:
            elementos = [
                Elemento(nome='consumo', tipo='reservatorio', capacidade_litros=81700),
                Elemento(nome='incendio', tipo='reservatorio', capacidade_litros=81700),
                Elemento(nome='cisternas', tipo='reservatorio', capacidade_litros=254300)
            ]
            db.session.add_all(elementos)
            db.session.commit()

def start_mqtt_thread():
    """Iniciar thread do cliente MQTT"""
    def mqtt_loop():
        mqtt_client.client.loop_forever()
    
    thread = threading.Thread(target=mqtt_loop, daemon=True)
    thread.start()

if __name__ == '__main__':
    print("🚀 Iniciando API Sistema Aguada...")
    
    init_db()
    start_mqtt_thread()
    
    print("✅ API disponível em http://localhost:8000")
    print("📊 Documentação da API: /docs")
    
    app.run(host='0.0.0.0', port=8000, debug=True)
```

## 📊 Dashboard JavaScript Frontend

### Interface Web para o Gateway
```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aguada Gateway - Status</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/socket.io-client@4.0.1/dist/socket.io.js"></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            min-height: 100vh;
        }
        
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .header h1 {
            color: #2c3e50;
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .status-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #27ae60;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(0.95); }
            50% { transform: scale(1.05); }
            100% { transform: scale(0.95); }
        }
        
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        
        .card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: transform 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .nivel-display {
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            margin: 1rem 0;
        }
        
        .nivel-normal { color: #27ae60; }
        .nivel-aviso { color: #f39c12; }
        .nivel-critico { color: #e74c3c; }
        
        .progress-bar {
            width: 100%;
            height: 20px;
            background: #ecf0f1;
            border-radius: 10px;
            overflow: hidden;
            margin: 1rem 0;
        }
        
        .progress-fill {
            height: 100%;
            border-radius: 10px;
            transition: width 0.5s ease;
            position: relative;
        }
        
        .progress-normal { background: linear-gradient(90deg, #27ae60, #2ecc71); }
        .progress-aviso { background: linear-gradient(90deg, #f39c12, #f1c40f); }
        .progress-critico { background: linear-gradient(90deg, #e74c3c, #c0392b); }
        
        .eventos-lista {
            max-height: 200px;
            overflow-y: auto;
        }
        
        .evento-item {
            padding: 0.5rem;
            border-bottom: 1px solid #ecf0f1;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .evento-item:last-child {
            border-bottom: none;
        }
        
        .timestamp {
            font-size: 0.8rem;
            color: #7f8c8d;
        }
        
        .footer {
            text-align: center;
            padding: 2rem;
            color: rgba(255, 255, 255, 0.8);
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>
            <div class="status-indicator" id="statusIndicator"></div>
            🚰 Sistema Supervisório Aguada
        </h1>
    </header>

    <div class="container">
        <div class="grid">
            <!-- Reservatório Consumo -->
            <div class="card" id="card-consumo">
                <h3>💧 Castelo de Consumo</h3>
                <div class="nivel-display nivel-normal" id="nivel-consumo">--%</div>
                <div class="progress-bar">
                    <div class="progress-fill progress-normal" id="progress-consumo" style="width: 0%"></div>
                </div>
                <p>Volume: <span id="volume-consumo">-- L</span></p>
                <p>Última leitura: <span id="timestamp-consumo">--:--</span></p>
            </div>

            <!-- Reservatório Incêndio -->
            <div class="card" id="card-incendio">
                <h3>🚨 Castelo de Incêndio</h3>
                <div class="nivel-display nivel-normal" id="nivel-incendio">--%</div>
                <div class="progress-bar">
                    <div class="progress-fill progress-normal" id="progress-incendio" style="width: 0%"></div>
                </div>
                <p>Volume: <span id="volume-incendio">-- L</span></p>
                <p>Pressão: <span id="pressao-incendio">-- bar</span></p>
            </div>

            <!-- Cisternas -->
            <div class="card" id="card-cisternas">
                <h3>🏗️ Cisternas IE</h3>
                <div>
                    <p>IE01: <span id="nivel-ie01">--%</span> (<span id="volume-ie01">-- L</span>)</p>
                    <p>IE02: <span id="nivel-ie02">--%</span> (<span id="volume-ie02">-- L</span>)</p>
                </div>
            </div>

            <!-- Estado dos Equipamentos -->
            <div class="card" id="card-equipamentos">
                <h3>⚙️ Equipamentos</h3>
                <div>
                    <p>Bombas: <span id="status-bombas">Verificando...</span></p>
                    <p>Válvulas: <span id="status-valvulas">Verificando...</span></p>
                    <p>Conectividade: <span id="status-conectividade">--%</span></p>
                </div>
            </div>

            <!-- Eventos Recentes -->
            <div class="card">
                <h3>📋 Eventos Recentes</h3>
                <div class="eventos-lista" id="eventos-lista">
                    <div class="evento-item">
                        <span>Carregando eventos...</span>
                        <span class="timestamp">--:--</span>
                    </div>
                </div>
            </div>

            <!-- Gráfico de Tendência -->
            <div class="card">
                <h3>📈 Tendência 24h</h3>
                <canvas id="chart-tendencia" width="400" height="200"></canvas>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>Sistema Aguada v1.0.0 - Gateway Local | <span id="uptime">Inicializando...</span></p>
    </footer>

    <script>
        // Configuração do Socket.IO para MQTT
        const socket = io('ws://localhost:8080');
        
        // Estado global
        let dadosTendencia = {
            labels: [],
            datasets: [{
                label: 'Consumo (%)',
                data: [],
                borderColor: '#3498db',
                backgroundColor: 'rgba(52, 152, 219, 0.1)',
                tension: 0.4
            }]
        };
        
        // Inicializar gráfico
        const ctx = document.getElementById('chart-tendencia').getContext('2d');
        const chart = new Chart(ctx, {
            type: 'line',
            data: dadosTendencia,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',
                    }
                }
            }
        });
        
        // Conectar ao WebSocket
        socket.on('connect', () => {
            console.log('✅ Conectado ao servidor');
            document.getElementById('statusIndicator').style.background = '#27ae60';
        });
        
        socket.on('disconnect', () => {
            console.log('❌ Desconectado do servidor');
            document.getElementById('statusIndicator').style.background = '#e74c3c';
        });
        
        // Receber telemetria
        socket.on('telemetry', (data) => {
            console.log('📡 Telemetria recebida:', data);
            processarTelemetria(data);
        });
        
        // Receber eventos
        socket.on('evento', (data) => {
            console.log('📋 Evento recebido:', data);
            adicionarEvento(data);
        });
        
        function processarTelemetria(data) {
            const device = data.device_id;
            
            if (device === 'consumo' || device === 'incendio') {
                atualizarReservatorio(device, data);
            } else if (device === 'cisternas') {
                atualizarCisternas(data);
            }
            
            // Atualizar equipamentos
            if (data.valvulas || data.bombas) {
                atualizarEquipamentos(data);
            }
            
            // Adicionar ao gráfico
            adicionarAoGrafico(device, data);
        }
        
        function atualizarReservatorio(device, data) {
            const nivel = Math.round(data.percentual);
            const volume = Math.round(data.volume_litros);
            
            // Atualizar elementos
            document.getElementById(`nivel-${device}`).textContent = `${nivel}%`;
            document.getElementById(`volume-${device}`).textContent = `${volume.toLocaleString()} L`;
            document.getElementById(`timestamp-${device}`).textContent = 
                new Date(data.ts * 1000).toLocaleTimeString();
            
            // Atualizar barra de progresso
            const progress = document.getElementById(`progress-${device}`);
            progress.style.width = `${nivel}%`;
            
            // Atualizar cor baseada no nível
            const nivelDisplay = document.getElementById(`nivel-${device}`);
            const progressBar = document.getElementById(`progress-${device}`);
            const card = document.getElementById(`card-${device}`);
            
            nivelDisplay.className = 'nivel-display';
            progressBar.className = 'progress-fill';
            
            if (nivel < 20) {
                nivelDisplay.classList.add('nivel-critico');
                progressBar.classList.add('progress-critico');
            } else if (nivel < 50) {
                nivelDisplay.classList.add('nivel-aviso');
                progressBar.classList.add('progress-aviso');
            } else {
                nivelDisplay.classList.add('nivel-normal');
                progressBar.classList.add('progress-normal');
            }
            
            // Atualizar pressão para incêndio
            if (device === 'incendio' && data.pressao_bar) {
                document.getElementById('pressao-incendio').textContent = `${data.pressao_bar} bar`;
            }
        }
        
        function atualizarCisternas(data) {
            if (data.cisternas) {
                // IE01
                const ie01 = data.cisternas.ie01;
                if (ie01) {
                    document.getElementById('nivel-ie01').textContent = `${Math.round(ie01.percentual)}%`;
                    document.getElementById('volume-ie01').textContent = `${Math.round(ie01.volume_litros).toLocaleString()} L`;
                }
                
                // IE02
                const ie02 = data.cisternas.ie02;
                if (ie02) {
                    document.getElementById('nivel-ie02').textContent = `${Math.round(ie02.percentual)}%`;
                    document.getElementById('volume-ie02').textContent = `${Math.round(ie02.volume_litros).toLocaleString()} L`;
                }
            }
        }
        
        function atualizarEquipamentos(data) {
            let bombasStatus = 'Normal';
            let valvulasStatus = 'Normal';
            
            if (data.bombas) {
                const bombas = Object.values(data.bombas);
                const ativas = bombas.filter(b => b === 1).length;
                bombasStatus = `${ativas}/${bombas.length} ativas`;
            }
            
            if (data.valvulas) {
                const valvulas = Object.values(data.valvulas);
                const abertas = valvulas.filter(v => v === 1).length;
                valvulasStatus = `${abertas}/${valvulas.length} abertas`;
            }
            
            document.getElementById('status-bombas').textContent = bombasStatus;
            document.getElementById('status-valvulas').textContent = valvulasStatus;
            document.getElementById('status-conectividade').textContent = `${data.rssi || 0}%`;
        }
        
        function adicionarEvento(evento) {
            const lista = document.getElementById('eventos-lista');
            const item = document.createElement('div');
            item.className = 'evento-item';
            
            const icone = getIconeEvento(evento.tipo);
            const timestamp = new Date(evento.timestamp).toLocaleTimeString();
            
            item.innerHTML = `
                <span>${icone} ${evento.mensagem}</span>
                <span class="timestamp">${timestamp}</span>
            `;
            
            lista.insertBefore(item, lista.firstChild);
            
            // Manter apenas os últimos 10 eventos
            while (lista.children.length > 10) {
                lista.removeChild(lista.lastChild);
            }
        }
        
        function getIconeEvento(tipo) {
            const icones = {
                'abastecimento': '⬆️',
                'consumo': '⬇️',
                'vazamento': '💧',
                'nivel_critico': '🚨',
                'nivel_alto': '⚠️'
            };
            return icones[tipo] || '📋';
        }
        
        function adicionarAoGrafico(device, data) {
            const agora = new Date();
            const label = agora.toLocaleTimeString().slice(0, 5);
            
            if (device === 'consumo') {
                // Adicionar nova leitura
                dadosTendencia.labels.push(label);
                dadosTendencia.datasets[0].data.push(data.percentual);
                
                // Manter apenas últimas 24 leituras
                if (dadosTendencia.labels.length > 24) {
                    dadosTendencia.labels.shift();
                    dadosTendencia.datasets[0].data.shift();
                }
                
                chart.update();
            }
        }
        
        // Atualizar uptime a cada segundo
        const startTime = Date.now();
        setInterval(() => {
            const uptime = Math.floor((Date.now() - startTime) / 1000);
            const hours = Math.floor(uptime / 3600);
            const minutes = Math.floor((uptime % 3600) / 60);
            const seconds = uptime % 60;
            
            document.getElementById('uptime').textContent = 
                `Uptime: ${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
        }, 1000);
        
        // Simulação de dados (remover em produção)
        function simularDados() {
            const dispositivos = ['consumo', 'incendio', 'cisternas'];
            const device = dispositivos[Math.floor(Math.random() * dispositivos.length)];
            
            const dados = {
                device_id: device,
                ts: Math.floor(Date.now() / 1000),
                nivel_cm: Math.random() * 300 + 50,
                percentual: Math.random() * 80 + 10,
                volume_litros: Math.random() * 50000 + 10000,
                rssi: Math.random() * 20 + 60
            };
            
            if (device === 'cisternas') {
                dados.cisternas = {
                    ie01: { nivel_cm: 200, volume_litros: 150000, percentual: 60 },
                    ie02: { nivel_cm: 180, volume_litros: 135000, percentual: 53 }
                };
            } else if (device === 'incendio') {
                dados.pressao_bar = Math.random() * 2 + 6;
            }
            
            socket.emit('telemetry', dados);
        }
        
        // Iniciar simulação (remover em produção)
        if (location.hostname === 'localhost' || location.hostname === '127.0.0.1') {
            setInterval(simularDados, 5000);
        }
    </script>
</body>
</html>
```

## 📋 Scripts de Instalação e Manutenção

### Script de Instalação Automática
```bash
#!/bin/bash
# install_aguada.sh

set -e

echo "🚀 Instalação do Sistema Supervisório Aguada"
echo "============================================="

# Verificar se é root
if [[ $EUID -ne 0 ]]; then
   echo "❌ Este script deve ser executado como root (sudo)"
   exit 1
fi

# Função para verificar comando
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "❌ $1 não encontrado. Instalando..."
        apt-get update
        apt-get install -y $1
    else
        echo "✅ $1 já instalado"
    fi
}

# Instalar dependências do sistema
echo "📦 Instalando dependências do sistema..."
apt-get update
apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    docker.io \
    docker-compose \
    postgresql-client

# Instalar PlatformIO para ESP32
echo "🔧 Instalando PlatformIO..."
curl -fsSL https://raw.githubusercontent.com/platformio/platformio/master/scripts/get-platformio.sh | sh -

# Criar usuário para o sistema
echo "👤 Criando usuário aguada..."
useradd -m -s /bin/bash aguada 2>/dev/null || true
usermod -aG docker aguada

# Criar estrutura de diretórios
echo "📁 Criando estrutura de diretórios..."
mkdir -p /opt/aguada/{config,data,logs,scripts,firmware,backend,frontend}
mkdir -p /opt/aguada/data/{postgresql,influxdb,mosquitto,grafana}
mkdir -p /opt/aguada/firmware/{nodes,gateways}
mkdir -p /opt/aguada/scripts/{install,maintenance,reports}
mkdir -p /opt/aguada/logs/{system,mqtt,grafana}

# Configurar permissões
chown -R aguada:aguada /opt/aguada
chmod -R 755 /opt/aguada

# Baixar e configurar Docker Compose
echo "🐳 Configurando Docker Compose..."
cd /opt/aguada

# Criar docker-compose.yml (se não existir)
if [ ! -f docker-compose.yml ]; then
    echo "📝 Criando docker-compose.yml..."
    cat > docker-compose.yml << 'EOF'
version: "3.8"

services:
  mosquitto:
    image: eclipse-mosquitto:2
    container_name: aguada-mosquitto
    ports:
      - "1883:1883"
      - "9001:9001"
    volumes:
      - ./config/mosquitto.conf:/mosquitto/config/mosquitto.conf:ro
      - ./data/mosquitto/data:/mosquitto/data
      - ./data/mosquitto/log:/mosquitto/log
    restart: unless-stopped
    networks:
      - aguada-net

  postgresql:
    image: postgres:15
    container_name: aguada-postgres
    environment:
      POSTGRES_DB: aguada
      POSTGRES_USER: aguada_user
      POSTGRES_PASSWORD: agu@da2025
    volumes:
      - ./data/postgresql:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    restart: unless-stopped
    networks:
      - aguada-net

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
      - ./data/influxdb:/var/lib/influxdb2
    restart: unless-stopped
    networks:
      - aguada-net

  grafana:
    image: grafana/grafana:latest
    container_name: aguada-grafana
    ports:
      - "3000:3000"
    volumes:
      - ./data/grafana:/var/lib/grafana
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=agu@da2025
    restart: unless-stopped
    networks:
      - aguada-net
    depends_on:
      - influxdb

networks:
  aguada-net:
    driver: bridge
EOF
fi

# Criar arquivo de configuração do Mosquitto
echo "📡 Configurando Mosquitto..."
cat > config/mosquitto.conf << 'EOF'
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log

listener 1883
protocol mqtt

listener 9001
protocol websockets

allow_anonymous true
max_inflight_messages 20
max_queued_messages 1000
EOF

# Criar script de inicialização do sistema
echo "🔧 Criando script de inicialização..."
cat > scripts/start_system.sh << 'EOF'
#!/bin/bash
cd /opt/aguada
docker-compose up -d
echo "✅ Sistema Aguada iniciado"
echo "📊 Dashboard Grafana: http://localhost:3000 (admin/agu@da2025)"
echo "📡 MQTT Broker: localhost:1883"
echo "🗄️ PostgreSQL: localhost:5432 (aguada_user/agu@da2025)"
EOF

chmod +x scripts/start_system.sh

# Criar script de parada do sistema
echo "🛑 Criando script de parada..."
cat > scripts/stop_system.sh << 'EOF'
#!/bin/bash
cd /opt/aguada
docker-compose down
echo "🛑 Sistema Aguada parado"
EOF

chmod +x scripts/stop_system.sh

# Criar serviço systemd
echo "⚙️ Configurando serviço systemd..."
cat > /etc/systemd/system/aguada.service << 'EOF'
[Unit]
Description=Sistema Supervisório Aguada
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
User=root
WorkingDirectory=/opt/aguada
ExecStart=/opt/aguada/scripts/start_system.sh
ExecStop=/opt/aguada/scripts/stop_system.sh

[Install]
WantedBy=multi-user.target
EOF

# Habilitar o serviço
systemctl daemon-reload
systemctl enable aguada

# Iniciar o sistema
echo "🟢 Iniciando o sistema..."
/opt/aguada/scripts/start_system.sh

# Aguardar serviços ficarem prontos
echo "⏳ Aguardando serviços ficarem prontos..."
sleep 30

# Verificar status
echo "🔍 Verificando status dos serviços..."
docker-compose ps

# Configurar firewall (se ativo)
echo "🔥 Configurando firewall..."
if command -v ufw &> /dev/null; then
    ufw allow 1883/tcp
    ufw allow 3000/tcp
    ufw allow 8086/tcp
fi

# Finalizar instalação
echo ""
echo "🎉 INSTALAÇÃO CONCLUÍDA!"
echo "========================"
echo "📊 Dashboard: http://localhost:3000 (admin/agu@da2025)"
echo "📡 MQTT: localhost:1883"
echo "🗄️ PostgreSQL: localhost:5432 (aguada_user/agu@da2025)"
echo ""
echo "Comandos úteis:"
echo "  • Iniciar: sudo systemctl start aguada"
echo "  • Parar: sudo systemctl stop aguada"
echo "  • Status: sudo systemctl status aguada"
echo "  • Logs: docker-compose logs -f"
echo ""
echo "📁 Arquivos em: /opt/aguada"
echo "👤 Usuário: aguada"
```

---

*Este documento contém códigos de exemplo completos e templates práticos para implementação do Sistema Supervisório Aguada, incluindo firmware ESP32, API backend, interface web e scripts de automação.*