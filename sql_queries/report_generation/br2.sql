WITH temp AS (SELECT c.city_id,c.city_name,monthname(t.month) AS month,
SUM(t.total_target_trips) AS target_trips
FROM trips_db.dim_city c
JOIN targets_db.monthly_target_trips t
ON c.city_id = t.city_id 
GROUP BY c.city_id,c.city_name,t.month)

SELECT 
	t.city_name, monthname(f.date) AS month,t.target_trips, COUNT(f.trip_id) AS actual_trips,
    CASE 
		WHEN t.target_trips < COUNT(f.trip_id) THEN "Above Target" 
		ELSE 'Below Target'
        END AS performance_status,
	ROUND(-(1 - (COUNT(f.trip_id)/t.target_trips))*100,2) AS "%difference"
        
FROM temp t
JOIN trips_db.fact_trips f 
ON t.city_id = f.city_id AND t.month = monthname(f.date)
GROUP BY t.city_name,monthname(f.date),t.target_trips
