DROP DATABASE IF EXISTS db_costos_rentabilidad;
    CREATE DATABASE db_costos_rentabilidad CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_costos_rentabilidad;

    CREATE TABLE maquinas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      codigo VARCHAR(40),
      modelo VARCHAR(80),
      ubicacion VARCHAR(80)
    );
    CREATE TABLE mantenimientos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      maquina_id INT,
      fecha DATE,
      tipo ENUM('preventivo','correctivo'),
      notas VARCHAR(200),
      FOREIGN KEY (maquina_id) REFERENCES maquinas(id)
    );
    CREATE TABLE trabajadores(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      turno ENUM('matutino','vespertino','nocturno')
    );
    CREATE TABLE produccion(
      id INT PRIMARY KEY AUTO_INCREMENT,
      fecha DATE,
      maquina_id INT,
      piezas INT,
      FOREIGN KEY (maquina_id) REFERENCES maquinas(id)
    );
    CREATE TABLE calidad(
      id INT PRIMARY KEY AUTO_INCREMENT,
      produccion_id INT,
      defectos INT,
      inspeccionado_por VARCHAR(120),
      FOREIGN KEY (produccion_id) REFERENCES produccion(id)
    );
    CREATE TABLE pedidos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      cliente VARCHAR(120),
      fecha DATE,
      piezas INT,
      estado ENUM('pendiente','en_proceso','entregado')
    );
    INSERT INTO maquinas (codigo, modelo, ubicacion) VALUES
('MX-01', 'CNC-200', 'Nave A'),
('MX-02', 'CNC-300', 'Nave B');
INSERT INTO trabajadores (nombre, turno) VALUES
('Jose', 'nocturno'),
('Ana', 'matutino');
INSERT INTO produccion (fecha, maquina_id, piezas) VALUES
('2025-08-07', 1, 1200),
('2025-08-08', 2, 900);
INSERT INTO mantenimientos (maquina_id, fecha, tipo, notas) VALUES
(1, '2025-08-05', 'preventivo', 'Lubricación'),
(2, '2025-08-06', 'correctivo', 'Cambio de fresa');
INSERT INTO pedidos (cliente, fecha, piezas, estado) VALUES
('Cliente Norte', '2025-08-10', 2000, 'en_proceso');
INSERT INTO calidad (produccion_id, defectos, inspeccionado_por) VALUES
(1, 5, 'Jose'),
(2, 8, 'Ana');
