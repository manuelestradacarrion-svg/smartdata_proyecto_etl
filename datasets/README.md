# Datasets - Fuentes de Datos

Archivos de entrada utilizados por el pipeline ETL.

## Archivos CSV (subir al contenedor `raw` en ADLS Gen2)

| Archivo | Descripción | Destino Bronze |
|---|---|---|
| `base_produccion_YYYYMM.csv` | Ventas mensuales de producción | `bronze.base_produccion_brz` |
| `base_producto_YYYYMM.csv` | Catálogo de productos | `bronze.base_producto_brz` |
| `base_tiendas_YYYYMM.csv` | Catálogo de tiendas | `bronze.base_tiendas_brz` |

## API (sin archivo - consumo directo)

| Fuente | URL | Destino Silver |
|---|---|---|
| BCRP Tipo de Cambio | `estadisticas.bcrp.gob.pe` | `silver.tipo_cambio_bcrp_slv` |

## Notas
- Los archivos CSV se suben al contenedor `raw` en Azure Data Lake Storage Gen2
- El nombre debe incluir el periodo en formato `YYYYMM` (ej: `base_produccion_202601.csv`)
- El pipeline detecta automáticamente el archivo sin importar el nombre exacto
- La autenticación al storage usa **Managed Identity** (sin credenciales en el código)
