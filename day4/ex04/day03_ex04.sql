WITH female_visits AS (
	SELECT pz.name AS pizzeria_name
	FROM person_order AS po 
	JOIN person AS p ON po.person_id = p.id 
	JOIN menu AS m ON po.menu_id = m.id 
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
	WHERE p.gender = 'female'
	EXCEPT
	SELECT pz.name AS pizzeria_name
	FROM person_order AS po 
	JOIN person AS p ON po.person_id = p.id 
	JOIN menu AS m ON po.menu_id = m.id 
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
	WHERE p.gender = 'male'
),
male_visits AS (
	SELECT pz.name AS pizzeria_name
	FROM person_order AS po 
	JOIN person AS p ON po.person_id = p.id 
	JOIN menu AS m ON po.menu_id = m.id 
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
	WHERE p.gender = 'male'
	EXCEPT
	SELECT pz.name AS pizzeria_name
	FROM person_order AS po 
	JOIN person AS p ON po.person_id = p.id 
	JOIN menu AS m ON po.menu_id = m.id 
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id 
	WHERE p.gender = 'female'
)
SELECT pizzeria_name 
FROM female_visits
UNION
SELECT pizzeria_name 
FROM male_visits
ORDER BY pizzeria_name;