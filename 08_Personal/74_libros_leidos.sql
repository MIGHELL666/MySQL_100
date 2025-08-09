DROP DATABASE IF EXISTS db_libros_leidos;
    CREATE DATABASE db_libros_leidos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_libros_leidos;

    CREATE TABLE categorias(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(80)
    );
    CREATE TABLE gastos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      categoria_id INT,
      descripcion VARCHAR(150),
      monto DECIMAL(10,2),
      fecha DATE,
      FOREIGN KEY (categoria_id) REFERENCES categorias(id)
    );
    CREATE TABLE contactos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      telefono VARCHAR(30),
      ciudad VARCHAR(80)
    );
    CREATE TABLE libros(
      id INT PRIMARY KEY AUTO_INCREMENT,
      titulo VARCHAR(150),
      autor VARCHAR(120),
      anio YEAR
    );
    CREATE TABLE viajes(
      id INT PRIMARY KEY AUTO_INCREMENT,
      destino VARCHAR(120),
      fecha DATE,
      notas VARCHAR(200)
    );
    CREATE TABLE objetivos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      titulo VARCHAR(150),
      categoria VARCHAR(80),
      estado ENUM('pendiente','en_progreso','completado') DEFAULT 'pendiente'
    );
    INSERT INTO categorias (nombre) VALUES
('Comida'),
('Transporte'),
('Deporte');
INSERT INTO gastos (categoria_id, descripcion, monto, fecha) VALUES
(1, 'Tacos nocturnos post-código', 120.0, '2025-08-08'),
(3, 'Guantes MMA', 650.0, '2025-08-07');
INSERT INTO contactos (nombre, telefono, ciudad) VALUES
('Coach Taekwondo', '+52 81 0000 0000', 'Monterrey');
INSERT INTO libros (titulo, autor, anio) VALUES
('Berserk Deluxe Vol.1', 'Kentaro Miura', 2019),
('The Pragmatic Programmer', 'Hunt/Thomas', 1999);
INSERT INTO viajes (destino, fecha, notas) VALUES
('CDMX', '2025-12-01', 'Concierto + museos');
INSERT INTO objetivos (titulo, categoria, estado) VALUES
('Dominadas estrictas x10', 'Calistenia', 'en_progreso'),
('Campaña JS100', 'Programación', 'en_progreso');
