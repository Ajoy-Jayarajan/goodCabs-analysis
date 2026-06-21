SELECT 
	c.city_name,
    COUNT(t.trip_id) AS total_trips,
    ROUND(AVG(t.fare_amount / t.distance_travelled_km),2) AS avg_fare_per_km,
    ROUND(AVG(t.fare_amount),2) AS avg_fare_per_trip,
    ROUND((COUNT(t.trip_id) / SUM(COUNT(t.trip_id)) OVER ())*100,2) AS "%_contibution_of_total_trips"
FROM fact_trips t
JOIN dim_city c
ON t.city_id = c.city_id
GROUP BY t.city_id