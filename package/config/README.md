# Arquivos de Configuração - Sistema Aguada

Este diretório contém todos os arquivos de configuração necessários para implementar o Sistema Supervisório Aguada.

## 📁 Estrutura dos Arquivos

### 🐳 Docker e Infraestrutura
- `docker-compose.yml` - Stack completa de containers
- `mosquitto.conf` - Configuração do broker MQTT
- `grafana/datasources.yml` - Data sources do Grafana
- `grafana/dashboards/` - Dashboards pré-configurados

### 💾 Banco de Dados
- `init.sql` - Schema completo do PostgreSQL
- `seed_data.sql` - Dados de exemplo
- `backup_script.sh` - Script de backup automático

### 📡 Configurações ESP32
- `esp32/config_consumo.json` - Configuração reservatório consumo
- `esp32/config_incendio.json` - Configuração reservatório incêndio
- `esp32/config_cisternas.json` - Configuração cisternas IE
- `esp32/gateway_config.json` - Configuração gateway

### 🔧 Scripts de Sistema
- `install.sh` - Instalação automatizada
- `start.sh` - Iniciar sistema
- `stop.sh` - Parar sistema
- `backup.sh` - Backup dos dados
- `restore.sh` - Restauração de backup

### 📊 Relatórios
- `report_template.html` - Template do relatório diário
- `email_templates/` - Templates de email
- `export_formats/` - Formatos de exportação

---

## 🚀 Quick Start

1. **Configurar ambiente:**
   ```bash
   chmod +x install.sh
   sudo ./install.sh
   ```

2. **Iniciar sistema:**
   ```bash
   ./start.sh
   ```

3. **Acessar interfaces:**
   - Dashboard: http://localhost:3000 (admin/agu@da2025)
   - API: http://localhost:8000
   - MQTT: localhost:1883

---

## 📝 Configurações Principais

### PostgreSQL
- **Host**: localhost
- **Port**: 5432
- **Database**: aguada
- **User**: aguada_user
- **Password**: agu@da2025

### MQTT
- **Host**: localhost
- **Port**: 1883 (TCP), 9001 (WebSocket)
- **Topic prefix**: xaguada/site-a/

### InfluxDB
- **Host**: localhost
- **Port**: 8086
- **Organization**: aguada
- **Bucket**: telemetry

### Grafana
- **Host**: localhost
- **Port**: 3000
- **Admin user**: admin
- **Admin password**: agu@da2025

---

## 🔧 Configurações Avançadas

### Compressão de Dados
- **Window size**: 11 amostras
- **Deadband**: 2.0 cm
- **Stability stddev**: 0.5 cm
- **Retenção InfluxDB**: 180 dias

### Alertas
- **Nível baixo**: < 20% (aviso), < 10% (crítico)
- **Nível alto**: > 90% (aviso), > 95% (crítico)
- **Vazamento**: Queda contínua > 1h
- **Falha bomba**: Sem pressão com bomba ON

### Relatórios
- **Horário**: 06:00h diariamente
- **Formato**: PDF + Email
- **Retention**: 1 ano
- **Destinatários**: Configuráveis

---

## 📋 Checklist de Validação

### Infraestrutura
- [ ] Docker instalado e funcionando
- [ ] PostgreSQL acessível
- [ ] MQTT broker respondendo
- [ ] InfluxDB com dados
- [ ] Grafana carregando dashboards

### Hardware ESP32
- [ ] Nodes enviando dados
- [ ] Gateway processando
- [ ] ESP-NOW funcionando
- [ ] Sensores medindo corretamente
- [ ] Controle de bombas/válvulas

### Software
- [ ] API REST respondendo
- [ ] Interface web carregando
- [ ] Compressão ativa
- [ ] Eventos sendo detectados
- [ ] Relatórios sendo gerados

---

## 🆘 Troubleshooting

### Problemas Comuns

**1. MQTT não conecta:**
```bash
docker-compose logs mosquitto
# Verificar firewall e porta 1883
```

**2. Dados não aparecem no Grafana:**
```bash
# Verificar data source
curl http://localhost:8086/ping
```

**3. ESP32 não conecta:**
```bash
# Verificar rede WiFi
# Reiniciar gateway
# Verificar configuração ESP-NOW
```

**4. Performance lenta:**
```bash
# Verificar recursos do servidor
htop
docker stats
```

### Logs Importantes
- **Sistema**: `/var/log/aguada/system.log`
- **MQTT**: `/var/log/aguada/mqtt.log`
- **API**: `/var/log/aguada/api.log`
- **Database**: `docker logs aguada-postgres`

---

## 📞 Suporte

Para suporte técnico:
1. Consultar documentação principal
2. Verificar logs de sistema
3. Executar scripts de diagnóstico
4. Contactar equipe técnica

---

*Configurações validadas para Sistema Aguada v1.0.0*