drop database if exists actividad2_2;
create database actividad2_2;
use actividad2_2;

create table notas (
    id_nota int primary key,
    alumno varchar(50),
    asignatura varchar(50),
    nota decimal(4,2)
);

insert into notas values
(1, 'Juan', 'BBDD', 7.5),
(2, 'Juan', 'Programación', 8.0),
(3, 'Ana', 'BBDD', 9.0),
(4, 'Ana', 'Programación', 8.5),
(5, 'Luis', 'BBDD', 4.5),
(6, 'Luis', 'Programación', 5.0);


select alumno, avg (nota) as media
from notas
group by alumno;

select alumno, avg (nota) as media
from notas
group by alumno 
having media >=6;

select asignatura, avg (nota) as media
from notas
group by asignatura 
having media >=7;


