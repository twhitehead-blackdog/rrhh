@echo off
chcp 65001 >nul
echo ============================================
echo Peopletrak - Configuracion Rapida
echo ============================================
echo.

REM Verificar si .env ya existe
if exist .env (
    echo ⚠️  El archivo .env ya existe
    set /p sobrescribir="¿Deseas sobrescribirlo? (s/n): "
    if /i not "%sobrescribir%"=="s" (
        echo Operacion cancelada.
        pause
        exit /b
    )
)

echo Este script creara el archivo .env necesario para ejecutar la aplicacion.
echo.
echo IMPORTANTE: Necesitas tener configurado:
echo   1. Una cuenta de Auth0 (gratuita en https://auth0.com)
echo   2. Una cuenta de Supabase (gratuita en https://supabase.com)
echo.
pause

echo.
echo ============================================
echo Configuracion de Auth0
echo ============================================
set /p AUTH0_DOMAIN="Ingresa tu dominio de Auth0 (ej: mi-app.auth0.com): "
set /p AUTH0_CLIENT_ID="Ingresa tu Client ID de Auth0: "
set /p AUTH0_AUDIENCE="Ingresa tu Audience de Auth0 (ej: https://mi-api.com): "

echo.
echo ============================================
echo Configuracion de Supabase
echo ============================================
set /p SUPABASE_URL="Ingresa tu URL de Supabase (ej: https://xxxxx.supabase.co): "
set /p SUPABASE_API_KEY="Ingresa tu API Key publica de Supabase: "

echo.
echo Creando archivo .env...

(
echo # ============================================
echo # Peopletrak - Variables de Entorno
echo # ============================================
echo # Generado automaticamente
echo.
echo # Auth0 Configuration
echo ENV_AUTH0_DOMAIN=%AUTH0_DOMAIN%
echo ENV_AUTH0_CLIENT_ID=%AUTH0_CLIENT_ID%
echo ENV_AUTH0_AUDIENCE=%AUTH0_AUDIENCE%
echo.
echo # Supabase Configuration
echo ENV_SUPABASE_URL=%SUPABASE_URL%
echo ENV_SUPABASE_API_KEY=%SUPABASE_API_KEY%
echo.
echo # Application Configuration
echo ENV_APP_URL=http://localhost:4200
) > .env

echo.
echo ✅ Archivo .env creado exitosamente!
echo.
echo Ahora puedes ejecutar la aplicacion con:
echo   npm start
echo.
echo La aplicacion estara disponible en: http://localhost:4200
echo.
pause
