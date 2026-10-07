drop database if exists actividad3_1;
create database actividad3_1;
use actividad3_1;

create table carreras (
    id_carrera int primary key,
    nombre varchar(50),
    duracion int
);

create table estudiantes (
    id_estudiante int primary key,
    nombre varchar(50),
    id_carrera int
);
insert into carreras values
(1, 'informática', 4),
(2, 'derecho', 5),
(3, 'medicina', 6);

insert into estudiantes values
(1, 'Ana', 1),
(2, 'Luis', 2),
(3, 'Marta', 1),
(4, 'Carlos', 3);

#Estudiantes que cursan una carrera de más de 4 años.
select nombre 
from estudiantes
where id_carrera in
(
  select id_carrera
  from carreras
  where duracion >4
);


#Estudiantes que cursan medicina.
select nombre
from estudiantes 
where id_carrera in
(
  select id_carrera
  from carreras
  where nombre='medicina'
);

#Carreras que tienen estudiantes matriculados
select *
from carreras c
where exists 
(
  select 1
  from estudiantes e
  where e.id_carrera=c.id_carrera
);

#Estudiantes que cursan carreras de duración mayor que todas las demás
select nombre
from estudiantes
where id_carrera in 
(
  select c1.id_carrera
  from carreras c1
  where duracion > all 
  (
    select duracion
    from carreras c2
    where c1.id_carrera <> c2.id_carrera
  )
);

#Estudiantes que cursan carreras de duración mayor que alguna otra
select nombre
from estudiantes
where id_carrera in 
(
  select c1.id_carrera
  from carreras c1
  where duracion > any 
  (
    select duracion
    from carreras c2
    where c1.id_carrera <> c2.id_carrera
  )
);

