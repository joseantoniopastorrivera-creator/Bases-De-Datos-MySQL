drop database if exists actividad3_1;
create database actividad3_1;
use actividad3_1;


create table actores (
codigo int not null auto_increment,
nombre varchar (50) not null unique,
fecha_nacimiento date not null,
constraint pk_actores primary key (codigo),
constraint chk_fecha_nacimiento check (fecha_nacimiento > '1900-1-1')
);
create table personajes (
codigo int not null auto_increment,
nombre varchar (50) not null unique,
codigo_actor int not null,
constraint pk_personajes primary key (codigo),
constraint fk_personajes_actores foreign key (codigo_actor) references actores(codigo) on delete cascade
);

#Insertar datos
insert into actores (
codigo,
nombre,
fecha_nacimiento)
values
(1,'Penelopé Cruz', '19740428'),
(2,'Javier Bardem', '19690301'),
(3,'Antonio Banderas', '19600810'),
(4,'Carmen Maura', '19450915'),
(5,'Mario Casas', '19860612'),
(6,'Blanca Suárez', '19881121'),
(7,'Dani Rovira', '19801101'),
(8,'Miguel Ángel Silvestre', '19820406'),
(9,'Macarena García', '19880426'),
(10,'Emilio Aragon', '19590416');

#Actualizar fecha nacimiento Blanca Suárez
update actores
set fecha_nacimiento='19881021'
where codigo=6;

#Borrar registro Emilio Aragon
delete from actores
where codigo=10;


insert into personajes (
nombre ,
codigo_actor) values 
('Raimunda', 1),
('Anton Chigurh', 3);


update personajes
set codigo_actor=2
where nombre='Anton Chigurh';


delete from actores
where codigo=1;

delete from personajes;
delete from actores;



