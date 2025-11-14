# 🔄 Cómo Funciona Peopletrak

## Arquitectura General

```
┌─────────────┐
│   Usuario   │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────┐
│     Angular Frontend (Puerto 4200)  │
│  ┌───────────────────────────────┐ │
│  │  Login Component              │ │
│  │  ↓                            │ │
│  │  Auth0 Authentication         │ │
│  │  ↓                            │ │
│  │  Dashboard Component          │ │
│  │  ├── Timeclock                │ │
│  │  ├── Admin                    │ │
│  │  ├── Time Management          │ │
│  │  └── Payroll                  │ │
│  └───────────────────────────────┘ │
└──────────────┬──────────────────────┘
               │
               │ HTTP Requests
               │ (con JWT Token)
               ▼
┌─────────────────────────────────────┐
│      HTTP Interceptor               │
│  - Añade token Auth0                │
│  - Añade API key Supabase           │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│      Supabase REST API              │
│  (Backend como Servicio)            │
│  - PostgreSQL Database              │
│  - Row Level Security (RLS)         │
│  - REST Endpoints                   │
└─────────────────────────────────────┘
```

## Flujo de Autenticación

```
1. Usuario visita /login
   │
   ▼
2. Click en "Entrar al dashboard"
   │
   ▼
3. Redirección a Auth0
   │
   ├─→ Login con email/password
   │   o proveedor social
   │
   ▼
4. Auth0 devuelve JWT Token
   │
   ▼
5. Token almacenado en memoria
   │
   ▼
6. Redirección a /timeclock
   │
   ▼
7. AuthGuard verifica autenticación
   │
   ├─→ ✅ Autenticado → Acceso permitido
   └─→ ❌ No autenticado → Redirige a /login
```

## Flujo de una Petición HTTP

```
Componente necesita datos
   │
   ▼
Store llama a HttpClient
   │
   ▼
HTTP Interceptor intercepta
   │
   ├─→ Obtiene token de Auth0
   │
   ├─→ Verifica si URL contiene "supabase"
   │
   └─→ Añade headers:
       - Authorization: Bearer {token}
       - apikey: {ENV_SUPABASE_API_KEY}
       - Content-Type: application/json
   │
   ▼
Petición a Supabase REST API
   │
   ├─→ GET /rest/v1/employees
   ├─→ POST /rest/v1/employees
   ├─→ PATCH /rest/v1/employees?id=eq.{id}
   └─→ DELETE /rest/v1/employees?id=eq.{id}
   │
   ▼
Supabase valida:
   - Token JWT válido
   - Row Level Security (RLS)
   - Permisos del usuario
   │
   ▼
Respuesta JSON
   │
   ▼
Store actualiza estado
   │
   ▼
Componente se actualiza automáticamente
```

## Gestión de Estado (NgRx Signals)

```
┌─────────────────────────────────┐
│      Signal Store               │
│  ┌───────────────────────────┐  │
│  │  State (señales)         │  │
│  │  - entities()            │  │
│  │  - isLoading()          │  │
│  │  - error()              │  │
│  └───────────────────────────┘  │
│  ┌───────────────────────────┐  │
│  │  Methods                 │  │
│  │  - fetchItems()          │  │
│  │  - createItem()          │  │
│  │  - updateItem()          │  │
│  │  - deleteItem()          │  │
│  └───────────────────────────┘  │
│  ┌───────────────────────────┐  │
│  │  Computed Signals        │  │
│  │  - filteredEntities()    │  │
│  │  - activeEntities()      │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

## Estructura de Rutas

```
/ (raíz)
│
├── /login
│   └── LoginComponent
│
├── /qr
│   └── QrGeneratorComponent
│
└── / (protegido por authGuard)
    └── DashboardComponent
        │
        ├── /timeclock (default)
        │   └── TimeclockComponent
        │
        ├── /home
        │   └── HomeComponent
        │
        ├── /admin
        │   ├── /employees
        │   │   ├── / (lista)
        │   │   ├── /new
        │   │   ├── /:id (detalle)
        │   │   └── /:id/edit
        │   ├── /companies
        │   ├── /departments
        │   ├── /positions
        │   └── /branches
        │
        ├── /time-management
        │   ├── /timelogs
        │   ├── /timetables
        │   ├── /schedules
        │   └── /shifts
        │
        └── /payroll
            ├── /payrolls
            │   ├── / (lista)
            │   ├── /:id (detalle)
            │   └── /:id/payments/:payment_id
            ├── /creditors
            └── /banks
```

## Componentes Principales

### 1. TimeclockComponent
- **Propósito**: Reloj de punto para empleados
- **Funcionalidad**:
  - Escaneo de QR code o código TOTP
  - Registro de entrada/salida
  - Registro de inicio/fin de almuerzo
  - Validación de horarios

### 2. DashboardComponent
- **Propósito**: Contenedor principal con navegación
- **Funcionalidad**:
  - Menú de navegación
  - Control de acceso basado en roles
  - Logout

### 3. EmployeeListComponent
- **Propósito**: Lista de empleados
- **Funcionalidad**:
  - Visualización de empleados
  - Filtros y búsqueda
  - Acciones CRUD

### 4. PayrollComponent
- **Propósito**: Gestión de nómina
- **Funcionalidad**:
  - Crear/configurar nóminas
  - Procesar pagos
  - Calcular deducciones
  - Generar reportes

## Stores (Gestión de Estado)

Cada módulo tiene su propio store:

- **AuthStore**: Autenticación y usuario actual
- **EmployeesStore**: Gestión de empleados
- **CompaniesStore**: Gestión de empresas
- **BranchesStore**: Gestión de sucursales
- **DepartmentsStore**: Gestión de departamentos
- **PositionsStore**: Gestión de posiciones
- **SchedulesStore**: Gestión de horarios
- **PayrollsStore**: Gestión de nóminas
- **BanksStore**: Gestión de bancos
- **CreditorsStore**: Gestión de acreedores
- **DashboardStore**: Estado del dashboard

## Seguridad

1. **Autenticación**: Auth0 con JWT
2. **Autorización**: Guards de Angular
3. **Backend**: Row Level Security (RLS) en Supabase
4. **HTTPS**: Requerido en producción
5. **Tokens**: Almacenados en memoria (no localStorage)

## Variables de Entorno

Todas las variables deben comenzar con `ENV_`:

- `ENV_AUTH0_DOMAIN`: Dominio de Auth0
- `ENV_AUTH0_CLIENT_ID`: Client ID de Auth0
- `ENV_AUTH0_AUDIENCE`: Audience de Auth0 API
- `ENV_SUPABASE_URL`: URL de Supabase
- `ENV_SUPABASE_API_KEY`: API Key pública de Supabase
- `ENV_APP_URL`: URL de la aplicación

## Tecnologías Clave

- **Angular 20**: Framework frontend
- **NgRx Signals**: Estado reactivo
- **PrimeNG**: Componentes UI
- **Tailwind CSS**: Estilos
- **Auth0**: Autenticación
- **Supabase**: Backend como servicio
- **Chart.js**: Gráficos
- **PDFMake**: Generación de PDFs
- **QRCode**: Códigos QR
- **OTPAuth**: Autenticación TOTP

