drop database if exists actividad1_7;
create database actividad1_7;
use actividad1_7;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT,
    fecha_lanzamiento DATE,
    codigo_almacen VARCHAR(10),
    garantia_meses INT
);

INSERT INTO productos VALUES 
(1, 'Laptop Gaming X', 'Computación', 1200.50, 10, '2023-05-15', 'ALM-A1', 24),
(2, 'Mouse Inalámbrico', 'Accesorios', 25.00, 50, '2023-01-10', 'ALM-B1', 12),
(3, 'Monitor 4K 27"', 'Computación', 350.00, 0, '2022-11-20', NULL, 36),
(4, 'Teclado Mecánico RGB', 'Accesorios', 85.00, 15, '2023-08-01', 'ALM-B2', NULL),
(5, 'Smartphone Z1', 'Telefonía', 899.99, 5, '2024-01-05', 'ALM-C1', 24),
(6, 'Tablet Pro 10', 'Telefonía', 450.00, 12, '2023-10-12', 'ALM-C2', 12),
(7, 'Cable HDMI 2.1', 'Accesorios', 15.00, 100, '2022-05-01', 'ALM-B3', 6),
(8, 'Disco Duro SSD 1TB', 'Almacenamiento', 110.00, 8, '2023-12-15', 'ALM-D1', 60),
(9, 'Memoria RAM 16GB', 'Almacenamiento', 75.00, 20, '2023-02-25', 'ALM-D2', 120),
(10, 'Auriculares Noise Cancelling', 'Audio', 199.00, 3, '2023-06-30', NULL, 24);


select 
nombre, 
precio
from productos
where
categoria in ('Accesorios', 'Almacenamiento')
and precio > 50
and stock >=1 
order by precio desc;

select *
from productos
where
garantia_meses between 12 and 36 
and categoria in ('Computación', 'Telefonía');

select 
nombre, 
categoria
from productos
where
codigo_almacen is null 
order by nombre;

select *
from productos 
where nombre like '%Pro%';

select *
from productos 
where codigo_almacen like 'ALM_B%';

select *
from productos 
where nombre like '%1';

select *
from productos
order by precio desc
limit 3;

select *
from productos
order by precio desc
limit 3,3;








