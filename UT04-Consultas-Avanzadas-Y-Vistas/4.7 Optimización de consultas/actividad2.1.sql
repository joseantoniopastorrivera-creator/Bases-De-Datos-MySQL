drop database if exists actividad2_1;
create database actividad2_1;
use actividad2_1;

create table ventas (
    id_venta int primary key,
    vendedor varchar(50),
    producto varchar(50),
    importe decimal(10,2)
);

insert into ventas values
(1, 'Ana', 'Portátil', 1200),
(2, 'Ana', 'Ratón', 50),
(3, 'Luis', 'Portátil', 800),
(4, 'Luis', 'Monitor', 300),
(5, 'Marta', 'Ratón', 40),
(6, 'Marta', 'Monitor', 250),
(7, 'Ana', 'Monitor', 300);

select vendedor, sum(importe) as total
from ventas
group by vendedor;

select vendedor, sum(importe) as total
from ventas
group by vendedor
having total > 1000;

select vendedor, avg(importe) as media
from ventas
group by vendedor
having media > 300;
