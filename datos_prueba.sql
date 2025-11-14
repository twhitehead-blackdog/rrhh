-- ============================================
-- Peopletrak - Datos de Prueba
-- ============================================
-- Este script genera datos de prueba para todas las tablas
-- Ejecuta este script en el SQL Editor de Supabase
-- ============================================

-- Limpiar datos existentes (opcional, descomenta si quieres empezar limpio)
-- TRUNCATE TABLE employees, companies, branches, departments, positions, schedules, 
--   employee_schedules, timelogs, payrolls, payroll_payments, payroll_deductions, 
--   payroll_debts, creditors, banks, timeoffs, terminations CASCADE;

-- ============================================
-- 1. COMPANIES (Empresas)
-- ============================================
INSERT INTO companies (id, name, address, phone_number, is_active, created_at) VALUES
('comp-001', 'Tech Solutions S.A.', 'Av. Principal 123, Ciudad', '555-0101', true, NOW()),
('comp-002', 'Servicios Generales Ltda.', 'Calle Secundaria 456', '555-0102', true, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 2. BRANCHES (Sucursales)
-- ============================================
INSERT INTO branches (id, name, short_name, address, is_active, ip, created_at) VALUES
('branch-001', 'Sucursal Central', 'CENTRAL', 'Av. Principal 123', true, '192.168.1.100', NOW()),
('branch-002', 'Sucursal Norte', 'NORTE', 'Calle Norte 789', true, '192.168.1.101', NOW()),
('branch-003', 'Sucursal Sur', 'SUR', 'Av. Sur 321', true, '192.168.1.102', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 3. DEPARTMENTS (Departamentos)
-- ============================================
INSERT INTO departments (id, name, created_at) VALUES
('dept-001', 'Recursos Humanos', NOW()),
('dept-002', 'Ventas', NOW()),
('dept-003', 'Tecnología', NOW()),
('dept-004', 'Contabilidad', NOW()),
('dept-005', 'Operaciones', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 4. POSITIONS (Posiciones/Cargos)
-- ============================================
INSERT INTO positions (id, name, department_id, schedule_admin, admin, schedule_approver, created_at) VALUES
('pos-001', 'Gerente General', 'dept-001', true, true, true, NOW()),
('pos-002', 'Gerente de Recursos Humanos', 'dept-001', true, true, true, NOW()),
('pos-003', 'Analista de RRHH', 'dept-001', false, false, false, NOW()),
('pos-004', 'Vendedor Senior', 'dept-002', false, false, false, NOW()),
('pos-005', 'Vendedor', 'dept-002', false, false, false, NOW()),
('pos-006', 'Desarrollador Senior', 'dept-003', false, false, false, NOW()),
('pos-007', 'Desarrollador', 'dept-003', false, false, false, NOW()),
('pos-008', 'Contador', 'dept-004', false, false, false, NOW()),
('pos-009', 'Supervisor de Operaciones', 'dept-005', true, false, true, NOW()),
('pos-010', 'Operario', 'dept-005', false, false, false, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 5. BANKS (Bancos)
-- ============================================
INSERT INTO banks (id, name, created_at) VALUES
('bank-001', 'Banco Nacional', NOW()),
('bank-002', 'Banco Popular', NOW()),
('bank-003', 'Banco Comercial', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 6. CREDITORS (Acreedores)
-- ============================================
INSERT INTO creditors (id, name, created_at) VALUES
('cred-001', 'Cooperativa de Empleados', NOW()),
('cred-002', 'Fondo de Ahorro', NOW()),
('cred-003', 'Préstamo Personal', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 7. SCHEDULES (Horarios)
-- ============================================
INSERT INTO schedules (id, name, entry_time, lunch_start_time, lunch_end_time, exit_time, day_off, minutes_tolerance, min_lunch_minutes, max_lunch_minutes, color, created_at) VALUES
('sched-001', 'Horario Oficina', '09:00:00', '13:00:00', '14:00:00', '18:00:00', false, 15, 60, 90, '#3B82F6', NOW()),
('sched-002', 'Horario Mañana', '07:00:00', '12:00:00', '13:00:00', '16:00:00', false, 10, 60, 90, '#10B981', NOW()),
('sched-003', 'Horario Tarde', '14:00:00', '18:00:00', '19:00:00', '22:00:00', false, 15, 60, 90, '#F59E0B', NOW()),
('sched-004', 'Día Libre', NULL, NULL, NULL, NULL, true, 0, NULL, NULL, '#EF4444', NOW()),
('sched-005', 'Horario Completo', '08:00:00', '12:30:00', '13:30:00', '17:30:00', false, 20, 60, 90, '#8B5CF6', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 8. EMPLOYEES (Empleados)
-- ============================================
INSERT INTO employees (
  id, document_id, first_name, middle_name, father_name, mother_name, 
  birth_date, gender, start_date, monthly_salary, branch_id, department_id, 
  position_id, email, work_email, phone_number, address, is_active, 
  uniform_size, bank, account_number, bank_account_type, created_at
) VALUES
('emp-001', '12345678', 'Juan', 'Carlos', 'Pérez', 'González', '1990-05-15', 'M', '2020-01-15', 5000.00, 'branch-001', 'dept-001', 'pos-001', 'juan.perez@email.com', 'jperez@techsolutions.com', '555-1001', 'Calle Principal 100', true, 'L', 'Banco Nacional', '1234567890', 'Ahorros', NOW()),
('emp-002', '23456789', 'María', 'Elena', 'Rodríguez', 'Martínez', '1988-08-22', 'F', '2020-03-01', 4500.00, 'branch-001', 'dept-001', 'pos-002', 'maria.rodriguez@email.com', 'mrodriguez@techsolutions.com', '555-1002', 'Av. Central 200', true, 'M', 'Banco Popular', '2345678901', 'Corriente', NOW()),
('emp-003', '34567890', 'Carlos', 'Alberto', 'García', 'López', '1992-11-10', 'M', '2021-06-01', 3500.00, 'branch-001', 'dept-001', 'pos-003', 'carlos.garcia@email.com', 'cgarcia@techsolutions.com', '555-1003', 'Calle Norte 300', true, 'XL', 'Banco Comercial', '3456789012', 'Ahorros', NOW()),
('emp-004', '45678901', 'Ana', 'Sofía', 'Martínez', 'Sánchez', '1995-02-28', 'F', '2021-08-15', 3200.00, 'branch-002', 'dept-002', 'pos-004', 'ana.martinez@email.com', 'amartinez@techsolutions.com', '555-1004', 'Av. Sur 400', true, 'S', 'Banco Nacional', '4567890123', 'Ahorros', NOW()),
('emp-005', '56789012', 'Luis', 'Fernando', 'Hernández', 'Torres', '1993-07-05', 'M', '2021-09-01', 2800.00, 'branch-002', 'dept-002', 'pos-005', 'luis.hernandez@email.com', 'lhernandez@techsolutions.com', '555-1005', 'Calle Este 500', true, 'M', 'Banco Popular', '5678901234', 'Corriente', NOW()),
('emp-006', '67890123', 'Laura', 'Patricia', 'Díaz', 'Morales', '1991-04-18', 'F', '2020-11-01', 4200.00, 'branch-001', 'dept-003', 'pos-006', 'laura.diaz@email.com', 'ldiaz@techsolutions.com', '555-1006', 'Av. Oeste 600', true, 'M', 'Banco Comercial', '6789012345', 'Ahorros', NOW()),
('emp-007', '78901234', 'Roberto', 'Antonio', 'Vargas', 'Jiménez', '1994-09-30', 'M', '2022-01-10', 3000.00, 'branch-001', 'dept-003', 'pos-007', 'roberto.vargas@email.com', 'rvargas@techsolutions.com', '555-1007', 'Calle Sur 700', true, 'L', 'Banco Nacional', '7890123456', 'Ahorros', NOW()),
('emp-008', '89012345', 'Carmen', 'Rosa', 'Flores', 'Castro', '1989-12-25', 'F', '2020-05-01', 3800.00, 'branch-001', 'dept-004', 'pos-008', 'carmen.flores@email.com', 'cflores@techsolutions.com', '555-1008', 'Av. Norte 800', true, 'S', 'Banco Popular', '8901234567', 'Corriente', NOW()),
('emp-009', '90123456', 'Pedro', 'José', 'Ramírez', 'Ortega', '1996-03-12', 'M', '2022-03-15', 2500.00, 'branch-003', 'dept-005', 'pos-009', 'pedro.ramirez@email.com', 'pramirez@techsolutions.com', '555-1009', 'Calle Centro 900', true, 'XL', 'Banco Comercial', '9012345678', 'Ahorros', NOW()),
('emp-010', '01234567', 'Sandra', 'Lucía', 'Mendoza', 'Ruiz', '1997-06-20', 'F', '2022-05-01', 2200.00, 'branch-003', 'dept-005', 'pos-010', 'sandra.mendoza@email.com', 'smendoza@techsolutions.com', '555-1010', 'Av. Principal 1000', true, 'M', 'Banco Nacional', '0123456789', 'Ahorros', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 9. EMPLOYEE_SCHEDULES (Horarios de Empleados)
-- ============================================
INSERT INTO employee_schedules (id, employee_id, branch_id, schedule_id, start_date, end_date, approved, created_at) VALUES
('es-001', 'emp-001', 'branch-001', 'sched-001', '2024-01-01', '2024-12-31', true, NOW()),
('es-002', 'emp-002', 'branch-001', 'sched-001', '2024-01-01', '2024-12-31', true, NOW()),
('es-003', 'emp-003', 'branch-001', 'sched-001', '2024-01-01', '2024-12-31', true, NOW()),
('es-004', 'emp-004', 'branch-002', 'sched-002', '2024-01-01', '2024-12-31', true, NOW()),
('es-005', 'emp-005', 'branch-002', 'sched-002', '2024-01-01', '2024-12-31', true, NOW()),
('es-006', 'emp-006', 'branch-001', 'sched-001', '2024-01-01', '2024-12-31', true, NOW()),
('es-007', 'emp-007', 'branch-001', 'sched-001', '2024-01-01', '2024-12-31', true, NOW()),
('es-008', 'emp-008', 'branch-001', 'sched-001', '2024-01-01', '2024-12-31', true, NOW()),
('es-009', 'emp-009', 'branch-003', 'sched-003', '2024-01-01', '2024-12-31', true, NOW()),
('es-010', 'emp-010', 'branch-003', 'sched-003', '2024-01-01', '2024-12-31', true, NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 10. PAYROLLS (Nóminas)
-- ============================================
INSERT INTO payrolls (id, name, company_id, created_at) VALUES
('payroll-001', 'Nómina Enero 2024', 'comp-001', NOW()),
('payroll-002', 'Nómina Febrero 2024', 'comp-001', NOW()),
('payroll-003', 'Nómina Marzo 2024', 'comp-001', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 11. PAYROLL_DEDUCTIONS (Deducciones)
-- ============================================
INSERT INTO payroll_deductions (id, payroll_id, name, value, min_salary, income_tax, calculation_type, created_at) VALUES
('ded-001', 'payroll-001', 'Seguro Social', 0.10, 0, false, 'percentage', NOW()),
('ded-002', 'payroll-001', 'Seguro de Salud', 0.05, 0, false, 'percentage', NOW()),
('ded-003', 'payroll-001', 'Impuesto sobre la Renta', 0.15, 3000, true, 'percentage', NOW()),
('ded-004', 'payroll-001', 'Cuota Fija', 50.00, 0, false, 'fixed', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 12. PAYROLL_PAYMENTS (Pagos de Nómina)
-- ============================================
INSERT INTO payroll_payments (id, title, payroll_id, start_date, end_date, status, created_at) VALUES
('pay-001', 'Pago Quincenal 1 - Enero', 'payroll-001', '2024-01-01', '2024-01-15', 'PAID', NOW()),
('pay-002', 'Pago Quincenal 2 - Enero', 'payroll-001', '2024-01-16', '2024-01-31', 'PAID', NOW()),
('pay-003', 'Pago Quincenal 1 - Febrero', 'payroll-002', '2024-02-01', '2024-02-15', 'PENDING', NOW())
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 13. TIMELOGS (Registros de Tiempo) - Últimos 30 días
-- ============================================
-- Generar registros de ejemplo para los últimos días
INSERT INTO timelogs (id, employee_id, company_id, branch_id, type, ip, created_at) VALUES
-- Entradas de hoy
('log-001', 'emp-001', 'comp-001', 'branch-001', 'entry', '192.168.1.100', NOW() - INTERVAL '0 days' + INTERVAL '8 hours'),
('log-002', 'emp-002', 'comp-001', 'branch-001', 'entry', '192.168.1.100', NOW() - INTERVAL '0 days' + INTERVAL '8 hours 5 minutes'),
('log-003', 'emp-003', 'comp-001', 'branch-001', 'entry', '192.168.1.100', NOW() - INTERVAL '0 days' + INTERVAL '8 hours 10 minutes'),
-- Almuerzos de ayer
('log-004', 'emp-001', 'comp-001', 'branch-001', 'lunch_start', '192.168.1.100', NOW() - INTERVAL '1 days' + INTERVAL '13 hours'),
('log-005', 'emp-001', 'comp-001', 'branch-001', 'lunch_end', '192.168.1.100', NOW() - INTERVAL '1 days' + INTERVAL '14 hours'),
-- Salidas de ayer
('log-006', 'emp-001', 'comp-001', 'branch-001', 'exit', '192.168.1.100', NOW() - INTERVAL '1 days' + INTERVAL '18 hours'),
('log-007', 'emp-002', 'comp-001', 'branch-001', 'exit', '192.168.1.100', NOW() - INTERVAL '1 days' + INTERVAL '18 hours 10 minutes')
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- 14. TIMEOFFS (Tiempos Libres)
-- ============================================
-- Primero necesitas crear los tipos de tiempo libre
-- (Asumiendo que existe una tabla timeoff_types)
INSERT INTO timeoffs (id, type_id, employee_id, date_from, date_to, is_approved, notes) VALUES
('toff-001', 'type-001', 'emp-003', '2024-01-15', '2024-01-17', true, ARRAY['Vacaciones aprobadas']),
('toff-002', 'type-002', 'emp-005', '2024-02-10', '2024-02-10', true, ARRAY['Día médico'])
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- RESUMEN
-- ============================================
-- Datos generados:
-- - 2 Empresas
-- - 3 Sucursales
-- - 5 Departamentos
-- - 10 Posiciones
-- - 3 Bancos
-- - 3 Acreedores
-- - 5 Horarios
-- - 10 Empleados
-- - 10 Horarios de empleados
-- - 3 Nóminas
-- - 4 Deducciones
-- - 3 Pagos de nómina
-- - 7 Registros de tiempo
-- - 2 Tiempos libres

SELECT 'Datos de prueba generados exitosamente!' as mensaje;

