SELECT 
    cat_delegacion.delegacion,
    COUNT(DISTINCT (t_incidentes.incidente_folio)) AS cantidad_incidentes,
    SUM(t_delegacion_habitantes.cantidad_habitantes) AS total_habitantes,
    cat_inegi_sexo.sexo
FROM
    `escom-3bv2-bd`.t_incidentes
        INNER JOIN
    cat_delegacion ON t_incidentes.clave_delegacion_inicio = cat_delegacion.clave_delegacion
        INNER JOIN
    t_delegacion_habitantes ON cat_delegacion.clave_delegacion = t_delegacion_habitantes.clave_delegacion
        INNER JOIN
    cat_inegi_sexo ON t_delegacion_habitantes.clave_sexo = cat_inegi_sexo.clave_sexo
WHERE
    cat_inegi_sexo.sexo = 'M'
GROUP BY cat_delegacion.delegacion , cat_inegi_sexo.sexo
ORDER BY cantidad_incidentes DESC;



-- Esta consulta SQL proporcionará el número total de incidentes y la cantidad de mujeres en cada delegación. 
-- La consulta se une a las tablas t_incidentes, cat_delegacion, t_delegacion_habitantes y cat_inegi_sexo para obtener la información necesaria. 

-- El resultado incluirá las siguientes columnas:
--     delegacion: El nombre de la delegación.
--     cantidad_incidentes: La cantidad total de incidentes en la delegación.
--     total_habitantes: La cantidad total de mujeres en la delegación.
--     sexo: El sexo de los habitantes en la delegación, que en este caso es 'M' (Mujeres).
-- 
-- La consulta agrupa los resultados por delegación y sexo (solo mujeres en este caso) y muestra la cantidad total de incidentes y mujeres en cada delegación.
