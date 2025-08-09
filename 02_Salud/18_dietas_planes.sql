DROP DATABASE IF EXISTS db_dietas_planes;
    CREATE DATABASE db_dietas_planes CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_dietas_planes;

    CREATE TABLE pacientes(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      edad INT,
      ciudad VARCHAR(80)
    );
    CREATE TABLE personal(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      rol ENUM('medico','enfermero','nutriologo','entrenador') NOT NULL
    );
    CREATE TABLE citas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      paciente_id INT,
      personal_id INT,
      fecha DATETIME,
      motivo VARCHAR(200),
      FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
      FOREIGN KEY (personal_id) REFERENCES personal(id)
    );
    CREATE TABLE tratamientos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      paciente_id INT,
      descripcion VARCHAR(200),
      inicio DATE,
      fin DATE,
      FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
    );
    CREATE TABLE medicamentos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      presentacion VARCHAR(80)
    );
    CREATE TABLE recetas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      paciente_id INT,
      medicamento_id INT,
      dosis VARCHAR(80),
      fecha DATE,
      FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
      FOREIGN KEY (medicamento_id) REFERENCES medicamentos(id)
    );
    INSERT INTO pacientes (nombre, edad, ciudad) VALUES
('Jose', 20, 'Monterrey'),
('Ana', 22, 'CDMX'),
('Luis', 24, 'Guadalajara');
INSERT INTO personal (nombre, rol) VALUES
('Dr. Cárdenas', 'medico'),
('Lic. Rivera', 'nutriologo'),
('Coach MMA', 'entrenador');
INSERT INTO citas (paciente_id, personal_id, fecha, motivo) VALUES
(1, 2, '2025-08-05 18:00:00', 'Plan nutricional calistenia'),
(1, 3, '2025-08-06 19:00:00', 'Técnica MMA');
INSERT INTO tratamientos (paciente_id, descripcion, inicio, fin) VALUES
(1, 'Rutina calistenia por grupos', '2025-08-01', '2025-09-01');
INSERT INTO medicamentos (nombre, presentacion) VALUES
('Ibuprofeno', '200mg'),
('Paracetamol', '500mg');
INSERT INTO recetas (paciente_id, medicamento_id, dosis, fecha) VALUES
(1, 1, '1 cada 8h', '2025-08-04');
