-- removing NULL values
DELETE FROM t_2020_2021_2022_divvy_tripdata WHERE start_station_name IS NULL;
DELETE FROM t_2020_2021_2022_divvy_tripdata WHERE end_station_name IS NULL;
DELETE FROM t_2020_2021_2022_divvy_tripdata WHERE start_station_id IS NULL;
DELETE FROM t_2020_2021_2022_divvy_tripdata WHERE end_station_id IS NULL;
DELETE FROM t_2020_2021_2022_divvy_tripdata WHERE end_lat IS NULL;
DELETE FROM t_2020_2021_2022_divvy_tripdata WHERE end_lng IS NULL;
