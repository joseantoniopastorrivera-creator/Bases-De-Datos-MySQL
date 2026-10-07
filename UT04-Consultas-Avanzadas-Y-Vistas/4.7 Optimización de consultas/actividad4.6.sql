drop database if exists actividad4_6;
create database actividad4_6;
use actividad4_6;

create table cliente (
  id int unsigned auto_increment primary key,
  nombre varchar(100) not null,
  apellido1 varchar(100) not null,
  apellido2 varchar(100),
  ciudad varchar(100),
  categoria int unsigned
);

create table comercial (
  id int unsigned auto_increment primary key,
  nombre varchar(100) not null,
  apellido1 varchar(100) not null,
  apellido2 varchar(100),
  comision float
);

create table pedido (
  id int unsigned auto_increment primary key,
  total double not null,
  fecha date,
  id_cliente int unsigned not null,
  id_comercial int unsigned not null,
  foreign key (id_cliente) references cliente(id),
  foreign key (id_comercial) references comercial(id)
);

insert into cliente values(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
insert into cliente values(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
insert into cliente values(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
insert into cliente values(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
insert into cliente values(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
insert into cliente values(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
insert into cliente values(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
insert into cliente values(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
insert into cliente values(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
insert into cliente values(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

insert into comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
insert into comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
insert into comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
insert into comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
insert into comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
insert into comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
insert into comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
insert into comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

insert into pedido values(1, 150.5, '2017-10-05', 5, 2);
insert into pedido values(2, 270.65, '2016-09-10', 1, 5);
insert into pedido values(3, 65.26, '2017-10-05', 2, 1);
insert into pedido values(4, 110.5, '2016-08-17', 8, 3);
insert into pedido values(5, 948.5, '2017-09-10', 5, 2);
insert into pedido values(6, 2400.6, '2016-07-27', 7, 1);
insert into pedido values(7, 5760, '2015-09-10', 2, 1);
insert into pedido values(8, 1983.43, '2017-10-10', 4, 6);
insert into pedido values(9, 2480.4, '2016-10-10', 8, 3);
insert into pedido values(10, 250.45, '2015-06-27', 8, 2);
insert into pedido values(11, 75.29, '2016-08-17', 3, 7);
insert into pedido values(12, 3045.6, '2017-04-25', 2, 1);
insert into pedido values(13, 545.75, '2019-01-25', 6, 1);
insert into pedido values(14, 145.82, '2017-02-02', 6, 1);
insert into pedido values(15, 370.85, '2019-03-11', 1, 5);
insert into pedido values(16, 2389.23, '2019-03-11', 1, 5);



#Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
select 
cl.* #no recomendado esta forma, es mejor especificar las columnas
from pedido pe
inner join cliente cl
on pe.id_cliente=cl.id
where year(pe.fecha)=2017 and
pe.total between 300 and 1000;


#Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
select 
co.nombre as nombre,
co.apellido1 as apellido1,
co.apellido2 as apellido2,
co.comision as comision,
pe.id as id_pedido,
pe.fecha as fecha,
pe.total as total,
pe.id_cliente as id_cliente
from pedido pe
right join comercial co
on pe.id_comercial=co.id 
order by co.apellido1, co.apellido2, co.nombre;



#Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
select 
cl.nombre as nombre,
cl.apellido1 as apellido1,
cl.apellido2 as apellido2
from 
cliente cl
where cl.id not in 
  (select id_cliente
   from pedido);

#Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
select 
'Cliente' as Tipo,
cl.nombre as nombre,
cl.apellido1 as apellido1,
cl.apellido2 as apellido2
from 
cliente cl
left join pedido pe
on pe.id_cliente=cl.id
where pe.id_cliente is null
union
select 
'Comercial' as  Tipo,
co.nombre as nombre,
co.apellido1 as apellido1,
co.apellido2 as apellido2
from comercial co
left join pedido pe2
on pe2.id_comercial=co.id
where pe2.id_comercial is null
order by apellido1, apellido2, nombre;

#Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
select 
cl.nombre as nombre,
cl.apellido1 as apellido1,
cl.apellido2 as apellido2,
pe.fecha,
max(total) as maximo
from pedido pe
inner join cliente cl
on cl.id=pe.id_cliente
group by pe.id_cliente,pe.fecha
having maximo > 2000;


#Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0
select 
cl.nombre as nombre,
cl.apellido1 as apellido1,
cl.apellido2 as apellido2,
count(pe.id_cliente) as numero_pedidos 
from pedido pe
right join cliente cl
on cl.id=pe.id_cliente
group by cl.id;


#Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año
select
year(pe.fecha) as anio,
max(pe.total) as maximo
from pedido pe
group by anio;

