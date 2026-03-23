SELECT 
	m.pizza_name, 
	p.name AS pizzeria_name,
	m.price
FROM menu AS m 
JOIN pizzeria AS p ON m.pizzeria_id = p.id
WHERE m.pizza_name = 'mushroom pizza'
	OR  m.pizza_name = 'pepperoni pizza'
ORDER BY m.pizza_name, pizzeria_name;