SELECT 
city_id,
monthname(month),
total_passengers,
SUM(repeat_passengers) AS repeat_passangers,
ROUND((SUM(repeat_passengers)/total_passengers)*100,2) AS monthly_repeat_passenger_rate,
ROUND((SUM(SUM(repeat_passengers)) OVER (partition by city_id) / SUM(total_passengers) OVER (partition by city_id))*100,2) AS city_repeat_passenger_rate

FROM trips_db.fact_passenger_summary
GROUP BY city_id,monthname(month),total_passengers
ORDER BY city_id,monthname(month)
