drop database if exists actividad1_8;
create database actividad1_8;
use actividad1_8;

CREATE TABLE libros (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    genero VARCHAR(50),
    precio_alquiler DECIMAL(5,2),
    paginas INT,
    fecha_publicacion DATE,
    idioma VARCHAR(20),
    ubicacion_pasillo VARCHAR(10) -- Algunos pueden ser NULL
);

INSERT INTO libros VALUES 
(1, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Clásico', 2.50, 1032, '1605-01-01', 'Español', 'A-1'),
(2, 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo Mágico', 3.00, 471, '1967-05-30', 'Español', 'A-2'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Clásico', 1.50, 180, '1925-04-10', 'Inglés', NULL),
(4, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'Realismo Mágico', 2.00, 150, '1981-01-01', 'Español', 'A-2'),
(5, '1984', 'George Orwell', 'Distopía', 1.80, 328, '1949-06-08', 'Inglés', 'B-1'),
(6, 'Fahrenheit 451', 'Ray Bradbury', 'Distopía', 1.80, 256, '1953-10-19', 'Inglés', 'B-1'),
(7, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Romance', 3.50, 368, '1985-01-01', 'Español', 'A-2'),
(8, 'Rayuela', 'Julio Cortázar', 'Novela', 2.20, 600, '1963-06-28', 'Español', NULL),
(9, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantasía', 4.00, 223, '1997-06-26', 'Inglés', 'C-1'),
(10, 'La ciudad y los perros', 'Mario Vargas Llosa', 'Novela', 2.10, 400, '1963-01-01', 'Español', 'D-1');


select 
titulo,
autor
from libros
where 
genero in ('Realismo Mágico' , 'Fantasía')
and precio_alquiler > 2.5
order by titulo;

select *
from libros
where 
fecha_publicacion between '1950-01-01' and '1990-12-31'
and idioma in ('Español', 'Inglés');

select *
from libros 
where titulo like 'El%';

select *
from libros 
where autor like '%García%';

select *
from libros 
where ubicacion_pasillo like 'A__';

select 
titulo,
genero
from libros
where 
ubicacion_pasillo is null
order by  paginas desc;


select *
from 
libros 
order by 
precio_alquiler, titulo
limit 4;
