# Diagramas e Fluxos do Sistema Aguada

## 📊 Diagrama de Arquitetura do Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                    SISTEMA SUPERVISÓRIO AGUADA                 │
│                    (Visão Geral da Arquitetura)                │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   HARDWARE      │    │  COMUNICAÇÃO    │    │   SOFTWARE      │
│                 │    │                 │    │                 │
│ ┌─────────────┐ │    │ ┌─────────────┐ │    │ ┌─────────────┐ │
│ │ESP32-C3 Node│ │    │ │   ESP-NOW   │ │    │ │ PostgreSQL  │ │
│ │  (Sensor)   │ │◄──►│ │    Mesh     │ │◄──►│ │ Database    │ │
│ └─────────────┘ │    │ └─────────────┘ │    │ └─────────────┘ │
│                 │    │                 │    │                 │
│ ┌─────────────┐ │    │ ┌─────────────┐ │    │ ┌─────────────┐ │
│ │ESP32-C3 Gate│ │    │ │WiFi + MQTT  │ │    │ │   InfluxDB  │ │
│ │  (Bridge)   │ │    │ │             │ │    │ │ Time Series │ │
│ └─────────────┘ │    │ └─────────────┘ │    │ └─────────────┘ │
└─────────────────┘    └─────────────────┘    │ ┌─────────────┐ │
                                              │ │   Node-RED  │ │
┌─────────────────┐    ┌─────────────────┐    │ │ Processing  │ │
│   SENSORES      │    │  FRONTEND       │    │ └─────────────┘ │
│                 │    │                 │    │                 │
│ • Ultrassom     │    │ ┌─────────────┐ │    │ ┌─────────────┐ │
│ • Pressão       │    │ │    Web      │ │    │ │   Grafana   │ │
│ • Temperatura   │    │ │  Interface  │ │    │ │  Dashboard  │ │
│ • Estado Válvula│    │ └─────────────┘ │    │ └─────────────┘ │
│ • Estado Bomba  │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 🔄 Fluxo de Dados do Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                    FLUXO DE DADOS COMPLETO                    │
│                  (Da leitura ao relatório)                     │
└─────────────────────────────────────────────────────────────────┘

1. LEITURA DE SENSORES
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Sensor      │    │ ESP32 Node  │    │ Filtro      │
│ Ultrassom   │───►│(Processa)   │───►│ Mediana     │
│ (10s)       │    │             │    │(11 amostras)│
└─────────────┘    └─────────────┘    └─────────────┘
                              │
                              ▼
2. TRANSMISSÃO
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ ESP-NOW     │    │ ESP32       │    │ WiFi/MQTT   │
│ Mesh        │───►│ Gateway     │───►│ Broker      │
│             │    │(Bridge)     │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
                                        │
                                        ▼
3. PROCESSAMENTO
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Node-RED    │    │ InfluxDB    │    │ PostgreSQL  │
│(Regras)     │───►│(Time Series)│───►│(Histórico)  │
│             │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
       │                    │                  │
       ▼                    ▼                  ▼
4. DETECÇÃO DE EVENTOS
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Abastecimento│   │ Consumo     │    │ Vazamento   │
│ ΔVolume +   │   │ ΔVolume -   │   │ Queda       │
│ Bomba ON    │   │ Sem bomba   │   │ contínua    │
└─────────────┘    └─────────────┘    └─────────────┘
       │                    │                  │
       ▼                    ▼                  ▼
5. INTERFACE
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Grafana     │    │ Web Local   │    │ Relatório   │
│Dashboard    │◄──►│ Interface   │───►│ 06:00h      │
│(Tempo Real) │    │(Config)     │    │(PDF/Email)  │
└─────────────┘    └─────────────┘    └─────────────┘
```

## 🏗️ Diagrama da Rede Hídrica

```
┌─────────────────────────────────────────────────────────────────┐
│                    TOPOLOGIA DA REDE HÍDRICA                   │
│                     (Conexões Físicas)                        │
└─────────────────────────────────────────────────────────────────┘

                         ┌─────────────────────┐
                         │  REDE ABASTECIMENTO │
                         │   (Água Tratada)   │
                         └──────────┬──────────┘
                                    │
                    ┌───────────────┼───────────────┐
                    │               │               │
                    ▼               ▼               ▼
           ┌─────────────────┐ ┌─────────────┐ ┌─────────────┐
           │ Válvula Entrada │ │  Válvula    │ │  Válvula    │
           │   Res. Consumo  │ │   IE01      │ │   IE02      │
           └────────┬────────┘ └──────┬──────┘ └──────┬──────┘
                    │                  │               │
                    ▼                  ▼               ▼
        ┌─────────────────────┐ ┌─────────────┐ ┌─────────────┐
        │  CASTELO CONSUMO   │ │  CISterna   │ │  CISterna   │
        │  81.700 L          │ │    IE01     │ │    IE02     │
        │  (Cilíndrico)      │ │  254.300 L  │ │  254.300 L  │
        │  Ø5,10m × 4,0m     │ │(Retangular) │ │(Retangular) │
        └─────┬───────────────┘ └──────┬──────┘ └──────┬──────┘
              │                       │               │
              │        ┌──────────────┼──────────────┐│
              │        │              │              ││
              ▼        ▼              ▼              ▼│
     ┌─────────────────────┐  ┌─────────────┐ ┌─────────────┐│
     │     BOMBA 01       │  │   BOMBA     │ │   BOMBA     ││
     │   (Recalque)       │  │     02      │ │     03      ││
     └─────┬───────────────┘  └──────┬──────┘ └──────┬──────┘
            │                       │               │
            ▼                       ▼               ▼
    ┌─────────────────────┐  ┌─────────────┐ ┌─────────────┐
    │ CASTELO INCÊNDIO   │  │  Casa de    │ │   Rede de   │
    │   81.700 L         │  │  Bombas     │ │  Distribuição│
    │  (Pressão 7 bar)   │  │             │ │             │
    └─────────────────────┘  └─────────────┘ └─────────────┘
           │                         │              │
           ▼                         ▼              ▼
    ┌─────────────┐          ┌─────────────┐ ┌─────────────┐
    │ Rede CAVAZ  │          │  Válvulas   │ │ Prédios e   │
    │(Incêndio)   │          │   AZ/AV     │ │ Equipamentos│
    └─────────────┘          └─────────────┘ └─────────────┘
```

## 📊 Diagrama de Estados do Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                    DIAGRAMA DE ESTADOS                         │
│                  (Eventos e Transições)                        │
└─────────────────────────────────────────────────────────────────┘

┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ ESTÁVEL     │    │ ABASTECIMENTO│   │ CONSUMO     │
│             │    │             │    │             │
│ Nível       │◄──►│ Nível       │◄──►│ Nível       │
│ Constante   │    │ Aumentando  │    │ Diminuindo  │
│ (±2cm)      │    │ (+50L+)     │    │ (-10L-)     │
└─────────────┘    └─────────────┘    └─────────────┘
       │                   │                  │
       │                   ▼                  ▼
       │          ┌─────────────┐    ┌─────────────┐
       │          │ BOMBA ON +  │    │ BOMBA OFF   │
       │          │ VÁLVULA AB  │    │ VÁLVULA FECH│
       │          └─────────────┘    └─────────────┘
       │                   │                  │
       ▼                   ▼                  ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ VAZAMENTO   │    │ MANUTENÇÃO  │    │ ALERTA      │
│             │    │             │    │             │
│ Queda       │    │ Operador    │    │ Nível       │
│ Contínua    │    │ intervenha  │    │ <10% ou >95%│
│ (1h+)       │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
```

## 🗄️ Diagrama do Modelo de Dados

```
┌─────────────────────────────────────────────────────────────────┐
│                    MODELO DE DADOS                             │
│                (Entidades e Relacionamentos)                   │
└─────────────────────────────────────────────────────────────────┘

    ┌──────────────┐
    │  ELEMENTO    │◄──────┐
    │              │       │
    │ PK id        │       │
    │ nome         │       │
    │ tipo         │       │
    │ descricao    │       │
    └──────┬───────┘       │
           │               │
    ┌──────┴──────┐   ┌────┴─────────┐
    │ CONEXAO     │   │  SENSOR      │
    │             │   │              │
    │ PK id       │   │ PK id        │
    │ FK origem   │   │ FK elemento  │
    │ FK destino  │   │ tipo         │
    │ descricao   │   │ unidade      │
    └──────┬──────┘   │ precisao     │
           │          └──────┬───────┘
           │                 │
    ┌──────┴──────┐   ┌──────┴───────┐
    │ ATUADOR     │   │ LEITURA_RAW   │
    │             │   │              │
    │ PK id       │   │ PK id        │
    │ FK elemento │   │ FK sensor    │
    │ tipo        │   │ timestamp    │
    │ estado      │   │ valor_bruto  │
    └──────┬──────┘   │ origem       │
           │          └──────┬───────┘
    ┌──────┴──────┐          │
    │ ESTADO_ATU  │          │
    │             │          │
    │ PK id       │          │
    │ FK atuador  │          │
    │ timestamp   │          │
    │ estado      │          │
    └──────┬──────┘          │
           │                 ▼
    ┌──────┴──────┐   ┌──────┴───────┐
    │ EVENTO_HID  │   │LEITURA_PROC  │
    │             │   │              │
    │ PK id       │   │ PK id        │
    │ tipo        │   │ FK sensor    │
    │ elemento    │   │ timestamp    │
    │ inicio      │   │ valor        │
    │ fim         │   │ volume_litros│
    │ volume_est  │   │ percentual   │
    │ confianca   │   │ processamento│
    └─────────────┘   └──────────────┘
```

## 🔄 Fluxograma de Compressão de Dados

```
┌─────────────────────────────────────────────────────────────────┐
│                   COMPRESSÃO DE DADOS                          │
│              (Raw → Processado → Eventos)                      │
└─────────────────────────────────────────────────────────────────┘

1. ENTRADA
┌─────────────┐
│ LEITURA RAW │ ◄─── ESP32 Node
│ (a cada 30s)│
└──────┬──────┘
       │
       ▼
2. BUFFER (11 amostras)
┌─────────────┐
│ [ ][ ][ ][ ]│ ◄─── Adicionar nova leitura
│ [ ][ ][ ][ ]│
│ [ ][ ][ ][ ]│
│ [ ][ ][ ][ ]│
└──────┬──────┘
       │ 11 amostras?
       ▼
3. PROCESSAMENTO
┌─────────────┐    ┌─────────────┐
│ Calcular    │    │ Desvio      │
│ Mediana     │    │ Padrão      │
└──────┬──────┘    └──────┬──────┘
       │                  │
       ▼                  ▼
4. COMPRESSÃO
┌─────────────┐
│ Variação    │   < 2cm? ┌─────────────┐
│ |Δ| ≤ 2cm   │─────────►│ ESTENDER    │
│             │          │ TEMPO       │
└──────┬──────┘          │ (atualizar  │
       │                 │ timestamp)  │
       ▼                 └─────────────┘
5. NOVO REGISTRO
┌─────────────┐
│ Variação    │
│ |Δ| > 2cm   │ ◄─── Inserir novo
│             │      registro
└──────┬──────┘
       │
       ▼
6. DETECÇÃO DE EVENTOS
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ ΔVolume +   │    │ ΔVolume -   │    │ Queda       │
│ Bomba ON    │    │ Sem bomba   │    │ Contínua    │
└──────┬──────┘    └──────┬──────┘    └──────┬──────┘
       │                  │                  │
       ▼                  ▼                  ▼
7. ARMAZENAMENTO
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Tabela      │    │ Tabela      │    │ Tabela      │
│ RAW         │    │ PROCESSADA  │    │ EVENTOS     │
└─────────────┘    └─────────────┘    └─────────────┘
```

## 📈 Cronograma de Implementação

```
┌─────────────────────────────────────────────────────────────────┐
│                    CRONOGRAMA DE PROJETO                       │
│                   (10 Semanas de Execução)                     │
└─────────────────────────────────────────────────────────────────┘

Semana │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │10│
Activ. │█  │█  │   │   │   │   │   │   │   │  │
Setup  │█  │█  │   │   │   │   │   │   │   │  │
Dev    │   │   │█  │█  │   │   │   │   │   │  │
HW     │   │   │█  │█  │   │   │   │   │   │  │
Test   │   │   │   │   │█  │   │   │   │   │  │
UI     │   │   │   │   │█  │█  │   │   │   │  │
CMMS   │   │   │   │   │   │   │█  │   │   │  │
Val    │   │   │   │   │   │   │   │█  │   │  │
Doc    │   │   │   │   │   │   │   │   │█  │  │
```

## 🏗️ Arquitetura de Containers Docker

```
┌─────────────────────────────────────────────────────────────────┐
│                    ARQUITETURA DOCKER                          │
│                     (Serviços Isolados)                        │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                    DOCKER HOST                               │
│  ┌─────────────────────────────────────────────────────────┐ │
│  │                 NETWORK: aguada-net                    │ │
│  │                                                         │ │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │ │
│  │  │   MOSQUITTO  │  │ POSTGRESQL   │  │   INFLUXDB   │  │ │
│  │  │  MQTT Broker │  │  Database    │  │Time Series   │  │ │
│  │  │  Port: 1883  │  │ Port: 5432   │  │ Port: 8086   │  │ │
│  │  └──────────────┘  └──────────────┘  └──────────────┘  │ │
│  │                                                         │ │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │ │
│  │  │  GRAFANA     │  │  NODE-RED    │  │ AGUADA-API   │  │ │
│  │  │  Dashboard   │  │ Processing   │  │ REST API     │  │ │
│  │  │  Port: 3000  │  │ Port: 1880   │  │ Port: 8000   │  │ │
│  │  └──────────────┘  └──────────────┘  └──────────────┘  │ │
│  └─────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
              │                │                │
              │                │                │
              ▼                ▼                ▼
    ┌──────────────┐   ┌──────────────┐ ┌──────────────┐
    │ Web Browser  │   │ ESP32 Gateway│ │ Admin Tools  │
    │ (Dashboard)  │◄──┤ (Bridge)     │ │ (Database)   │
    └──────────────┘   └──────────────┘ └──────────────┘
```

## 📊 Métricas de Performance

```
┌─────────────────────────────────────────────────────────────────┐
│                    MÉTRICAS DE PERFORMANCE                     │
│                    (KPIs do Sistema)                           │
└─────────────────────────────────────────────────────────────────┘

OPERACIONAIS
┌─────────────────┐┌─────────────────┐┌─────────────────┐
│ Disponibilidade ││ Precisão        ││ Latência        │
│      >99%       ││    ±0.5cm       ││    <30s         │
└─────────────────┘└─────────────────┘└─────────────────┘

DE DADOS
┌─────────────────┐┌─────────────────┐┌─────────────────┐
│ Compressão      ││ Redução DB      ││ Tempo Process.  │
│     90%         ││     95%         ││    <1s          │
└─────────────────┘└─────────────────┘└─────────────────┘

DE NEGÓCIO
┌─────────────────┐┌─────────────────┐┌─────────────────┐
│ Redução Perdas  ││ Economia Energ. ││ MTTR            │
│     20%         ││     15%         ││   -30%          │
└─────────────────┘└─────────────────┘└─────────────────┘
```

## 🔐 Diagrama de Segurança

```
┌─────────────────────────────────────────────────────────────────┐
│                    SEGURANÇA DO SISTEMA                        │
│                   (Camadas de Proteção)                        │
└─────────────────────────────────────────────────────────────────┘

NÍVEL 1: REDE
┌─────────────────┐
│ Firewall        │ ◄─── UFW, iptables
│ Isolamento      │     Docker networks
│ VPN             │     Certificados SSL
└─────────────────┘

NÍVEL 2: APLICAÇÃO
┌─────────────────┐
│ Autenticação    │ ◄─── JWT tokens
│ Autorização     │     RBAC (papéis)
│ Rate Limiting   │     API keys
└─────────────────┘

NÍVEL 3: DADOS
┌─────────────────┐
│ Criptografia    │ ◄─── SSL/TLS
│ Hash senhas     │     bcrypt
│ Backup          │     Encriptação
└─────────────────┘

NÍVEL 4: MONITORAMENTO
┌─────────────────┐
│ Audit Logs      │ ◄─── PostgreSQL
│ Alertas         │     InfluxDB
│ Métricas        │     Grafana
└─────────────────┘
```

---

*Diagramas gerados para documentar visualmente a arquitetura e funcionamento do Sistema Supervisório Aguada*