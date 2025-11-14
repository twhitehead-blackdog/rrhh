# ⚠️ URGENTE: Configurar Credenciales de Auth0

## 🔍 Problema Detectado

La URL de Auth0 muestra parámetros vacíos:
- `client_id=&` ❌
- `audience=&` ❌

Esto significa que el archivo `.env` tiene valores vacíos.

## ✅ Solución Inmediata

### Opción 1: Script Interactivo (MÁS FÁCIL)

Ejecuta este comando en PowerShell:

```powershell
.\setup-env.ps1
```

Te pedirá las credenciales paso a paso.

### Opción 2: Editar Manualmente

1. Abre el archivo `.env` en la raíz del proyecto
2. Completa estos valores (los más importantes para Auth0):

```env
ENV_AUTH0_DOMAIN=tu-dominio.auth0.com
ENV_AUTH0_CLIENT_ID=tu-client-id-aqui
ENV_AUTH0_AUDIENCE=https://tu-api.com
```

3. Guarda el archivo
4. **REINICIA el servidor** (Ctrl+C y luego `npm start`)

### Opción 3: Configurar Auth0 Ahora (Si No Lo Has Hecho)

Si aún no tienes Auth0 configurado:

1. **Ve a:** https://manage.auth0.com/
2. **Crea cuenta gratuita** (si no tienes)
3. **Crea una aplicación:**
   - Tipo: **Single Page Application**
   - Nombre: Peopletrak (o el que quieras)
4. **Configura estas URLs:**
   - Allowed Callback URLs: `http://localhost:4200`
   - Allowed Logout URLs: `http://localhost:4200`
   - Allowed Web Origins: `http://localhost:4200`
5. **Crea una API:**
   - Ve a "APIs" en el menú
   - Click "Create API"
   - Nombre: Peopletrak API
   - Identifier: `https://peopletrak-api.com` (o el que quieras)
6. **Copia estos valores:**
   - **Domain:** Lo encuentras en la página principal (ej: `dev-xxxxx.us.auth0.com`)
   - **Client ID:** Lo encuentras en Applications > Tu App > Settings
   - **Audience:** Es el Identifier de tu API (ej: `https://peopletrak-api.com`)

## 🔄 Después de Configurar

**CRÍTICO:** Después de editar el `.env`:

1. **Detén el servidor:** Presiona `Ctrl + C`
2. **Reinicia:** `npm start`
3. **Recarga el navegador:** F5 o Ctrl+R

Las variables solo se cargan al iniciar el servidor.

## 📋 Valores Mínimos Necesarios

Para que Auth0 funcione, necesitas al menos:

```env
ENV_AUTH0_DOMAIN=dev-xxxxx.us.auth0.com
ENV_AUTH0_CLIENT_ID=xxxxxxxxxxxxxxxxxxxx
ENV_AUTH0_AUDIENCE=https://peopletrak-api.com
ENV_APP_URL=http://localhost:4200
```

Los de Supabase pueden esperar si solo quieres probar la autenticación.

## 🎯 Verificación Rápida

Después de configurar y reiniciar, la URL de Auth0 debería verse así:

```
https://TU-DOMINIO.auth0.com/authorize?client_id=TU-CLIENT-ID&audience=TU-AUDIENCE&...
```

En lugar de:
```
https://authorize/?client_id=&audience=&...
```

## 🆘 ¿Necesitas Ayuda?

- Ejecuta `.\setup-env.ps1` para configuración guiada
- Revisa `GUIA_LOCAL.md` para instrucciones detalladas
- Verifica que el archivo `.env` esté en la raíz del proyecto

