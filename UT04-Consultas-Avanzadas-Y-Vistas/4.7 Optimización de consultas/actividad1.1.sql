drop database if exists actividad1_1;
create database actividad1_1;
use actividad1_1;

CREATE TABLE compras (
    cliente VARCHAR(50),
    producto VARCHAR(50),
    categoria VARCHAR(30),
    metodo_pago VARCHAR(20),
    fecha DATE
);

INSERT INTO compras (cliente, producto, categoria, metodo_pago, fecha) VALUES 
('Juan Pérez', 'Ratón', 'Electrónica', 'Tarjeta', '2024-01-01'),
('Ana López', 'Teclado', 'Electrónica', 'PayPal', '2024-01-02'),
('Juan Pérez', 'Monitor', 'Electrónica', 'Tarjeta', '2024-01-02'),
('Luis Gómez', 'Camiseta', 'Ropa', 'Tarjeta', '2024-01-03'),
('Ana López', 'Ratón', 'Electrónica', 'PayPal', '2024-01-03'),
('Lucía Sanz', 'Zapatillas', 'Ropa', 'Bizum', '2024-01-04'),
('Juan Pérez', 'Teclado', 'Electrónica', 'Tarjeta', '2024-01-05'),
('Ana López', 'Camiseta', 'Ropa', 'PayPal', '2024-01-05');


select cliente, producto
from compras;

select producto, categoria
from compras;

select 
cliente as nombre_cliente,
producto,
metodo_pago as medio_de_pago,
fecha as fecha_compra
from 
compras;

select distinct (producto)
from compras;

select distinct (metodo_pago)
from compras;


