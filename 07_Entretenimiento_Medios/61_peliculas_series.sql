-- DB 61: Películas y Series
DROP DATABASE IF EXISTS db_peliculas_series;
CREATE DATABASE db_peliculas_series CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_peliculas_series;

CREATE TABLE peliculas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(200) NOT NULL,
  anio INT,
  pais VARCHAR(80),
  duracion_min INT,
  plataforma VARCHAR(80)
);

CREATE TABLE series (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(200) NOT NULL,
  anio_inicio INT,
  anio_fin INT NULL,
  temporadas INT,
  plataforma VARCHAR(80)
);

CREATE TABLE personas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  rol ENUM('actor','actriz','director','guionista') NOT NULL
);

CREATE TABLE roles (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('actuacion','direccion','guion') NOT NULL
);

CREATE TABLE plataformas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  pais VARCHAR(80)
);

CREATE TABLE visionados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('pelicula','serie') NOT NULL,
  ref_id INT NOT NULL,
  usuario VARCHAR(120) NOT NULL,
  fecha DATE NOT NULL,
  calificacion TINYINT
);

INSERT INTO plataformas (nombre,pais) VALUES
('Netflix','México'),('HBO Max','México'),('Disney+','México'),('Prime Video','México'),('Crunchyroll','México');

INSERT INTO peliculas (titulo,anio,pais,duracion_min,plataforma) VALUES
('Your Name',2016,'Japón',106,'Netflix'),
('El Hoyo',2019,'España',94,'Netflix'),
('Parasite',2019,'Corea del Sur',132,'Prime Video'),
('Spider-Man: Into the Spider-Verse',2018,'EEUU',117,'Disney+'),
('Roma',2018,'México',135,'Netflix');

INSERT INTO series (titulo,anio_inicio,anio_fin,temporadas,plataforma) VALUES
('Dark',2017,2020,3,'Netflix'),
('The Last of Us',2023,NULL,1,'HBO Max'),
('Arcane',2021,NULL,1,'Netflix'),
('Cobra Kai',2018,NULL,5,'Netflix'),
('The Boys',2019,NULL,4,'Prime Video');

INSERT INTO personas (nombre,rol) VALUES
('Bong Joon-ho','director'),('Alfonso Cuarón','director'),('Pedro Pascal','actor'),
('Hailee Steinfeld','actriz'),('Makoto Shinkai','director');

INSERT INTO roles (tipo) VALUES ('actuacion'),('direccion'),('guion');

INSERT INTO visionados (tipo,ref_id,usuario,fecha,calificacion) VALUES
('pelicula',1,'Jose',DATE('2025-08-01'),10),
('pelicula',5,'Jose',DATE('2025-07-15'),9),
('serie',1,'Jose',DATE('2025-06-20'),9),
('serie',2,'Jose',DATE('2025-08-05'),10),
('serie',3,'Jose',DATE('2025-08-07'),9);
