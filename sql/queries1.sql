use   delhi_metro_trips;

select * from  delhi_metro_trips;

CREATE INDEX idx_route
ON delhi_metro_trips (from_Station,to_Station);

#1. Which metro routes have the highest passenger traffic?
SELECT from_Station,to_Station,SUM(passengers) AS total_passengers
FROM delhi_metro_trips
GROUP BY from_Station,to_Station
ORDER BY total_passengers DESC
LIMIT 10;

#2. Which routes generate the highest total revenue?
SELECT from_Station, to_Station, Round(sum(Fare*Passengers),2) AS total_revenue
FROM delhi_metro_trips
GROUP BY from_Station,to_Station
ORDER BY total_revenue DESC
LIMIT 1;

#3. What is the average fare for each route?
SELECT from_Station,to_Station, Round(avg(fare),2) AS average_fare
FROM delhi_metro_trips
GROUP BY from_Station, to_Station
ORDER BY average_fare;

#4. Which routes have the longest travel distances?
SELECT from_Station,to_Station, distance_km AS longest_distance
FROM delhi_metro_trips
ORDER BY distance_km DESC
LIMIT 1;

#5. Which stations have the highest number of trip departures?
SELECT from_Station, COUNT(*) AS trip_departures
FROM delhi_metro_trips
GROUP BY from_Station
ORDER BY trip_departures DESC
LIMIT 1;

#6. Which stations receive the highest number of passengers?
SELECT to_Station, SUM(passengers) AS total_passengers
FROM delhi_metro_trips
GROUP BY to_Station
ORDER BY total_passengers DESC
LIMIT 1;

#7. What are the top 10 most frequently used metro stations?
SELECT station, COUNT(*) AS frequency_count
FROM (
    SELECT from_Station AS station FROM delhi_metro_trips
    UNION ALL
    SELECT to_Station AS station FROM delhi_metro_trips
) t
GROUP BY station
ORDER BY frequency_count DESC
LIMIT 10;

#8. Which station pairs are most frequently used for travel?
SELECT from_Station,to_Station, COUNT(*) AS trip_count 
FROM delhi_metro_trips 
GROUP BY from_Station,to_Station 
ORDER BY trip_count DESC;

CREATE INDEX idx_fare_passengers
ON delhi_metro_trips (fare, passengers);

#9. What is the total revenue generated from all trips?
SELECT ROUND(SUM(fare * passengers), 2) AS total_revenue
FROM delhi_metro_trips;

#10. What is the average fare per trip?
SELECT ROUND(AVG(fare), 2) AS avg_fare_per_trip
FROM delhi_metro_trips;

#11. Which routes generate the highest revenue per kilometer?
SELECT from_Station,to_Station, Round(sum(fare*passengers)/sum(distance_km),2) AS revenue_per_km
FROM delhi_metro_trips
GROUP BY from_Station,to_Station
ORDER BY revenue_per_km DESC
LIMIT 1;

#12. Which ticket type generates the highest revenue?
SELECT ticket_type, Round(sum(fare*passengers),2) AS total_revenue
FROM delhi_metro_trips
GROUP BY ticket_type
ORDER BY total_revenue DESC;

#13. What is the average number of passengers per trip?
SELECT ROUND(AVG(passengers)) AS avg_passengers from delhi_metro_trips;

#14. Which trips recorded the highest passenger counts?
SELECT from_station, to_station, passengers
FROM delhi_metro_trips
WHERE passengers = (
    SELECT MAX(passengers) 
    FROM delhi_metro_trips
);

#15. What is the passenger distribution by ticket type?
SELECT ticket_type,SUM(passengers) AS total_num
FROM delhi_metro_trips
GROUP BY ticket_type;

#16. What is the total passenger count for each station?
SELECT station, SUM(passengers) AS total_passengers
FROM (
    SELECT From_Station AS station, passengers 
    FROM delhi_metro_trips
	UNION ALL
    SELECT To_Station AS station, passengers 
    FROM delhi_metro_trips
) t
GROUP BY station
ORDER BY total_passengers DESC;

#17. How many trips occur during peak, off-peak, festival, and weekend conditions?
SELECT remarks,count(remarks) AS trip_day_type
FROM delhi_metro_trips
GROUP BY remarks;

#18. Which travel condition generates the highest revenue?
SELECT remarks,ROUND(sum(fare*passengers),2) AS total_revenue
FROM delhi_metro_trips
GROUP BY remarks
ORDER BY total_revenue desc
LIMIT 1;

#19. What is the monthly passenger trend across the dataset?
SELECT MONTH(date) AS month,SUM(passengers)AS total_passengers 
FROM delhi_metro_trips
GROUP BY month
ORDER BY month ;

#20. Which travel condition has the highest average passenger count per trip?
SELECT remarks,ROUND(avg(passengers),2) AS avg_passengers
FROM delhi_metro_trips
GROUP BY remarks
ORDER BY avg_passengers DESC
LIMIT 1;
