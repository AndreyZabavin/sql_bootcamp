SELECT 
	m.pizza_name, 
	p.name AS pizzeria_name
FROM person_order AS po 
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS p ON m.pizzeria_id = p.id
WHERE po.person_id = 1 OR po.person_id = 4
ORDER BY m.pizza_name, pizzeria_name;