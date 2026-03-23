SELECT 
	m.pizza_name,
	m.price,
	pz.name AS pizzeria_name,
	pv.visit_date
FROM person_visits AS pv 
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
JOIN person AS p ON pv.person_id = p.id 
JOIN menu AS m ON m.pizzeria_id = pz.id 
WHERE p.name = 'Kate'
	AND m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;