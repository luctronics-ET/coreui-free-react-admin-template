#!/bin/bash

# ============================================================================
# Script de Instalação Completa do Database CMASM
# Descrição: Executa todas as migrations e seeds em ordem
# Data: 2025-11-26
# ============================================================================

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configurações (ALTERE CONFORME SEU AMBIENTE)
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="root"
DB_PASS="admin"
DB_NAME="cmasm_db"

# Diretórios
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MIGRATIONS_DIR="$SCRIPT_DIR/migrations"
SEEDS_DIR="$SCRIPT_DIR/seeds"
BACKUP_DIR="$SCRIPT_DIR/backups"

# Criar diretório de backup se não existir
mkdir -p "$BACKUP_DIR"

# Função para exibir mensagens
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Função para executar SQL
execute_sql() {
    local sql_file=$1
    local description=$2
    
    log_info "Executando: $description"
    
    if mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$sql_file" 2>/dev/null; then
        log_info "✓ Sucesso: $description"
        return 0
    else
        log_error "✗ Falha: $description"
        return 1
    fi
}

# Banner
echo "============================================================================"
echo "  INSTALAÇÃO DO DATABASE CMASM"
echo "  Sistema de Gestão de Equipamentos e Calibração"
echo "============================================================================"
echo ""

# Verificar se MySQL está instalado
if ! command -v mysql &> /dev/null; then
    log_error "MySQL não está instalado!"
    exit 1
fi

# Solicitar senha se não fornecida
if [ -z "$DB_PASS" ]; then
    echo -n "Digite a senha do MySQL para o usuário $DB_USER: "
    read -s DB_PASS
    echo ""
fi

# Teste de conexão
log_info "Testando conexão com MySQL..."
if ! mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "SELECT 1;" &>/dev/null; then
    log_error "Não foi possível conectar ao MySQL. Verifique as credenciais."
    exit 1
fi
log_info "✓ Conexão estabelecida"

# Verificar se database existe
log_info "Verificando database '$DB_NAME'..."
DB_EXISTS=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "SHOW DATABASES LIKE '$DB_NAME';" | grep "$DB_NAME" || true)

if [ -n "$DB_EXISTS" ]; then
    log_warn "Database '$DB_NAME' já existe!"
    echo -n "Deseja fazer backup e recriar? (s/N): "
    read -r response
    
    if [[ "$response" =~ ^[Ss]$ ]]; then
        # Fazer backup
        BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"
        log_info "Criando backup em: $BACKUP_FILE"
        mysqldump -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"
        log_info "✓ Backup criado"
        
        # Dropar database
        log_info "Removendo database existente..."
        mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "DROP DATABASE $DB_NAME;"
    else
        log_info "Instalação cancelada pelo usuário."
        exit 0
    fi
fi

# Criar database
log_info "Criando database '$DB_NAME'..."
mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
log_info "✓ Database criado"

echo ""
echo "============================================================================"
echo "  FASE 1: EXECUTANDO MIGRATIONS"
echo "============================================================================"
echo ""

# Executar migrations em ordem
MIGRATIONS=(
    "01_create_organizations.sql:Tabela organizations"
    "02_create_laboratories.sql:Tabela laboratories"
    "03_create_providers.sql:Tabela providers"
    "04_create_reference_standards.sql:Tabela reference_standards"
    "05_create_users.sql:Tabela users"
    "06_create_equipment.sql:Tabela equipment"
    "07_create_services.sql:Tabela services"
    "08_create_calibrations.sql:Tabela calibrations"
    "09_create_certificates_and_parameters.sql:Tabelas certificates e parameters"
    "10_add_foreign_keys.sql:Foreign keys pendentes"
    "11_create_support_tables.sql:Tabelas de suporte"
)

FAILED=0
for migration in "${MIGRATIONS[@]}"; do
    IFS=':' read -r file desc <<< "$migration"
    if ! execute_sql "$MIGRATIONS_DIR/$file" "$desc"; then
        FAILED=1
        break
    fi
done

if [ $FAILED -eq 1 ]; then
    log_error "Migração falhou! Abortando instalação."
    exit 1
fi

echo ""
echo "============================================================================"
echo "  FASE 2: EXECUTANDO SEEDS"
echo "============================================================================"
echo ""

# Executar seeds em ordem
SEEDS=(
    "01_seed_organizations.sql:Estrutura organizacional CMASM"
    "02_seed_laboratories.sql:Laboratórios de calibração"
    "03_seed_reference_standards.sql:Padrões de referência"
    "04_seed_users.sql:Usuários iniciais"
    "05_triggers_and_procedures.sql:Triggers e stored procedures"
    "06_views.sql:Views do sistema"
    "07_seed_real_equipment.sql:Equipamentos reais CMASM (30+ equipamentos)"
)

for seed in "${SEEDS[@]}"; do
    IFS=':' read -r file desc <<< "$seed"
    if ! execute_sql "$SEEDS_DIR/$file" "$desc"; then
        log_warn "Seed falhou, mas continuando: $desc"
    fi
done

echo ""
echo "============================================================================"
echo "  VERIFICAÇÃO FINAL"
echo "============================================================================"
echo ""

# Contar tabelas
TABLE_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SHOW TABLES;" | wc -l)
TABLE_COUNT=$((TABLE_COUNT - 1)) # Remove header line

log_info "Tabelas criadas: $TABLE_COUNT"

# Contar registros em tabelas principais
ORG_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM organizations;" -sN)
LAB_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM laboratories;" -sN)
USER_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM users;" -sN)
EQUIP_COUNT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM equipment;" -sN)

log_info "Organizações: $ORG_COUNT"
log_info "Laboratórios: $LAB_COUNT"
log_info "Usuários: $USER_COUNT"
log_info "Equipamentos: $EQUIP_COUNT"

echo ""
echo "============================================================================"
log_info "INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo "============================================================================"
echo ""
echo "Informações de acesso:"
echo "  Database: $DB_NAME"
echo "  Host: $DB_HOST:$DB_PORT"
echo ""
echo "Usuário padrão:"
echo "  Username: admin"
echo "  Email: admin@cmasm.mar.mil.br"
echo "  Senha: Admin@123"
echo ""
log_warn "IMPORTANTE: Altere a senha padrão imediatamente!"
echo ""
echo "Próximos passos:"
echo "  1. Alterar senhas padrão"
echo "  2. Configurar API backend (PHP/Node.js)"
echo "  3. Atualizar frontend React para usar nova estrutura"
echo "  4. Testar funcionalidades"
echo ""
