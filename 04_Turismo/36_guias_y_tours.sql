DROP DATABASE IF EXISTS db_guias_y_tours;
    CREATE DATABASE db_guias_y_tours CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_guias_y_tours;

    CREATE TABLE hoteles(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(150),
      ciudad VARCHAR(80)
    );
    CREATE TABLE habitaciones(
      id INT PRIMARY KEY AUTO_INCREMENT,
      hotel_id INT,
      numero VARCHAR(10),
      tipo VARCHAR(60),
      precio DECIMAL(10,2),
      FOREIGN KEY (hotel_id) REFERENCES hoteles(id)
    );
    CREATE TABLE clientes(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      email VARCHAR(120)
    );
    CREATE TABLE reservas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      cliente_id INT,
      habitacion_id INT,
      check_in DATE,
      check_out DATE,
      FOREIGN KEY (cliente_id) REFERENCES clientes(id),
      FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
    );
    CREATE TABLE pagos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      reserva_id INT,
      monto DECIMAL(10,2),
      fecha DATETIME,
      metodo ENUM('tarjeta','efectivo','transferencia'),
      FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );
    CREATE TABLE servicios(
      id INT PRIMARY KEY AUTO_INCREMENT,
      reserva_id INT,
      nombre VARCHAR(120),
      costo DECIMAL(10,2),
      FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );
    INSERT INTO hoteles (nombre, ciudad) VALUES
('Hotel Macroplaza', 'Monterrey'),
('Hotel Centro', 'CDMX');
INSERT INTO habitaciones (hotel_id, numero, tipo, precio) VALUES
(1, '101', 'Doble', 1200.0),
(1, '102', 'Suite', 2200.0),
(2, '201', 'Sencilla', 900.0);
INSERT INTO clientes (nombre, email) VALUES
('Jose', 'jose@example.com'),
('Ana', 'ana@example.com');
INSERT INTO reservas (cliente_id, habitacion_id, check_in, check_out) VALUES
(1, 2, '2025-08-15', '2025-08-17'),
(2, 3, '2025-09-01', '2025-09-03');
INSERT INTO pagos (reserva_id, monto, fecha, metodo) VALUES
(1, 4400.0, '2025-08-10 12:00:00', 'tarjeta');
INSERT INTO servicios (reserva_id, nombre, costo) VALUES
(1, 'Gimnasio', 0.0),
(1, 'Desayuno', 300.0);
