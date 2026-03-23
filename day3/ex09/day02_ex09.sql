SELECT p.name 
FROM person_order AS po 
JOIN person AS p ON po.person_id = p.id 
JOIN menu AS m ON po.menu_id = m.id 
WHERE p.gender = 'female' 
	AND m.pizza_name = 'pepperoni pizza'
	
INTERSECT

SELECT p.name 
FROM person_order AS po 
JOIN person AS p ON po.person_id = p.id 
JOIN menu AS m ON po.menu_id = m.id 
WHERE p.gender = 'female' 
	AND m.pizza_name = 'cheese pizza'
	
ORDER BY name; 