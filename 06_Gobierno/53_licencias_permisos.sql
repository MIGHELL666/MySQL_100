DROP DATABASE IF EXISTS db_licencias_permisos;
    CREATE DATABASE db_licencias_permisos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_licencias_permisos;

    CREATE TABLE ciudadanos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      curp VARCHAR(18),
      ciudad VARCHAR(80)
    );
    CREATE TABLE documentos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      ciudadano_id INT,
      tipo VARCHAR(80),
      numero VARCHAR(40),
      fecha_emision DATE,
      FOREIGN KEY (ciudadano_id) REFERENCES ciudadanos(id)
    );
    CREATE TABLE tramites(
      id INT PRIMARY KEY AUTO_INCREMENT,
      ciudadano_id INT,
      tipo VARCHAR(120),
      estado ENUM('nuevo','en_proceso','finalizado','rechazado') DEFAULT 'nuevo',
      fecha DATE,
      FOREIGN KEY (ciudadano_id) REFERENCES ciudadanos(id)
    );
    CREATE TABLE oficinas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      ciudad VARCHAR(80)
    );
    CREATE TABLE citas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      tramite_id INT,
      oficina_id INT,
      fecha DATETIME,
      FOREIGN KEY (tramite_id) REFERENCES tramites(id),
      FOREIGN KEY (oficina_id) REFERENCES oficinas(id)
    );
    CREATE TABLE pagos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      tramite_id INT,
      monto DECIMAL(10,2),
      fecha DATETIME,
      FOREIGN KEY (tramite_id) REFERENCES tramites(id)
    );
    INSERT INTO ciudadanos (nombre, curp, ciudad) VALUES
('Jose', 'FOAJ050406HNLXXX01', 'Monterrey'),
('Ana', 'ANAA000101MDFXXX02', 'CDMX');
INSERT INTO oficinas (nombre, ciudad) VALUES
('Módulo Macroplaza', 'Monterrey'),
('Oficina Central', 'CDMX');
INSERT INTO tramites (ciudadano_id, tipo, estado, fecha) VALUES
(1, 'Renovación INE', 'en_proceso', '2025-08-05');
INSERT INTO citas (tramite_id, oficina_id, fecha) VALUES
(1, 1, '2025-08-12 10:30:00');
INSERT INTO documentos (ciudadano_id, tipo, numero, fecha_emision) VALUES
(1, 'INE', 'INE123456', '2020-04-10');
INSERT INTO pagos (tramite_id, monto, fecha) VALUES
(1, 250.0, '2025-08-05 11:00:00');
