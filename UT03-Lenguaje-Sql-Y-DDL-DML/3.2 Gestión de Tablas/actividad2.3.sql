create table actores (
codigo int not null auto_increment,
nombre varchar (50) not null unique,
fecha_nacimiento date not null,
constraint pk_actores primary key (codigo),
constraint chk_fecha_nacimiento check (fecha_nacimiento > '1900-1-1')
);
