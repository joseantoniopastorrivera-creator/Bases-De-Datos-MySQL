drop database if exists actividad4_1;
create database actividad4_1;
use actividad4_1;

create table clientes (
    id_cliente int primary key,
    nombre varchar(50),
    ciudad varchar(50)
);

create table mascotas (
    id_mascota int primary key,
    nombre_mascota varchar(50),
    especie varchar(20),
    id_cliente int
);

create table citas (
    id_cita int primary key,
    id_mascota int,
    fecha date,
    coste decimal(10,2)
);

insert into clientes values 
(1, 'Carlos Ruiz', 'Madrid'),
(2, 'Laura Gil', 'Barcelona'),
(3, 'Pedro Sanz', 'Madrid'),
(4, 'Marta Soto', 'Sevilla');

insert into mascotas values 
(10, 'Rex', 'Perro', 1),
(20, 'Michi', 'Gato', 1),
(30, 'Piolín', 'Pájaro', 2),
(40, 'Firulais', 'Perro', 3),
(50, 'Nemo', 'Pez', NULL); # Mascota sin dueño (en adopción)

insert into citas values 
(100, 10, '2024-01-10', 50.00),
(101, 10, '2024-02-15', 30.00),
(102, 20, '2024-01-20', 45.00),
(103, 30, '2024-03-01', 25.00),
(104, 60, '2024-03-10', 40.00); # Cita de mascota que ya no existe

#Nombre del cliente, el nombre de su mascota y la fecha de sus citas (solo deben aparecer si tienen los tres datos).
select cl.nombre as nombre_cliente, 
ma.nombre_mascota as nombre_mascota,
ci.fecha as fecha_cita
from clientes cl
inner join mascotas ma
on cl.id_cliente = ma.id_cliente
inner join citas ci
on ma.id_mascota=ci.id_mascota;

#Muestra todos los clientes y el nombre de sus mascotas. Si un cliente no tiene mascota debe aparecer su nombre y "<sin mascota>".
select cl.nombre as nombre_cliente, 
ifnull(ma.nombre_mascota,'<sin mascota>') as nombre_mascota
from clientes cl
left join mascotas ma
on cl.id_cliente = ma.id_cliente;

#Muestra todas las mascotas y el nombre de su dueño. Si una mascota no tiene dueño deberá aparecer "<sin dueño>".
select ifnull(cl.nombre, 'sin dueño') as nombre_cliente, 
ma.nombre_mascota as nombre_mascota
from clientes cl
right join mascotas ma
on cl.id_cliente = ma.id_cliente;

#Muestra el nombre de cada cliente y el coste total que ha gastado en citas.
select cl.nombre as nombre, sum(ci.coste) as coste_total
from clientes cl
inner join mascotas ma
on cl.id_cliente = ma.id_cliente
inner join citas ci
on ma.id_mascota=ci.id_mascota 
group by cl.id_cliente;

#Lista todas las mascotas que tengan dueño, la fecha de sus citas y el nombre de su dueño, ordenado por fecha de cita. Deben aparecer incluso las mascotas que nunca han tenido una cita.
select ma.nombre_mascota as nombre_mascota,
cl.nombre as nombre_dueno,
ci.fecha as fecha_cita
from clientes cl
inner join mascotas ma
on cl.id_cliente = ma.id_cliente
left join citas ci
on ma.id_mascota=ci.id_mascota
order by ci.fecha;








