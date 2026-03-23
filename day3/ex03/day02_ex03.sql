WITH md AS ( 
	SELECT 
		generate_series('2022-01-01'::date, 
						'2022-01-10'::date, 
						'1 day')::date AS missing_date 
) 
SELECT md.missing_date 
FROM md 
LEFT JOIN ( 
	SELECT DISTINCT visit_date 
	FROM person_visits 
	WHERE person_id = 1 
) AS v1 ON md.missing_date = v1.visit_date 
LEFT JOIN ( 
	SELECT DISTINCT visit_date 
	FROM person_visits 
	WHERE person_id = 2 
) AS v2 ON md.missing_date = v2.visit_date 
WHERE v1.visit_date IS NULL 
	AND v2.visit_date IS NULL 
ORDER BY md.missing_date;