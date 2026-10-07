drop database if exists actividad3_2;
create database actividad3_2;
use actividad3_2;

create table libros (
    id_libro int primary key,
    titulo varchar(100),
    editorial varchar(50)
);

create table prestamos (
    id_prestamo int primary key,
    id_libro int,
    fecha date
);

insert into libros values
(1, 'El Quijote', 'Anaya'),
(2, '1984', 'Planeta'),
(3, 'Hamlet', 'Anaya');

insert into prestamos values
(1, 1, '2024-01-10'),
(2, 3, '2024-01-15');


#Libros de la editorial Anaya que han sido prestados.

select titulo 
from libros
where
editorial='Anaya' and
id_libro in
(
  select id_libro
  from prestamos
);


#Libros que han sido prestados.
select titulo 
from libros
where
id_libro in
(
  select id_libro
  from prestamos
);

#Libros cuyo id es mayor que todos los prestados.
select *
from libros l
where l.id_libro > all
(
  select id_libro
  from prestamos
);


#Libros cuyo id es mayor que alguno de los prestados.
select *
from libros l
where l.id_libro > any
(
  select id_libro
  from prestamos
);

