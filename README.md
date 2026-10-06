# RetailPro-M3_Actividad_Integradora
Proyecto Integrador Data Analytics - RetailPro
M3 - SCRIPT SQL DE INGENIERIA DE DATOS
------------------------------------------------------------

Archivo:
ventas_tech_db_M3_SQL_Server_FINAL.sql

¿QUE HACE?
- Utiliza la base de datos Ventas_Tech_DB.
- Elimina las tablas anteriores si ya existen.
- Crea las tablas:
  * categorias
  * clientes
  * productos
  * ventas
- Define claves primarias y relaciones entre las tablas.
- Carga datos de ejemplo para trabajar con las consultas de los módulos
  siguientes.
- Incluye 6 clientes y 7 productos.
- Incluye un cliente sin compras (Sofia Martinez) y un producto sin ventas
  (Parlante Bluetooth), utilizados específicamente para las consultas del M5.
- Al final realiza consultas SELECT para verificar los datos cargados.

IMPORTANTE:
Ejecutar este script primero, ya que crea y carga la estructura que utilizan
M4 y M5.

------------------------------------------------------------
M4 - CONSULTAS DE NEGOCIO
------------------------------------------------------------

Archivo:
m4_consultas_negocio_SQL_Server_FINAL.sql

¿QUE HACE?
Realiza consultas sobre la tabla ventas para obtener información útil para
el análisis del negocio.

Las consultas permiten:
1. Obtener un resumen mensual de ventas, cantidad de pedidos y ticket promedio.
2. Identificar los productos con mayor facturación.
3. Identificar clientes recurrentes, es decir, clientes con más de una compra.
4. Comparar la facturación mensual con el promedio mensual.

También incluye comentarios finales con algunos hallazgos obtenidos a partir
de los datos.

IMPORTANTE:
M4 debe ejecutarse después de M3, porque utiliza la tabla ventas creada en M3.

------------------------------------------------------------
M5 - CONSULTAS CON JOINS
------------------------------------------------------------

Archivo:
m5_consultas_joins_SQL_Server.sql

¿QUE HACE?
Amplía el análisis relacionando información de diferentes tablas mediante JOIN.

Las consultas permiten:
1. Combinar ventas con clientes, productos y categorías para obtener una
   vista más completa de cada operación.
2. Identificar clientes que nunca realizaron una compra mediante LEFT JOIN
   e IS NULL.
3. Identificar productos que nunca tuvieron ventas mediante LEFT JOIN
   e IS NULL.
4. Consolidar las ventas en dos canales mediante UNION ALL y comparar
   el total facturado por canal.

ACLARACION SOBRE LOS CANALES:
La tabla ventas no posee una columna de canal. Por eso, para cumplir con
el ejercicio, la Consulta 4 crea una clasificación utilizando las fechas:
- Online: ventas del 01/03/2024 al 05/03/2024.
- Presencial: ventas posteriores al 05/03/2024.

Esta clasificación es únicamente para el ejercicio y permite demostrar
el uso de UNION ALL y la consolidación de información.

