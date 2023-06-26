SELECT
    t1.delegacion,
    t1.poblacion_masculina,
    t2.numero_incidentes
FROM
    (
    SELECT
        d.delegacion,
        SUM(dp.poblacion) AS poblacion_masculina
    FROM
        tbl002_poblacion_por_delegacion dp
    JOIN cat005_delegacion d ON
        dp.id_delegacion = d.id_delegacion
    JOIN cat007_sexo s ON
        dp.id_sexo = s.id_sexo
    WHERE
        s.sexo_codigo = 'H'
    GROUP BY
        d.delegacion
    ORDER BY
        poblacion_masculina
    DESC
LIMIT 16
) t1,(
    SELECT
        d.delegacion,
        COUNT(i.id_delegacion_inicio) AS numero_incidentes
    FROM
        tbl001_incidente i
    JOIN cat005_delegacion d ON
        i.id_delegacion_inicio = d.id_delegacion
    GROUP BY
        d.delegacion
    ORDER BY
        numero_incidentes
    DESC
LIMIT 16
) t2
WHERE
    t1.delegacion = t2.delegacion;