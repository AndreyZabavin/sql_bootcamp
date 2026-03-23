WITH menu_id AS (
	SELECT id
	FROM menu 
	WHERE id NOT IN (
		SELECT menu_id
		FROM person_order
	)
)
SELECT 
	m.pizza_name,
	m.price,
	pz.name AS pizzeria_name
FROM menu_id
JOIN menu AS m ON menu_id.id = m.id 
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;