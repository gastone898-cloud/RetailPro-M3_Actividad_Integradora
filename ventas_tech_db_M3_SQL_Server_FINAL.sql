-- ============================================================
-- ACTIVIDAD 3 - SCRIPT SQL DE INGENIERIA DE DATOS
-- RetailPro
-- Base de datos: Ventas_Tech_DB
-- Motor: Microsoft SQL Server
-- ============================================================

-- ============================================================
-- 1. CREACION DE LA BASE DE DATOS
-- Si la base ya existe, no se vuelve a crear.
-- ============================================================

IF DB_ID('Ventas_Tech_DB') IS NULL
BEGIN
    CREATE DATABASE Ventas_Tech_DB;
END;

-- ============================================================
-- 2. USAR LA BASE DE DATOS
-- ============================================================

USE Ventas_Tech_DB;


-- ============================================================
-- 3. DROP TABLES
-- Se eliminan primero las tablas que dependen de otras.
-- Esto permite volver a ejecutar el script.
-- ============================================================

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;


-- ============================================================
-- 4. CREATE TABLES
-- ============================================================

-- Tabla de categorias

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);


-- Tabla de clientes

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);


-- Tabla de productos

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo INT DEFAULT 1,

    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);


-- Tabla de ventas

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);


-- ============================================================
-- 5. INSERT DATA
-- ============================================================

-- Categorias

INSERT INTO categorias
VALUES
(1, 'Computacion', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Perifericos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');


-- Clientes

INSERT INTO clientes
VALUES
(1, 'Maria Lopez', 'maria@mail.com', 'Buenos Aires', '2024-01-05'),
(2, 'Carlos Ruiz', 'carlos@mail.com', 'Cordoba', '2024-01-10'),
(3, 'Ana Gomez', 'ana@mail.com', 'Rosario', '2024-02-01'),
(4, 'Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
(5, 'Laura Torres', 'laura@mail.com', 'Tucuman', '2024-03-01');


-- Productos

INSERT INTO productos
VALUES
(1, 'Laptop Pro 15', 1, 1200.00, 15, 1),
(2, 'Mouse Inalambrico', 2, 28.00, 80, 1),
(3, 'Monitor 4K 27 pulgadas', 1, 450.00, 12, 1),
(4, 'Auriculares BT Pro', 3, 120.00, 35, 1),
(5, 'SSD Externo 1TB', 4, 130.00, 18, 1),
(6, 'Teclado Mecanico', 2, 95.00, 40, 1);


-- Ventas

INSERT INTO ventas
VALUES
(1, 1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 2, 5, 28.00, '2024-03-06'),
(3, 3, 3, 1, 450.00, '2024-03-07'),
(4, 1, 4, 2, 120.00, '2024-03-08'),
(5, 4, 5, 3, 130.00, '2024-03-10'),
(6, 2, 6, 4, 95.00, '2024-03-11'),
(7, 5, 1, 1, 1200.00, '2024-03-12'),
(8, 3, 2, 8, 28.00, '2024-03-13'),
(9, 4, 4, 1, 120.00, '2024-03-14'),
(10, 5, 3, 2, 450.00, '2024-03-15');


-- ============================================================
-- 6. VERIFICACION DE LOS DATOS
-- ============================================================

SELECT * FROM categorias;

SELECT * FROM clientes;

SELECT * FROM productos;

SELECT * FROM ventas;
