drop database if exists actividad3_3;
create database actividad3_3;
use actividad3_3;

create table equipos (
    id_equipo int primary key,
    nombre varchar(50)
);

create table jugadores (
    id_jugador int primary key,
    nombre varchar(50),
    goles int,
    id_equipo int
);


insert into equipos values
(1, 'Rojo'),
(2, 'Azul');

insert into jugadores values
(1, 'Juan', 10, 1),
(2, 'Pedro', 5, 1),
(3, 'Luis', 7, 2);



#Jugadores del equipo Rojo.
select * 
from jugadores
where
id_equipo in
(
  select id_equipo
  from equipos
  where nombre='Rojo'
);


#Jugadores del equipo Azul.
select * 
from jugadores
where
id_equipo in
(
  select id_equipo
  from equipos
  where nombre='Azul'
);

#Equipos que tienen jugadores.
select *
from equipos e
where exists (
  select 1 
  from jugadores
  where id_equipo=e.id_equipo
);



#Jugadores con más goles que el máximo goleador del equipo Azul.
select *
from jugadores
where goles > all
(
  select goles
  from jugadores
  where id_equipo in 
    (
       select id_equipo
       from equipos 
       where nombre='Azul'
    )
);

#Jugadores con más goles que alguno de los jugadores del equipo Azul.
select *
from jugadores
where goles > any
(
  select goles
  from jugadores
  where id_equipo in 
    (
       select id_equipo
       from equipos 
       where nombre='Azul'
    )
);

