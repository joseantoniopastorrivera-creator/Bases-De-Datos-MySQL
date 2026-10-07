drop database if exists actividad3_4;
create database actividad3_4;
use actividad3_4;

create table productos (
    id_producto int primary key,
    nombre varchar(50),
    precio decimal(10,2)
);

create table ventas (
    id_venta int primary key,
    id_producto int,
    cantidad int
);

insert into productos values
(1, 'Teclado', 30),
(2, 'Ratón', 20),
(3, 'Monitor', 200);

insert into ventas values
(1, 1, 5),
(2, 3, 1);

#Productos que han sido vendidos.
select * 
from productos
where
id_producto in
(
  select id_producto
  from ventas
);


#Productos con el precio máximo.
select * 
from productos
where
precio in
(
  select max(precio)
  from productos
);


#Productos con precio mayor que todos los vendidos.
select *
from productos p
where precio > all
(
  select precio
  from productos p2
  where p2.id_producto <> p.id_producto
  and id_producto in
    (
      select id_producto
      from ventas
    )
);

#Productos con precio mayor que alguno de los vendidos.
select *
from productos p
where precio > any
(
  select precio
  from productos p2
  where p2.id_producto <> p.id_producto
  and id_producto in
    (
      select id_producto
      from ventas
    )
);

