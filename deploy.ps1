# ============================================
# deploy.ps1 — Dolce Diavolo a GitHub Pages
# Ejecutar desde C:\Users\User01\OneDrive\2026-proyectos\dolcediavolo
# ============================================

# 1. Elegir cuenta (cambia a infraestructura-it si prefieres esa org)
$ORG = "automatizacion-it"
gh auth switch --user $ORG

# 2. Inicializar repo local
git init
git add .
git commit -m "feat: sitio inicial Dolce Diavolo - home, tienda, origen, rituali, etiquetas"

# 3. Crear repositorio en GitHub y hacer push
gh repo create "$ORG/dolcediavolo" --public --source . --remote origin --push

# 4. Activar GitHub Pages (rama main, raiz)
gh api "repos/$ORG/dolcediavolo/pages" -X POST -f "source[branch]=main" -f "source[path]=/"

# 5. Configurar dominio personalizado en Pages
gh api "repos/$ORG/dolcediavolo/pages" -X PUT -f "cname=dolcediavolo.com"

Write-Host ""
Write-Host "Listo. Ahora configura el DNS en Cloudflare (ver instrucciones)." -ForegroundColor Green
