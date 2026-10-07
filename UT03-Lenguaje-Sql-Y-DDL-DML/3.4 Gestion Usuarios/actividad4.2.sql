drop user if exists 'propietario'@'localhost';
drop user if exists 'escritura'@'localhost';
drop user if exists 'lectura'@'localhost';
drop database if exists actividad4_2;

create user 'propietario'@'localhost' identified by 'propietario';

create database actividad4_2;

grant create, alter, drop, insert, update, delete, select on actividad4_2.* to 'propietario'@'localhost';

create user 'escritura'@'localhost' identified by 'escritura';

grant insert, update, delete, select on actividad4_2.* to 'escritura'@'localhost';

create user 'lectura'@'localhost' identified by 'lectura';

grant select on actividad4_2.* to 'lectura'@'localhost';


#con usuario propietario
use actividad4_2;

create table prueba (
columna varchar(50)
);

insert into prueba (columna) values
('un registro');

select * from prueba;

#con usuario escritura
use actividad4_2;

create table prueba2 (
columna varchar(50)
); #da error

delete from prueba;

insert into prueba (columna) values
('un registro');

update prueba set 
columna='otro registro';

select * from prueba;

#con usuario lectura
use actividad4_2;

create table prueba2 (
columna varchar(50)
); #da error

delete from prueba; #da error

insert into prueba (columna) values
('un registro'); #da error

update prueba set 
columna='otro registro'; #da error

select * from prueba; #ok
