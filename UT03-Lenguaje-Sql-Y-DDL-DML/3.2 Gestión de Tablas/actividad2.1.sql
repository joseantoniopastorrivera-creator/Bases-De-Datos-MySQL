create table clientes (
nombre varchar (50) not null,
anyo_nacimiento numeric(4,0) not null, 
constraint chk_anyo_nacimiento check (anyo_nacimiento >= 1900 and anyo_nacimiento <= 2025)
);