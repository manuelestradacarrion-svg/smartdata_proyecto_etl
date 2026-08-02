

-- ============================================================
-- REVERSIÓN DEL PIPELINE - Smart Data ETL
-- ============================================================
-- Tener en cuenta que la primera vez que se ejecute el pipeline, las tablas deben crearse, las siguientes ejecuciones al ser incrementales solo se van appendear por eso se usa TRUNCATE

-- TRUNCATE (recomendado para re-ejecutar el pipeline)
--   Elimina los datos pero conserva la estructura de la tabla.
--   Usar cuando las tablas ya existen y se quiere cargar datos frescos.

-- ============================================================
-- TRUNCATE (limpiar datos, mantener estructura)
-- ============================================================

-- BRONZE
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_produccion_brz;
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_producto_brz;
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_tiendas_brz;

-- SILVER
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.silver.tipo_cambio_bcrp_slv;
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.silver.base_producto_slv;
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.silver.base_tiendas_slv;
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.silver.quality_layer_slv;

-- GOLD
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.gold.semantic_layer_gld;
TRUNCATE TABLE IF EXISTS adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld;
