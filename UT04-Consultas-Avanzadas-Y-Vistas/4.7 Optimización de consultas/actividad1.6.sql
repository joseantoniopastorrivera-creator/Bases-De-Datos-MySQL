drop database if exists actividad1_6;
create database actividad1_6;
use actividad1_6;

CREATE TABLE inventario (
    id INT PRIMARY KEY,
    sku VARCHAR(20),
    nombre_prod VARCHAR(50),
    stock INT,
    ultima_revision DATE
);

INSERT INTO inventario VALUES 
(1, '  PROD-A1 ', 'Monitor 24', 15, '2023-12-01'),
(2, 'PROD-B2  ', 'Teclado Mecanico', 0, '2024-01-10'),
(3, ' PROD-C3', 'Mouse Optico', 50, '2024-02-15');

select 
ltrim(rtrim(sku)) as sku, 
datediff(curdate(),ultima_revision) as dias_transcurridos,
if(stock=0, 'AGOTADO', stock) as stock_disponible
from inventario;


