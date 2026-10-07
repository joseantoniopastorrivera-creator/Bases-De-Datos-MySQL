drop database if exists actividad2_14;
create database actividad2_14;
use actividad2_14;

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


