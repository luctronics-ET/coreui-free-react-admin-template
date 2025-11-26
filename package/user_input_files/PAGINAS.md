# PÁGINAS DO SISTEMA xAGUADA

## 📋 PÁGINAS PRINCIPAIS ATIVAS

### 🏠 **Sistema Principal** (Banco: `xaguada`)
1. **`index.php`** - Página inicial com menu principal
   - 🔗 URL: `http://localhost/xaguada/`
   - 📝 Descrição: Menu de navegação entre módulos

2. **`consumo.php`** - Dashboard Castelo de Consumo  
   - 🔗 URL: `http://localhost/xaguada/consumo.php`
   - 📊 Mostra: Nível, volume, válvulas, eventos
   - 🎯 Device: `castelo_consumo`

3. **`incendio.php`** - Dashboard Castelo de Incêndio
   - 🔗 URL: `http://localhost/xaguada/incendio.php`  
   - 📊 Mostra: Pressão, capacidade, status sistema
   - 🎯 Device: `castelo_incendio`

4. **`cisternas.php`** - Dashboard Cisternas IE
   - 🔗 URL: `http://localhost/xaguada/cisternas.php`
   - 📊 Mostra: Status múltiplas cisternas IE01/IE02
   - 🎯 Devices: `cisterna_ie01`, `cisterna_ie02`

### 🎨 **Diagramas SCADA**
5. **`scada.html`** - Diagrama em Cards SVG
   - 🔗 URL: `http://localhost/xaguada/scada.html`
   - 🎨 Visualização: Cards interativos em SVG

6. **`scada2.html`** - Diagrama SCADA Avançado  
   - 🔗 URL: `http://localhost/xaguada/scada2.html`
   - 🎨 Visualização: Diagrama técnico completo

---

## 🔧 **Sistema Nano** (Legacy - Banco: `sensores_db`)

### 📊 **Painéis de Sensores**
7. **`nano/painel.php`** - Painel simples (vazio)
   - 🔗 URL: `http://localhost/xaguada/nano/painel.php`
   - ⚠️ Status: Arquivo vazio

8. **`nano/painel2.php`** - Dashboard avançado com cards
   - 🔗 URL: `http://localhost/xaguada/nano/painel2.php`
   - 🔐 Auth: admin/senha123
   - 📊 Mostra: Cards coloridos, gráficos, tabelas

9. **`nano/relatorio_consumo.php`** - Relatório consumo/abastecimento
   - 🔗 URL: `http://localhost/xaguada/nano/relatorio_consumo.php`  
   - 🔐 Auth: admin/senha123
   - 📈 Recursos: Filtros, gráficos, exportação

---

## ⚙️ **Páginas de Setup/Migração**

10. **`setup_clean.php`** - Setup do novo sistema unificado
    - 🔗 URL: `http://localhost/xaguada/setup_clean.php`
    - 🚀 Função: Cria banco limpo + dados demo
    - ⚡ Uso: Executar uma vez para resetar sistema

11. **`migrations/001_create_unified_schema.php`** - Criar schema
    - 🔗 URL: `http://localhost/xaguada/migrations/001_create_unified_schema.php`

12. **`migrations/002_migrate_data.php`** - Migrar dados
    - 🔗 URL: `http://localhost/xaguada/migrations/002_migrate_data.php`

---

## 🔌 **APIs e Utilitários**

13. **`nano/inserir_leitura.php`** - API para receber dados sensores
    - 🔗 Method: POST JSON
    - 📡 Função: Endpoint para Arduino/sensores

14. **`nano/inserir_demo.php`** - Inserir dados demo
    - 🔗 URL: `http://localhost/xaguada/nano/inserir_demo.php`

15. **`nano/processar_resumo.php`** - Processar resumos diários  
    - 🔗 URL: `http://localhost/xaguada/nano/processar_resumo.php`

---

## 📁 **Arquivos de Configuração**

- **`db.php`** - Conexão PDO (sistema principal)
- **`nano/config.php`** - Configurações sistema nano  
- **`config/database.php`** - Config unificada
- **`config/settings.php`** - Settings gerais
- **`style.css`** - Estilos principais

---

## 🎯 **RECOMENDAÇÃO DE TESTE**

### Para o sistema atual:
1. ✅ Execute `setup_clean.php` primeiro
2. ✅ Teste `index.php` → navegue pelos módulos
3. ✅ Verifique `consumo.php`, `incendio.php`, `cisternas.php`
4. ✅ Explore diagramas `scada.html`, `scada2.html`

### Para o sistema nano (legacy):
5. ✅ Teste `nano/painel2.php` (com auth)
6. ✅ Verifique `nano/relatorio_consumo.php`

**Total**: 15 páginas ativas + 5 configs/schemas
