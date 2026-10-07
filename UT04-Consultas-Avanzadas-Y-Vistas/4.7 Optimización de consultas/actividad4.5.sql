drop database if exists actividad4_5;
create database actividad4_5;
use actividad4_5;

create table estudios (
    id_estudio int primary key,
    nombre_estudio varchar(50),
    sede varchar(30)
);

create table plataformas (
    id_plataforma int primary key,
    nombre_plat varchar(30) -- pc, ps5, xbox, switch
);

create table juegos (
    id_juego int primary key,
    titulo varchar(100),
    id_estudio int,
    precio_base decimal(10,2),
    foreign key (id_estudio) references estudios(id_estudio)
);

create table usuarios (
    id_usuario int primary key,
    nickname varchar(50),
    email varchar(50)
);

create table licencias (
    id_licencia varchar(20) primary key,
    id_usuario int,
    id_juego int,
    id_plataforma int,
    fecha_compra date,
    foreign key (id_usuario) references usuarios(id_usuario),
    foreign key (id_juego) references juegos(id_juego),
    foreign key (id_plataforma) references plataformas(id_plataforma)
);

insert into estudios values (1, 'FromSoftware', 'Japón'), (2, 'Naughty Dog', 'EEUU'), (3, 'CD Projekt', 'Polonia');
insert into plataformas values (10, 'PC'), (20, 'PS5'), (30, 'Xbox Series');
insert into juegos values (100, 'Elden Ring', 1, 60.00), (101, 'The Last of Us', 2, 70.00), (102, 'Cyberpunk 2077', 3, 50.00);
insert into usuarios values (1, 'GamerPro99', 'pro@mail.com'), (2, 'ShadowLink', 'shadow@mail.com');

insert into licencias values 
('X-111', 1, 100, 10, '2024-01-10'), 
('X-222', 1, 101, 20, '2024-01-12'), 
('X-333', 2, 100, 20, '2024-02-01'), 
('X-444', 2, 102, 10, '2024-02-05'); 


#Muestra el nickname del usuario, el título del juego, el nombre de la plataforma y el nombre del estudio que lo desarrolló para todas las licencias vendidas.
select 
us.nickname as nickname_usuario,
ju.titulo as titulo_juego,
pl.nombre_plat as nombre_plataforma,
es.nombre_estudio as nombre_estudio
from licencias li
inner join usuarios us
on li.id_usuario=us.id_usuario
inner join juegos ju
on li.id_juego=ju.id_juego
inner join plataformas pl
on li.id_plataforma=pl.id_plataforma 
inner join estudios es
on es.id_estudio=ju.id_estudio;

#También se podría quizás hacer left join por si algún campo de licencias es null (sería más bien un error de diseño de la BD)
select 
us.nickname as nickname_usuario,
ju.titulo as titulo_juego,
pl.nombre_plat as nombre_plataforma,
es.nombre_estudio as nombre_estudio
from licencias li
left join usuarios us
on li.id_usuario=us.id_usuario
left join juegos ju
on li.id_juego=ju.id_juego
left join plataformas pl
on li.id_plataforma=pl.id_plataforma 
inner join estudios es
on es.id_estudio=ju.id_estudio;


#Lista los nicknames de los usuarios que han comprado juegos desarrollados por estudios con sede en 'Japón'.
select 
distinct(us.nickname) as nickname_usuario
from licencias li
inner join usuarios us
on li.id_usuario=us.id_usuario
inner join juegos ju
on li.id_juego=ju.id_juego
inner join estudios es
on es.id_estudio=ju.id_estudio
where es.sede='Japón';

#Muestra los títulos de los juegos (sin repetición) que han sido comprados por usuarios para la plataforma 'PC'.
select  
distinct(ju.titulo) as titulo_juego
from licencias li
inner join juegos ju
on li.id_juego=ju.id_juego
inner join plataformas pl
on li.id_plataforma=pl.id_plataforma 
where pl.nombre_plat='PC';


#Encuentra el email de los usuarios que poseen una licencia de 'Elden Ring' pero específicamente en la plataforma 'PS5'.
select 
distinct(us.email) as email_usuario
from licencias li
inner join usuarios us
on li.id_usuario=us.id_usuario
inner join juegos ju
on li.id_juego=ju.id_juego
inner join plataformas pl
on li.id_plataforma=pl.id_plataforma 
where ju.id_juego=100 and
pl.id_plataforma=20;



#Muestra el nombre del estudio y el título del juego, pero solo de aquellas licencias compradas en el mes de enero'.
select 
ju.titulo as titulo_juego,
es.nombre_estudio as nombre_estudio
from licencias li
inner join juegos ju
on li.id_juego=ju.id_juego
inner join plataformas pl
on li.id_plataforma=pl.id_plataforma 
inner join estudios es
on es.id_estudio=ju.id_estudio 
where month(li.fecha_compra)=1;

