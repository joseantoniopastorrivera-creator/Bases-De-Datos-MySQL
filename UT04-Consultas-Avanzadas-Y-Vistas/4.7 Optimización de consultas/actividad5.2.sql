drop database if exists actividad5_2;
create database actividad5_2;
use actividad5_2;


create table estudiantes (
    id_estudiante int primary key,
    nombre varchar(50)
);

create table notas (
    id_nota int primary key,
    id_estudiante int,
    calificacion decimal(4,2),
    foreign key (id_estudiante) references estudiantes(id_estudiante)
);

insert into estudiantes values
(1, 'Ana'),
(2, 'Luis'),
(3, 'Carlos'),
(4, 'Sofia');

insert into notas values
(1, 1, 8.0),
(2, 1, 9.0),
(3, 2, 6.0),
(4, 2, 7.0),
(5, 3, 10.0),
(6, 3, 9.0),
(7, 4, 5.0),
(8, 4, 6.0);


#Valor mejor media
select
max(medias.media)
from
  (select 
   no1.id_estudiante as id_estudiante,
   avg(no1.calificacion) as media
   from notas no1
   group by no1.id_estudiante) as medias;



#Obtener el nombre de los estudiantes que tienen la mejor media.
select 
es1.nombre,
avg(calificacion) media
from notas no1
inner join estudiantes es1
on no1.id_estudiante=es1.id_estudiante
group by no1.id_estudiante
having media=
  (select
   max(medias.media)
   from
     (select 
      no1.id_estudiante as id_estudiante,
      avg(no1.calificacion) as media
      from notas no1
      group by no1.id_estudiante) as medias);
  
#Valor peor media
select
min(medias.media)
from
  (select 
   no1.id_estudiante as id_estudiante,
   avg(no1.calificacion) as media
   from notas no1
   group by no1.id_estudiante) as medias;



#Obtener el nombre de los estudiantes que tienen la peor media.
select 
es1.nombre,
avg(calificacion) media
from notas no1
inner join estudiantes es1
on no1.id_estudiante=es1.id_estudiante
group by no1.id_estudiante
having media=
  (select
   min(medias.media)
   from
     (select 
      no1.id_estudiante as id_estudiante,
      avg(no1.calificacion) as media
      from notas no1
      group by no1.id_estudiante) as medias);



#Obtener los estudiantes que tienen la mejor y la peor media respectivamente

select 
es1.nombre,
avg(calificacion) media
from notas no1
inner join estudiantes es1
on no1.id_estudiante=es1.id_estudiante
group by no1.id_estudiante
having media=
  (select
   max(medias.media)
   from
     (select 
      no1.id_estudiante as id_estudiante,
      avg(no1.calificacion) as media
      from notas no1
      group by no1.id_estudiante) as medias)
union
select 
es1.nombre,
avg(calificacion) media
from notas no1
inner join estudiantes es1
on no1.id_estudiante=es1.id_estudiante
group by no1.id_estudiante
having media=
  (select
   min(medias.media)
   from
     (select 
      no1.id_estudiante as id_estudiante,
      avg(no1.calificacion) as media
      from notas no1
      group by no1.id_estudiante) as medias);




