drop database if exists actividad2_16;
create database actividad2_16;
use actividad2_16;

create table categorias (
id int not null auto_increment,
descripcion varchar(50) not null,
constraint pk_categorias primary key (id)
);

create table centros_trabajo (
id int not null auto_increment,
nombre varchar(50) not null,
direccion varchar(100) not null,
constraint pk_centros_trabajo primary key (id)
);

create table departamentos (
id int not null auto_increment,
nombre varchar(50) not null,
presupuesto numeric (8,2) not null,
id_centro_trabajo int not null,
constraint pk_departamentos primary key (id),
constraint foreign key fk_departamentos_centros_trabajo (id_centro_trabajo) references centros_trabajo (id)
);


create table empleados (
id int not null auto_increment,
nombre varchar(50) not null,
apellidos varchar(100) not null,
telefono char(9) not null unique,
fecha_alta date not null,
salario numeric (8,2) not null,
id_categoria int not null,
id_departamento_asignado int not null,
id_departamento_dirige int not null,
constraint pk_empleados primary key (id),
constraint foreign key fk_empleados_categorias (id_categoria) references categorias (id),
constraint foreign key fk_empleados_departamentos_asignado (id_departamento_asignado) references departamentos (id),
constraint foreign key fk_empleados_departamentos_dirige (id_departamento_dirige) references departamentos (id)
);

create table hijos (
id int not null auto_increment,
nombre varchar(50) not null,
fecha_nacimiento date not null,
id_empleado_padre int null,
id_empleado_madre int null,
constraint pk_hijos primary key (id),
constraint foreign key fk_hijos_empleados_padre (id_empleado_padre) references empleados (id),
constraint foreign key hijos_empleados_padre (id_empleado_madre) references empleados (id),
#check que id padres sean distintos (si existen)
constraint ck_padres check  (id_empleado_padre is null or id_empleado_madre is null or (id_empleado_padre <> id_empleado_madre))
);





