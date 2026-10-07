drop database if exists actividad2_13;
create database actividad2_13;
use actividad2_13;

create table profesores (
codigo int not null auto_increment, 
nombre varchar(50) not null,
DNI char (9) not null,
telefono char (9) not null unique,
constraint pk_profesores primary key  (codigo)
);

create table modulos (
codigo int not null auto_increment, 
descripcion varchar(50) not null,
codigo_profesor int not null,
constraint pk_modulos primary key  (codigo),
constraint fk_modulos_profesores foreign key (codigo_profesor) references profesores (codigo)
);

create table clases (
codigo char(6) not null,
constraint pk_clases primary key  (codigo)
);


create table alumnos (
numero_expediente numeric (6,0) not null, 
nombre varchar(50) not null,
apellidos varchar(100) not null,
fecha_nacimiento date not null,
es_delegago boolean not null,
codigo_clase char(6) not null,
constraint pk_alumnos primary key (numero_expediente),
constraint fk_alumnos_clases foreign key (codigo_clase) references clases (codigo)
);


create table matriculas (
codigo_modulo int not null,
numero_expediente_alumno numeric (6,0) not null, 
constraint pk_matriculas primary key (codigo_modulo, numero_expediente_alumno),
constraint fk_matriculas_modulos foreign key (codigo_modulo) references modulos (codigo),
constraint fk_matriculas_alumnos foreign key (numero_expediente_alumno) references alumnos (numero_expediente)
);











