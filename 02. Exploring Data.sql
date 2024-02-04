-- checking if data for all years and months loaded
SELECT 
	EXTRACT('YEAR' FROM started_at_date) AS year_test,
	EXTRACT('MONTH' FROM started_at_date) AS month_test 
FROM t_2020_2021_2022_divvy_tripdata
GROUP BY 
	EXTRACT('YEAR' FROM started_at_date),
	EXTRACT('MONTH' FROM started_at_date);

-- checking length of ride IDs
SELECT LENGTH(ride_id) FROM t_2020_2021_2022_divvy_tripdata;

-- checking the total number of rows
SELECT COUNT(*) FROM t_2020_2021_2022_divvy_tripdata; --14'804'382 rows

-- checking if ride IDs have any duplicate values
SELECT COUNT(DISTINCT(ride_id)) FROM t_2020_2021_2022_divvy_tripdata; --14'804'096

-- checking the number of NULL values per row 
SELECT 
	COUNT(*) - COUNT(ride_id) AS ride_id_count, --0
	COUNT(*) - COUNT(rideable_type) AS rideable_type_count, --0
	COUNT(*) - COUNT(started_at_date) AS started_at_date_count, --0
	COUNT(*) - COUNT(started_at_time) AS started_at_hour_count, --0
	COUNT(*) - COUNT(ended_at_date) AS ended_at_date_count, --0
	COUNT(*) - COUNT(ended_at_time) AS ended_at_hour_count, --0
	COUNT(*) - COUNT(start_station_name) AS start_station_name_count, --1'618'518
	COUNT(*) - COUNT(start_station_id) AS start_station_id_count, --1'619'141
	COUNT(*) - COUNT(end_station_name) AS end_station_name_count, --1'742'780
	COUNT(*) - COUNT(end_station_id) AS end_station_id_count, --1'743'241
	COUNT(*) - COUNT(start_lat) AS start_lat_count, --0
	COUNT(*) - COUNT(start_lng) AS start_lng_count, --0
	COUNT(*) - COUNT(end_lat) AS end_lat_count, --14'884
	COUNT(*) - COUNT(end_lng) AS end_lng_count, --14'884
	COUNT(*) - COUNT(member_casual) AS member_casual_count --0
FROM t_2020_2021_2022_divvy_tripdata;	

-- checking how many stations are there 
SELECT DISTINCT(end_station_name) AS end_station FROM t_2020_2021_2022_divvy_tripdata; --1730
SELECT DISTINCT(start_station_name) AS start_station FROM t_2020_2021_2022_divvy_tripdata; --1712

-- confirming that member type has only two values, casual and member
SELECT DISTINCT(member_casual) AS member_type FROM t_2020_2021_2022_divvy_tripdata;

-- confirming that there are only two member types of riders
SELECT DISTINCT (member_casual) FROM t_2020_2021_2022_divvy_tripdata;