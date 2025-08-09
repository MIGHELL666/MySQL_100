DROP DATABASE IF EXISTS db_torneos_esports;
CREATE DATABASE db_torneos_esports CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_torneos_esports;

CREATE TABLE juegos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  genero VARCHAR(80)
);
CREATE TABLE equipos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  region VARCHAR(80)
);
CREATE TABLE jugadores(
  id INT PRIMARY KEY AUTO_INCREMENT,
  equipo_id INT,
  nick VARCHAR(80) NOT NULL,
  rol VARCHAR(80),
  FOREIGN KEY (equipo_id) REFERENCES equipos(id)
);
CREATE TABLE torneos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  juego_id INT,
  nombre VARCHAR(150),
  sede VARCHAR(120),
  fecha DATE,
  FOREIGN KEY (juego_id) REFERENCES juegos(id)
);
CREATE TABLE partidas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  torneo_id INT,
  equipo_a INT,
  equipo_b INT,
  fecha DATETIME,
  FOREIGN KEY (torneo_id) REFERENCES torneos(id),
  FOREIGN KEY (equipo_a) REFERENCES equipos(id),
  FOREIGN KEY (equipo_b) REFERENCES equipos(id)
);
CREATE TABLE resultados_partida(
  id INT PRIMARY KEY AUTO_INCREMENT,
  partida_id INT,
  ganador INT,
  marcador VARCHAR(20),
  FOREIGN KEY (partida_id) REFERENCES partidas(id),
  FOREIGN KEY (ganador) REFERENCES equipos(id)
);

INSERT INTO juegos (nombre,genero) VALUES ('League of Legends','MOBA'),('Valorant','FPS');
INSERT INTO equipos (nombre,region) VALUES ('Monterrey Esports','LATAM'),('CDMX Gamers','LATAM');
INSERT INTO jugadores (equipo_id,nick,rol) VALUES (1,'JM-Dev','Mid'),(1,'ShieldMX','Support'),(2,'CDX-Ace','Duelist');
INSERT INTO torneos (juego_id,nombre,sede,fecha) VALUES (1,'Copa Norte 2025','Monterrey','2025-09-20');
INSERT INTO partidas (torneo_id,equipo_a,equipo_b,fecha) VALUES (1,1,2,'2025-09-20 16:00:00');
INSERT INTO resultados_partida (partida_id,ganador,marcador) VALUES (1,1,'2-1');
