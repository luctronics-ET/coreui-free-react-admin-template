# Database CMASM - Estrutura Completa

## 📁 Estrutura de Diretórios

```
database/
├── migrations/          # Scripts de criação de tabelas
│   ├── 01_create_organizations.sql
│   ├── 02_create_laboratories.sql
│   ├── 03_create_providers.sql
│   ├── 04_create_reference_standards.sql
│   ├── 05_create_users.sql
│   ├── 06_create_equipment.sql
│   ├── 07_create_services.sql
│   ├── 08_create_calibrations.sql
│   ├── 09_create_certificates_and_parameters.sql
│   ├── 10_add_foreign_keys.sql
│   └── 11_create_support_tables.sql
│
├── seeds/              # Dados iniciais
│   ├── 01_seed_organizations.sql
│   ├── 02_seed_laboratories.sql
│   ├── 03_seed_reference_standards.sql
│   ├── 04_seed_users.sql
│   ├── 05_triggers_and_procedures.sql
│   └── 06_views.sql
│
├── backups/            # Backups automáticos (criado pelo script)
│
└── install.sh          # Script de instalação automática
```

## 🚀 Instalação Rápida

### Opção 1: Script Automático (Recomendado)

```bash
cd database
./install.sh
```

O script irá:
1. ✅ Testar conexão com MySQL
2. ✅ Criar backup se database existir
3. ✅ Criar database com charset UTF-8
4. ✅ Executar 11 migrations (tabelas)
5. ✅ Executar 6 seeds (dados iniciais)
6. ✅ Criar triggers, procedures e views
7. ✅ Validar instalação

### Opção 2: Manual

```bash
# 1. Criar database
mysql -u root -p -e "CREATE DATABASE cmasm_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 2. Executar migrations
for file in migrations/*.sql; do
    mysql -u root -p cmasm_db < "$file"
done

# 3. Executar seeds
for file in seeds/*.sql; do
    mysql -u root -p cmasm_db < "$file"
done
```

## 📊 Estrutura do Database

### 15 Tabelas Principais

| Tabela | Descrição | Registros Iniciais |
|--------|-----------|-------------------|
| `organizations` | Hierarquia CMASM (OM → Depto → Div → Seção) | 16 |
| `laboratories` | Labs internos/externos | 7 |
| `providers` | Fornecedores de serviços | 0 |
| `reference_standards` | Padrões rastreáveis | 10 |
| `users` | Usuários do sistema | 3 |
| `equipment` | Equipamentos a calibrar | 0 |
| `services` | Ordens de serviço (OS) | 0 |
| `calibrations` | Eventos de calibração | 0 |
| `certificates` | Certificados emitidos | 0 |
| `measurement_parameters` | Parâmetros medidos | 0 |
| `calibration_reference_standards` | N:N Calibração↔Padrão | 0 |
| `equipment_movements` | Histórico movimentação | 0 |
| `notifications` | Notificações usuários | 0 |
| `audit_logs` | Auditoria completa | 0 |
| `reports` | Relatórios gerados | 0 |

### Relacionamentos

```
organizations (1) ──< (N) users
organizations (1) ──< (N) equipment
organizations (1) ──< (N) services (requester)
organizations (1) ──< (N) services (executor)

equipment (1) ──< (N) calibrations
equipment (1) ──< (N) services
equipment (1) ──< (N) equipment_movements

calibrations (1) ──< (1) certificates
calibrations (1) ──< (N) measurement_parameters
calibrations (N) ──< >── (N) reference_standards

providers (1) ──< (N) equipment
providers (1) ──< (N) calibrations

laboratories (1) ──< (N) calibrations
laboratories (1) ──< (N) providers

users (1) ──< (N) notifications
users (1) ──< (N) audit_logs
```

## 🔧 Recursos Automáticos

### Triggers

| Trigger | Evento | Função |
|---------|--------|--------|
| `trg_calibration_update_equipment` | AFTER UPDATE calibrations | Atualiza `equipment.last_calibration_id` quando calibração concluída |
| `trg_equipment_audit_update` | AFTER UPDATE equipment | Registra mudanças em `audit_logs` |
| `trg_calibration_audit_update` | AFTER UPDATE calibrations | Registra mudanças em `audit_logs` |

### Stored Procedures

| Procedure | Parâmetros | Função |
|-----------|------------|--------|
| `sp_generate_service_number()` | OUT service_num | Gera número único de OS (OS-2025-00001) |
| `sp_generate_certificate_number()` | OUT cert_num | Gera número único de certificado (CERT-2025-00001) |
| `sp_schedule_calibrations_batch()` | months_ahead, org_id | Agenda calibrações em lote e cria notificações |
| `sp_notify_overdue_calibrations()` | - | Envia notificações de calibrações vencidas |

### Views

| View | Descrição |
|------|-----------|
| `v_equipment_calibration_status` | Status completo de calibração por equipamento |
| `v_services_dashboard` | Dashboard de serviços ativos |
| `v_calibrations_report` | Relatório analítico de calibrações |
| `v_organization_hierarchy` | Hierarquia organizacional recursiva |
| `v_executive_dashboard` | KPIs executivos (totais, vencidos, custos) |

## 👥 Usuários Iniciais

| Username | Senha Padrão | Role | Organização |
|----------|--------------|------|-------------|
| `admin` | `Admin@123` | admin | CMASM |
| `tecnico.eletron` | `Admin@123` | technician | Seção Eletrônica |
| `gerente.qualidade` | `Admin@123` | manager | CMASM |

⚠️ **IMPORTANTE**: Alterar senhas imediatamente após instalação!

## 🏢 Estrutura Organizacional CMASM

```
CMASM (Centro de Mísseis e Armas Submarinas da Marinha)
├── Departamento de Armas
│   ├── Divisão MK-48
│   ├── Divisão MK-46
│   ├── Divisão F-21
│   ├── Divisão EXOCET
│   ├── Divisão Minas e Bombas
│   └── Divisão Mísseis Especiais
│
└── Departamento de Infraestrutura
    └── Divisão Manutenção Especializada
        ├── Seção Carpintaria
        ├── Seção Metalurgia
        ├── Seção Pintura Industrial
        ├── Seção Máquinas
        ├── Seção Refrigeração
        └── Seção Eletrônica

CMS (Centro de Manutenção da Marinha)
```

## 🧪 Laboratórios

### Internos
- **CMS-LAB** - Laboratório de Metrologia CMS (RBC acreditado)

### Externos Acreditados
- **BACS** - BACS Laboratório de Calibração (RBC)
- **MVMETRO** - MV Metrologia e Calibração (RBC)
- **VISOMES** - Visomes Metrologia (RBC)
- **IPTC** - Instituto de Pesquisas Tecnológicas (INMETRO)

### Externos Não Acreditados
- **MSMI** - MSMI Calibração e Serviços
- **CALIBRARIO** - Calibrario Ltda

## 📏 Padrões de Referência

10 padrões rastreáveis cadastrados:
- 3 padrões elétricos (tensão, resistência, corrente)
- 2 padrões de temperatura (range, Pt100)
- 2 padrões mecânicos (massa, torque)
- 2 padrões de pressão (0-10 bar, digital)
- 1 padrão dimensional (bloco 100mm)

Rastreabilidade: RBC → INMETRO → BIPM/PTB/NIST

## 🔐 Segurança

### Hashing de Senhas
- Algoritmo: **bcrypt** (`$2y$10$`)
- Cost factor: 10
- Senhas nunca armazenadas em texto plano

### Auditoria
- Todas as operações importantes registradas em `audit_logs`
- Rastreamento de IP e User-Agent
- Valores antigos/novos em JSON
- Triggers automáticos para equipment e calibrations

### Permissões
- 5 níveis de acesso: admin, manager, technician, operator, viewer
- Permissões granulares por recurso em JSON
- Controle de organizações (usuário vê apenas sua OM)

## 📈 Performance

### Indexes Criados
- 47 índices simples
- 6 índices compostos
- 1 índice FULLTEXT (equipment: manufacturer, model, serial_number)
- Total: **54 índices**

### Otimizações
- Particionamento de `audit_logs` por mês (preparado para futura implementação)
- Views materializadas para dashboards
- Queries otimizadas com JOINs e subqueries eficientes

## 🧪 Validação Pós-Instalação

```sql
-- 1. Verificar tabelas criadas
SHOW TABLES;

-- 2. Verificar hierarquia organizacional
SELECT * FROM v_organization_hierarchy;

-- 3. Verificar usuários
SELECT username, email, role, o.name as organization 
FROM users u 
JOIN organizations o ON u.organization_id = o.id;

-- 4. Dashboard executivo
SELECT * FROM v_executive_dashboard;

-- 5. Triggers
SHOW TRIGGERS;

-- 6. Procedures
SHOW PROCEDURE STATUS WHERE Db = 'cmasm_db';

-- 7. Views
SHOW FULL TABLES WHERE Table_type = 'VIEW';
```

## 🔄 Backup e Restore

### Backup Manual
```bash
mysqldump -u root -p cmasm_db > backup_$(date +%Y%m%d_%H%M%S).sql
```

### Restore
```bash
mysql -u root -p cmasm_db < backup_20250126_143022.sql
```

### Backup Automático (via install.sh)
Backups salvos em `database/backups/`

## 📞 Próximos Passos

1. ✅ **Instalação** - Executar `./install.sh`
2. 🔐 **Segurança** - Alterar senhas padrão
3. 🔌 **API Backend** - Implementar endpoints REST (veja API_QUERIES_EXAMPLES.md)
4. ⚛️ **Frontend React** - Integrar com nova estrutura
5. 🧪 **Testes** - Cadastrar equipamentos e calibrações de teste
6. 📊 **Dashboards** - Validar views e relatórios
7. 🚀 **Deploy** - Migrar para produção

## 📚 Documentação Relacionada

- `DATABASE_ARCHITECTURE.md` - Arquitetura completa (65 páginas)
- `API_QUERIES_EXAMPLES.md` - Endpoints e queries SQL (30 páginas)
- `DATABASE_MIGRATION_GUIDE.md` - Guia de migração (25 páginas)
- `RESUMO_EXECUTIVO_DATABASE.md` - Resumo executivo (15 páginas)

## ⚠️ Notas Importantes

1. **Charset**: Todas as tabelas usam `utf8mb4_unicode_ci` para suporte completo a Unicode
2. **Engine**: InnoDB para suporte a transações ACID e foreign keys
3. **Timestamps**: Automáticos via `created_at` e `updated_at`
4. **Soft Deletes**: Via campo `is_active` (não remove fisicamente)
5. **JSON Fields**: Para dados flexíveis (permissions, specialties, filters)

---

**Versão**: 1.0.0  
**Data**: 2025-11-26  
**Desenvolvido para**: CMASM - Centro de Mísseis e Armas Submarinas da Marinha  
**Conformidade**: ISO/IEC 17025:2017
