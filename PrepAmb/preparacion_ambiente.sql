-- ============================================================
-- PREPARACIÓN DE AMBIENTE - Smart Data ETL Pipeline
-- Ejecutar como administrador del metastore en Databricks SQL
-- ============================================================

-- 1. CREAR CATÁLOGO
CREATE CATALOG IF NOT EXISTS adbsmartdatamanuelestrada
  COMMENT 'Catálogo principal del proyecto Smart Data ETL';

USE CATALOG adbsmartdatamanuelestrada;

-- 2. CREAR SCHEMAS (capas medallion)
CREATE SCHEMA IF NOT EXISTS adbsmartdatamanuelestrada.bronze
  COMMENT 'Capa de datos crudos (raw ingestion)';

CREATE SCHEMA IF NOT EXISTS adbsmartdatamanuelestrada.silver
  COMMENT 'Capa de datos limpios y transformados';

CREATE SCHEMA IF NOT EXISTS adbsmartdatamanuelestrada.gold
  COMMENT 'Capa de datos agregados y listos para consumo';

-- 3. STORAGE CREDENTIAL (Managed Identity - Azure Access Connector)
CREATE STORAGE CREDENTIAL IF NOT EXISTS `credential`
  WITH AZURE_MANAGED_IDENTITY (
    CONNECTOR = '/subscriptions/ce6b5dac-956f-4919-8887-219318e067fe/resourceGroups/rg-proyectosmartdatame/providers/Microsoft.Databricks/accessConnectors/ac-smartdata'
  )
  COMMENT 'Credencial Managed Identity - Access Connector ac-smartdata';

-- 4. EXTERNAL LOCATIONS
CREATE EXTERNAL LOCATION IF NOT EXISTS `exlt-raw`
  URL 'abfss://raw@adlssmartdatamanuel95.dfs.core.windows.net/'
  WITH (STORAGE CREDENTIAL `credential`)
  COMMENT 'Contenedor RAW - archivos CSV de entrada';

CREATE EXTERNAL LOCATION IF NOT EXISTS `exlt-delta-lake`
  URL 'abfss://delta-lake@adlssmartdatamanuel95.dfs.core.windows.net/'
  WITH (STORAGE CREDENTIAL `credential`)
  COMMENT 'Contenedor Delta Lake - tablas Delta';

CREATE EXTERNAL LOCATION IF NOT EXISTS `exlt-metastore`
  URL 'abfss://metastore@adlssmartdatamanuel95.dfs.core.windows.net/'
  WITH (STORAGE CREDENTIAL `credential`)
  COMMENT 'Contenedor Metastore - Unity Catalog';
