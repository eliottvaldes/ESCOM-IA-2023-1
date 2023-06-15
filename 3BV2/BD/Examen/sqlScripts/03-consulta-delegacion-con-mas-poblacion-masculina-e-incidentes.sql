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
        t_delegacion_poblacion dp
    JOIN cat_delegacion d ON
        dp.id_delegacion = d.id_delegacion
    JOIN cat_sexo s ON
        dp.id_sexo = s.id_sexo
    WHERE
        s.sexo = 'M'
    GROUP BY
        d.delegacion
    ORDER BY
        poblacion_masculina
    DESC
LIMIT 1
) t1,(
    SELECT
        d.delegacion,
        COUNT(i.id_delegacion_inicio) AS numero_incidentes
    FROM
        t_incidente i
    JOIN cat_delegacion d ON
        i.id_delegacion_inicio = d.id_delegacion
    GROUP BY
        d.delegacion
    ORDER BY
        numero_incidentes
    DESC
LIMIT 1
) t2
WHERE
    t1.delegacion = t2.delegacion;
