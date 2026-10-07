drop database if exists actividad2_17;
create database actividad2_17;
use actividad2_17;

create table clientes (
id int not null auto_increment,
nombre varchar(150) not null,
dni char(9) null,
pasaporte char(9) null,
telefono char(9) not null unique,
constraint pk_clientes primary key (id),
#chequear que hay dni ó pasaporte, pero no ambos
constraint chk_dni_pasaporte check ((pasaporte is not null and dni is null) or (dni is not null and pasaporte is null)) 
);

create table tipo_habitacion (
id int not null auto_increment,
descripcion varchar(50) not null,
constraint pk_tipo_habitacion primary key (id)
);

create table categorias (
id int not null auto_increment,
descripcion varchar(50) not null,
constraint pk_categorias primary key (id)
);

create table tipo_categorias(
id int not null auto_increment,
valor_iva numeric (4,2) not null,
constraint pk_tipo_iva primary key (id)
);

create table hoteles (
id int not null auto_increment,
nombre varchar(50) not null,
direccion varchar(200) not null,
telefono char(9) not null,
id_categoria int not null, 
constraint pk_hoteles primary key (id),
constraint fk_hoteles_categoria foreign key  (id_categoria) references categorias (id)
);


create table agencias_viajes(
id int not null auto_increment,
nombre varchar(50) not null,
id_cliente int not null,
constraint pk_tipo_iva primary key (id),
constraint fk_departamentos_centros_trabajo foreign key  (id_cliente) references clientes (id)
);


create table habitaciones(
numero numeric (4,0) not null,
nombre varchar(50) not null,
id_cliente int not null,
constraint pk_habitaciones primary key (numero),
constraint fk_habitaciones_clientes foreign key  (id_cliente) references clientes (id)
);



create table reservas (
id_cliente int not null,
numero_habitacion numeric (4,0) not null,
fecha_inicio date not null,
fecha_fin date not null,
precio numeric (5,2) not null,
constraint pk_reservas primary key (id_cliente, numero_habitacion, fecha_inicio, fecha_fin), 
constraint fk_reservas_clientes foreign key (id_cliente) references clientes (id),
constraint fk_reservas_habitaciones foreign key (numero_habitacion) references habitaciones (numero)
);


