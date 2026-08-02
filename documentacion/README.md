# Documentación del Proyecto

## Smart Data ETL Pipeline — Azure Databricks

### Descripción
Pipeline ETL completo implementado con arquitectura Medallion (Bronze → Silver → Gold) sobre Azure Databricks y Azure Data Lake Storage Gen2, usando Unity Catalog como capa de gobernanza.

### Arquitectura
![Arquitectura](../evidencias/arquitectura.png)

### Decisiones técnicas

| Decisión | Justificación |
|---|---|
| Managed Identity | Autenticación segura sin exponer credenciales en el código |
| Delta Lake | Formato ACID con soporte incremental y time travel |
| Unity Catalog | Gobernanza centralizada de datos, linaje y control de acceso |
| PySpark | Procesamiento distribuido escalable |
| Lakeflow Jobs | Orquestación con lógica condicional por disponibilidad de datos |
| API BCRP | Fuente externa de tipo de cambio en tiempo real |

### Flujo del pipeline

1. **Raw** → Archivos CSV en ADLS Gen2 (contenedor `raw`)
2. **Bronze** → Ingesta cruda con validaciones básicas y control de duplicados por mes
3. **Silver** → Limpieza, enriquecimiento con tipo de cambio y joins dimensionales
4. **Gold** → Métricas de negocio: margen, costo total en soles, flujo mensual analítico

### Servicios Azure aprovisionados

- Azure Databricks Workspace (`adb-7405619351097086`)
- Azure Data Lake Storage Gen2 (`adlssmartdatamanuel95`)
- Azure Access Connector (`ac-smartdata`) — Managed Identity
- Unity Catalog con External Locations

### Orquestación

El job **Generación de Reportes** ejecuta 11 tareas con lógica condicional:
- Ingesta paralela de productos, tiendas y producción
- Condición: solo transforma si hay datos nuevos
- Calidad de producción se ejecuta con `AT_LEAST_ONE_SUCCESS`
- Resultado final en capa Gold disponible para Power BI
