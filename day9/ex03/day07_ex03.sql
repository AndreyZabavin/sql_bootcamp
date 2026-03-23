WITH vo AS (
	SELECT 
		pz.name,
		COUNT(*) AS	count
	FROM person_order AS po 
	JOIN menu AS m ON po.menu_id = m.id
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
	GROUP BY pz.name
	
	UNION ALL
	
	SELECT 
		pz.name,
		COUNT(*) AS	count
	FROM person_visits AS pv 
	JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
	GROUP BY pz.name
)

SELECT 
	name, 
	SUM(count) AS total_count
FROM vo
GROUP BY name
ORDER BY 2 DESC, 1 ASC;