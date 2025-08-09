DROP DATABASE IF EXISTS db_playlists_musica;
CREATE DATABASE db_playlists_musica CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_playlists_musica;

CREATE TABLE artistas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL
);
CREATE TABLE albums(
  id INT PRIMARY KEY AUTO_INCREMENT,
  artista_id INT,
  titulo VARCHAR(150),
  anio YEAR,
  FOREIGN KEY (artista_id) REFERENCES artistas(id)
);
CREATE TABLE canciones(
  id INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT,
  titulo VARCHAR(150),
  duracion_seg INT,
  FOREIGN KEY (album_id) REFERENCES albums(id)
);
CREATE TABLE playlists(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120),
  descripcion VARCHAR(200)
);
CREATE TABLE playlist_canciones(
  playlist_id INT,
  cancion_id INT,
  PRIMARY KEY (playlist_id,cancion_id),
  FOREIGN KEY (playlist_id) REFERENCES playlists(id),
  FOREIGN KEY (cancion_id) REFERENCES canciones(id)
);
CREATE TABLE escuchas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  cancion_id INT,
  usuario VARCHAR(120),
  fecha DATETIME,
  FOREIGN KEY (cancion_id) REFERENCES canciones(id)
);

INSERT INTO artistas (nombre) VALUES ('Porter'),('Zoé'),('Daft Punk');
INSERT INTO albums (artista_id,titulo,anio) VALUES (3,'Discovery',2001),(1,'Moctezuma',2014),(2,'Reptilectric',2008);
INSERT INTO canciones (album_id,titulo,duracion_seg) VALUES (1,'Harder, Better, Faster, Stronger',224),(2,'Huitzil',300),(3,'Reptilectric',250);
INSERT INTO playlists (nombre,descripcion) VALUES ('Entrenamiento','Para calistenia y MMA'),('Focus','Para programar de madrugada');
INSERT INTO playlist_canciones VALUES (1,1),(1,2),(2,3);
INSERT INTO escuchas (cancion_id,usuario,fecha) VALUES (1,'Jose','2025-08-07 22:10:00'),(2,'Jose','2025-08-08 07:00:00'),(3,'Jose','2025-08-08 23:00:00');
