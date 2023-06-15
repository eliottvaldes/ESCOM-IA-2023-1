SELECT
    cat_delegacion.delegacion,
    COUNT(*) AS numero_incidentes
FROM
    `t_incidente`
JOIN cat_delegacion ON t_incidente.id_delegacion_inicio = cat_delegacion.id_delegacion
GROUP BY
    t_incidente.id_delegacion_inicio
ORDER BY
    numero_incidentes
DESC
    -- COLOCAR O REMOVER EL LIMIT SEGUN SEA EL CASO DE RESULTADOS DESEADOS
    -- LIMIT 1;