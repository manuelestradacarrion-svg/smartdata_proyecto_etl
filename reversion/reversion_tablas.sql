-- ============================================================
-- REVERSIÓN DEL PIPELINE - Smart Data ETL
-- ============================================================
-- OPCIÓN 1: TRUNCATE (recomendado para re-ejecutar el pipeline)
--   Elimina los datos pero conserva la estructura de la tabla.
--   Usar cuando las tablas ya existen y se quiere cargar datos frescos.
--
-- OPCIÓN 2: DROP (reset completo)
--   Elimina tabla y estructura. El pipeline las recrea automáticamente
--   en el primer run gracias al control IF NOT EXISTS en cada notebook.
-- ============================================================


-- ============================================================
-- OPCIÓN 1: TRUNCATE (limpiar datos, mantener estructura)
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


-- ============================================================
-- OPCIÓN 2: DROP (eliminar tablas completamente)
-- Descomentar solo si se desea un reset total.
-- El pipeline recreará las tablas automáticamente en el primer run.
-- ============================================================

-- BRONZE
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_produccion_brz;
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_producto_brz;
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_tiendas_brz;

-- SILVER
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.tipo_cambio_bcrp_slv;
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.base_producto_slv;
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.base_tiendas_slv;
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.quality_layer_slv;

-- GOLD
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.gold.semantic_layer_gld;
-- DROP TABLE IF EXISTS adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld;

-- SCHEMAS (descomentar solo para eliminar todo el catálogo)
-- DROP SCHEMA IF EXISTS adbsmartdatamanuelestrada.bronze CASCADE;
-- DROP SCHEMA IF EXISTS adbsmartdatamanuelestrada.silver CASCADE;
-- DROP SCHEMA IF EXISTS adbsmartdatamanuelestrada.gold CASCADE;
