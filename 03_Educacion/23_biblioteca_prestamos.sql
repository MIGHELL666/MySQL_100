DROP DATABASE IF EXISTS db_biblioteca_prestamos;
    CREATE DATABASE db_biblioteca_prestamos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_biblioteca_prestamos;

    CREATE TABLE alumnos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      email VARCHAR(120)
    );
    CREATE TABLE profesores(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      departamento VARCHAR(120)
    );
    CREATE TABLE cursos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(150),
      creditos INT,
      profesor_id INT,
      FOREIGN KEY (profesor_id) REFERENCES profesores(id)
    );
    CREATE TABLE inscripciones(
      id INT PRIMARY KEY AUTO_INCREMENT,
      alumno_id INT,
      curso_id INT,
      periodo VARCHAR(20),
      FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
      FOREIGN KEY (curso_id) REFERENCES cursos(id)
    );
    CREATE TABLE calificaciones(
      id INT PRIMARY KEY AUTO_INCREMENT,
      inscripcion_id INT,
      parcial1 DECIMAL(4,2),
      parcial2 DECIMAL(4,2),
      final DECIMAL(4,2),
      FOREIGN KEY (inscripcion_id) REFERENCES inscripciones(id)
    );
    CREATE TABLE asistencias(
      id INT PRIMARY KEY AUTO_INCREMENT,
      inscripcion_id INT,
      fecha DATE,
      presente BOOLEAN,
      FOREIGN KEY (inscripcion_id) REFERENCES inscripciones(id)
    );
    INSERT INTO alumnos (nombre, email) VALUES
('Jose', 'jose@uni.mx'),
('Ana', 'ana@uni.mx');
INSERT INTO profesores (nombre, departamento) VALUES
('Mtro. García', 'Sistemas'),
('Dra. Díaz', 'Matemáticas');
INSERT INTO cursos (nombre, creditos, profesor_id) VALUES
('Estructuras de Datos', 8, 1),
('Cálculo II', 8, 2);
INSERT INTO inscripciones (alumno_id, curso_id, periodo) VALUES
(1, 1, '2025-2'),
(1, 2, '2025-2'),
(2, 1, '2025-2');
INSERT INTO calificaciones (inscripcion_id, parcial1, parcial2, final) VALUES
(1, 95, 92, 94),
(2, 88, 90, 89),
(3, 85, 87, 86);
INSERT INTO asistencias (inscripcion_id, fecha, presente) VALUES
(1, '2025-08-01', 1),
(1, '2025-08-03', 1),
(2, '2025-08-01', 1);
