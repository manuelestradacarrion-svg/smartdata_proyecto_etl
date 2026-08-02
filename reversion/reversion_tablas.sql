-- ============================================================
-- REVERSIÓN DEL PIPELINE - Eliminar todas las tablas
-- ============================================================

-- BRONZE
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_produccion_brz;
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_producto_brz;
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.bronze.base_tiendas_brz;

-- SILVER
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.tipo_cambio_bcrp_slv;
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.base_producto_slv;
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.base_tiendas_slv;
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.silver.quality_layer_slv;

-- GOLD
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.gold.semantic_layer_gld;
DROP TABLE IF EXISTS adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld;

-- SCHEMAS (opcional - descomentar si se desea eliminar completamente)
-- DROP SCHEMA IF EXISTS adbsmartdatamanuelestrada.bronze CASCADE;
-- DROP SCHEMA IF EXISTS adbsmartdatamanuelestrada.silver CASCADE;
-- DROP SCHEMA IF EXISTS adbsmartdatamanuelestrada.gold CASCADE;
