-- combining data
CREATE TABLE t_2020_2021_2022_divvy_tripdata AS 
SELECT * FROM (
	SELECT * FROM t_2020_Q1_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_04_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_05_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_06_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_07_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_08_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_09_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_10_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_11_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2020_12_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_01_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_02_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_03_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_04_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_05_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_06_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_07_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_08_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_09_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_10_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_11_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2021_12_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_01_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_02_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_03_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_04_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_05_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_06_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_07_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_08_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_09_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_10_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_11_divvy_tripdata
	UNION ALL
	SELECT * FROM t_2022_12_divvy_tripdata
);
 