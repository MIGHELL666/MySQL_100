DROP DATABASE IF EXISTS db_panaderia_productos;
    CREATE DATABASE db_panaderia_productos CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_panaderia_productos;

    CREATE TABLE productos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120) NOT NULL,
      categoria VARCHAR(80),
      precio DECIMAL(10,2),
      stock INT
    );
    CREATE TABLE proveedores(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120) NOT NULL,
      ciudad VARCHAR(80),
      contacto VARCHAR(120)
    );
    CREATE TABLE clientes(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      ciudad VARCHAR(80),
      email VARCHAR(120)
    );
    CREATE TABLE pedidos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      cliente_id INT,
      fecha DATE,
      total DECIMAL(10,2),
      estado ENUM('pendiente','pagado','enviado','cancelado') DEFAULT 'pendiente',
      FOREIGN KEY (cliente_id) REFERENCES clientes(id)
    );
    CREATE TABLE pedido_items(
      id INT PRIMARY KEY AUTO_INCREMENT,
      pedido_id INT,
      producto_id INT,
      cantidad INT,
      precio_unit DECIMAL(10,2),
      FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
      FOREIGN KEY (producto_id) REFERENCES productos(id)
    );
    CREATE TABLE pagos(
      id INT PRIMARY KEY AUTO_INCREMENT,
      pedido_id INT,
      metodo ENUM('tarjeta','efectivo','transferencia') NOT NULL,
      monto DECIMAL(10,2),
      fecha DATETIME,
      FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
    );
    INSERT INTO proveedores (nombre, ciudad, contacto) VALUES
('Textiles MTY', 'Monterrey', 'ventas@textilesmty.mx'),
('Distribuidora Centro', 'CDMX', 'contacto@centro.mx'),
('Norte Proveedores', 'Monterrey', 'norte@prove.mx');
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Playera negra', 'Ropa', 199.0, 50),
('Jeans slim', 'Ropa', 599.0, 30),
('Sudadera capucha', 'Ropa', 799.0, 20);
INSERT INTO clientes (nombre, ciudad, email) VALUES
('Jose', 'Monterrey', 'jose@example.com'),
('Ana', 'CDMX', 'ana@example.com'),
('Luis', 'Guadalajara', 'luis@example.com');
INSERT INTO pedidos (cliente_id, fecha, total, estado) VALUES
(1, '2025-08-07', 998.0, 'pagado'),
(2, '2025-08-08', 199.0, 'pendiente');
INSERT INTO pedido_items (pedido_id, producto_id, cantidad, precio_unit) VALUES
(1, 1, 2, 199.0),
(1, 2, 1, 599.0),
(2, 1, 1, 199.0);
INSERT INTO pagos (pedido_id, metodo, monto, fecha) VALUES
(1, 'tarjeta', 998.0, '2025-08-07 21:30:00');
