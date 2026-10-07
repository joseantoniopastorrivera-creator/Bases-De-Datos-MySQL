drop database if exists actividad2_15;
create database actividad2_15;
use actividad2_15;



create table posiciones (
id int not null auto_increment,
descripcion varchar(50) not null,
constraint pk_posiciones primary key (id)
);

create table presidentes (
id int not null auto_increment,
DNI char (9) not null unique,
nombre varchar(50) not null,
apellidos varchar(100) not null,
fecha_nacimiento date not null,
anio_elegido year not null,
constraint pk_presidentes primary key (id)
);

create table equipos (
id int not null auto_increment,
nombre varchar(50) not null,
nombre_estadio varchar(50) not null,
ciudad varchar(50) not null,
aforo numeric (5,0) not null,
anio_fundacion year not null,
id_presidente int not null,
constraint pk_equipos primary key (id),
constraint foreign key fk_equipos_presidentes (id_presidente) references presidentes (id)
);

create table jugadores (
id int not null auto_increment,
nombre varchar(50) not null,
fecha_nacimiento date not null,
id_equipo int not null,
id_posicion int not null,
constraint pk_jugadores primary key (id),
constraint foreign key fk_jugadores_posiciones (id_posicion) references posiciones (id),
constraint foreign key fk_jugadores_equipos (id_equipo) references equipos (id)
);

create table partidos (
id int not null auto_increment,
resultado varchar(5) not null, #xx - xx
fecha date not null,
id_equipo_local int not null,
id_equipo_visitante int not null,
constraint pk_partidos primary key (id),
constraint foreign key fk_partidos_equipos_local (id_equipo_local) references equipos (id),
constraint foreign key fk_partidos_equipos_visitante (id_equipo_visitante) references equipos (id)
);

create table goles (
id int not null auto_increment,
descripcion varchar(50) not null,
minuto numeric (2,0) not null,
local_visitante enum('Local','Visitante'),
id_partido int not null,
id_jugador int not null,
constraint pk_partidos primary key (id),
constraint foreign key fk_partidos_partido (id_partido) references partidos (id),
constraint foreign key fk_partidos_equipos_jugadores (id_jugador) references jugadores(id)
);






create table clientes (
id int not null auto_increment,
nombre varchar(50) not null,
apellidos varchar(50) not null,
direccion varchar(100) not null,
telefono char(9) not null unique,
constraint pk_clientes primary key (id)
);

create table productos (
id  int not null auto_increment,
descripcion varchar(500) not null,
precio decimal (5,0) not null,
existencias decimal (4,0) not null,
constraint pk_productos primary key (id)
);

create table proveedores (
id int not null auto_increment,
nombre varchar(50) not null,
CIF char (10) not null,
direccion varchar(100) not null,
telefono char(9) not null unique,
constraint pk_proveedores primary key (id)
);


create table provisiones (
id_producto int not null,
id_proveedor int not null,
fecha date not null,
constraint primary key pk_provisiones (id_producto, id_proveedor),
constraint foreign key fk_provisiones_productos (id_proveedor) references proveedores (id),
constraint foreign key fk_provisiones_clientes (id_producto) references productos (id)
);


create table ventas (
id_producto int not null,
id_cliente int not null,
fecha date not null,
constraint primary key pk_ventas (id_producto, id_cliente, fecha),
constraint foreign key fk_ventas_productos (id_producto) references productos (id),
constraint foreign key fk_ventas_clientes (id_cliente) references clientes (id)
);


