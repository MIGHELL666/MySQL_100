DROP DATABASE IF EXISTS db_suscripciones_streaming;
CREATE DATABASE db_suscripciones_streaming CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_suscripciones_streaming;

CREATE TABLE plataformas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL UNIQUE
);
CREATE TABLE planes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  plataforma_id INT,
  nombre VARCHAR(80),
  precio_mxn DECIMAL(10,2),
  perfiles INT,
  resolucion VARCHAR(20),
  FOREIGN KEY (plataforma_id) REFERENCES plataformas(id)
);
CREATE TABLE usuarios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120),
  email VARCHAR(120)
);
CREATE TABLE suscripciones(
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  plan_id INT,
  inicio DATE,
  fin DATE NULL,
  estado ENUM('activa','pausada','cancelada'),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (plan_id) REFERENCES planes(id)
);
CREATE TABLE perfiles(
  id INT PRIMARY KEY AUTO_INCREMENT,
  suscripcion_id INT,
  nombre VARCHAR(80),
  tipo ENUM('adulto','infantil'),
  FOREIGN KEY (suscripcion_id) REFERENCES suscripciones(id)
);
CREATE TABLE reproducciones(
  id INT PRIMARY KEY AUTO_INCREMENT,
  perfil_id INT,
  titulo VARCHAR(200),
  tipo ENUM('pelicula','serie','anime'),
  fecha DATE,
  minutos INT,
  FOREIGN KEY (perfil_id) REFERENCES perfiles(id)
);

INSERT INTO plataformas (nombre) VALUES ('Netflix'),('HBO Max'),('Prime Video'),('Disney+'),('Crunchyroll');

INSERT INTO planes (plataforma_id,nombre,precio_mxn,perfiles,resolucion) VALUES
(1,'Estándar',219,2,'1080p'),
(2,'Mensual',179,3,'1080p'),
(5,'Fan',119,1,'1080p');

INSERT INTO usuarios (nombre,email) VALUES ('Jose','jose@example.com');

INSERT INTO suscripciones (usuario_id,plan_id,inicio,fin,estado) VALUES
(1,1,'2025-06-01',NULL,'activa'),
(1,3,'2025-07-01',NULL,'activa');

INSERT INTO perfiles (suscripcion_id,nombre,tipo) VALUES
(1,'Jose','adulto'),
(2,'Jose Anime','adulto');

INSERT INTO reproducciones (perfil_id,titulo,tipo,fecha,minutos) VALUES
(1,'Dark S01E01','serie','2025-08-01',50),
(1,'Parasite','pelicula','2025-08-02',132),
(2,'Jujutsu Kaisen S1E1','anime','2025-08-03',24);
