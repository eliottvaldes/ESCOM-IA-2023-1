-- parte 1 de consultas
-- 4.- ¿Cuáles son los valores NO repetidos que tienen asignados (rango) los siguientes campos?:
--  Latitud y longitud
SELECT DISTINCT
    latitud, longitud
FROM
    incidentes;
    
-- Opcional 
SELECT DISTINCT
    (geopoint)
FROM
    incidentes;
    
-- año cierre
SELECT DISTINCT
    (año_cierre)
FROM
    incidentes;
    
-- hora cierre
SELECT DISTINCT
    (hora_cierre)
FROM
    incidentes;

-- OTRA SOLUCION A LA RESPUESTA 4
-- latitud y longitud
SELECT 
    MIN(latitud) AS Latitud_Min, 
    MAX(latitud) AS Latitud_Max, 
    MIN(longitud) AS Longitud_Min, 
    MAX(longitud) AS Longitud_Max
FROM incidentes;

-- año cierre
SELECT 
    MIN(año_cierre) AS Año_Cierre_Min, 
    MAX(año_cierre) AS Año_Cierre_Max
FROM incidentes;

-- hora cierre
SELECT 
    MIN(hora_cierre) AS Hora_Cierre_Min, 
    MAX(hora_cierre) AS Hora_Cierre_Max
FROM incidentes;


-- 5.- ¿Cuáles son los valores NO repetidos que tienen asignados y que significado tienen (revisar el diccionario de datos https://datos.cdmx.gob.mx/dataset/incidentes-viales-c5)?
SELECT DISTINCT
    incidente_c4 AS Incidente,
    tipo_entrada AS Tipo,
    clas_con_f_alarma AS Clasificación,
    delegacion_inicio AS Delegación
FROM
    incidentes;

-- 6
-- A. ¿Cuál es la frecuencia de ocurrencia de cada incidente vial? 
SELECT 
    incidente_c4 AS Incidente, COUNT(*) AS Frecuencia
FROM
    incidentes
GROUP BY incidente_c4;

-- B : ¿Cuál es el día_semana con la mayor cantidad de incidentes viales?
SELECT 
    dia_semana AS Dia, COUNT(*) AS frecuencia
FROM
    incidentes
GROUP BY dia_semana
LIMIT 1
;

-- C: ¿Cuál es el mes (fecha_creacion) con la mayor cantidad de incidentes viales?
SELECT 
    MONTH(CONVERT(fecha_creacion , DATE)) AS Fecha, COUNT(*) AS frecuencia
FROM
    incidentes
GROUP BY fecha_creacion;