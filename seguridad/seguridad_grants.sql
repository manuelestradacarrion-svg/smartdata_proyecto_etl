-- ============================================================
-- SEGURIDAD - GRANTS, USUARIOS Y GRUPOS
-- Smart Data ETL Pipeline
-- ============================================================

-- 1. GRANTS SOBRE EL CATÁLOGO
GRANT USE CATALOG ON CATALOG adbsmartdatamanuelestrada TO `analistas`;
GRANT USE CATALOG ON CATALOG adbsmartdatamanuelestrada TO `ingenieros`;

-- 2. GRANTS SOBRE SCHEMAS
-- Bronze: solo ingenieros pueden escribir
GRANT USE SCHEMA, SELECT ON SCHEMA adbsmartdatamanuelestrada.bronze TO `ingenieros`;

-- Silver: ingenieros escriben, analistas leen
GRANT USE SCHEMA, SELECT ON SCHEMA adbsmartdatamanuelestrada.silver TO `ingenieros`;
GRANT USE SCHEMA, SELECT ON SCHEMA adbsmartdatamanuelestrada.silver TO `analistas`;

-- Gold: todos leen
GRANT USE SCHEMA, SELECT ON SCHEMA adbsmartdatamanuelestrada.gold TO `ingenieros`;
GRANT USE SCHEMA, SELECT ON SCHEMA adbsmartdatamanuelestrada.gold TO `analistas`;
GRANT USE SCHEMA, SELECT ON SCHEMA adbsmartdatamanuelestrada.gold TO `visualizacion`;

-- 3. GRANTS SOBRE TABLAS GOLD (consumo de dashboards)
GRANT SELECT ON TABLE adbsmartdatamanuelestrada.gold.semantic_layer_gld        TO `analistas`;
GRANT SELECT ON TABLE adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld TO `analistas`;
GRANT SELECT ON TABLE adbsmartdatamanuelestrada.gold.semantic_layer_gld        TO `visualizacion`;
GRANT SELECT ON TABLE adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld TO `visualizacion`;

-- 4. GRANTS SOBRE EXTERNAL LOCATION (solo ingenieros)
GRANT READ FILES, WRITE FILES ON EXTERNAL LOCATION `exlt-raw` TO `ingenieros`;
GRANT READ FILES ON EXTERNAL LOCATION `exlt-delta-lake`        TO `ingenieros`;

-- 5. GRANTS SOBRE STORAGE CREDENTIAL (solo admins)
GRANT CREATE EXTERNAL LOCATION ON STORAGE CREDENTIAL `credential` TO `admins`;

-- ============================================================
-- DELTA SHARING (compartir tabla gold externamente)
-- ============================================================

-- Crear share
CREATE SHARE IF NOT EXISTS share_gold_smartdata
  COMMENT 'Share de tablas Gold para consumo externo';

-- Agregar tabla Gold al share
ALTER SHARE share_gold_smartdata
  ADD TABLE adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld;

-- Crear recipient externo
-- CREATE RECIPIENT IF NOT EXISTS recipient_externo_analytics;

-- Otorgar acceso al recipient
-- GRANT SELECT ON SHARE share_gold_smartdata TO RECIPIENT recipient_externo_analytics;
