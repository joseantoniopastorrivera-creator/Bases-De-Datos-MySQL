drop database if exists actividad2_4;
create database actividad2_4;
use actividad2_4;

create table empleados (
    id_empleado int primary key,
    nombre varchar(50),
    departamento varchar(50),
    salario decimal(10,2)
);

insert into empleados values
(1, 'Ana', 'IT', 2200),
(2, 'Luis', 'IT', 2100),
(3, 'Marta', 'Ventas', 1800),
(4, 'Carlos', 'Ventas', 1900),
(5, 'Laura', 'RRHH', 2000);


select departamento, avg(salario) as salario_medio
from empleados
group by departamento;

select departamento, avg(salario) as salario_medio
from empleados
group by departamento
having salario_medio > 2000;

select departamento, count(*) as total_empleados
from empleados
group by departamento;


