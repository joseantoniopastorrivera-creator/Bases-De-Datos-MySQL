drop database if exists actividad2_5;
create database actividad2_5;
use actividad2_5;

create table reservas (
    id_reserva int primary key,
    hotel varchar(50),
    cliente varchar(50),
    noches int,
    precio_noche decimal(6,2)
);

insert into reservas values
(1, 'Hotel Sol', 'Ana', 3, 80),
(2, 'Hotel Sol', 'Luis', 2, 80),
(3, 'Hotel Mar', 'Marta', 5, 120),
(4, 'Hotel Mar', 'Carlos', 1, 120),
(5, 'Hotel Sol', 'Pedro', 4, 80);

select hotel, sum(noches) total_noches
from reservas
group by hotel;


select hotel, sum(noches) total_noches
from reservas
group by hotel
having total_noches > 5;

select hotel, avg(precio_noche) precio_medio_noche
from reservas
group by hotel;
