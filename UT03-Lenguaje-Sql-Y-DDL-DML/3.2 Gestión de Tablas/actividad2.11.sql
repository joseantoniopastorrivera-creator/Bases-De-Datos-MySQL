drop database if exists actividad2_11;
create database actividad2_11;
use actividad2_11;

create table clientes (
DNI char (9) not null,
nombre varchar(50) not null,
apellidos varchar(50) not null,
direccion varchar(100) not null,
fecha_nacimiento date not null,
constraint pk_clientes primary key (DNI)
);

create table proovedores (
CIF char (10) not null,
nombre varchar(50) not null,
direccion varchar(100) not null,
constraint pk_proveedores primary key (CIF)
);

create table productos (
codigo decimal (6,0) not null,
nombre varchar(50) not null,
precio decimal (5,0) not null,
CIF_proveedor char (10) not null,
constraint pk_productos primary key (codigo),
constraint fk_productos_proveedores foreign key (CIF_proveedor) references proovedores (CIF)
);

create table compras (
DNI_cliente char (9) not null,
codigo_producto decimal (6,0) not null,
constraint primary key pk_compras (DNI_cliente, codigo_producto),
constraint foreign key fk_compras_clientes (DNI_cliente) references clientes (DNI),
constraint foreign key fk_compras_productos (codigo_producto) references productos (codigo)
);

insert into clientes (
DNI,
nombre,
apellidos,
direccion,
fecha_nacimiento) values
('00000001R', 'nombre1', 'apellidos1', 'direccion1', '20010101'),
('00000002W', 'nombre2', 'apellidos2', 'direccion2', '20020202'),
('00000003A', 'nombre3', 'apellidos3', 'direccion3', '20030303');

insert into proovedores (
CIF,
nombre,
direccion) values 
('A00000001', 'proveedor1', 'direccion 1'), 
('A00000002', 'proveedor2', 'direccion 2'); 

insert into productos (
codigo,
nombre,
precio,
CIF_proveedor) values 
(1,'Producto1', 1.00,'A00000001'),
(2,'Producto2', 2.00,'A00000002'),
(3,'Producto3', 3.00,'A00000001'),
(4,'Producto4', 4.00,'A00000002'),
(5,'Producto5', 5.00,'A00000001');

insert into compras (
DNI_cliente,
codigo_producto) values 
('00000001R',1),
('00000001R',2),
('00000002W',1),
('00000002W',2),
('00000003A',1),
('00000003A',2),
('00000003A',3),
('00000003A',4),
('00000003A',5);

select * from clientes;
select * from productos;
select * from proveedores;
select * from compras;




