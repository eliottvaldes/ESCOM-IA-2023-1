SELECT
    cat_incidente_codigo_cierre.codigo_cierre,
    cat_incidente_codigo_cierre.descripcion,
    COUNT(*) AS frecuencia
FROM
    `t_incidente`
JOIN cat_incidente_codigo_cierre ON t_incidente.id_codigo_cierre = cat_incidente_codigo_cierre.id_codigo_cierre
GROUP BY
    t_incidente.id_codigo_cierre
ORDER BY
    frecuencia
DESC
    -- COLOCAR O REMOVER EL LIMIT SEGUN SEA EL CASO DE RESULTADOS DESEADOS
    -- LIMIT 1
    ;