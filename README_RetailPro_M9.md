# RetailPro — Proyecto de Análisis de Datos

## Descripción del proyecto

RetailPro es un proyecto académico de análisis de datos orientado a explorar información comercial de una empresa minorista. Su objetivo es organizar y analizar los datos de ventas para generar indicadores que permitan comprender el comportamiento de las ventas, los productos y los clientes, y aportar información útil para la toma de decisiones comerciales.

El proyecto integra consultas SQL, transformación de datos, modelado y visualización en Power BI. Este repositorio reúne los scripts y archivos desarrollados durante las distintas etapas del proyecto.

## Objetivos

* Consultar y analizar información de ventas.
* Relacionar ventas con clientes, productos y categorías.
* Obtener indicadores comerciales mediante consultas SQL.
* Preparar y transformar los datos para su análisis en Power BI.
* Construir un modelo de datos con relaciones y medidas DAX.
* Documentar el proceso para facilitar su revisión y continuidad.

## Herramientas utilizadas

* **SQL Server:** creación y consulta de tablas, análisis de datos y consultas con `JOIN`.
* **SQL Server Management Studio (SSMS):** ejecución y prueba de scripts SQL.
* **Power BI Desktop:** modelado de datos, creación de medidas DAX y visualización de indicadores.
* **Power Query:** limpieza y transformación de datos.
* **GitHub:** almacenamiento, documentación y control de versiones de los archivos del proyecto.
* **Inteligencia artificial (IA):** apoyo en la generación de borradores, revisión de consultas y documentación. Las respuestas y propuestas se evalúan antes de incorporarlas al proyecto.

## Contenido del repositorio

El repositorio contiene los principales archivos desarrollados durante el proyecto:

* `ventas\_tech\_db\_M3\_SQL\_Server\_FINAL.sql`: script SQL correspondiente a la etapa de creación y preparación de la base de datos.
* `m4\_consultas\_negocio\_SQL\_Server\_FINAL.sql`: consultas de análisis comercial, como facturación, ventas por producto y comportamiento de los clientes.
* `m5\_consultas\_joins\_SQL\_Server`: consultas SQL que relacionan ventas con clientes, productos y categorías.
* `RetailPro\_M6\_ETL.pbix`: archivo de Power BI correspondiente al trabajo de preparación y transformación de datos.
* `Olliver\_Gaston\_Checkpoint2.pbix`: archivo de Power BI correspondiente al modelo de datos y las medidas DAX del Checkpoint 2.
* `README.md`: documentación general del proyecto.

Los nombres indicados corresponden a los archivos identificados en el repositorio. Para acceder a las versiones disponibles, consultá el listado de archivos publicado en GitHub.

## Cómo ejecutar los scripts SQL

Para ejecutar los scripts se necesita acceso a Microsoft SQL Server y SQL Server Management Studio (SSMS).

1. Descargar o clonar este repositorio desde GitHub.
2. Abrir SSMS y conectarse a la instancia de SQL Server correspondiente.
3. Abrir el archivo SQL que se desea ejecutar.
4. Verificar que la base de datos indicada en el script exista y que la conexión corresponda a la instancia correcta.
5. Comprobar que las tablas y los datos requeridos estén disponibles antes de ejecutar consultas de análisis.
6. Ejecutar el script y revisar los resultados y los mensajes de SQL Server.
7. Comparar los resultados obtenidos con los cálculos y objetivos de la consulta para comprobar que sean coherentes.

**Importante:** los scripts pueden depender de objetos creados en etapas anteriores. Por eso, deben ejecutarse respetando sus dependencias. Antes de ejecutar instrucciones que creen, modifiquen o eliminen objetos, revisá el contenido del archivo y confirmá que estás trabajando sobre la base de datos correcta.

## Modelo de análisis en Power BI

El modelo contempla una tabla de hechos de ventas y tablas relacionadas con clientes, productos, categorías y fechas.

A partir de este modelo se pueden analizar indicadores como:

* Ventas totales.
* Ventas por canal.
* Ventas acumuladas en el año (YTD).
* Ventas del año anterior (LY).
* Crecimiento porcentual interanual.

La interpretación de estos indicadores debe considerar el período disponible, la calidad de los datos y la configuración de las relaciones del modelo.

## Uso responsable de inteligencia artificial

La inteligencia artificial se utiliza como herramienta de apoyo para generar borradores, revisar consultas SQL, documentar el proyecto y explorar posibles interpretaciones comerciales.

Las respuestas generadas no se consideran correctas automáticamente. El código debe ejecutarse y verificarse, mientras que los hallazgos comerciales deben contrastarse con los datos originales. Las cifras incluidas en los reportes deben poder rastrearse hasta las consultas y fuentes que las respaldan.

La responsabilidad sobre las decisiones analíticas y las conclusiones finales corresponde al analista.

## Estado del proyecto

RetailPro reúne los trabajos realizados durante las distintas etapas de la formación en análisis de datos, desde las consultas SQL hasta el modelado y la visualización en Power BI.

El repositorio funciona como documentación del desarrollo académico y permite consultar los archivos disponibles para revisar y continuar el proyecto.

## Autoría

Proyecto realizado por Gastón Olliver como parte de una formación en análisis de datos.

