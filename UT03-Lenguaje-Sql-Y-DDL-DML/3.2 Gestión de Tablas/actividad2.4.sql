--create table actores (
--codigo int not null auto_increment,
--nombre varchar (50) not null unique,
--fecha_nacimiento date not null,
--constraint pk_actores primary key (codigo),
--constraint chk_fecha_nacimiento check (fecha_nacimiento > '1900-1-1')
--);

create table personajes (
codigo int not null auto_increment,
nombre varchar (50) not null unique,
codigo_actor int not null,
constraint pk_personajes primary key (codigo),
constraint fk_personajes_actores foreign key (codigo_actor) references actores(codigo) on delete cascade
);
