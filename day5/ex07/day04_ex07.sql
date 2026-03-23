INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(id) + 1 FROM person_visits),
	(SELECT id FROM person WHERE name = 'Dmitriy'),
	(SELECT m.pizzeria_id 
	FROM menu AS m 
	WHERE m.price < 800 
		AND pizzeria_id NOT IN (
			SELECT pz.id
			FROM person AS p 
			JOIN person_visits AS pv ON p.id = pv.person_id 
			JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
			WHERE p.name = 'Dmitriy' 
				AND pv.visit_date = '2022-01-08')
	LIMIT 1),
	'2022-01-08'
);


REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;