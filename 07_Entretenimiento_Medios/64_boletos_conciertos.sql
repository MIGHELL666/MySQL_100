DROP DATABASE IF EXISTS db_boletos_conciertos;
CREATE DATABASE db_boletos_conciertos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_boletos_conciertos;

CREATE TABLE artistas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  genero VARCHAR(80)
);
CREATE TABLE venues(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  ciudad VARCHAR(80),
  capacidad INT
);
CREATE TABLE eventos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  artista_id INT,
  venue_id INT,
  fecha DATE,
  hora TIME,
  FOREIGN KEY (artista_id) REFERENCES artistas(id),
  FOREIGN KEY (venue_id) REFERENCES venues(id)
);
CREATE TABLE boletos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  evento_id INT,
  zona VARCHAR(60),
  precio DECIMAL(10,2),
  FOREIGN KEY (evento_id) REFERENCES eventos(id)
);
CREATE TABLE compradores(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120),
  email VARCHAR(120)
);
CREATE TABLE transacciones(
  id INT PRIMARY KEY AUTO_INCREMENT,
  boleto_id INT,
  comprador_id INT,
  fecha DATETIME,
  metodo ENUM('tarjeta','efectivo','transferencia'),
  FOREIGN KEY (boleto_id) REFERENCES boletos(id),
  FOREIGN KEY (comprador_id) REFERENCES compradores(id)
);

INSERT INTO artistas (nombre,genero) VALUES ('Porter','Rock'),('Zoé','Rock'),('Bad Bunny','Urbano');
INSERT INTO venues (nombre,ciudad,capacidad) VALUES ('Auditorio Citibanamex','Monterrey',8000),('Arena CDMX','CDMX',22000);
INSERT INTO eventos (artista_id,venue_id,fecha,hora) VALUES (1,1,'2025-09-10','21:00'),(2,2,'2025-10-05','20:30');
INSERT INTO boletos (evento_id,zona,precio) VALUES (1,'General',800.00),(1,'VIP',1500.00),(2,'General',900.00);
INSERT INTO compradores (nombre,email) VALUES ('Jose','jose@example.com'),('Ana','ana@example.com');
INSERT INTO transacciones (boleto_id,comprador_id,fecha,metodo) VALUES (1,1,'2025-08-08 12:30:00','tarjeta'),(2,1,'2025-08-08 12:31:00','tarjeta'),(3,2,'2025-08-09 10:00:00','transferencia');
