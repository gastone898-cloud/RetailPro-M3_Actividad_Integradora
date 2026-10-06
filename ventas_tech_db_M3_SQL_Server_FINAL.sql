-- ============================================================
-- ACTIVIDAD 3 - SCRIPT SQL DE INGENIERIA DE DATOS
-- RetailPro
-- Base de datos: Ventas_Tech_DB
-- Motor: Microsoft SQL Server
-- ============================================================

    USE Ventas_Tech_DB;

-- ============================================================
-- ELIMINAR LAS TABLAS EXISTENTES
-- Se verifica que existan antes de eliminarlas.
-- El orden evita problemas por las relaciones entre tablas.
-- ============================================================

IF OBJECT_ID('ventas', 'U') IS NOT NULL
    DROP TABLE ventas;

IF OBJECT_ID('productos', 'U') IS NOT NULL
    DROP TABLE productos;

IF OBJECT_ID('clientes', 'U') IS NOT NULL
    DROP TABLE clientes;

IF OBJECT_ID('categorias', 'U') IS NOT NULL
    DROP TABLE categorias;

-- ============================================================
-- TABLA: categorias
-- ============================================================

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- ============================================================
-- TABLA: clientes
-- ============================================================

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);

-- ============================================================
-- TABLA: productos
-- ============================================================

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo INT DEFAULT 1,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- ============================================================
-- TABLA: ventas
-- ============================================================

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ============================================================
-- DATOS: categorias
-- ============================================================

INSERT INTO categorias (id_categoria, nombre_categoria, descripcion)
VALUES
(1, 'Informatica', 'Computadoras y accesorios'),
(2, 'Celulares', 'Telefonos celulares y accesorios'),
(3, 'Audio', 'Auriculares y dispositivos de audio'),
(4, 'Gaming', 'Productos para videojuegos');

-- ============================================================
-- DATOS: clientes
-- Cliente 6 no tiene ninguna venta.
-- Esto permite demostrar LEFT JOIN + IS NULL en M5.
-- ============================================================

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
(1, 'Juan Perez', 'juan@mail.com', 'Buenos Aires', '2024-01-10'),
(2, 'Maria Lopez', 'maria@mail.com', 'CABA', '2024-01-15'),
(3, 'Carlos Gomez', 'carlos@mail.com', 'Lanus', '2024-02-05'),
(4, 'Ana Rodriguez', 'ana@mail.com', 'Quilmes', '2024-02-12'),
(5, 'Pedro Fernandez', 'pedro@mail.com', 'Avellaneda', '2024-02-20'),
(6, 'Sofia Martinez', 'sofia@mail.com', 'La Plata', '2024-03-20');

-- ============================================================
-- DATOS: productos
-- Producto 7 no tiene ninguna venta.
-- Esto permite demostrar LEFT JOIN + IS NULL en M5.
-- ============================================================

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
(1, 'Notebook Lenovo', 1, 1200.00, 10, 1),
(2, 'Mouse Logitech', 1, 25.00, 50, 1),
(3, 'iPhone 15', 2, 950.00, 8, 1),
(4, 'Samsung Galaxy A55', 2, 500.00, 15, 1),
(5, 'Auriculares Sony', 3, 150.00, 20, 1),
(6, 'Teclado Gamer', 4, 80.00, 30, 1),
(7, 'Parlante Bluetooth', 3, 85.00, 25, 1);

-- ============================================================
-- DATOS: ventas
-- ============================================================

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
(1, 1, 1, 1, 1200.00, '2024-03-01'),
(2, 2, 2, 2, 25.00, '2024-03-02'),
(3, 3, 3, 1, 950.00, '2024-03-03'),
(4, 4, 4, 1, 500.00, '2024-03-04'),
(5, 5, 5, 2, 150.00, '2024-03-05'),
(6, 1, 1, 2, 1200.00, '2024-03-06'),
(7, 2, 6, 1, 80.00, '2024-03-07'),
(8, 3, 3, 1, 950.00, '2024-03-08'),
(9, 4, 1, 1, 1200.00, '2024-03-09'),
(10, 5, 2, 3, 25.00, '2024-03-10');

-- ============================================================
-- VALIDACION
-- ============================================================

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
