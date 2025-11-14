# 🚀 Guía para Ejecutar Peopletrak Localmente

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- **Node.js** (versión 18 o superior)
- **npm** o **yarn**
- Una cuenta de **Auth0** (gratuita)
- Una cuenta de **Supabase** (gratuita)

## 🔧 Configuración Paso a Paso

### 1. Instalar Dependencias

```bash
npm install
```

### 2. Configurar Variables de Entorno

La aplicación utiliza variables de entorno que deben comenzar con el prefijo `ENV_`. 

Crea un archivo `.env` en la raíz del proyecto con las siguientes variables:

```env
# Auth0 Configuration
ENV_AUTH0_DOMAIN=tu-dominio.auth0.com
ENV_AUTH0_CLIENT_ID=tu-client-id
ENV_AUTH0_AUDIENCE=tu-audience-url

# Supabase Configuration
ENV_SUPABASE_URL=https://tu-proyecto.supabase.co
ENV_SUPABASE_API_KEY=tu-api-key-publica

# Application URL
ENV_APP_URL=http://localhost:4200
```

**Nota:** El plugin `env-var-plugin.js` solo inyecta variables que comienzan con `ENV_` al proceso de build.

### 3. Configurar Auth0

1. Ve a [Auth0 Dashboard](https://manage.auth0.com/)
2. Crea una nueva aplicación (Single Page Application)
3. Configura las siguientes URLs:
   - **Allowed Callback URLs**: `http://localhost:4200`
   - **Allowed Logout URLs**: `http://localhost:4200`
   - **Allowed Web Origins**: `http://localhost:4200`
4. Crea una API y configura el **Audience**
5. Copia el **Domain**, **Client ID** y **Audience** a tu archivo `.env`

### 4. Configurar Supabase

1. Ve a [Supabase Dashboard](https://app.supabase.com/)
2. Crea un nuevo proyecto
3. Ve a **Settings** > **API**
4. Copia la **URL** y la **anon/public key** a tu archivo `.env`
5. Configura las tablas necesarias en la base de datos (ver sección de Base de Datos)

### 5. Configurar Base de Datos en Supabase

La aplicación requiere las siguientes tablas principales:

- `employees` - Empleados
- `companies` - Empresas
- `branches` - Sucursales
- `departments` - Departamentos
- `positions` - Posiciones/Cargos
- `schedules` - Horarios
- `employee_schedules` - Horarios de empleados
- `timelogs` - Registros de tiempo
- `payrolls` - Nóminas
- `payroll_payments` - Pagos de nómina
- `payroll_deductions` - Deducciones
- `payroll_debts` - Débitos
- `creditors` - Acreedores
- `banks` - Bancos
- `timeoffs` - Tiempos libres
- `terminations` - Terminaciones

**Nota:** Necesitarás configurar Row Level Security (RLS) en Supabase para que Auth0 funcione correctamente.

### 6. Ejecutar la Aplicación

#### Modo Desarrollo

```bash
npm start
# o
npx nx serve peopletrak
```

La aplicación estará disponible en: `http://localhost:4200`

#### Modo Producción (Build)

```bash
npm run build
# o
npx nx build peopletrak
```

Para ejecutar el servidor SSR:

```bash
node dist/peopletrak/server/server.mjs
```

## 🔍 Cómo Funciona la Aplicación

### Flujo de Autenticación

1. El usuario accede a `/login`
2. Al hacer clic en "Entrar al dashboard", se redirige a Auth0
3. Auth0 autentica al usuario y devuelve un JWT token
4. El token se almacena y se usa en todas las peticiones HTTP
5. El `httpInterceptor` añade automáticamente el token a las peticiones a Supabase

### Comunicación con el Backend

- Todas las peticiones HTTP van a Supabase REST API
- El formato de URL es: `${ENV_SUPABASE_URL}/rest/v1/{tabla}`
- El interceptor HTTP añade:
  - `apikey`: La API key pública de Supabase
  - `Authorization`: Bearer token de Auth0
  - Headers necesarios para CORS

### Gestión de Estado

- Utiliza **NgRx Signals** para el estado reactivo
- Cada módulo tiene su propio store (employees, companies, payrolls, etc.)
- Los stores se inicializan automáticamente cuando se cargan los componentes

### Rutas Principales

- `/login` - Página de inicio de sesión
- `/qr` - Generador de códigos QR para empleados
- `/timeclock` - Reloj de punto (página principal por defecto)
- `/home` - Dashboard principal (solo admin)
- `/admin` - Administración (empleados, empresas, sucursales, etc.)
- `/time-management` - Gestión de tiempo (horarios, timelogs, etc.)
- `/payroll` - Gestión de nómina

## 🧪 Ejecutar Tests

```bash
npm test
# o
npx nx test peopletrak
```

## 🐛 Solución de Problemas

### Error: "Cannot find module"

```bash
rm -rf node_modules package-lock.json
npm install
```

### Error de Autenticación

- Verifica que las variables de entorno de Auth0 estén correctas
- Asegúrate de que las URLs de callback estén configuradas en Auth0
- Revisa la consola del navegador para ver errores específicos

### Error de Conexión con Supabase

- Verifica que `ENV_SUPABASE_URL` y `ENV_SUPABASE_API_KEY` estén correctos
- Asegúrate de que Row Level Security (RLS) esté configurado correctamente
- Verifica que el token de Auth0 tenga los permisos necesarios

### Variables de Entorno No Funcionan

- Asegúrate de que las variables comiencen con `ENV_`
- Reinicia el servidor de desarrollo después de cambiar las variables
- Verifica que el archivo `.env` esté en la raíz del proyecto

## 📚 Recursos Adicionales

- [Documentación de Angular](https://angular.io/docs)
- [Documentación de Nx](https://nx.dev)
- [Documentación de Auth0](https://auth0.com/docs)
- [Documentación de Supabase](https://supabase.com/docs)
- [Documentación de PrimeNG](https://primeng.org)

## 🎯 Próximos Pasos

1. Configura tu base de datos en Supabase
2. Crea algunos datos de prueba (empresas, empleados, etc.)
3. Configura Auth0 con usuarios de prueba
4. Explora las diferentes funcionalidades de la aplicación

