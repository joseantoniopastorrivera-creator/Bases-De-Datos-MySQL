drop database if exists actividad5_1;
create database actividad5_1;
use actividad5_1;


create table empleados (
    id_empleado int primary key,
    nombre varchar(50),
    departamento varchar(50),
    salario decimal(10,2)
);



insert into empleados (id_empleado, nombre, departamento, salario) values
(1, 'Ana',   'Ventas',      2500.00),
(2, 'Luis',  'Ventas',      3000.00),
(3, 'Marta', 'IT',          4000.00),
(4, 'Pedro', 'IT',          4500.00),
(5, 'Sofía', 'RRHH',        2000.00),
(6, 'Carlos','RRHH',        2200.00),
(7, 'Laura', 'Finanzas',    5000.00);

#Obtener los departamentos cuyo salario promedio sea mayor que el salario promedio general de toda la empresa
select d.departamento, d.promedio_departamento
from (
    select departamento, avg(salario) as promedio_departamento
    from empleados
    group by departamento
) as d
where d.promedio_departamento > (
    select avg(salario)
    from empleados
);

#Tambien
select departamento, avg(salario) as promedio_departamento
    from empleados
    group by departamento
    having promedio_departamento > 
     (select avg(salario)
      from empleados)
