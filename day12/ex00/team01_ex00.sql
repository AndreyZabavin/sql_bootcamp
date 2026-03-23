CREATE OR REPLACE FUNCTION fnc_get_rate(curr VARCHAR)
RETURNS NUMERIC
AS $$
	SELECT rate_to_usd 
	FROM currency
	WHERE name = curr
	ORDER BY updated DESC
	LIMIT 1
$$ LANGUAGE SQL;

SELECT
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	b.type,
	SUM(b.money) AS volume,
	COALESCE(curr_name, 'not defined') AS currency_name,
	COALESCE(fnc_get_rate(curr_name), 1) AS last_rate_to_usd,
	TO_CHAR(SUM(b.money) * COALESCE(fnc_get_rate(curr_name), 1), 'FM999990.999999')::NUMERIC AS total_volume_in_usd
FROM balance AS b 
LEFT JOIN "user" AS u ON b.user_id = u.id
LEFT JOIN LATERAL (
	SELECT c.name AS curr_name
	FROM currency AS c
	WHERE c.id = b.currency_id
	LIMIT 1
) AS c ON true
GROUP BY u.name, u.lastname, b.type, curr_name
ORDER BY 1 DESC, 2, 3;