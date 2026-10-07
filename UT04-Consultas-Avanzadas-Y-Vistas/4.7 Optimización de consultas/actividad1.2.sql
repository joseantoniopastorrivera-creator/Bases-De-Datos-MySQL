drop database if exists actividad1_2;
create database actividad1_2;
use actividad1_2;

CREATE TABLE trabajadores (
id INT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
puesto VARCHAR(50),
departamento VARCHAR(50),
bono DECIMAL(10,2)
);
INSERT INTO trabajadores VALUES
(1, ' Juan', 'Perez ', 'Gerente', 'VENTAS', 500.00),
(2, 'Maria', 'Gomez', 'Analista', 'ventas', NULL),
(3, ' carloS', 'ruiz ', 'Asistente', 'MARKETING', 200.00),
(4, 'Ana', 'Soto', 'Programador', 'IT', NULL); 


select
ltrim(rtrim(upper(concat (nombre, ' ', apellido)))) as nombre, 
lower (departamento) as departameno,
ifnull(bono,0) as bono
from 
trabajadores;
