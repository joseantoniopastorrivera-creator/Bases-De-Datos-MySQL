drop database if exists actividad1_5;
create database actividad1_5;
use actividad1_5;

CREATE TABLE registros_acceso (
    id INT PRIMARY KEY,
    empleado_id INT,
    entrada DATETIME,
    salida DATETIME
);

INSERT INTO registros_acceso VALUES 
(1, 10, '2024-03-01 08:00:00', '2024-03-01 17:30:00'),
(2, 11, '2024-03-05 09:15:00', '2024-03-05 18:00:00'),
(3, 10, '2024-04-10 08:05:00', '2024-04-10 16:45:00');

select empleado_id,
date_format (entrada, '%H-%i-%s') as fecha_entrada,
date_format (salida, '%%H-%i-%s') as fecha_salida,
timediff (salida, entrada) as tiempo_trabajado
from registros_acceso;



