DROP DATABASE IF EXISTS db_influencers;
CREATE DATABASE db_influencers CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE db_influencers;

CREATE TABLE creadores(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  plataforma VARCHAR(60),
  categoria VARCHAR(80)
);
CREATE TABLE plataformas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(60) NOT NULL,
  url VARCHAR(200)
);
CREATE TABLE marcas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(120) NOT NULL,
  industria VARCHAR(80)
);
CREATE TABLE campanas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  marca_id INT,
  nombre VARCHAR(150),
  inicio DATE,
  fin DATE,
  presupuesto DECIMAL(12,2),
  FOREIGN KEY (marca_id) REFERENCES marcas(id)
);
CREATE TABLE publicaciones(
  id INT PRIMARY KEY AUTO_INCREMENT,
  creador_id INT,
  campana_id INT,
  fecha DATE,
  enlace VARCHAR(255),
  FOREIGN KEY (creador_id) REFERENCES creadores(id),
  FOREIGN KEY (campana_id) REFERENCES campanas(id)
);
CREATE TABLE metricas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  publicacion_id INT,
  vistas INT,
  likes INT,
  comentarios INT,
  FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id)
);

INSERT INTO plataformas (nombre,url) VALUES ('YouTube','https://youtube.com'),('Instagram','https://instagram.com'),('TikTok','https://tiktok.com');
INSERT INTO marcas (nombre,industria) VALUES ('Logitech','Tecnología'),('Adidas','Deportes');
INSERT INTO creadores (nombre,plataforma,categoria) VALUES ('Jose Dev','YouTube','Programación'),('Otaku MX','TikTok','Anime');
INSERT INTO campanas (marca_id,nombre,inicio,fin,presupuesto) VALUES (1,'Setup 2025','2025-08-01','2025-09-01',50000.00),(2,'Ropa Deportiva','2025-08-10','2025-09-10',30000.00);
INSERT INTO publicaciones (creador_id,campana_id,fecha,enlace) VALUES (1,1,'2025-08-05','https://youtube.com/demo1'),(2,2,'2025-08-12','https://tiktok.com/@otakumx/video/1');
INSERT INTO metricas (publicacion_id,vistas,likes,comentarios) VALUES (1,12000,1500,120),(2,50000,6000,430);
