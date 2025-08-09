DROP DATABASE IF EXISTS db_modelos_ia;
    CREATE DATABASE db_modelos_ia CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_modelos_ia;

    CREATE TABLE proyectos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(150),
      area VARCHAR(120),
      inicio DATE
    );
    CREATE TABLE investigadores(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      institucion VARCHAR(120)
    );
    CREATE TABLE experimentos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      proyecto_id INT,
      nombre VARCHAR(150),
      fecha DATE,
      FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
    );
    CREATE TABLE datasets(
      id INT PRIMARY KEY AUTO_INCREMENT,
      experimento_id INT,
      nombre VARCHAR(150),
      muestras INT,
      FOREIGN KEY (experimento_id) REFERENCES experimentos(id)
    );
    CREATE TABLE resultados(
      id INT PRIMARY KEY AUTO_INCREMENT,
      experimento_id INT,
      resumen VARCHAR(255),
      exito BOOLEAN,
      FOREIGN KEY (experimento_id) REFERENCES experimentos(id)
    );
    CREATE TABLE equipos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      tipo VARCHAR(120)
    );
    INSERT INTO proyectos (nombre, area, inicio) VALUES
('Modelo IA clasificación imágenes', 'IA', '2025-07-01'),
('Estudio meteorológico MTY', 'Clima', '2025-08-01');
INSERT INTO investigadores (nombre, institucion) VALUES
('Jose', 'Tec MTY'),
('Ana', 'UNAM');
INSERT INTO experimentos (proyecto_id, nombre, fecha) VALUES
(1, 'ResNet baseline', '2025-08-05'),
(2, 'Sensores urbanos', '2025-08-06');
INSERT INTO datasets (experimento_id, nombre, muestras) VALUES
(1, 'Imagenes_urbanas', 10000),
(2, 'Temperatura_2025_Q3', 9000);
INSERT INTO resultados (experimento_id, resumen, exito) VALUES
(1, 'Accuracy 82% en validación', 1),
(2, 'Series temporales limpias', 1);
INSERT INTO equipos (nombre, tipo) VALUES
('RTX 4090 rig', 'GPU'),
('Estación Meteorológica MTY', 'Sensor');
