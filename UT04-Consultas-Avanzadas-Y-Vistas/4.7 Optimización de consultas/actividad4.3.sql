drop database if exists actividad4_3;
create database actividad4_3;
use actividad4_3;

create table directores (
    id_director int primary key,
    nombre_director varchar(50),
    pais_origen varchar(30)
) ;

create table peliculas (
    id_pelicula int primary key,
    titulo varchar(100),
    genero varchar(30),
    id_director int
) ;

create table salas (
    id_sala int primary key,
    nombre_sala varchar(20),
    id_pelicula int,# película que se está proyectando actualmente
    capacidad int
) ;

insert into directores values 
(1, 'Christopher Nolan', 'Reino Unido'),
(2, 'Steven Spielberg', 'EEUU'),
(3, 'Greta Gerwig', 'EEUU'),
(4, 'Pedro Almodóvar', 'España');

insert into peliculas values 
(10, 'Oppenheimer', 'Drama', 1),
(11, 'Inception', 'Ciencia Ficción', 1),
(20, 'Jurassic Park', 'Aventura', 2),
(30, 'Barbie', 'Comedia', 3),
(40, 'Dolor y Gloria', 'Drama', 4),
(50, 'Película Indie', 'Indie', NULL); ## Sin director famoso registrado

insert into salas values 
(101, 'Sala IMAX', 10, 300),
(102, 'Sala 2', 10, 150), 
(103, 'Sala VIP', 30, 50),
(104, 'Sala 4', NULL, 200), # Sala vacía (sin película)
(105, 'Sala 5', 99, 100); # Sala con ID de película que no existe

#Muestra el nombre de la sala, el título de la película y el nombre de su director
select sa.nombre_sala as nombre_sala ,
pe.titulo as titulo_pelicula ,
di.nombre_director as nombre_director
from salas sa
inner join peliculas pe
on sa.id_pelicula=pe.id_pelicula
inner join directores di
on pe.id_director=di.id_director;

#Obtén una lista única de los nombres de directores que tienen películas proyectándose en alguna sala ahora mismo.

select 
distinct(di.nombre_director) as nombre_director
from salas sa
inner join peliculas pe
on sa.id_pelicula=pe.id_pelicula
inner join directores di
on pe.id_director=di.id_director;


#Muestra todas las salas de cine y el título de la película que proyectan. Si la sala está vacía, debe aparecer el título como "<sin película>".
select sa.nombre_sala as nombre_sala, 
ifnull(pe.titulo, '<sin película>') as pelicula
from salas sa
left join peliculas pe
on sa.id_pelicula=pe.id_pelicula;

#Calcula la capacidad total (suma de asientos) de todas las salas donde se están proyectando películas dirigidas por 'Christopher Nolan'.

select 
sum(sa.capacidad) as capacidad_total
from salas sa
inner join peliculas pe
on sa.id_pelicula=pe.id_pelicula
inner join directores di
on pe.id_director=di.id_director
where di.id_director=1; #Nolan

#Lista los títulos de las películas y los nombres de las salas donde el director sea de 'EEUU'.
select 
pe.titulo as nombre_pelicula,
sa.nombre_sala as nombre_sala
from salas sa
inner join peliculas pe
on sa.id_pelicula=pe.id_pelicula
inner join directores di
on pe.id_director=di.id_director
where di.pais_origen='EEUU';

