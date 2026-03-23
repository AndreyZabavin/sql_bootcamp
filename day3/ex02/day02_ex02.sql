SELECT
    COALESCE(p.name, '-') AS person_name,
    pv.visit_date,
    COALESCE(z.name, '-') AS pizzeria_name
FROM (
    SELECT *
    FROM person_visits
    WHERE visit_date BETWEEN DATE '2022-01-01' AND DATE '2022-01-03'
) AS pv
FULL JOIN person AS p ON pv.person_id = p.id
FULL JOIN pizzeria AS z ON pv.pizzeria_id = z.id
ORDER BY person_name, visit_date, pizzeria_name;