drop database if exists actividad2_12;
create database actividad2_12;
use actividad2_12;

create table provincias (
codigo numeric (2,0) not null,
nombre varchar (50) not null,
constraint pk_provincias primary key  (codigo)
);

create table poblaciones (
codigo int not null auto_increment,
nombre varchar (100) not null,
codigo_provincia numeric (2,0) not null,
constraint pk_poblaciones primary key  (codigo), 
constraint fk_poblaciones_provincias foreign key (codigo_provincia) references provincias (codigo)
);


create table repartidores (
DNI char (9) not null,
nombre varchar(100) not null,
direccion varchar(100) not null,
codigo_poblacion int not null,
salario numeric (7,2) not null,
constraint pk_repartidores primary key (DNI), 
constraint fk_repartidores_poblaciones foreign key (codigo_poblacion) references poblaciones (codigo)
);


create table paquetes (
codigo int not null auto_increment, 
descripcion varchar(100) not null,
nombre_destinatario varchar(100) not null,
direccion varchar(100) not null,
codigo_poblacion int not null,
DNI_repartidor char (9) not null,
constraint pk_paquetes primary key (codigo),
constraint fk_paquetes_poblaciones foreign key (codigo_poblacion) references poblaciones (codigo),
constraint fk_paquetes_repartidores foreign key (DNI_repartidor) references repartidores (DNI)
);


create table furgonetas (
matricula char (7) not null,
marcha varchar (50) not null,
modelo varchar (50) not null,
constraint pk_furgonetas primary key (matricula)
);

create table furgonetas_asignadas (
DNI_repartidor char (9) not null,
matricula_furgoneta char (7) not null,
fecha date not null,
constraint pk_furgonetas primary key (DNI_repartidor, matricula_furgoneta,fecha),
constraint fk_furgonetas_asignadas_repartidores foreign key (DNI_repartidor) references repartidores (DNI),
constraint fk_furgonetas_asignadas_furgonetas foreign key (matricula_furgoneta) references furgonetas (matricula)
);



insert into provincias (
codigo,
nombre) 
values
(28, 'Madrid'),
(01, 'Ávila');

insert into poblaciones (
codigo,
nombre,
codigo_provincia)
values
(1, 'Alcalá de Henares', 28),
(2, 'Madrid', 28),
(3, 'Ávila', 01);


insert into repartidores (
DNI,
nombre,
direccion,
codigo_poblacion,
salario) values
('00000001R', 'Juan Gómez', 'Mayor 1', 1, 20000),
('00000002W', 'Felipe Álvarez', 'Mayor 25', 2, 21000),
('00000003A', 'Ana López', 'Empecinado 3', 1, 22000),
('00000004G', 'Silvia Parrilla', 'Plaza Mayor 5', 3, 18000);


insert into paquetes (
descripcion,
nombre_destinatario,
direccion,
codigo_poblacion,
DNI_repartidor) values
('un paquete', 'Diana Gómez', 'Ronda Fiscal 7', 1, '00000001R');

insert into furgonetas (
matricula,
marcha,
modelo) values
('0100JKL', 'Renault', 'Express');

insert into furgonetas_asignadas (
DNI_repartidor,
matricula_furgoneta,
fecha ) values
('00000001R', '0100JKL', '20260112'),
('00000002W', '0100JKL', '20260113');


select * from furgonetas;
select * from furgonetas_asignadas;
select * from paquetes;
select * from poblaciones;
select * from provincias;
select * from repartidores;




