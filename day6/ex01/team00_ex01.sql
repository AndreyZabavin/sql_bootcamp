WITH RECURSIVE paths AS (
    SELECT point1 AS start,
        point2 AS finish,
        cost,
        ARRAY [point1, point2]::text [] AS path
    FROM nodes
    WHERE point1 = 'a'
    UNION
    SELECT paths.start,
        nodes.point2,
        paths.cost + nodes.cost,
        paths.path || nodes.point2::text
    FROM paths
        JOIN nodes ON paths.finish = nodes.point1
    WHERE NOT nodes.point2 = ANY(paths.path)
),
complete_tours AS (
    SELECT cost + (
            SELECT cost
            FROM nodes
            WHERE point1 = finish
                AND point2 = start
        ) AS total_cost,
        path || start AS tour
    FROM paths
    WHERE cardinality(path) = 4
)
SELECT total_cost,
    tour
FROM complete_tours
WHERE total_cost = (
        SELECT MIN(total_cost)
        FROM complete_tours
    ) OR 
	  total_cost = (
		SELECT MAX(total_cost)
		FROM complete_tours
	)
ORDER BY total_cost,
    tour;