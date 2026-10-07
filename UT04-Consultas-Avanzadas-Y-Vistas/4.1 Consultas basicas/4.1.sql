-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: UT4
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `cliente` varchar(50) DEFAULT NULL,
  `producto` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `metodo_pago` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES ('Juan Pérez','Ratón','Electrónica','Tarjeta','2024-01-01'),('Ana López','Teclado','Electrónica','PayPal','2024-01-02'),('Juan Pérez','Monitor','Electrónica','Tarjeta','2024-01-02'),('Luis Gómez','Camiseta','Ropa','Tarjeta','2024-01-03'),('Ana López','Ratón','Electrónica','PayPal','2024-01-03'),('Lucía Sanz','Zapatillas','Ropa','Bizum','2024-01-04'),('Juan Pérez','Teclado','Electrónica','Tarjeta','2024-01-05'),('Ana López','Camiseta','Ropa','PayPal','2024-01-05');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id` int NOT NULL,
  `sku` varchar(20) DEFAULT NULL,
  `nombre_prod` varchar(50) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `ultima_revision` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'PROD-A1','Monitor 24',15,'2023-12-01'),(2,'PROD-B2','Teclado Mecanico',0,'2024-01-10'),(3,'PROD-C3','Mouse Optico',50,'2024-02-15');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id_libro` int NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `precio_alquiler` decimal(5,2) DEFAULT NULL,
  `paginas` int DEFAULT NULL,
  `fecha_publicacion` date DEFAULT NULL,
  `idioma` varchar(20) DEFAULT NULL,
  `ubicacion_pasillo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Don Quijote de la Mancha','Miguel de Cervantes','Clásico',2.50,1032,'1605-01-01','Español','A-1'),(2,'Cien años de soledad','Gabriel García Márquez','Realismo Mágico',3.00,471,'1967-05-30','Español','A-2'),(3,'The Great Gatsby','F. Scott Fitzgerald','Clásico',1.50,180,'1925-04-10','Inglés',NULL),(4,'Crónica de una muerte anunciada','Gabriel García Márquez','Realismo Mágico',2.00,150,'1981-01-01','Español','A-2'),(5,'1984','George Orwell','Distopia',1.80,328,'1949-06-08','Inglés','B-1'),(6,'Fahrenheit 451','Ray Bradbury','Distopia',1.80,256,'1953-10-19','Inglés','B-1'),(7,'El amor en los tiempos del cólera','Gabriel García Márquez','Romance',3.50,368,'1985-01-01','Español','A-2'),(8,'Rayuela','Julio Cortázar','Novela',2.20,600,'1963-06-28','Español',NULL),(9,'Harry Potter y la piedra filosofal','J.K. Rowling','Fantasía',4.00,223,'1997-06-26','Inglés','C-1'),(10,'La ciudad y los perros','Mario Vargas Llosa','Novela',2.10,400,'1963-01-01','Español','D-1');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `codigo_almacen` varchar(10) DEFAULT NULL,
  `garantia_meses` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop Gaming X','Computación',1200.50,10,'2023-05-15','ALM-A1',24),(2,'Mouse Inalámbrico','Accesorios',25.00,50,'2023-01-10','ALM-B1',12),(3,'Monitor 4K 27\"','Computación',350.00,0,'2022-11-20',NULL,36),(4,'Teclado Mecánico RGB','Accesorios',85.00,15,'2023-08-01','ALM-B2',NULL),(5,'Smartphone Z1','Telefonía',899.99,5,'2024-01-05','ALM-C1',24),(6,'Tablet Pro 10','Telefonía',450.00,12,'2023-10-12','ALM-C2',12),(7,'Cable HDMI 2.1','Accesorios',15.00,100,'2022-05-01','ALM-B3',6),(8,'Disco Duro SSD 1TB','Almacenamiento',110.00,8,'2023-12-15','ALM-D1',60),(9,'Memoria RAM 16GB','Almacenamiento',75.00,20,'2023-02-25','ALM-D2',120),(10,'Auriculares Noise Cancelling','Audio',199.00,3,'2023-06-30',NULL,24);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_acceso`
--

DROP TABLE IF EXISTS `registros_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_acceso` (
  `id` int NOT NULL,
  `empleado_id` int DEFAULT NULL,
  `entrada` datetime DEFAULT NULL,
  `salida` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_acceso`
--

LOCK TABLES `registros_acceso` WRITE;
/*!40000 ALTER TABLE `registros_acceso` DISABLE KEYS */;
INSERT INTO `registros_acceso` VALUES (1,10,'2024-03-01 08:00:00','2024-03-01 17:30:00'),(2,11,'2024-03-05 09:15:00','2024-03-05 18:00:00'),(3,10,'2024-04-10 08:05:00','2024-04-10 16:45:00');
/*!40000 ALTER TABLE `registros_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `id` int NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,'user_alpha','2023-01-15','2024-01-15'),(2,'user_beta','2023-05-20','2023-11-20'),(3,'user_gamma','2022-10-01','2025-10-01');
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `id` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `bono` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,' Juan','Perez ','Gerente','VENTAS',500.00),(2,'Maria','Gomez','Analista','ventas',NULL),(3,'carlos','ruiz','Asistente','MARKETING',200.00),(4,'Ana','Soto','Programador','IT',NULL);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,101,'Electrónica',2,500.00),(2,102,'Hogar',1,150.00),(3,101,'Electrónica',1,500.00),(4,103,'Electrónica',5,20.00),(5,104,'Deportes',3,100.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-20 12:50:02
