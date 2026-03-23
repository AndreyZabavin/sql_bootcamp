CREATE VIEW v_symmetric_union AS
WITH rs AS (
	SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-02'
	EXCEPT
	SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-06'
),
sr AS (
	SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-06'
	EXCEPT
	SELECT person_id
	FROM person_visits
	WHERE visit_date = '2022-01-02'
)
SELECT person_id FROM rs
UNION
SELECT person_id FROM sr
ORDER BY person_id;