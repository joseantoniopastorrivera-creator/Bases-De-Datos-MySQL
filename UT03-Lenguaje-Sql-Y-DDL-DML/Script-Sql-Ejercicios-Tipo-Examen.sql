-- ============================================================
-- SCRIPT SQL COMPLETO - EJEMPLOS Y EJERCICIOS TIPO EXAMEN
-- ============================================================
-- 
-- CÓMO USARLO ONLINE (sin instalar nada):
--    Opción 1: https://sqliteonline.com  -> Seleccionar "MySQL" -> Pegar
--    Opción 2: https://www.db-fiddle.com -> Seleccionar "MySQL 8.0"
--    Opción 3: https://onecompiler.com/mysql
--
-- IMPORTANTE: Ejecuta primero la PARTE 1 (creación de tablas)
-- y luego ve ejecutando los ejemplos y ejercicios uno por uno.
-- ============================================================


-- ============================================================
-- PARTE 1: CREACIÓN DE TABLAS E INSERCIÓN DE DATOS
-- ============================================================

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS departamentos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE departamentos (
    id_dep INT PRIMARY KEY,
    nombre_dep VARCHAR(30),
    ubicacion VARCHAR(30),
    presupuesto DECIMAL(12,2)
);

INSERT INTO departamentos VALUES
(1, 'Ventas', 'Madrid', 50000.00),
(2, 'IT', 'Barcelona', 80000.00),
(3, 'Marketing', 'Madrid', 35000.00),
(4, 'RRHH', 'Sevilla', 25000.00),
(5, 'Logística', 'Valencia', 45000.00),
(6, 'I+D', 'Bilbao', 90000.00);

CREATE TABLE empleados (
    id_emp INT PRIMARY KEY,
    nombre VARCHAR(50),
    departamento VARCHAR(30),
    id_dep INT,
    salario DECIMAL(10,2),
    fecha_ingreso DATE,
    ciudad VARCHAR(30),
    email VARCHAR(60),
    id_jefe INT,
    FOREIGN KEY (id_dep) REFERENCES departamentos(id_dep)
);

INSERT INTO empleados VALUES
(1, 'Ana García', 'Ventas', 1, 2500.00, '2021-03-15', 'Madrid', 'ana@empresa.com', 5),
(2, 'Luis López', 'IT', 2, 3200.00, '2020-07-22', 'Barcelona', 'luis@empresa.com', 5),
(3, 'María Casal', 'Marketing', 3, 2800.00, '2022-01-10', 'Madrid', 'maria@empresa.com', 5),
(4, 'Pedro Ruiz', 'IT', 2, 3100.00, '2019-11-05', 'Sevilla', 'pedro@empresa.com', 2),
(5, 'Elena Sanz', 'Ventas', 1, 2400.00, '2023-05-20', 'Valencia', NULL, NULL),
(6, 'José Ferrer', 'RRHH', 4, 2900.00, '2018-09-12', 'Madrid', 'jose@empresa.com', 5),
(7, 'Lucía Gil', 'IT', 2, 3500.00, '2021-12-01', 'Barcelona', 'lucia@empresa.com', 2),
(8, 'Carlos Mora', 'Ventas', 1, 2600.00, '2022-06-15', 'Madrid', 'carlos@empresa.com', 1),
(9, 'Sara Blanco', 'Marketing', 3, 3000.00, '2020-03-01', 'Barcelona', NULL, 3),
(10, 'Miguel Torres', NULL, NULL, 2200.00, '2024-01-15', 'Sevilla', 'miguel@empresa.com', NULL);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(30),
    email VARCHAR(60),
    fecha_registro DATE
);

INSERT INTO clientes VALUES
(1, 'Empresa Alpha', 'Madrid', 'contacto@alpha.com', '2020-01-15'),
(2, 'Beta Solutions', 'Barcelona', 'info@beta.com', '2021-03-22'),
(3, 'Gamma Corp', 'Valencia', 'ventas@gamma.com', '2019-07-10'),
(4, 'Delta SA', 'Sevilla', NULL, '2022-11-05'),
(5, 'Epsilon Ltd', 'Madrid', 'hello@epsilon.com', '2023-02-28'),
(6, 'Zeta Group', 'Bilbao', 'contact@zeta.com', '2020-09-14'),
(7, 'Eta Services', 'Madrid', NULL, '2024-01-10');

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(30),
    precio DECIMAL(10,2),
    stock INT
);

INSERT INTO productos VALUES
(1, 'Portátil Pro', 'Electrónica', 1200.00, 50),
(2, 'Monitor 27"', 'Electrónica', 350.00, 80),
(3, 'Teclado mecánico', 'Periféricos', 85.00, 200),
(4, 'Ratón inalámbrico', 'Periféricos', 45.00, 300),
(5, 'Silla ergonómica', 'Mobiliario', 420.00, 30),
(6, 'Mesa escritorio', 'Mobiliario', 280.00, 25),
(7, 'Webcam HD', 'Periféricos', 65.00, 150),
(8, 'Disco SSD 1TB', 'Almacenamiento', 95.00, 120);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    total DECIMAL(10,2),
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO pedidos VALUES
(1, 1, 1, 2, 2400.00, '2024-01-15'),
(2, 1, 3, 5, 425.00, '2024-01-20'),
(3, 2, 2, 3, 1050.00, '2024-02-10'),
(4, 3, 5, 1, 420.00, '2024-02-15'),
(5, 3, 4, 10, 450.00, '2024-03-01'),
(6, 1, 7, 2, 130.00, '2024-03-10'),
(7, 5, 1, 1, 1200.00, '2024-03-15'),
(8, 2, 6, 2, 560.00, '2024-04-01'),
(9, 6, 8, 5, 475.00, '2024-04-10'),
(10, 3, 3, 3, 255.00, '2024-05-01'),
(11, 5, 2, 1, 350.00, '2024-05-15'),
(12, 1, 4, 8, 360.00, '2024-06-01');


-- ============================================================
-- PARTE 2: EJEMPLOS RESUELTOS POR TIPO DE CONSULTA
-- (Solo funciones y palabras del temario)
-- ============================================================

-- ── A) SELECT BÁSICA ──

SELECT * FROM empleados;
SELECT nombre AS empleado, salario AS sueldo FROM empleados;
SELECT DISTINCT ciudad FROM empleados;
SELECT DISTINCT departamento FROM empleados;
SELECT nombre, salario, salario * 12 AS salario_anual FROM empleados;

-- ── B) FUNCIONES LÓGICAS: IFNULL, IF ──

SELECT IFNULL(NULL, 'valor nulo') AS valor;
SELECT nombre, IFNULL(email, 'Sin email') AS contacto FROM empleados;
SELECT IF(5 > 5, 'verdadero', 'falso') AS condicion;
SELECT nombre, salario, IF(salario > 3000, 'Alto', 'Normal') AS nivel FROM empleados;

-- ── C) FUNCIONES NUMÉRICAS: COUNT, ROUND, SUM, MIN, MAX, AVG ──

SELECT COUNT(*) AS total_empleados FROM empleados;
SELECT COUNT(DISTINCT departamento) AS dep_diferentes FROM empleados;
SELECT ROUND(1234.499, 2) AS redondeado;
SELECT SUM(salario) AS total_salarios FROM empleados;
SELECT MIN(salario) AS minimo, MAX(salario) AS maximo FROM empleados;
SELECT AVG(salario) AS salario_medio FROM empleados;

-- ── D) FUNCIONES TEXTO: CONCAT, UPPER, LOWER, LTRIM, RTRIM ──

SELECT CONCAT(nombre, ' - ', departamento) AS nombre_dep FROM empleados WHERE departamento IS NOT NULL;
SELECT UPPER(nombre) AS mayusculas FROM empleados;
SELECT LOWER(nombre) AS minusculas FROM empleados;
SELECT LTRIM('   hola') AS sin_espacios_izq;
SELECT RTRIM('hola   ') AS sin_espacios_der;

-- ── E) FUNCIONES FECHA: NOW, CURDATE, DATEDIFF, TIMEDIFF, YEAR, MONTH, DATE_FORMAT ──

SELECT CURRENT_TIMESTAMP(), NOW();
SELECT CURDATE();
SELECT DATEDIFF('2026-01-25', '2026-01-15') AS dias;
SELECT TIMEDIFF('13:10:11', '14:10:10') AS diferencia;
SELECT nombre, MONTH(fecha_ingreso) AS mes, YEAR(fecha_ingreso) AS anio FROM empleados;
SELECT DATE_FORMAT(NOW(), '%e/%m/%Y %H:%i:%s') AS instante;
SELECT nombre, DATEDIFF(CURDATE(), fecha_ingreso) AS dias_en_empresa FROM empleados;

-- ── F) FILTROS: WHERE, IN, BETWEEN, LIKE, IS NULL, LIMIT ──

SELECT * FROM empleados WHERE salario > 3000;
SELECT * FROM empleados WHERE departamento = 'IT' AND salario > 3000;
SELECT * FROM empleados WHERE ciudad = 'Madrid' OR ciudad = 'Barcelona';
SELECT * FROM empleados WHERE NOT departamento = 'IT';
SELECT * FROM empleados WHERE ciudad IN ('Madrid', 'Barcelona', 'Valencia');
SELECT * FROM empleados WHERE salario BETWEEN 2500 AND 3200;
SELECT * FROM empleados WHERE fecha_ingreso BETWEEN '2020-01-01' AND '2022-12-31';
SELECT * FROM empleados WHERE email IS NULL;
SELECT * FROM empleados WHERE departamento IS NOT NULL;
SELECT * FROM empleados WHERE nombre LIKE 'A%';
SELECT * FROM empleados WHERE nombre LIKE '%a';
SELECT * FROM empleados WHERE nombre LIKE '%ar%';
SELECT * FROM empleados WHERE nombre LIKE '_u%';
SELECT * FROM empleados ORDER BY salario DESC LIMIT 3;

-- ── G) ORDER BY ──

SELECT * FROM empleados ORDER BY salario DESC;
SELECT * FROM empleados ORDER BY departamento ASC, salario DESC;
SELECT nombre, departamento, salario FROM empleados ORDER BY 3 DESC;

-- ── H) GROUP BY + HAVING ──

SELECT departamento, AVG(salario) AS media FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento;
SELECT ciudad, COUNT(*) AS total FROM empleados GROUP BY ciudad ORDER BY total DESC;
SELECT departamento, COUNT(*) AS total FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento HAVING total > 2;
SELECT departamento, ROUND(AVG(salario), 2) AS media FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento HAVING media > 2800;

-- ── I) SUBCONSULTAS ──

SELECT nombre, salario FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados);
SELECT nombre FROM empleados WHERE id_dep IN (SELECT id_dep FROM departamentos WHERE presupuesto > 40000);
SELECT nombre FROM clientes c WHERE EXISTS (SELECT 1 FROM pedidos p WHERE p.id_cliente = c.id_cliente);
SELECT nombre FROM clientes c WHERE NOT EXISTS (SELECT 1 FROM pedidos p WHERE p.id_cliente = c.id_cliente);
SELECT nombre, salario FROM empleados WHERE salario > ALL (SELECT salario FROM empleados WHERE departamento = 'Ventas');
SELECT nombre, salario FROM empleados WHERE salario > ANY (SELECT salario FROM empleados WHERE departamento = 'IT');

-- ── J) JOINs ──

SELECT e.nombre, e.salario, d.nombre_dep FROM empleados e INNER JOIN departamentos d ON e.id_dep = d.id_dep;
SELECT e.nombre, d.nombre_dep FROM empleados e LEFT JOIN departamentos d ON e.id_dep = d.id_dep;
SELECT e.nombre, d.nombre_dep FROM empleados e RIGHT JOIN departamentos d ON e.id_dep = d.id_dep;
SELECT e.nombre, d.nombre_dep FROM empleados e LEFT JOIN departamentos d ON e.id_dep = d.id_dep UNION SELECT e.nombre, d.nombre_dep FROM empleados e RIGHT JOIN departamentos d ON e.id_dep = d.id_dep;
SELECT d1.nombre_dep AS dep1, d2.nombre_dep AS dep2 FROM departamentos d1 CROSS JOIN departamentos d2 WHERE d1.id_dep < d2.id_dep;
SELECT e.nombre AS empleado, IFNULL(j.nombre, 'Sin jefe') AS jefe FROM empleados e LEFT JOIN empleados j ON e.id_jefe = j.id_emp;
SELECT c.nombre AS cliente, pr.nombre AS producto, p.cantidad, p.total FROM pedidos p INNER JOIN clientes c ON p.id_cliente = c.id_cliente INNER JOIN productos pr ON p.id_producto = pr.id_producto;

-- ── K) UNION, INTERSECT, EXCEPT ──

SELECT ciudad FROM empleados WHERE ciudad IS NOT NULL UNION SELECT ciudad FROM clientes;
SELECT ciudad FROM empleados WHERE ciudad IS NOT NULL INTERSECT SELECT ciudad FROM clientes;
SELECT ciudad FROM empleados WHERE ciudad IS NOT NULL EXCEPT SELECT ciudad FROM clientes;

-- ── L) TABLAS DERIVADAS ──

SELECT td.nombre_cliente, td.gasto_total FROM (SELECT c.nombre AS nombre_cliente, SUM(p.total) AS gasto_total FROM clientes c JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre) AS td WHERE td.gasto_total > 500 ORDER BY td.gasto_total DESC;

-- ── M) VISTAS ──

CREATE VIEW vista_nominas AS SELECT e.nombre, d.nombre_dep AS departamento, e.salario, e.salario * 12 AS salario_anual FROM empleados e LEFT JOIN departamentos d ON e.id_dep = d.id_dep;
SELECT * FROM vista_nominas;
SELECT * FROM vista_nominas WHERE salario_anual > 30000 ORDER BY salario_anual DESC;
SHOW FULL TABLES WHERE Table_type = 'VIEW';
SHOW CREATE VIEW vista_nominas;
DESCRIBE vista_nominas;
-- DROP VIEW vista_nominas;


-- ============================================================
-- PARTE 3: EJERCICIOS TIPO EXAMEN (52 ejercicios)
-- Intenta resolverlos antes de mirar las soluciones al final.
-- ============================================================

-- BLOQUE 1: SELECT BÁSICA Y FUNCIONES (8 ejercicios)
-- EJ1: Nombre y salario redondeado a 1 decimal.
-- EJ2: Departamentos distintos (sin repetir, sin nulos).
-- EJ3: Nombre en mayúsculas y email (si es NULL mostrar 'No disponible').
-- EJ4: Nombre, salario y bonus (15% del salario, redondeado a 2 decimales).
-- EJ5: Nombre y días que lleva en la empresa (DATEDIFF + CURDATE).
-- EJ6: Nombre, mes y año de ingreso (MONTH, YEAR).
-- EJ7: Nombre y nivel: 'Alto' si salario > 3000, 'Normal' si no (IF).
-- EJ8: Nombre y departamento concatenados con ' - '. Si departamento NULL mostrar 'Sin asignar' (CONCAT + IFNULL).

-- BLOQUE 2: FILTROS Y ORDENACIÓN (10 ejercicios)
-- EJ9:  Empleados de Madrid o Barcelona con salario > 2500.
-- EJ10: Empleados cuyo nombre empieza por 'L' o 'M'.
-- EJ11: Salario entre 2500 y 3200 que NO sean de IT.
-- EJ12: Empleados que ingresaron en 2021 (YEAR).
-- EJ13: Productos con precio entre 50 y 300, ordenados por precio DESC.
-- EJ14: Los 5 empleados mejor pagados.
-- EJ15: Empleados sin email.
-- EJ16: Clientes registrados después del 2021-01-01, ordenados por fecha.
-- EJ17: Empleados cuyo nombre contiene 'ar'.
-- EJ18: Pedidos > 500 euros en 2024, por total DESC.

-- BLOQUE 3: GROUP BY + HAVING (10 ejercicios)
-- EJ19: Nº empleados por departamento.
-- EJ20: Salario medio, mínimo y máximo por departamento.
-- EJ21: Departamentos con más de 2 empleados.
-- EJ22: Gasto total por cliente.
-- EJ23: Nº pedidos por mes en 2024.
-- EJ24: Categorías con precio medio > 100.
-- EJ25: Ciudad con más empleados.
-- EJ26: Cliente que más ha gastado.
-- EJ27: Producto más vendido (por cantidad).
-- EJ28: Departamentos con salario total > 5000.

-- BLOQUE 4: SUBCONSULTAS (8 ejercicios)
-- EJ29: Empleados que ganan más que la media.
-- EJ30: Departamentos con al menos un empleado (IN + subconsulta).
-- EJ31: Clientes con al menos un pedido (EXISTS).
-- EJ32: Clientes sin pedidos (NOT EXISTS).
-- EJ33: Productos nunca pedidos.
-- EJ34: Empleados que ganan más que TODOS los de Marketing (ALL).
-- EJ35: Empleados que ganan más que ALGUNO de IT (ANY).
-- EJ36: Segundo salario más alto (subconsulta, sin LIMIT).

-- BLOQUE 5: JOINs (10 ejercicios)
-- EJ37: Empleado con su departamento (INNER JOIN).
-- EJ38: Todos los empleados con departamento, NULL si no tienen (LEFT JOIN).
-- EJ39: Todos los departamentos con empleados, NULL si están vacíos (RIGHT JOIN).
-- EJ40: Cliente, producto, cantidad y total por pedido (3 tablas).
-- EJ41: Empleado y nombre de su jefe (Self JOIN).
-- EJ42: Departamentos sin empleados (JOIN + IS NULL).
-- EJ43: Empleados sin departamento.
-- EJ44: Total gastado por cliente incluyendo los que no compraron (0).
-- EJ45: Nombre departamento, nº empleados y presupuesto.
-- EJ46: Productos pedidos por clientes de Madrid.

-- BLOQUE 6: TABLAS DERIVADAS Y VISTAS (6 ejercicios)
-- EJ47: Departamentos con salario medio superior a la media global (tabla derivada).
-- EJ48: Vista 'vista_clientes_gastos': nombre cliente y gasto total.
-- EJ49: Vista 'vista_productos_vendidos': producto, cantidad total, total recaudado.
-- EJ50: Consultar vista EJ49: 3 productos más vendidos por cantidad.
-- EJ51: Empleados con salario superior a la media de su departamento (tabla derivada).
-- EJ52: Vista 'vista_resumen_departamento': nombre, nº empleados, salario medio, total y presupuesto.


-- ============================================================
-- PARTE 4: SOLUCIONES
-- ============================================================

-- EJ1
SELECT nombre, ROUND(salario, 1) AS salario FROM empleados;
-- EJ2
SELECT DISTINCT departamento FROM empleados WHERE departamento IS NOT NULL;
-- EJ3
SELECT UPPER(nombre) AS nombre_mayus, IFNULL(email, 'No disponible') AS contacto FROM empleados;
-- EJ4
SELECT nombre, salario, ROUND(salario * 0.15, 2) AS bonus FROM empleados;
-- EJ5
SELECT nombre, DATEDIFF(CURDATE(), fecha_ingreso) AS dias_en_empresa FROM empleados;
-- EJ6
SELECT nombre, MONTH(fecha_ingreso) AS mes, YEAR(fecha_ingreso) AS anio FROM empleados;
-- EJ7
SELECT nombre, salario, IF(salario > 3000, 'Alto', 'Normal') AS nivel FROM empleados;
-- EJ8
SELECT CONCAT(nombre, ' - ', IFNULL(departamento, 'Sin asignar')) AS info FROM empleados;
-- EJ9
SELECT * FROM empleados WHERE ciudad IN ('Madrid', 'Barcelona') AND salario > 2500;
-- EJ10
SELECT * FROM empleados WHERE nombre LIKE 'L%' OR nombre LIKE 'M%';
-- EJ11
SELECT * FROM empleados WHERE salario BETWEEN 2500 AND 3200 AND departamento != 'IT';
-- EJ12
SELECT * FROM empleados WHERE YEAR(fecha_ingreso) = 2021;
-- EJ13
SELECT * FROM productos WHERE precio BETWEEN 50 AND 300 ORDER BY precio DESC;
-- EJ14
SELECT * FROM empleados ORDER BY salario DESC LIMIT 5;
-- EJ15
SELECT * FROM empleados WHERE email IS NULL;
-- EJ16
SELECT * FROM clientes WHERE fecha_registro > '2021-01-01' ORDER BY fecha_registro;
-- EJ17
SELECT * FROM empleados WHERE nombre LIKE '%ar%';
-- EJ18
SELECT * FROM pedidos WHERE total > 500 AND YEAR(fecha_pedido) = 2024 ORDER BY total DESC;
-- EJ19
SELECT departamento, COUNT(*) AS total FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento;
-- EJ20
SELECT departamento, ROUND(AVG(salario), 2) AS media, MIN(salario) AS minimo, MAX(salario) AS maximo FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento;
-- EJ21
SELECT departamento, COUNT(*) AS total FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento HAVING total > 2;
-- EJ22
SELECT c.nombre, SUM(p.total) AS gasto_total FROM clientes c JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre ORDER BY gasto_total DESC;
-- EJ23
SELECT MONTH(fecha_pedido) AS mes, COUNT(*) AS num_pedidos FROM pedidos WHERE YEAR(fecha_pedido) = 2024 GROUP BY MONTH(fecha_pedido) ORDER BY mes;
-- EJ24
SELECT categoria, ROUND(AVG(precio), 2) AS precio_medio FROM productos GROUP BY categoria HAVING precio_medio > 100;
-- EJ25
SELECT ciudad, COUNT(*) AS total FROM empleados GROUP BY ciudad ORDER BY total DESC LIMIT 1;
-- EJ26
SELECT c.nombre, SUM(p.total) AS gasto_total FROM clientes c JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre ORDER BY gasto_total DESC LIMIT 1;
-- EJ27
SELECT pr.nombre, SUM(p.cantidad) AS total_vendido FROM productos pr JOIN pedidos p ON pr.id_producto = p.id_producto GROUP BY pr.nombre ORDER BY total_vendido DESC LIMIT 1;
-- EJ28
SELECT departamento, SUM(salario) AS salario_total FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento HAVING salario_total > 5000;
-- EJ29
SELECT nombre, salario FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados);
-- EJ30
SELECT nombre_dep FROM departamentos WHERE id_dep IN (SELECT DISTINCT id_dep FROM empleados WHERE id_dep IS NOT NULL);
-- EJ31
SELECT nombre FROM clientes c WHERE EXISTS (SELECT 1 FROM pedidos p WHERE p.id_cliente = c.id_cliente);
-- EJ32
SELECT nombre FROM clientes c WHERE NOT EXISTS (SELECT 1 FROM pedidos p WHERE p.id_cliente = c.id_cliente);
-- EJ33
SELECT nombre FROM productos WHERE id_producto NOT IN (SELECT DISTINCT id_producto FROM pedidos);
-- EJ34
SELECT nombre, salario FROM empleados WHERE salario > ALL (SELECT salario FROM empleados WHERE departamento = 'Marketing');
-- EJ35
SELECT nombre, salario FROM empleados WHERE salario > ANY (SELECT salario FROM empleados WHERE departamento = 'IT');
-- EJ36
SELECT nombre, salario FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados WHERE salario < (SELECT MAX(salario) FROM empleados));
-- EJ37
SELECT e.nombre, d.nombre_dep FROM empleados e INNER JOIN departamentos d ON e.id_dep = d.id_dep;
-- EJ38
SELECT e.nombre, d.nombre_dep FROM empleados e LEFT JOIN departamentos d ON e.id_dep = d.id_dep;
-- EJ39
SELECT d.nombre_dep, e.nombre AS empleado FROM empleados e RIGHT JOIN departamentos d ON e.id_dep = d.id_dep;
-- EJ40
SELECT c.nombre AS cliente, pr.nombre AS producto, p.cantidad, p.total FROM pedidos p JOIN clientes c ON p.id_cliente = c.id_cliente JOIN productos pr ON p.id_producto = pr.id_producto;
-- EJ41
SELECT e.nombre AS empleado, IFNULL(j.nombre, 'Sin jefe') AS jefe FROM empleados e LEFT JOIN empleados j ON e.id_jefe = j.id_emp;
-- EJ42
SELECT d.nombre_dep FROM departamentos d LEFT JOIN empleados e ON d.id_dep = e.id_dep WHERE e.id_emp IS NULL;
-- EJ43
SELECT nombre FROM empleados WHERE id_dep IS NULL;
-- EJ44
SELECT c.nombre, IFNULL(SUM(p.total), 0) AS total_gastado FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre ORDER BY total_gastado DESC;
-- EJ45
SELECT d.nombre_dep, COUNT(e.id_emp) AS num_empleados, d.presupuesto FROM departamentos d LEFT JOIN empleados e ON d.id_dep = e.id_dep GROUP BY d.nombre_dep, d.presupuesto;
-- EJ46
SELECT DISTINCT pr.nombre FROM productos pr JOIN pedidos p ON pr.id_producto = p.id_producto JOIN clientes c ON p.id_cliente = c.id_cliente WHERE c.ciudad = 'Madrid';
-- EJ47
SELECT td.departamento, td.salario_medio FROM (SELECT departamento, AVG(salario) AS salario_medio FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento) AS td WHERE td.salario_medio > (SELECT AVG(salario) FROM empleados);
-- EJ48
CREATE VIEW vista_clientes_gastos AS SELECT c.nombre, IFNULL(SUM(p.total), 0) AS gasto_total FROM clientes c LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY c.nombre;
SELECT * FROM vista_clientes_gastos;
-- EJ49
CREATE VIEW vista_productos_vendidos AS SELECT pr.nombre, SUM(p.cantidad) AS cantidad_total, SUM(p.total) AS total_recaudado FROM productos pr JOIN pedidos p ON pr.id_producto = p.id_producto GROUP BY pr.nombre;
SELECT * FROM vista_productos_vendidos;
-- EJ50
SELECT * FROM vista_productos_vendidos ORDER BY cantidad_total DESC LIMIT 3;
-- EJ51
SELECT e.nombre, e.departamento, e.salario FROM empleados e JOIN (SELECT departamento, AVG(salario) AS media_dep FROM empleados WHERE departamento IS NOT NULL GROUP BY departamento) AS td ON e.departamento = td.departamento WHERE e.salario > td.media_dep;
-- EJ52
CREATE VIEW vista_resumen_departamento AS SELECT d.nombre_dep, COUNT(e.id_emp) AS num_empleados, ROUND(AVG(e.salario), 2) AS salario_medio, SUM(e.salario) AS salario_total, d.presupuesto FROM departamentos d LEFT JOIN empleados e ON d.id_dep = e.id_dep GROUP BY d.nombre_dep, d.presupuesto;
SELECT * FROM vista_resumen_departamento;

-- ============================================================
-- FIN DEL SCRIPT
-- ============================================================
