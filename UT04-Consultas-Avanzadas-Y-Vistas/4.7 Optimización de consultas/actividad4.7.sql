drop database if exists actividad4_7;
create database actividad4_7;
use actividad4_7;

create table estudiantes (
    id_estudiante int primary key,
    nombre varchar(50) not null,
    carrera varchar(50) not null
);

create table asignaturas (
    id_asignatura int primary key,
    nombre varchar(50) not null,
    semestre int not null
);

create table matriculas (
    id_estudiante int,
    id_asignatura int,
    nota decimal(4,2),
    primary key (id_estudiante, id_asignatura),
    foreign key (id_estudiante) references estudiantes(id_estudiante),
    foreign key (id_asignatura) references asignaturas(id_asignatura)
);


insert into estudiantes values (1, 'Ana Torres', 'Ingenieria');
insert into estudiantes values (2, 'Luis Perez', 'Ingenieria');
insert into estudiantes values (3, 'Maria Lopez', 'Administración');
insert into estudiantes values (4, 'Carlos Ruiz', 'Administración');
insert into estudiantes values (5, 'Elena Gomez', 'Ingenieria');
insert into estudiantes values (6, 'Jorge Diaz', 'Derecho'); -- no matriculado

insert into asignaturas values (101, 'Matematicas', 1);
insert into asignaturas values (102, 'Programacion', 1);
insert into asignaturas values (103, 'Contabilidad', 1);
insert into asignaturas values (201, 'Base de Datos', 2);
insert into asignaturas values (202, 'Estadistica', 2);
insert into asignaturas values (203, 'Marketing', 2);
insert into asignaturas values (300, 'Filosofia', 3); -- sin estudiantes

insert into matriculas values (1, 101, 8.5);
insert into matriculas values (1, 201, 7.0);

insert into matriculas values (2, 101, 4.0);
insert into matriculas values (2, 102, 6.5);

insert into matriculas values (3, 103, 9.0);
insert into matriculas values (3, 203, 8.0);

insert into matriculas values (4, 103, 3.5);
insert into matriculas values (4, 202, 5.5);

insert into matriculas values (5, 102, 7.5);
insert into matriculas values (5, 202, 9.0);


#Los nombres de estudiantes de "ingeniería" y de "Administracion".
select nombre
from estudiantes
where carrera='Ingeniería'
union
select nombre
from estudiantes
where carrera='Administración';


#Estudiantes que estén matriculados en asignaturas del primer y segundo trimestre.
select es.nombre
from matriculas ma
inner join estudiantes es
on ma.id_estudiante=es.id_estudiante
inner join asignaturas asi
on ma.id_asignatura=asi.id_asignatura
where asi.semestre=1
intersect
select es.nombre
from matriculas ma
inner join estudiantes es
on ma.id_estudiante=es.id_estudiante
inner join asignaturas asi
on ma.id_asignatura=asi.id_asignatura
where asi.semestre=2;


#Estudiantes que tengan alguna nota mayor a 8 y sean de ingeniería.
select es.nombre
from matriculas ma
inner join estudiantes es
on ma.id_estudiante=es.id_estudiante
where ma.nota>8
intersect
select nombre
from estudiantes
where carrera='Ingeniería';


#Estudiantes matriculados que ya tengan todas las asignaturas aprobadas.
select es.nombre
from matriculas ma
inner join estudiantes es
on ma.id_estudiante=es.id_estudiante
where nota>=5
except 
select es.nombre
from matriculas ma
inner join estudiantes es
on ma.id_estudiante=es.id_estudiante
where nota<5;

#Asignaturas que no tengan estudiantes matriculados.
select nombre
from 
asignaturas
except
select asi.nombre
from matriculas ma
inner join asignaturas asi
on ma.id_asignatura=asi.id_asignatura;

