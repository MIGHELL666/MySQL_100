DROP DATABASE IF EXISTS db_animes_completos;
CREATE DATABASE db_animes_completos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_animes_completos;

CREATE TABLE estudios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  pais VARCHAR(80)
);
CREATE TABLE generos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL
);
CREATE TABLE animes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(200) NOT NULL,
  anio INT,
  estudio_id INT,
  estado ENUM('completo','en_emision','cancelado') NOT NULL DEFAULT 'completo',
  FOREIGN KEY (estudio_id) REFERENCES estudios(id)
);
CREATE TABLE temporadas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  anime_id INT,
  numero INT,
  anio INT,
  FOREIGN KEY (anime_id) REFERENCES animes(id)
);
CREATE TABLE episodios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  temporada_id INT,
  numero INT,
  titulo VARCHAR(200),
  duracion_min INT,
  FOREIGN KEY (temporada_id) REFERENCES temporadas(id)
);
CREATE TABLE calificaciones(
  id INT PRIMARY KEY AUTO_INCREMENT,
  anime_id INT,
  usuario VARCHAR(120),
  score TINYINT,
  comentario VARCHAR(255),
  fecha DATE,
  FOREIGN KEY (anime_id) REFERENCES animes(id)
);

INSERT INTO estudios (nombre,pais) VALUES ('ufotable','Japón'),('Wit Studio','Japón'),('Bones','Japón');
INSERT INTO generos (nombre) VALUES ('Acción'),('Fantasía Oscura'),('Aventura'),('Sci-Fi');

INSERT INTO animes (titulo,anio,estudio_id,estado) VALUES
('Fullmetal Alchemist: Brotherhood',2009,3,'completo'),
('Demon Slayer: Kimetsu no Yaiba',2019,1,'completo'),
('Attack on Titan',2013,2,'completo');

INSERT INTO temporadas (anime_id,numero,anio) VALUES
(1,1,2009),
(2,1,2019),
(3,1,2013),(3,2,2017),(3,3,2019),(3,4,2020);

INSERT INTO episodios (temporada_id,numero,titulo,duracion_min) VALUES
(1,1,'Fullmetal Alchemist',24),(1,2,'The First Day',24),
(2,1,'Cruelty',24),
(3,1,'To You, in 2000 Years',24);

INSERT INTO calificaciones (anime_id,usuario,score,comentario,fecha) VALUES
(1,'Jose',10,'Obra maestra para programar de madrugada','2025-08-05'),
(2,'Jose',9,'Animación top para entrenar antes de dormir','2025-08-06'),
(3,'Jose',10,'Fantasía oscura al nivel que me gusta','2025-08-07');
