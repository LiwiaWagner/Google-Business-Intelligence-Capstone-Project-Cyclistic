-- calculate trip length in minutes
SELECT EXTRACT(EPOCH FROM (ended_at_time - started_at_time))/60 AS trip_time_minutes 
FROM t_2020_2021_2022_divvy_tripdata;

-- add trip_time_minutes field to the table
ALTER TABLE t_2020_2021_2022_divvy_tripdata
ADD COLUMN trip_time_minutes TIME;

UPDATE t_2020_2021_2022_divvy_tripdata a
SET trip_time_minutes = (SELECT EXTRACT(EPOCH FROM (ended_at_time - started_at_time))/60 
FROM t_2020_2021_2022_divvy_tripdata b
WHERE a.ride_id = b.ride_id);
			 
-- average trip time for all users
SELECT AVG(trip_time_minutes) AS avg_trip_time_minutes 
FROM t_2020_2021_2022_divvy_tripdata;

-- average trip time for each group member type
SELECT member_casual, AVG(trip_time_minutes) AS avg_member_trip_time
FROM t_2020_2021_2022_divvy_tripdata
GROUP BY member_casual;

-- max time spend on trip for each group
SELECT member_casual, MAX(trip_time_minutes) AS max_member_trip_time
FROM t_2020_2021_2022_divvy_tripdata
GROUP BY member_casual;

-- min time spend on trip for each group
SELECT member_casual, MIN(trip_time_minutes) AS min_member_trip_time
FROM t_2020_2021_2022_divvy_tripdata
GROUP BY member_casual;

-- which weekdays have most trips
SELECT TO_CHAR(started_at_date, 'DAY') AS week_day
FROM t_2020_2021_2022_divvy_tripdata;

ALTER TABLE t_2020_2021_2022_divvy_tripdata
ADD COLUMN week_day TEXT;

UPDATE t_2020_2021_2022_divvy_tripdata a
SET week_day = (SELECT TO_CHAR(started_at_date, 'DAY')
FROM t_2020_2021_2022_divvy_tripdata b
WHERE a.ride_id = b.ride_id);

SELECT week_day, COUNT(week_day) AS week_day_count
FROM t_2020_2021_2022_divvy_tripdata
GROUP BY week_day;

-- per membership type
SELECT week_day, COUNT(week_day) AS week_day_count
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'member'
GROUP BY week_day;

SELECT week_day, COUNT(week_day) AS week_day_count
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'casual'
GROUP BY week_day;

-- most popular months
SELECT EXTRACT(MONTH FROM started_at_date::date) AS month_name
FROM t_2020_2021_2022_divvy_tripdata;

SELECT month_name, COUNT(month_name) AS count_month_name
FROM t_2020_2021_2022_divvy_tripdata;

SELECT month_name, COUNT(month_name) AS count_month_name
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'member';

SELECT month_name, COUNT(month_name) AS count_month_name
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'casual';

-- most popular hours
SELECT EXTRACT(HOUR FROM started_at_date) AS time_of_day, COUNT(*), member_casual
FROM t_2020_2021_2022_divvy_tripdata
GROUP BY time_of_day, member_casual
ORDER BY time_of_day DESC;

-- most popular start stations for casual riders
SELECT start_station_name, COUNT(*) AS rank_start_station 
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY rank_start_station

-- most popular start stations for member riders
SELECT start_station_name, COUNT(*) AS rank_start_station 
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY rank_start_station

-- most popular end stations for casual riders
SELECT end_station_name, COUNT(*) AS rank_end_station 
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'casual'
GROUP BY end_station_name
ORDER BY rank_end_station

-- most popular end stations for member riders
SELECT end_station_name, COUNT(*) AS rank_end_station 
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'member'
GROUP BY end_station_name
ORDER BY rank_end_station

--  most popular routes amongst casual riders
SELECT COUNT(*) AS frequency, start_station_name, end_station_name
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'casual'
GROUP BY start_station_name, end_station_name
ORDER BY frequency DESC;

--  most popular routes amongst member riders
SELECT COUNT(*) AS frequency, start_station_name, end_station_name
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'member'
GROUP BY start_station_name, end_station_name
ORDER BY frequency DESC;

--  least popular routes amongst casual riders
SELECT COUNT(*) AS frequency, start_station_name, end_station_name
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'casual'
GROUP BY start_station_name, end_station_name
ORDER BY frequency ASC;

--  least popular routes amongst member riders
SELECT COUNT(*) AS frequency, start_station_name, end_station_name
FROM t_2020_2021_2022_divvy_tripdata
WHERE member_casual = 'member'
GROUP BY start_station_name, end_station_name
ORDER BY frequency ASC;