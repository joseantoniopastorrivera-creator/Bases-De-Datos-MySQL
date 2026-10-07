drop database if exists actividad1_4;
create database actividad1_4;
use actividad1_4;

CREATE TABLE suscripciones (
    id INT PRIMARY KEY,
    usuario VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE
);

INSERT INTO suscripciones VALUES 
(1, 'user_alpha', '2023-01-15', '2027-01-15'),
(2, 'user_beta', '2023-05-20', '2026-11-20'),
(3, 'user_gamma', '2022-10-01', '2027-10-01');


select id, datediff (fecha_fin, fecha_inicio) as duracion from suscripciones;

select id, year(fecha_inicio) as anio_inicio from suscripciones;

select id, datediff (fecha_fin, curdate()) as dias_faltan from suscripciones;




