#!/bin/bash

# ============================================================================
# Script de Instalação via Docker - Database CMASM
# Descrição: Executa migrations e seeds usando container Docker MySQL
# Data: 2025-11-26
# ============================================================================

# Usar Docker do sistema (não do NVM)
DOCKER_CMD="/usr/bin/docker"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configurações Docker
CONTAINER_NAME="cmms_docker-db-1"
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

# Função para executar SQL via Docker
execute_sql() {
    local sql_file=$1
    local description=$2
    
    log_info "Executando: $description"
    
    if $DOCKER_CMD exec -i "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$sql_file" 2>/dev/null; then
        log_info "✓ Sucesso: $description"
        return 0
    else
        log_error "✗ Falha: $description"
        return 1
    fi
}

# Banner
echo "============================================================================"
echo "  INSTALAÇÃO DO DATABASE CMASM VIA DOCKER"
echo "  Sistema de Gestão de Equipamentos e Calibração"
echo "============================================================================"
echo ""

# Verificar se Docker está instalado
if ! command -v $DOCKER_CMD &> /dev/null; then
    log_error "Docker não está instalado!"
    exit 1
fi

# Verificar se container existe e está rodando
if ! $DOCKER_CMD ps --format '{{.Names}}' | grep -qF "$CONTAINER_NAME"; then
    log_error "Container '$CONTAINER_NAME' não está rodando!"
    echo "Containers disponíveis:"
    $DOCKER_CMD ps --format '{{.Names}}'
    exit 1
fi

log_info "✓ Container Docker encontrado"

# Teste de conexão
log_info "Testando conexão com MySQL no container..."
if ! $DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" -e "SELECT 1;" &>/dev/null; then
    log_error "Não foi possível conectar ao MySQL no container."
    exit 1
fi
log_info "✓ Conexão estabelecida"

# Verificar se database existe
log_info "Verificando database '$DB_NAME'..."
DB_EXISTS=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" -e "SHOW DATABASES LIKE '$DB_NAME';" 2>/dev/null | grep "$DB_NAME" || true)

if [ -n "$DB_EXISTS" ]; then
    log_warn "Database '$DB_NAME' já existe!"
    
    # Verificar se tem tabelas
    TABLE_COUNT=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SHOW TABLES;" 2>/dev/null | wc -l)
    TABLE_COUNT=$((TABLE_COUNT - 1))
    
    if [ $TABLE_COUNT -gt 0 ]; then
        log_warn "Database possui $TABLE_COUNT tabelas"
        echo -n "Deseja fazer backup e recriar? (s/N): "
        read -r response
        
        if [[ "$response" =~ ^[Ss]$ ]]; then
            # Fazer backup
            BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"
            log_info "Criando backup em: $BACKUP_FILE"
            $DOCKER_CMD exec "$CONTAINER_NAME" mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" 2>/dev/null > "$BACKUP_FILE"
            log_info "✓ Backup criado"
            
            # Dropar database
            log_info "Removendo database existente..."
            $DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" -e "DROP DATABASE $DB_NAME;" 2>/dev/null
        else
            log_info "Instalação cancelada pelo usuário."
            exit 0
        fi
    else
        log_info "Database vazio, será utilizado"
    fi
else
    # Criar database
    log_info "Criando database '$DB_NAME'..."
    $DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" 2>/dev/null
    log_info "✓ Database criado"
fi

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
    "07_seed_real_equipment.sql:Equipamentos reais CMASM"
)

for seed in "${SEEDS[@]}"; do
    IFS=':' read -r file desc <<< "$seed"
    if [ -f "$SEEDS_DIR/$file" ]; then
        if ! execute_sql "$SEEDS_DIR/$file" "$desc"; then
            log_warn "Seed falhou, mas continuando: $desc"
        fi
    else
        log_warn "Arquivo não encontrado: $file"
    fi
done

echo ""
echo "============================================================================"
echo "  VERIFICAÇÃO FINAL"
echo "============================================================================"
echo ""

# Contar tabelas
TABLE_COUNT=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SHOW TABLES;" 2>/dev/null | wc -l)
TABLE_COUNT=$((TABLE_COUNT - 1))

log_info "Tabelas criadas: $TABLE_COUNT"

# Contar registros em tabelas principais
ORG_COUNT=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM organizations;" -sN 2>/dev/null)
LAB_COUNT=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM laboratories;" -sN 2>/dev/null)
USER_COUNT=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM users;" -sN 2>/dev/null)
EQUIP_COUNT=$($DOCKER_CMD exec "$CONTAINER_NAME" mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT COUNT(*) FROM equipment;" -sN 2>/dev/null)

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
echo "  Container: $CONTAINER_NAME"
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
echo "Acessar MySQL:"
echo "  $DOCKER_CMD exec -it $CONTAINER_NAME mysql -u$DB_USER -p$DB_PASS $DB_NAME"
echo ""
