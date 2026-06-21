WITH temp1 AS (
	SELECT city_id,trip_count,SUM(repeat_passenger_count) AS repeat_passengers
	FROM dim_repeat_trip_distribution
	GROUP BY city_id, trip_count
), temp2 AS (
	SELECT c.city_name,c.city_id, SUM(p.repeat_passengers) AS total_repeat_passengers
	FROM fact_passenger_summary p
	JOIN dim_city c
	ON p.city_id = c.city_id
	GROUP BY p.city_id
)

SELECT 
	t2.city_name,t1.trip_count,
	ROUND((t1.repeat_passengers/t2.total_repeat_passengers)*100,2) AS "%repeat_passengers"
FROM temp1 t1
JOIN temp2 t2
ON t1.city_id = t2.city_id
