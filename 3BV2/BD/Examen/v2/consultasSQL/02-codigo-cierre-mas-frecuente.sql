SELECT
    cat005_delegacion.delegacion,
    id_delegacion_cierre,
    id_codigo_cierre,
    COUNT(*) AS frecuencia
FROM
    tbl001_incidente
JOIN cat005_delegacion ON tbl001_incidente.id_delegacion_cierre = cat005_delegacion.id_delegacion
GROUP BY
    id_delegacion_cierre,
    id_codigo_cierre
HAVING
    frecuencia =(
    SELECT
        MAX(sub.frecuencia)
    FROM
        (
        SELECT
            id_delegacion_cierre,
            id_codigo_cierre,
            COUNT(*) AS frecuencia
        FROM
            tbl001_incidente
        GROUP BY
            id_delegacion_cierre,
            id_codigo_cierre
    ) AS sub
WHERE
    sub.id_delegacion_cierre = tbl001_incidente.id_delegacion_cierre
);