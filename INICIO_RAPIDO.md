# 🚀 Guía Rápida para Ejecutar Peopletrak Localmente

## ✅ Paso 1: Verificar Dependencias Instaladas

Las dependencias ya están instaladas. Si necesitas reinstalarlas:

```bash
npm install --legacy-peer-deps
```

## ⚙️ Paso 2: Configurar Variables de Entorno

**Opción A: Usar el script automático (Windows)**
```bash
setup-env.bat
```

**Opción B: Crear manualmente el archivo `.env`**

Crea un archivo llamado `.env` en la raíz del proyecto con este contenido:

```env
# Auth0 Configuration
ENV_AUTH0_DOMAIN=tu-dominio.auth0.com
ENV_AUTH0_CLIENT_ID=tu-client-id
ENV_AUTH0_AUDIENCE=https://tu-api.com

# Supabase Configuration
ENV_SUPABASE_URL=https://tu-proyecto.supabase.co
ENV_SUPABASE_API_KEY=tu-api-key-publica

# Application URL
ENV_APP_URL=http://localhost:4200
```

### 🔑 Cómo obtener las credenciales:

#### Auth0:
1. Ve a https://manage.auth0.com/
2. Crea una aplicación tipo "Single Page Application"
3. Configura:
   - **Allowed Callback URLs**: `http://localhost:4200`
   - **Allowed Logout URLs**: `http://localhost:4200`
   - **Allowed Web Origins**: `http://localhost:4200`
4. Crea una API y configura el Audience
5. Copia Domain, Client ID y Audience

#### Supabase:
1. Ve a https://app.supabase.com/
2. Crea un nuevo proyecto
3. Ve a Settings > API
4. Copia la URL y la anon/public key

## 🏃 Paso 3: Ejecutar la Aplicación

```bash
npm start
```

O alternativamente:

```bash
npx nx serve peopletrak
```

La aplicación estará disponible en: **http://localhost:4200**

## 🐛 Solución de Problemas

### Error: Variables de entorno no encontradas
- Asegúrate de que el archivo `.env` esté en la raíz del proyecto
- Verifica que todas las variables comiencen con `ENV_`
- Reinicia el servidor después de crear/modificar el `.env`

### Error: Puerto 4200 ya en uso
```bash
# Windows
netstat -ano | findstr :4200
taskkill /PID <PID> /F

# O cambia el puerto en el archivo .env
ENV_APP_URL=http://localhost:4201
```

### Error de autenticación
- Verifica que las URLs de callback estén configuradas en Auth0
- Asegúrate de que el dominio y client ID sean correctos

### Error de conexión con Supabase
- Verifica que la URL y API key sean correctas
- Asegúrate de que Row Level Security (RLS) esté configurado

## 📝 Notas Importantes

- El archivo `.env` está en `.gitignore` por seguridad
- No subas credenciales reales al repositorio
- Para desarrollo local, usa `http://localhost:4200`
- Las variables deben comenzar con `ENV_` para que funcionen

## 🎯 Próximos Pasos

Una vez que la aplicación esté corriendo:

1. Accede a `http://localhost:4200`
2. Serás redirigido a `/login`
3. Haz clic en "Entrar al dashboard"
4. Inicia sesión con Auth0
5. Explora las funcionalidades de la aplicación

