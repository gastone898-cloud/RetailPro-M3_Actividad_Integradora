-- ============================================================
-- RETAILPRO - ACTIVIDAD 4
-- Pre-entrega: Consultas SQL de negocio
-- Archivo: m4_consultas_negocio.sql
-- Base de datos: Ventas_Tech_DB
-- Motor: Microsoft SQL Server
-- ============================================================

USE Ventas_Tech_DB;


-- ============================================================
-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio,
-- agrupados por mes.
--
-- Conceptos: WHERE, DISTINCT, GROUP BY, ORDER BY
--
-- Se utiliza MONTH() en lugar de EXTRACT(MONTH FROM fecha
-- _venta), que corresponde a PostgreSQL.
-- ============================================================

SELECT DISTINCT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
WHERE cantidad > 0
  AND precio_unitario > 0
GROUP BY MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);


-- ============================================================
-- CONSULTA 2 - RANKING DE PRODUCTOS
-- Top 5 de productos por total facturado.
--
-- Conceptos: GROUP BY, ORDER BY y TOP 5.
--
-- Se utiliza TOP 5 para obtener el mismo resultado.
-- ============================================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
WHERE cantidad > 0
  AND precio_unitario > 0
GROUP BY id_producto
ORDER BY SUM(cantidad * precio_unitario) DESC;


-- ============================================================
-- CONSULTA 3 - CLIENTES RECURRENTES
-- Clientes que realizaron mas de un pedido.
--
-- Conceptos: GROUP BY, HAVING, ORDER BY y DISTINCT.
-- ============================================================

SELECT DISTINCT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
WHERE cantidad > 0
  AND precio_unitario > 0
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;


-- ============================================================
-- CONSULTA 4 - MESES POR ENCIMA O POR DEBAJO DEL PROMEDIO
-- Se compara la facturacion de cada mes contra el promedio
-- mensual general.
--
-- Conceptos: WHERE, GROUP BY, HAVING y ORDER BY.
-- ============================================================

SELECT
    resumen.mes,
    resumen.total_facturado,
    CASE
        WHEN resumen.total_facturado > (
            SELECT AVG(promedio_mensual.total_mensual)
            FROM (
                SELECT
                    MONTH(fecha_venta) AS mes,
                    SUM(cantidad * precio_unitario) AS total_mensual
                FROM ventas
                WHERE cantidad > 0
                  AND precio_unitario > 0
                GROUP BY MONTH(fecha_venta)
                HAVING COUNT(*) > 0
            ) AS promedio_mensual
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    WHERE cantidad > 0
      AND precio_unitario > 0
    GROUP BY MONTH(fecha_venta)
    HAVING COUNT(*) > 0
) AS resumen
ORDER BY resumen.mes;


-- ============================================================
-- BLOQUE DE CIERRE - HALLAZGOS
-- ============================================================

-- 1. En marzo de 2024 se registraron 10 pedidos y se
--    facturaron $6.444,00.

-- 2. El producto 1 fue el producto con mayor facturacion,
--    generando $3.600,00, aproximadamente el 55,9% del
--    total facturado.

-- 3. Los 5 clientes registrados realizaron mas de un pedido,
--    por lo que todos pueden considerarse clientes recurrentes
--    dentro del periodo analizado.
