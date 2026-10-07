drop database if exists actividad2_7;
create database actividad2_7;
use actividad2_7;

create table aulas (
numero decimal (2,0) not null,
planta decimal (1,0) not null,
situacion varchar(50) not null,
constraint pk_aulas primary key (numero,planta)
);

create table estudiantes (
id int not null auto_increment,
nombre varchar(50) not null,
direccion varchar(1000) not null,
constraint pk_estudiantes primary key (id)
);

create table asignaturas (
ciclo enum ('basico', 'medio', 'superior') not null,
nombre varchar(50) not null,
descripcion varchar(1000) not null,
constraint pk_asignaturas primary key (ciclo,nombre)
);

create table estudios (
numero_aula decimal (2,0) not null,
planta_aula decimal (1,0) not null,
id_estudiante int not null,
ciclo_asignatura enum ('basico', 'medio', 'superior') not null,
nombre_asignatura varchar(50) not null,
hora decimal(1,0) not null,
constraint pk_estudios primary key (numero_aula,planta_aula,id_estudiante,ciclo_asignatura,nombre_asignatura), 
constraint fk_estudios_aulas foreign key (numero_aula,planta_aula)
	references aulas (numero,planta),
constraint fk_estudios_estudiantes foreign key (id_estudiante)
	references estudiantes (id),
constraint fk_estudios_asignaturas foreign key (ciclo_asignatura,nombre_asignatura)
	references asignaturas (ciclo,nombre)
);

#Test
insert into aulas (
numero,
planta,
situacion) values
(1, 0, 'Isidra'),
(3, 0, 'Isidra');

insert into estudiantes (
id,
nombre,
direccion) values 
(1000, 'José Gómez García', 'Calle Mayor 2'),
(2000, 'Jesús Pérez González', 'Plaza Cervantes 7');

insert into asignaturas (
ciclo,
nombre,
descripcion) values
('superior','Programación', 'Asignatura de conocer los fundamentos de la programación'),
('medio','Redes', 'Asignatura para configurar redes');

insert into estudios (
numero_aula,
planta_aula,
id_estudiante,
ciclo_asignatura,
nombre_asignatura,
hora) values
(1,0, 1000, 'superior','Programacion',5);

#Da errror porque se repite
insert into estudios (
numero_aula,
planta_aula,
id_estudiante,
ciclo_asignatura,
nombre_asignatura,
hora) values
(1,0, 1000, 'superior','Programacion',6);

#Da errror porque no existe redes en grado superior
insert into estudios (
numero_aula,
planta_aula,
id_estudiante,
ciclo_asignatura,
nombre_asignatura,
hora) values
(1,0, 1000, 'superior','Redes',6);

select * from estudios;












