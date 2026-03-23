WITH female_visits AS (
	SELECT pz.name AS pizzeria_name, COUNT(*) AS female_count
	FROM person_visits AS pv
	JOIN person AS p ON pv.person_id = p.id
	JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
	WHERE p.gender = 'female'
	GROUP BY pz.name
),
male_visits AS (
	SELECT pz.name AS pizzeria_name, COUNT(*) AS male_count
	FROM person_visits AS pv
	JOIN person AS p ON pv.person_id = p.id
	JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
	WHERE p.gender = 'male'
	GROUP BY pz.name
)
SELECT fv.pizzeria_name
FROM female_visits AS fv
LEFT JOIN male_visits AS mv ON fv.pizzeria_name = mv.pizzeria_name
WHERE fv.female_count > COALESCE(mv.male_count, 0)
UNION ALL
SELECT mv.pizzeria_name
FROM male_visits AS mv
LEFT JOIN female_visits AS fv ON mv.pizzeria_name = fv.pizzeria_name
WHERE mv.male_count > COALESCE(fv.female_count, 0)
ORDER BY pizzeria_name;
