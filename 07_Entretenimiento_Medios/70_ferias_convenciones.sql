DROP DATABASE IF EXISTS db_ferias_convenciones;
CREATE DATABASE db_ferias_convenciones CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_ferias_convenciones;

CREATE TABLE sedes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150),
  ciudad VARCHAR(80),
  capacidad INT
);
CREATE TABLE eventos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  sede_id INT,
  nombre VARCHAR(150),
  fecha DATE,
  FOREIGN KEY (sede_id) REFERENCES sedes(id)
);
CREATE TABLE expositores(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150),
  industria VARCHAR(100)
);
CREATE TABLE stands(
  id INT PRIMARY KEY AUTO_INCREMENT,
  evento_id INT,
  expositor_id INT,
  numero VARCHAR(10),
  FOREIGN KEY (evento_id) REFERENCES eventos(id),
  FOREIGN KEY (expositor_id) REFERENCES expositores(id)
);
CREATE TABLE asistentes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120),
  ciudad VARCHAR(80)
);
CREATE TABLE registros(
  id INT PRIMARY KEY AUTO_INCREMENT,
  evento_id INT,
  asistente_id INT,
  fecha DATETIME,
  FOREIGN KEY (evento_id) REFERENCES eventos(id),
  FOREIGN KEY (asistente_id) REFERENCES asistentes(id)
);

INSERT INTO sedes (nombre,ciudad,capacidad) VALUES ('Cintermex','Monterrey',15000),('WTC','CDMX',20000);
INSERT INTO eventos (sede_id,nombre,fecha) VALUES (1,'DevCon Monterrey','2025-11-05'),(2,'AnimeFest CDMX','2025-10-12');
INSERT INTO expositores (nombre,industria) VALUES ('Logitech','Tecnología'),('Crunchyroll','Entretenimiento');
INSERT INTO stands (evento_id,expositor_id,numero) VALUES (1,1,'A12'),(2,2,'B07');
INSERT INTO asistentes (nombre,ciudad) VALUES ('Jose','Monterrey'),('Ana','Guadalajara');
INSERT INTO registros (evento_id,asistente_id,fecha) VALUES (2,1,'2025-10-12 10:00:00'),(1,1,'2025-11-05 09:30:00');
