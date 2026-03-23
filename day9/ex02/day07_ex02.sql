(SELECT 
	pz.name,
	COUNT(*) AS	count,
	'order' AS	action_type
FROM person_order AS po 
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
GROUP BY pz.name 
ORDER BY 2 DESC
LIMIT 3)

UNION 

(SELECT 
	pz.name,
	COUNT(*) AS	count,
	'visit' AS	action_type
FROM person_visits AS pv 
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
GROUP BY pz.name 
ORDER BY 2 DESC
LIMIT 3)

ORDER BY 3, 2 DESC