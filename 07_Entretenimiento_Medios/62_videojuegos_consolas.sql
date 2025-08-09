DROP DATABASE IF EXISTS db_videojuegos_consolas;
CREATE DATABASE db_videojuegos_consolas CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_videojuegos_consolas;

CREATE TABLE juegos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  genero VARCHAR(60),
  plataforma VARCHAR(60),
  lanzamiento YEAR
);

CREATE TABLE consolas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  fabricante VARCHAR(80),
  anio YEAR
);

CREATE TABLE plataformas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  tipo ENUM('pc','consola','movil') NOT NULL
);

CREATE TABLE generos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(60) NOT NULL
);

CREATE TABLE coleccion(
  id INT PRIMARY KEY AUTO_INCREMENT,
  juego_id INT,
  estado ENUM('físico','digital') NOT NULL,
  ubicacion VARCHAR(120),
  FOREIGN KEY (juego_id) REFERENCES juegos(id)
);

CREATE TABLE sesiones_juego(
  id INT PRIMARY KEY AUTO_INCREMENT,
  juego_id INT,
  jugador VARCHAR(120),
  fecha DATE,
  minutos INT,
  FOREIGN KEY (juego_id) REFERENCES juegos(id)
);

INSERT INTO consolas (nombre,fabricante,anio) VALUES
('PlayStation 5','Sony',2020),('Nintendo Switch','Nintendo',2017),('Xbox Series X','Microsoft',2020);

INSERT INTO generos (nombre) VALUES ('Acción'),('RPG'),('Lucha'),('Deportes'),('Aventura');

INSERT INTO plataformas (nombre,tipo) VALUES
('PC','pc'),('PS5','consola'),('Switch','consola'),('Xbox Series','consola'),('Android','movil');

INSERT INTO juegos (titulo,genero,plataforma,lanzamiento) VALUES
('Elden Ring','RPG','PS5',2022),
('The Legend of Zelda: TOTK','Aventura','Switch',2023),
('Street Fighter 6','Lucha','PS5',2023),
('Hades','Acción','PC',2020),
('Rocket League','Deportes','PS5',2015);

INSERT INTO coleccion (juego_id,estado,ubicacion) VALUES
(1,'físico','Estante - Monterrey'),(2,'digital','Cuenta Nintendo'),
(3,'físico','Cajón TV'),(4,'digital','Steam'),(5,'digital','PSN');

INSERT INTO sesiones_juego (juego_id,jugador,fecha,minutos) VALUES
(1,'Jose','2025-08-02',120),(2,'Jose','2025-08-03',90),(3,'Jose','2025-08-05',60),(4,'Jose','2025-08-06',45),(5,'Jose','2025-08-07',30);
