# ⚠️ Problema Detectado: Variables de Entorno Vacías

## 🔍 Diagnóstico

La URL de Auth0 muestra parámetros vacíos:
- `client_id=&` 
- `audience=&`

Esto indica que el archivo `.env` no existe o las variables no están configuradas.

## ✅ Solución Rápida

### Opción 1: Configurar con Script (Recomendado)

Ejecuta el script interactivo:

```powershell
.\setup-env.ps1
```

O en CMD:
```cmd
setup-env.bat
```

### Opción 2: Crear Manualmente

1. El archivo `.env` ya fue creado con valores vacíos
2. Edítalo y completa los valores:

```env
ENV_AUTH0_DOMAIN=tu-dominio.auth0.com
ENV_AUTH0_CLIENT_ID=tu-client-id
ENV_AUTH0_AUDIENCE=https://tu-api.com
ENV_SUPABASE_URL=https://tu-proyecto.supabase.co
ENV_SUPABASE_API_KEY=tu-api-key
ENV_APP_URL=http://localhost:4200
```

### Opción 3: Valores de Prueba Temporal

Si solo quieres probar la estructura sin autenticación, puedes usar valores temporales:

```env
ENV_AUTH0_DOMAIN=dev-xxxxx.us.auth0.com
ENV_AUTH0_CLIENT_ID=xxxxx
ENV_AUTH0_AUDIENCE=https://dev-xxxxx.us.auth0.com/api/v2/
ENV_SUPABASE_URL=https://xxxxx.supabase.co
ENV_SUPABASE_API_KEY=xxxxx
ENV_APP_URL=http://localhost:4200
```

## 🔄 Después de Configurar

**IMPORTANTE:** Después de crear o modificar el archivo `.env`:

1. **Detén el servidor** (Ctrl + C)
2. **Reinicia el servidor:**
   ```bash
   npm start
   ```

El plugin `env-var-plugin.js` solo carga las variables durante el build/start, por lo que necesitas reiniciar.

## 📝 Cómo Obtener las Credenciales

### Auth0 (Gratis):
1. Ve a https://manage.auth0.com/
2. Crea una aplicación tipo "Single Page Application"
3. Configura:
   - **Allowed Callback URLs**: `http://localhost:4200`
   - **Allowed Logout URLs**: `http://localhost:4200`
   - **Allowed Web Origins**: `http://localhost:4200`
4. Crea una API y configura el Audience
5. Copia Domain, Client ID y Audience

### Supabase (Gratis):
1. Ve a https://app.supabase.com/
2. Crea un nuevo proyecto
3. Ve a Settings > API
4. Copia la URL y la anon/public key

## 🎯 Estado Actual

- ✅ Archivo `.env` creado (con valores vacíos)
- ⚠️ Necesitas completar las credenciales
- ⚠️ Necesitas reiniciar el servidor después de configurar

