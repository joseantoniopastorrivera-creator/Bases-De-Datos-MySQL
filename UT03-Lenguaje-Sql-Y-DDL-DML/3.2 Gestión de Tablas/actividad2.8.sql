drop database if exists actividad2_8;
create database actividad2_8;
use actividad2_8;

create table representantes (
numeroLicencia decimal (5,0) not null,
nombre varchar(50) not null,
constraint pk_representantes primary key (numeroLicencia)
);

create table actores (
id int not null auto_increment,
nombreArtistico varchar(50) not null,
nombreReal varchar(50) not null,
numeroLicenciaRepresentante decimal (5,0) not null,
constraint pk_actores primary key (id),
constraint fk_actores_representantes foreign key (numeroLicenciaRepresentante)
	references representantes (numeroLicencia)
);

#Test
insert into representantes (
numeroLicencia,
nombre) values
(12345, 'representate 12345'),
(56789, 'representate 56789');

insert into actores (
nombreArtistico,
nombreReal,
numeroLicenciaRepresentante) values
('Penelope Cruz', 'Penélope Cruz Sánchez', 12345),
('Javier Bardem', 'Javier Ángel Encinas Bardem', 12345);

select * from representantes;
select * from actores;













