drop database if exists actividad1_3;
create database actividad1_3;
use actividad1_3;

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_producto INT,
    categoria VARCHAR(30),
    cantidad INT,
    precio_unitario DECIMAL(10,2)
);

INSERT INTO ventas VALUES 
(1, 101, 'Electrónica', 2, 500.00),
(2, 102, 'Hogar', 1, 150.00),
(3, 101, 'Electrónica', 1, 500.00),
(4, 103, 'Electrónica', 5, 20.00),
(5, 104, 'Deportes', 3, 100.00);

select distinct(categoria) as categorias_distintas from ventas;

select count(distinct(categoria)) as total_categorias from ventas;

select sum(cantidad*precio_unitario) as total_vendido from ventas;

select round(avg(precio_unitario),2) as precio_promedio from ventas;

select min(cantidad*precio_unitario) as menor_venta from ventas;


