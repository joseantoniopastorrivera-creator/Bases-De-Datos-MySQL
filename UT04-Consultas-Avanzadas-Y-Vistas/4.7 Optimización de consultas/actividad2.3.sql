drop database if exists actividad2_3;
create database actividad2_3;
use actividad2_3;

create table pedidos (
    id_pedido int primary key,
    cliente varchar(50),
    ciudad varchar(50),
    total decimal(10,2)
);

insert into pedidos values
(1, 'Carlos', 'Madrid', 300),
(2, 'Carlos', 'Madrid', 150),
(3, 'Laura', 'Sevilla', 500),
(4, 'Laura', 'Sevilla', 200),
(5, 'Pedro', 'Madrid', 100);

select cliente, sum(total) as gastado
from pedidos
group by cliente;

select cliente, sum(total) as gastado
from pedidos
group by cliente
having gastado > 400;

select ciudad, avg(total)
from pedidos
group by ciudad ;


