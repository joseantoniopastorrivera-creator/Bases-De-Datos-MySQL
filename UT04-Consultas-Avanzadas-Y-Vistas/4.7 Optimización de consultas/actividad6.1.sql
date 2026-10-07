drop database if exists actividad6_1;
create database actividad6_1;
use actividad6_1;


create table productos (
    id_producto int primary key,
    nombre varchar(50),
    categoria varchar(50)
);

create table ventas (
    id_venta int primary key,
    id_producto int,
    cantidad int,
    foreign key (id_producto) references productos(id_producto)
);

insert into productos (id_producto, nombre, categoria) values
(1, 'laptop', 'tecnologia'),
(2, 'mouse', 'tecnologia'),
(3, 'silla', 'hogar'),
(4, 'mesa', 'hogar'),
(5, 'balon', 'deportes');

insert into ventas (id_venta, id_producto, cantidad) values
(1, 1, 5),
(2, 1, 3),
(3, 2, 10),
(4, 3, 7),
(5, 3, 2),
(6, 4, 4),
(7, 5, 12);

#Inner join de las 2 tablas
create view producto_venta as
select 
pr.id_producto as id_producto,
pr.nombre as nombre,
pr.categoria as categoria,
ve.id_venta as id_venta,
ve.cantidad as cantidad
from 
productos pr
inner join ventas ve
on ve.id_producto=pr.id_producto;

#Total ventas por categoría y producto
create view producto_categoria_venta as
select
pr.id_producto as id_producto,
pr.nombre as nombre,
pr.categoria as categoria,
sum(ve.cantidad) as total_cantidad
from
productos pr
inner join ventas ve
on ve.id_producto=pr.id_producto
group by id_producto, categoria;

#Máximo ventas por categoría
create view maximo_categoria_venta as
select
categoria,
max(total_cantidad) as total_cantidad
from
producto_categoria_venta
group by categoria;

#
create view maximo_producto_categoria_venta as 
select 
pcv.id_producto as id_producto,
pcv.nombre as nombre,
pcv.categoria as categoria,
pcv.total_cantidad as total_cantidad
from 
producto_categoria_venta pcv
inner join maximo_categoria_venta mcv
on pcv.categoria=mcv.categoria and
pcv.total_cantidad=mcv.total_cantidad;

   
