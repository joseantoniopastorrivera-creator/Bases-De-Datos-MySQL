drop database if exists actividad5_3;
create database actividad5_3;
use actividad5_3;


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

#Paso para ir obteniendo
#select *
#from 
#ventas ve 
#inner join productos pr
#on ve.id_producto=pr.id_producto;
#
#select 
#pr.categoria as categoria,
##pr.nombre,
#pr.id_producto as id_producto,
#sum(ve.cantidad) as total_cantidad
#from 
#ventas ve 
#inner join productos pr
#on ve.id_producto=pr.id_producto
#group by pr.categoria, pr.id_producto;
#
#
#select
#   total_ventas.categoria,
#   max(total_ventas.total_cantidad) as max_cantidad
#   from
#     (select 
#      pr.categoria as categoria,
#      pr.id_producto as id_producto,
#      sum(ve.cantidad) as total_cantidad
#      from 
#      ventas ve 
#      inner join productos pr
#      on ve.id_producto=pr.id_producto
#      group by pr.categoria, pr.id_producto) as total_ventas
#group by total_ventas.categoria;

#hacemos inner join de tabla de ventas por producto-categoria, ventas máximas por categoria y productos


select 
pr.nombre,
ventas_maximas.categoria,
ventas_maximas.max_cantidad
from
productos pr
inner join 
  (select 
   pr.categoria as categoria,
   pr.id_producto as id_producto,
   sum(ve.cantidad) as total_cantidad
   from 
   ventas ve 
   inner join productos pr
   on ve.id_producto=pr.id_producto
   group by pr.categoria, pr.id_producto) as ventas
on pr.id_producto=ventas.id_producto
inner join 
  (select
   total_ventas.categoria,
   max(total_ventas.total_cantidad) as max_cantidad
   from
     (select 
      pr.categoria as categoria,
      pr.id_producto as id_producto,
      sum(ve.cantidad) as total_cantidad
      from 
      ventas ve 
      inner join productos pr
      on ve.id_producto=pr.id_producto
      group by pr.categoria, pr.id_producto) as total_ventas
   group by total_ventas.categoria) as ventas_maximas
on ventas.categoria=ventas_maximas.categoria
where ventas.total_cantidad=ventas_maximas.max_cantidad;

#Otra forma es agrupando por nombre, pero no sería del todo correcto porque podría haber productos con el mismo nombre (no es pk ni unique)
#Pasos para ir obteniendo

#select *
#from 
#ventas ve 
#inner join productos pr
#on ve.id_producto=pr.id_producto;
#
#
#select 
#pr.categoria as categoria,
#pr.nombre as nombre,
#sum(ve.cantidad) as total_cantidad
#from 
#ventas ve 
#inner join productos pr
#on ve.id_producto=pr.id_producto
#group by pr.categoria, pr.nombre;
#
#select 
#total_ventas.categoria,
#max(total_ventas.total_cantidad)
#from
#  (select 
#   pr.categoria as categoria,
#   pr.nombre as nombre,
#   sum(ve.cantidad) as total_cantidad
#   from 
#   ventas ve 
#   inner join productos pr
#   on ve.id_producto=pr.id_producto
#   group by pr.categoria, pr.nombre) as total_ventas
#group by total_ventas.categoria;
#
#
#select 
#total_ventas.categoria,
#max(total_ventas.total_cantidad)
#from
#  (select 
#   pr.categoria as categoria,
#   pr.nombre as nombre,
#   sum(ve.cantidad) as total_cantidad
#   from 
#   ventas ve 
#   inner join productos pr
#   on ve.id_producto=pr.id_producto
#   where categoria='Tecnología'
#   group by pr.categoria, pr.nombre) as total_ventas
#group by total_ventas.categoria;



select 
pr.categoria as categoria3,
pr.nombre as nombre,
sum(ve.cantidad) as total_cantidad
from 
ventas ve 
inner join productos pr
on ve.id_producto=pr.id_producto
group by pr.categoria, pr.nombre 
having total_cantidad=
  (select 
   #total_ventas.categoria,
   max(total_ventas.total_cantidad2)
   from
     (select 
      pr2.categoria,
      pr2.nombre,
      sum(ve2.cantidad) as total_cantidad2
      from 
      ventas ve2 
      inner join productos pr2
      on ve2.id_producto=pr2.id_producto
      where pr2.categoria=categoria3
      group by pr2.categoria, pr2.nombre) as total_ventas
      group by total_ventas.categoria);


#Otras

#select 
#pr2.categoria as categoria,
#pr2.id_producto as id_producto,
#sum(ve2.cantidad) as total_cantidad
#from 
#ventas ve2 
#inner join productos pr2
#on ve2.id_producto=pr2.id_producto
#group by pr2.categoria, pr2.id_producto
#having total_cantidad=
#  (select
#   #total_ventas.categoria as categoria,
#   max(total_ventas.total_cantidad) as max_cantidad
#   from
#     (select 
#      pr.categoria as categoria,
#      pr.id_producto as id_producto,
#      sum(ve.cantidad) as total_cantidad
#      from 
#      ventas ve 
#      inner join productos pr
#      on ve.id_producto=pr.id_producto
#      group by pr.categoria, pr.id_producto) as total_ventas
#   where total_ventas.categoria=pr2.categoria
#   group by total_ventas.categoria);

#select 
#p.nombre as nombre,
#p.categoria as categoria_total,
#sum(v.cantidad) as cantidad_total
#from ventas v
#inner join productos p
#on v.id_producto=p.id_producto
#group by v.id_producto
#having cantidad_total=
#   (select 
##   ventas1.categoria as categoria1,
#   max(ventas1.total_cantidad) as max_ventas
#   from
#     (select 
#      p1.nombre as nombre,
#      p1.categoria as categoria,
#      sum(v1.cantidad) as total_cantidad
#      from ventas v1
#      inner join productos p1
#      on v1.id_producto=p1.id_producto
#      group by v1.id_producto) as ventas1
#   where ventas1.categoria=categoria_total
#   group by ventas1.categoria);
