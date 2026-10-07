drop database if exists actividad2_18;
create database actividad2_18;
use actividad2_18;

create table arbitros (
id int not null auto_increment,
nombre varchar(50) not null,
constraint pk_arbitros primary key (id)
);

create table torneos (
id int not null auto_increment,
nombre varchar(50) not null,
constraint pk_torneos primary key (id)
);

create table fases (
id int not null auto_increment,
fase varchar(50) not null,
constraint pk_fases primary key (id)
);

create table modalidad (
id int not null auto_increment,
modalidad varchar(50) not null,
constraint pk_modalidad primary key (id)
);

create table paises (
id int not null auto_increment,
pais varchar(50) not null,
constraint pk_paises primary key (id)
);

create table edicion (
anio year not null,
id_torneo int not null,
constraint pk_edicion primary key (anio,id_torneo),
constraint fk_edicion_torneos foreign key (id_torneo) references torneos (id)
);

create table ciudades (
id int not null auto_increment,
ciudad varchar(50) not null,
id_pais int not null,
constraint pk_ciudades primary key (id),
constraint fk_ciudades_paises foreign key (id_pais) references paises (id)
);

create table jugadores (
id int not null auto_increment,
nombre varchar(100) not null,
id_pais int not null,
constraint pk_jugadores primary key (id),
constraint fk_jugadores_paises foreign key (id_pais) references paises (id)
);

create table partidos (
id int not null auto_increment,
resultado varchar(10) not null,
premio_ganador numeric (6,0) null,
premio_consolacion numeric (6,0) null,
id_torneo int not null,
id_edicion_anio year not null,
id_ciudad int not null,
id_fase int not null,
id_modalidad int not null,
id_arbitro int not null,
id_jugador1 int not null,
id_jugador1_doble int not null,
id_jugador2 int not null,
id_jugador2_doble int not null,
constraint pk_partidos primary key (id),
constraint fk_torneos_edicion foreign key (id_torneo,id_edicion_anio) references edicion (id_torneo,anio),
constraint fk_ciudades_partidos foreign key (id_ciudad) references ciudades (id),
constraint fk_fases_partidos foreign key (id_fase) references fases (id),
constraint fk_modalidad_partidos foreign key (id_modalidad) references modalidad (id),
constraint fk_arbitros_partidos foreign key (id_arbitro) references arbitros (id),
constraint fk_jugadores1_partidos foreign key (id_jugador1) references jugadores (id),
constraint fk_jugadores1_doble_partidos foreign key (id_jugador1_doble) references jugadores (id),
constraint fk_jugadores2_partidos foreign key (id_jugador2) references jugadores (id),
constraint fk_jugadores2_doble_partidos foreign key (id_jugador2_doble) references jugadores (id)
);


