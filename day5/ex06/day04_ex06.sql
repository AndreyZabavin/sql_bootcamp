CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM person AS p 
JOIN person_visits AS pv ON p.id = pv.person_id 
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
JOIN menu AS m ON m.pizzeria_id = pz.id 
WHERE p.name = 'Dmitriy' 
	AND pv.visit_date = '2022-01-08' 
	AND m.price < 800;