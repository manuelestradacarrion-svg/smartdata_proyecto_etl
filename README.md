# Smart Data ETL Pipeline

Pipeline ETL completo implementado en **Azure Databricks** con arquitectura **Medallion** (Bronze → Silver → Gold), orquestado con **Lakeflow Jobs** y versionado en GitHub con **CI/CD via GitHub Actions**.

## Arquitectura

Azure ADLS Gen2 (raw)

  [Bronze Layer]          ← Ingesta cruda desde CSV y API (DOS FUENTES)
  
  base_produccion_brz
  
  base_producto_brz
  
  base_tiendas_brz
  
  
  [Silver Layer]          ← Calidad, limpieza y validaciones
  
  quality_layer_slv
  
  base_producto_slv
  
  base_tiendas_slv
  
  tipo_cambio_bcrp_slv
  
  [Gold Layer]            ← Métricas de negocio y analítica
  
  semantic_layer_gld
  
  flujo_analitico_mensual_gld

## Tecnologías

| Componente | Tecnología |
|---|---|
| Compute | Azure Databricks (Cluster + Serverless) |
| Storage | Azure Data Lake Storage Gen2 |
| Autenticación | Managed Identity (Azure Access Connector) |
| Formato tablas | Delta Lake |
| Catálogo | Unity Catalog |
| Orquestación | Lakeflow Jobs (con tareas de condición) |
| CI/CD | GitHub Actions |
| Lenguaje | PySpark (Python) |

## Fuentes de datos

* **CSV (ADLS Gen2 - contenedor raw)**: Producción mensual, Productos, Tiendas
* **API REST (BCRP)**: Tipo de cambio mensual — `estadisticas.bcrp.gob.pe`

## Estructura del repositorio


proceso/                  # Notebooks ETL (PySpark)
ing2brz_Produccion.ipynb

Ing2brz_Producto.ipynb

Ing2brz_Tienda.ipynb

str_slv_tipoCambioBCRP.ipynb

str_slv_Producto.ipynb

str_slv_Tienda.ipynb

str_slv_Quality_layer.ipynb

str_gld_Semantic_layer.ipynb

str_gld_Analityc_layer.ipynb

PrepAmb/                  # Scripts de preparación de ambiente

 preparacion_ambiente.sql
 
reversion/                # Scripts de reversión (DROP)

 reversion_tablas.sql
 
github/

workflows/

ci_cd.yml         # CI/CD GitHub Actions

README.md


## Ejecución

1. Subir archivos CSV al contenedor raw en Azure (ADLS Gen2)
2. Ejecutar el job **Generación de Reportes** en Lakeflow Jobs
3. El pipeline detecta automáticamente los archivos y procesa el mes correspondiente

## Seguridad

La conexión a Azure ADLS Gen2 usa exclusivamente Managed Identity (System-Assigned) a través del Access Connector ac-smartdata, sin credenciales expuestas en el código.
