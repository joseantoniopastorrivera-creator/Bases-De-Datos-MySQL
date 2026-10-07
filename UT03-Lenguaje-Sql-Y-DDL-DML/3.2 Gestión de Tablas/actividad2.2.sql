create table planetas (
id int not null auto_increment,
nombre varchar (50) not null,
distancia_tierra numeric (10,0) not null,
constraint pk_planetas primary key (id),
constraint chk_distnacia check (distancia_tierra > 0)
);
