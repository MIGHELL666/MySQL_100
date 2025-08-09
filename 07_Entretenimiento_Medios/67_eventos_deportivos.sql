DROP DATABASE IF EXISTS db_eventos_deportivos;
CREATE DATABASE db_eventos_deportivos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_eventos_deportivos;

CREATE TABLE deportes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL
);
CREATE TABLE equipos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  deporte_id INT,
  nombre VARCHAR(120),
  ciudad VARCHAR(80),
  FOREIGN KEY (deporte_id) REFERENCES deportes(id)
);
CREATE TABLE eventos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  deporte_id INT,
  fecha DATE,
  sede VARCHAR(120),
  FOREIGN KEY (deporte_id) REFERENCES deportes(id)
);
CREATE TABLE asistentes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120),
  ciudad VARCHAR(80)
);
CREATE TABLE entradas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  evento_id INT,
  zona VARCHAR(60),
  precio DECIMAL(10,2),
  FOREIGN KEY (evento_id) REFERENCES eventos(id)
);
CREATE TABLE resultados(
  id INT PRIMARY KEY AUTO_INCREMENT,
  evento_id INT,
  equipo_local VARCHAR(120),
  equipo_visitante VARCHAR(120),
  marcador VARCHAR(20),
  FOREIGN KEY (evento_id) REFERENCES eventos(id)
);

INSERT INTO deportes (nombre) VALUES ('Volleyball'),('Taekwondo'),('MMA');
INSERT INTO equipos (deporte_id,nombre,ciudad) VALUES (1,'Rayados Voley','Monterrey'),(1,'Tigres Voley','Monterrey');
INSERT INTO eventos (deporte_id,fecha,sede) VALUES (1,'2025-09-01','UANL'),(2,'2025-09-10','Dojo Monterrey');
INSERT INTO asistentes (nombre,ciudad) VALUES ('Jose','Monterrey'),('Ana','CDMX');
INSERT INTO entradas (evento_id,zona,precio) VALUES (1,'Cancha',150.00),(1,'Grada',80.00),(2,'General',120.00);
INSERT INTO resultados (evento_id,equipo_local,equipo_visitante,marcador) VALUES (1,'Rayados Voley','Tigres Voley','3-2');
