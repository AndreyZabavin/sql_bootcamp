SELECT DISTINCT pz.name AS pizzeria_name
FROM person_visits AS pv 
JOIN person AS p ON pv.person_id = p.id 
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
WHERE p.name = 'Andrey'

EXCEPT

SELECT DISTINCT pz.name AS pizzeria_name
FROM person_order AS po 
JOIN person AS p ON po.person_id = p.id 
JOIN menu AS m ON po.menu_id = m.id 
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
WHERE p.name = 'Andrey'

ORDER BY pizzeria_name;
