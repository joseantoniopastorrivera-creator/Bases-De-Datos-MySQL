drop database if exists actividad4_2;
create database actividad4_2;
use actividad4_2;

create table autores (
    id_autor int primary key,
    nombre_autor varchar(50),
    nacionalidad varchar(30)
);

create table libros (
    id_libro int primary key,
    titulo varchar(100),
    id_autor int
);

create table prestamos (
    id_prestamo int primary key,
    id_libro int,
    nombre_usuario varchar(50),
    fecha_prestamo date
);

insert into autores values 
(1, 'Miguel de Cervantes', 'Española'),
(2, 'Gabriel García Márquez', 'Colombiana'),
(3, 'Isabel Allende', 'Chilena');

insert into libros values 
(10, 'Don Quijote de la Mancha', 1),
(20, 'Cien años de soledad', 2),
(30, 'El amor en los tiempos del cólera', 2),
(40, 'La casa de los espíritus', 3),
(50, 'Libro Huérfano', NULL); # Libro sin autor registrado

insert into prestamos values 
(100, 10, 'Juan Pérez', '2024-01-05'),
(101, 10, 'Ana López', '2024-02-10'), # El mismo libro prestado otra vez
(102, 20, 'Juan Pérez', '2024-01-15'),# El mismo usuario lleva otro libro
(103, 30, 'Luis Gómez', '2024-03-01'),
(104, 99, 'Usuario Fantasma', '2024-03-05'); # Préstamo de libro inexistente




#Muestra el nombre del autor, el título del libro y el nombre del usuario que lo pidió. Solo registros con toda la información.
select au.nombre_autor as nombre_autor,
li.titulo as titulo_libro,
pr.nombre_usuario as nombre_usuario
from autores au
inner join libros li
on li.id_autor=au.id_autor
inner join prestamos pr
on pr.id_libro=li.id_libro;


#Obtén la lista de usuarios (sin repetición) que han tomado prestados libros de autores de nacionalidad colombiana. 
select distinct (pr.nombre_usuario)
from prestamos pr
inner join libros li
on pr.id_libro=li.id_libro
inner join autores au
on au.id_autor=li.id_autor
where au.nacionalidad='Colombiana';


#Lista todos los autores y los títulos de sus libros, si un libro no tiene autor se debe mostrar "ANÓNIMO".
select ifnull(au.nombre_autor,'ANÓNIMO') as autor, 
li.titulo as titulo
from libros li
left join autores au
on li.id_autor=au.id_autor;

#Cuenta cuántos autores distintos tienen libros que han sido prestados al menos una vez.
select count(distinct(au.id_autor))
from libros li
inner join prestamos pr
on li.id_libro=pr.id_libro
inner join autores au
on li.id_autor=au.id_autor;


#Muestra el nombre de los usuarios (sin repetición) que han leído algún libro de 'Gabriel García Márquez'.
select distinct (pr.nombre_usuario) as nombre_usuario
from autores au
inner join libros li
on li.id_autor=au.id_autor
inner join prestamos pr
on pr.id_libro=li.id_libro 
where li.id_autor=2

