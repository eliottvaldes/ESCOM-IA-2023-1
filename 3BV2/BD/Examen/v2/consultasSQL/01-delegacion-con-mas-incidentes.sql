SELECT
    cat005_delegacion.delegacion,
    COUNT(*) AS total_incidentes
FROM
    tbl001_incidente
JOIN cat005_delegacion ON tbl001_incidente.id_delegacion_inicio = cat005_delegacion.id_delegacion
GROUP BY
    id_delegacion_inicio
ORDER BY
    total_incidentes
DESC
LIMIT 1;