Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Peopletrak - Configuracion Rapida" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si .env ya existe
if (Test-Path .env) {
    Write-Host "⚠️  El archivo .env ya existe" -ForegroundColor Yellow
    $sobrescribir = Read-Host "¿Deseas sobrescribirlo? (s/n)"
    if ($sobrescribir -ne "s") {
        Write-Host "Operacion cancelada." -ForegroundColor Yellow
        exit
    }
}

Write-Host "Este script creara el archivo .env necesario para ejecutar la aplicacion." -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANTE: Necesitas tener configurado:" -ForegroundColor Yellow
Write-Host "  1. Una cuenta de Auth0 (gratuita en https://auth0.com)" -ForegroundColor White
Write-Host "  2. Una cuenta de Supabase (gratuita en https://supabase.com)" -ForegroundColor White
Write-Host ""

# Auth0
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Configuracion de Auth0" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
$AUTH0_DOMAIN = Read-Host "Ingresa tu dominio de Auth0 (ej: mi-app.auth0.com)"
$AUTH0_CLIENT_ID = Read-Host "Ingresa tu Client ID de Auth0"
$AUTH0_AUDIENCE = Read-Host "Ingresa tu Audience de Auth0 (ej: https://mi-api.com)"

# Supabase
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Configuracion de Supabase" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
$SUPABASE_URL = Read-Host "Ingresa tu URL de Supabase (ej: https://xxxxx.supabase.co)"
$SUPABASE_API_KEY = Read-Host "Ingresa tu API Key publica de Supabase"

# Crear archivo .env
Write-Host ""
Write-Host "Creando archivo .env..." -ForegroundColor Green

$envContent = @"
# ============================================
# Peopletrak - Variables de Entorno
# ============================================
# Generado automaticamente el $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

# Auth0 Configuration
ENV_AUTH0_DOMAIN=$AUTH0_DOMAIN
ENV_AUTH0_CLIENT_ID=$AUTH0_CLIENT_ID
ENV_AUTH0_AUDIENCE=$AUTH0_AUDIENCE

# Supabase Configuration
ENV_SUPABASE_URL=$SUPABASE_URL
ENV_SUPABASE_API_KEY=$SUPABASE_API_KEY

# Application Configuration
ENV_APP_URL=http://localhost:4200
"@

$envContent | Out-File -FilePath .env -Encoding utf8 -NoNewline

Write-Host ""
Write-Host "✅ Archivo .env creado exitosamente!" -ForegroundColor Green
Write-Host ""
Write-Host "Ahora puedes ejecutar la aplicacion con:" -ForegroundColor Cyan
Write-Host "  npm start" -ForegroundColor Yellow
Write-Host ""
Write-Host "La aplicacion estara disponible en: http://localhost:4200" -ForegroundColor Green
Write-Host ""

