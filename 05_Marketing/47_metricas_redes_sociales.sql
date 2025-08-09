DROP DATABASE IF EXISTS db_metricas_redes_sociales;
    CREATE DATABASE db_metricas_redes_sociales CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
    USE db_metricas_redes_sociales;

    CREATE TABLE leads(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(120),
      email VARCHAR(120),
      ciudad VARCHAR(80),
      fuente VARCHAR(80)
    );
    CREATE TABLE campañas(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(150),
      inicio DATE,
      fin DATE,
      presupuesto DECIMAL(12,2)
    );
    CREATE TABLE canales(
      id INT PRIMARY KEY AUTO_INCREMENT,
      nombre VARCHAR(80),
      tipo ENUM('social','email','search','display')
    );
    CREATE TABLE promociones(
      id INT PRIMARY KEY AUTO_INCREMENT,
      campaña_id INT,
      nombre VARCHAR(150),
      descuento DECIMAL(5,2),
      FOREIGN KEY (campaña_id) REFERENCES campañas(id)
    );
    CREATE TABLE interacciones(
      id INT PRIMARY KEY AUTO_INCREMENT,
      lead_id INT,
      canal_id INT,
      fecha DATETIME,
      accion VARCHAR(80),
      FOREIGN KEY (lead_id) REFERENCES leads(id),
      FOREIGN KEY (canal_id) REFERENCES canales(id)
    );
    CREATE TABLE conversiones(
      id INT PRIMARY KEY AUTO_INCREMENT,
      lead_id INT,
      campaña_id INT,
      fecha DATETIME,
      monto DECIMAL(10,2),
      FOREIGN KEY (lead_id) REFERENCES leads(id),
      FOREIGN KEY (campaña_id) REFERENCES campañas(id)
    );
    INSERT INTO leads (nombre, email, ciudad, fuente) VALUES
('Jose', 'jose@dev.mx', 'Monterrey', 'Instagram'),
('Ana', 'ana@dev.mx', 'CDMX', 'YouTube');
INSERT INTO campañas (nombre, inicio, fin, presupuesto) VALUES
('Lanzamiento Portafolio', '2025-08-10', '2025-09-10', 10000.0);
INSERT INTO canales (nombre, tipo) VALUES
('Instagram', 'social'),
('Email', 'email'),
('Google Ads', 'search');
INSERT INTO promociones (campaña_id, nombre, descuento) VALUES
(1, '-20% Suscripción newsletter', 20.0);
INSERT INTO interacciones (lead_id, canal_id, fecha, accion) VALUES
(1, 1, '2025-08-09 12:00:00', 'click'),
(2, 3, '2025-08-09 13:00:00', 'impresion');
INSERT INTO conversiones (lead_id, campaña_id, fecha, monto) VALUES
(1, 1, '2025-08-09 18:00:00', 299.0);
