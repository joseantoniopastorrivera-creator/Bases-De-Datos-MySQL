drop database if exists actividad2_6;
create database actividad2_6;
use actividad2_6;

create table empleados (
dni char(9) not null,
nombre varchar(50) not null,
dni_superior char(9) null,
constraint pk_empleados primary key (dni),
constraint fk_empleado_superior foreign key (dni_superior)
	references empleados (dni)
);


#Test
insert into empleados (
dni,
nombre,
dni_superior) values
('01000000J', 'Jefe Supremo ', null), 
('02000000I', 'Jefe Intermedio', '01000000J'), 
('03000000E', 'Empleado Uno', '02000000I'), 
('04000004E', 'Empleado Dos', '02000000I');

select * from empleados;












