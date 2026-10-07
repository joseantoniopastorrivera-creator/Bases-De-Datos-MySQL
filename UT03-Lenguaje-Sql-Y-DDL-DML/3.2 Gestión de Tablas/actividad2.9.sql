drop database if exists actividad2_9;
create database actividad2_9;
use actividad2_9;

create table empleados (
DNI char (9) not null,
nombre varchar(50) not null,
constraint pk_empleados primary key (DNI)
);

create table directivos (
DNI char (9) not null,
departamento decimal (2,0) not null,
constraint pk_directivos primary key (DNI),
constraint fk_directivos_empleados foreign key (DNI)
	references empleados (DNI)
);

create table tecnicos (
DNI char (9) not null,
maquina decimal (2,0) not null,
constraint pk_tecnicos primary key (DNI),
constraint fk_tecnicos_empleados foreign key (DNI)
	references empleados (DNI)
);

create table comerciales (
DNI char (9) not null,
comision decimal (4,2) not null, #porcentaje
constraint pk_comerciales primary key (DNI),
constraint fk_comerciales_empleados foreign key (DNI)
	references empleados (DNI)
);

#Test
insert into empleados (
DNI,
nombre) values
('00000001R', 'Jefe'),
('00000002W', 'Técnico'),
('00000003A', 'Vendedor');

insert into directivos (
DNI,
departamento) values
('00000001R', 8);

insert into tecnicos (
DNI,
maquina) values 
('00000002W', 5);

insert into comerciales (
DNI,
comision) values 
('00000003A', 12.5);

select * from empleados;
select * from directivos;
select * from tecnicos;
select * from comerciales;













