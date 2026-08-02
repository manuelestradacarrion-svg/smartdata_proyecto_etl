# Dashboard - Visualizaciones

Archivos del reporte de ventas desarrollado en Power BI.

## Contenido

| Archivo | Descripción |
|---|---|
| `Reporte_ventas_final_smartdata.pbix` | Archivo Power BI Desktop con el reporte completo |
| `reporte_pagina1.png` | Captura página 1 del reporte (KPIs y gráficos) |
| `reporte_pagina2.png` | Captura página 2 del reporte |
| `enlace_powerbi.txt` | Enlace al reporte publicado en Power BI Service (si aplica) |

## Tablas conectadas

| Tabla Power BI | Tabla Databricks |
|---|---|
| `Fact_mensual` | `adbsmartdatamanuelestrada.gold.flujo_analitico_mensual_gld` |
| `Dim_producto` | `adbsmartdatamanuelestrada.silver.base_producto_slv` |
| `Dim_tiendas` | `adbsmartdatamanuelestrada.silver.base_tiendas_slv` |
| `Dim_tipo_cambio` | `adbsmartdatamanuelestrada.silver.tipo_cambio_bcrp_slv` |

## Conexión
- **Server**: `adb-7405619351097086.6.azuredatabricks.net`
- **SQL Warehouse**: `Serverless Starter Warehouse`
- **HTTP Path**: `/sql/1.0/warehouses/bbb63a4910bfa90a`
