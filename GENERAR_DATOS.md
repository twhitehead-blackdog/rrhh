# 📊 Generar Datos de Prueba para Peopletrak

## 🎯 Qué hace este script

El archivo `datos_prueba.sql` contiene datos de prueba completos para todas las tablas de la aplicación:

- ✅ **2 Empresas**
- ✅ **3 Sucursales** 
- ✅ **5 Departamentos**
- ✅ **10 Posiciones/Cargos**
- ✅ **3 Bancos**
- ✅ **3 Acreedores**
- ✅ **5 Horarios de trabajo**
- ✅ **10 Empleados** (con datos completos)
- ✅ **10 Asignaciones de horarios**
- ✅ **3 Nóminas**
- ✅ **4 Deducciones**
- ✅ **3 Pagos de nómina**
- ✅ **7 Registros de tiempo** (timelogs)
- ✅ **2 Tiempos libres**

## 🚀 Cómo Usar

### Opción 1: Desde Supabase Dashboard (Recomendado)

1. Ve a tu proyecto en [Supabase Dashboard](https://app.supabase.com/)
2. Click en **SQL Editor** en el menú lateral
3. Click en **New Query**
4. Abre el archivo `datos_prueba.sql`
5. Copia todo el contenido
6. Pégalo en el editor SQL
7. Click en **Run** o presiona `Ctrl + Enter`
8. Espera a que se ejecute (debería tomar unos segundos)

### Opción 2: Desde la Terminal (si tienes psql)

```bash
psql -h tu-proyecto.supabase.co -U postgres -d postgres -f datos_prueba.sql
```

## 📋 Datos Generados

### Empleados de Prueba

1. **Juan Carlos Pérez González** - Gerente General
2. **María Elena Rodríguez Martínez** - Gerente de RRHH
3. **Carlos Alberto García López** - Analista de RRHH
4. **Ana Sofía Martínez Sánchez** - Vendedora Senior
5. **Luis Fernando Hernández Torres** - Vendedor
6. **Laura Patricia Díaz Morales** - Desarrolladora Senior
7. **Roberto Antonio Vargas Jiménez** - Desarrollador
8. **Carmen Rosa Flores Castro** - Contadora
9. **Pedro José Ramírez Ortega** - Supervisor de Operaciones
10. **Sandra Lucía Mendoza Ruiz** - Operaria

### Horarios

- **Horario Oficina**: 09:00 - 18:00 (1 hora almuerzo)
- **Horario Mañana**: 07:00 - 16:00 (1 hora almuerzo)
- **Horario Tarde**: 14:00 - 22:00 (1 hora almuerzo)
- **Horario Completo**: 08:00 - 17:30 (1 hora almuerzo)
- **Día Libre**: Para días de descanso

### Nóminas

- Nómina Enero 2024 (2 pagos quincenales)
- Nómina Febrero 2024 (1 pago pendiente)
- Nómina Marzo 2024 (creada)

## ⚠️ Notas Importantes

1. **IDs Personalizados**: Los IDs están predefinidos (emp-001, branch-001, etc.) para facilitar las pruebas
2. **Fechas**: Las fechas están configuradas para 2024, ajusta según necesites
3. **Salarios**: Los salarios están en la moneda base (ajusta según tu país)
4. **Relaciones**: Todas las relaciones entre tablas están correctamente configuradas

## 🔄 Limpiar y Regenerar

Si quieres empezar de nuevo, descomenta las líneas al inicio del script:

```sql
TRUNCATE TABLE employees, companies, branches, ... CASCADE;
```

Esto eliminará todos los datos antes de insertar los nuevos.

## 🎨 Personalizar los Datos

Puedes modificar el archivo `datos_prueba.sql` para:
- Cambiar nombres de empleados
- Ajustar salarios
- Modificar horarios
- Agregar más registros
- Cambiar fechas

## ✅ Verificar que Funcionó

Después de ejecutar el script:

1. Ve a **Table Editor** en Supabase
2. Selecciona la tabla `employees`
3. Deberías ver 10 empleados
4. Repite para otras tablas para verificar

## 🆘 Si Hay Errores

### Error: "relation does not exist"
- Las tablas no existen aún
- Necesitas crear primero el esquema de la base de datos

### Error: "duplicate key value"
- Los datos ya existen
- Descomenta las líneas TRUNCATE al inicio del script

### Error: "foreign key constraint"
- Faltan datos en tablas relacionadas
- Ejecuta el script completo desde el principio

## 📝 Próximos Pasos

Después de generar los datos:

1. ✅ Verifica que los datos se insertaron correctamente
2. ✅ Configura Row Level Security (RLS) si es necesario
3. ✅ Prueba la aplicación con los datos de prueba
4. ✅ Personaliza los datos según tus necesidades

