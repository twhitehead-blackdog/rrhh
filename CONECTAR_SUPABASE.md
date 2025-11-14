# 🗄️ Guía: Conectar Base de Datos Supabase de Prueba

## 📋 Paso 1: Obtener Credenciales de Supabase

### 1.1 Crear o Acceder a tu Proyecto

1. Ve a [Supabase Dashboard](https://app.supabase.com/)
2. Si no tienes cuenta, crea una **gratuita**
3. Crea un nuevo proyecto o selecciona uno existente

### 1.2 Obtener las Credenciales

1. En tu proyecto de Supabase, ve a **Settings** (⚙️) en el menú lateral
2. Click en **API** en el submenú
3. Encontrarás dos valores importantes:

   **Project URL:**
   ```
   https://xxxxxxxxxxxxx.supabase.co
   ```
   Copia esta URL completa

   **anon public key:**
   ```
   eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh4eHh4eHh4eHh4eHh4eHh4eCIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNjQ4NzY4ODAwLCJleHAiOjE5NjQzNDQ4MDB9.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```
   Copia esta clave (es la que dice "anon" o "public")

## 📝 Paso 2: Configurar el Archivo .env

### Opción A: Script Interactivo (Recomendado)

Ejecuta en PowerShell:
```powershell
.\setup-env.ps1
```

Te pedirá las credenciales paso a paso.

### Opción B: Editar Manualmente

1. Abre el archivo `.env` en la raíz del proyecto
2. Completa estas líneas con tus valores de Supabase:

```env
ENV_SUPABASE_URL=https://tu-proyecto.supabase.co
ENV_SUPABASE_API_KEY=tu-anon-public-key-aqui
```

**Ejemplo real:**
```env
ENV_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
ENV_SUPABASE_API_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTY0ODc2ODgwMCwiZXhwIjoxOTY0MzQ0ODAwfQ.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## 🔧 Paso 3: Configurar Row Level Security (RLS)

Para que la aplicación funcione correctamente, necesitas configurar RLS en Supabase:

### 3.1 Deshabilitar RLS Temporalmente (Solo para Pruebas)

1. Ve a **Authentication** > **Policies** en Supabase
2. Para cada tabla, puedes temporalmente deshabilitar RLS:
   - Click en la tabla
   - Ve a "RLS Policies"
   - Puedes crear una política que permita todo temporalmente:

```sql
-- Política temporal para desarrollo (PERMITE TODO)
CREATE POLICY "Enable all operations for all users"
ON nombre_tabla
FOR ALL
USING (true)
WITH CHECK (true);
```

### 3.2 O Deshabilitar RLS Completamente (Solo Desarrollo)

1. Ve a **Table Editor** en Supabase
2. Selecciona cada tabla
3. En "Settings", desactiva "Enable Row Level Security"

⚠️ **ADVERTENCIA:** Esto solo es seguro en desarrollo. En producción siempre usa RLS.

## 📊 Paso 4: Crear las Tablas Necesarias

La aplicación necesita estas tablas principales. Puedes crearlas manualmente o usar SQL:

### Tablas Principales:

1. **companies** - Empresas
2. **branches** - Sucursales
3. **departments** - Departamentos
4. **positions** - Posiciones/Cargos
5. **employees** - Empleados
6. **schedules** - Horarios
7. **employee_schedules** - Horarios de empleados
8. **timelogs** - Registros de tiempo
9. **payrolls** - Nóminas
10. **payroll_payments** - Pagos de nómina
11. **payroll_deductions** - Deducciones
12. **payroll_debts** - Débitos
13. **creditors** - Acreedores
14. **banks** - Bancos
15. **timeoffs** - Tiempos libres
16. **terminations** - Terminaciones

### Crear Tablas desde SQL Editor:

1. Ve a **SQL Editor** en Supabase
2. Puedes crear tablas básicas o importar un schema completo

## 🔄 Paso 5: Reiniciar el Servidor

Después de configurar el `.env`:

1. **Detén el servidor:** Presiona `Ctrl + C`
2. **Reinicia:**
   ```bash
   npm start
   ```

## ✅ Paso 6: Verificar la Conexión

1. Abre la aplicación en `http://localhost:4200`
2. Abre la **Consola del Navegador** (F12)
3. Ve a la pestaña **Network**
4. Intenta usar alguna funcionalidad que requiera datos
5. Deberías ver peticiones a `https://tu-proyecto.supabase.co/rest/v1/...`

Si ves errores 401 o 403, revisa:
- Que la API key sea correcta
- Que RLS esté configurado correctamente
- Que las tablas existan

## 🎯 Modo Desarrollo Sin Auth0

He modificado el interceptor HTTP para que funcione **sin Auth0** cuando las credenciales están vacías. Esto significa que:

- ✅ Puedes usar Supabase sin configurar Auth0
- ✅ Las peticiones usarán solo la API key de Supabase
- ✅ Funciona perfectamente para desarrollo y pruebas

## 📝 Ejemplo Completo de .env

```env
# Supabase (REQUERIDO para base de datos)
ENV_SUPABASE_URL=https://tu-proyecto.supabase.co
ENV_SUPABASE_API_KEY=tu-anon-public-key

# Auth0 (OPCIONAL - solo si quieres autenticación)
ENV_AUTH0_DOMAIN=
ENV_AUTH0_CLIENT_ID=
ENV_AUTH0_AUDIENCE=

# Application
ENV_APP_URL=http://localhost:4200
```

## 🆘 Solución de Problemas

### Error: "Invalid API key"
- Verifica que copiaste la clave completa
- Asegúrate de usar la clave "anon" o "public", no la "service_role"

### Error: 401 Unauthorized
- Verifica que RLS esté configurado correctamente
- O deshabilita RLS temporalmente para pruebas

### Error: "relation does not exist"
- Las tablas no existen en tu base de datos
- Crea las tablas necesarias primero

### No se conecta
- Verifica que `ENV_SUPABASE_URL` y `ENV_SUPABASE_API_KEY` estén en el `.env`
- Reinicia el servidor después de modificar `.env`
- Verifica que la URL no tenga espacios o caracteres extra

## 📚 Recursos Adicionales

- [Documentación de Supabase](https://supabase.com/docs)
- [Supabase REST API](https://supabase.com/docs/reference/javascript/introduction)
- [Row Level Security Guide](https://supabase.com/docs/guides/auth/row-level-security)

