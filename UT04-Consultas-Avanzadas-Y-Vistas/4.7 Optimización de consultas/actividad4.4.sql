drop database if exists actividad4_4;
create database actividad4_4;
use actividad4_4;

create table clientes (
    id_cliente int primary key,
    nombre varchar(50),
    pais_residencia varchar(30)
);

create table productos (
    id_producto int primary key,
    nombre_prod varchar(50),
    precio decimal(10,2),
    categoria varchar(20)
);

create table transportistas (
    id_transp int primary key,
    empresa varchar(50),
    metodo_envio varchar(20) -- aéreo, marítimo, terrestre
);

create table pedidos (
    id_pedido int primary key,
    id_cliente int,
    id_producto int,
    id_transp int,
    fecha_pedido date,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_producto) references productos(id_producto),
    foreign key (id_transp) references transportistas(id_transp)
);

insert into clientes values (1, 'Alice Smith', 'USA'), (2, 'Hans Müller', 'Alemania'), (3, 'Yuki Tanaka', 'Japón');
insert into productos values (10, 'Smartphone X', 800, 'Tech'), (20, 'Laptop Pro', 1200, 'Tech'), (30, 'Cafetera', 150, 'Hogar');
insert into transportistas values (100, 'DHL', 'Aéreo'), (200, 'Maersk', 'Marítimo'), (300, 'FedEx', 'Aéreo');

insert into pedidos values 
(501, 1, 10, 100, '2024-05-01'), 
(502, 1, 20, 100, '2024-05-02'), 
(503, 2, 10, 200, '2024-05-05'), 
(504, 3, 30, 300, '2024-05-10'); 

#Muestra el id_pedido, el nombre del cliente, el nombre del producto y la empresa de transporte de todos los pedidos.
select 
pe.id_pedido as id_pedido,
cl.nombre as nombre_cliente,
pr.nombre_prod as nombre_producto,
tr.empresa as empresa_transporte
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join productos pr
on pe.id_producto = pr.id_producto
inner join transportistas tr
on pe.id_transp=tr.id_transp;

#Lista los nombres de los clientes que han comprado productos de la categoría 'Tech' y cuyo envío ha sido 'Aéreo'.
select 
distinct(cl.nombre) as nombre_cliente
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join productos pr
on pe.id_producto = pr.id_producto
inner join transportistas tr
on pe.id_transp=tr.id_transp 
where pr.categoria='Tech'
and tr.metodo_envio='Aéreo';

#Queremos saber qué productos (nombre) se han enviado a 'USA' usando el método 'Aéreo'.
select 
distinct(pr.nombre_prod) as nombre_producto
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join productos pr
on pe.id_producto = pr.id_producto
inner join transportistas tr
on pe.id_transp=tr.id_transp 
where cl.pais_residencia='USA'
and tr.metodo_envio='Aéreo';

#Obtén una lista sin repetición de los países de residencia de los clientes que han usado a 'Maersk' como transportista.
select 
distinct (cl.pais_residencia) as pais_residencia
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join transportistas tr
on pe.id_transp=tr.id_transp 
where tr.empresa='Maersk';

#Muestra el nombre del cliente y el nombre de la empresa de transporte, pero solo para aquellos pedidos donde el precio del producto sea mayor a 500€.
select 
cl.nombre as nombre_cliente,
tr.empresa as empresa_transporte
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join productos pr
on pe.id_producto = pr.id_producto
inner join transportistas tr
on pe.id_transp=tr.id_transp 
where pr.precio > 500;

#si no queremos repeticion
select 
distinct cl.nombre , tr.empresa 
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join productos pr
on pe.id_producto = pr.id_producto
inner join transportistas tr
on pe.id_transp=tr.id_transp 
where pr.precio > 500;

#también
select 
distinct(concat(cl.nombre,' - ', tr.empresa)) as cliente_empresa
from pedidos pe
inner join clientes cl
on pe.id_cliente=cl.id_cliente
inner join productos pr
on pe.id_producto = pr.id_producto
inner join transportistas tr
on pe.id_transp=tr.id_transp 
where pr.precio > 500;

