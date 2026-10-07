drop database if exists actividad2_5;
create database actividad2_5;
use actividad2_5;

create table categorias (
codigo int not null auto_increment,
descripcion varchar(50) not null,
constraint pk_categorias primary key (codigo)
);


create table productos (
id int not null auto_increment,
nombre varchar(50) not null,
precio decimal (4,2) not null,
descripcion varchar(50) not null,
codigo_categoria int not null,
constraint pk_productos primary key (id),
constraint fk_productos_categorias foreign key (codigo_categoria)
	references categorias (codigo) on delete cascade
);

#Test
insert into categorias (
codigo,
descripcion) values 
(1, 'pescado'),
(2, 'fruta');


insert into productos (
id,
nombre,
precio,
descripcion,
codigo_categoria) values
(1, 'manzana', 2.70, 'manzanas golden',2),
(2, 'pera', 1.30, 'peras de agual',2),
(3, 'emperador', 5.71, 'emperador pescado en el Atlántico',1),
(4, 'merluza', 7.71, 'pescado en el Atlántico sur',1);

select * from categorias;
select * from productos;
