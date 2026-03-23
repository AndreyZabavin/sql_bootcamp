SELECT 
	p.name,
	m.pizza_name,
	m.price,
	m.price - (m.price * pd.discount / 100) :: INT AS discount_price,
	pz.name AS pizzeria_name
FROM person_order AS po
JOIN menu AS m ON po.menu_id = m.id 
JOIN person AS p ON po.person_id = p.id 
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
JOIN person_discounts AS pd ON p.id = pd.person_id AND pz.id = pd.pizzeria_id
ORDER BY 1,2;