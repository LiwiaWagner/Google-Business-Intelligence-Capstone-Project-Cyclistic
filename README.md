# Google Business Intelligence Capstone Project: Buying Behaviour Analysis of Cyclistic Customers

Google Business Intelligence Professional Certificate: https://www.coursera.org/professional-certificates/google-business-intelligence

# Preface

Business Intelligence Professional Certificate designed by Google consisted of three courses:

  1. Foundations of Business Intelligence
  2. The Path to Insights: Data Models and Piplines
  3. Decisions, Decisions: Dashboards and Reports

To complete the course and obtain the certification Capstone Project on choosen case needs to be delivered. I did choose the case of Chicago based bike rental company - Cyclistic. 

My task was to act as a Junior Data Analyst that would analyse company data and based on the analysis outcomes recommend to the company management ways of increasing sales amongst two customer groups. I did perform end-to-end Business Intelligence process designed by Google i.e. Ask, Prepare, Process, Analyze, Share and Act.

# Project Links

Data Source: https://divvy-tripdata.s3.amazonaws.com/index.html

SQL Queries:
  1. Combining Data
  2. Exploring Data
  3. Cleaning Data
  4. Analyzing Data

Tableau Report Link: https://public.tableau.com/app/profile/liwia2886/viz/CyclisticCustomerBuyingBehaviourAnalysisGoogleBICertificationCapstoneProject/Dashboard

Tableau Report Preview:
![image](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/assets/66546424/0b08ef5c-8400-416c-b113-d3180583bfab)

# Background

Cyclistic is a bike-share company based in Chicago with more than 5800 bicycles. These bicycles are geo-tracked and locked into a network of more than 600 stations. The bikes can be unlocked from one station and returned to any other station in the system. The pricing plans are single-ride passes, full-day passes and annual memberships. Customers with single-ride or full-day passes are referred to as casual riders. On the other hand, customers with annual memberships are called Cyclistic members.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, the marketing management team believes that maximizing the number of annual members will be key to future growth. 

Rather than creating a marketing campaign that targets all-new customers, marketing management believes there is a very good chance to convert casual riders into members. The casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. The marketing team plans to design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. 

### Case Scenario

I am assuming the role of a Junior Data Analyst working in the marketing analyst team at Cyclistic. The goal of the analysis is to identify the behavioural differences between the Cyclistic members and the Casual riders. The scope of the analysis will focus on the trip data data for both of the customer groups of the years 2020, 2021 and 2022. The final deliverable will recommend 3 suggestions to convert Casual riders into Cyclistic members.

## Stage 1: Ask
### The question
How do Cyclistic members and casual riders use Cyclistic bikes differently?
### Guiding questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?

## Stage 2: Prepare
### Data Source
I used Cyclistic’s historical trip data to analyze and identify trends from Jan 2020 to Dec 2022 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  

### Data Organization
There are 34 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Stage 3: Process
PostgreSQL was used to combine the various datasets into one dataset and clean it.    

### Combining the Data
SQL Query: [Data Combining](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/01.%20Data%20Combining.sql)  
34 csv files were uploaded as tables and then union into one table named "t_2020_2021_2022_divvy_tridata", containing 14,804,382 rows of data.

### Data Exploration
SQL Query: [Data Exploration](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/02.%20Data%20Exploration.sql)  
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:  
1. The table below shows the all column names and their data types. The __ride_id__ column is our primary key.  

   ![image](https://user-images.githubusercontent.com/125132307/226139161-c5209861-7542-4ad6-8d9a-ce0115086e4d.png)  

2. The following table shows number of __null values__ in each column.  
   
   ![image](https://user-images.githubusercontent.com/125132307/226182623-1f3378b1-c4b2-403e-8a41-7916aacd3666.png)

   Note that some columns have same number of missing values. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.  
3. As ride_id has no null values, let's use it to check for duplicates.  

   ![image](https://user-images.githubusercontent.com/125132307/226181500-38f9b3ca-811d-4612-87ea-87b6d1d3843e.png)

   There are no __duplicate__ rows in the data.  
   
4. All __ride_id__ values have length of 16 so no need to clean it.
5. There are 3 unique types of bikes(__rideable_type__) in our data.

   ![image](https://user-images.githubusercontent.com/125132307/226203372-10c60802-0880-4b17-9ac0-2177ab862974.png)

6. The __started_at__ and __ended_at__ shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format. New column ride_length can be created to find the total trip duration. There are 5360 trips which has duration longer than a day and 122283 trips having less than a minute duration or having end time earlier than start time so need to remove them. Other columns day_of_week and month can also be helpful in analysis of trips at different times in a year.
7. Total of 833064 rows have both __start_station_name__ and __start_station_id__ missing which needs to be removed.  
8. Total of 892742 rows have both __end_station_name__ and __end_station_id__ missing which needs to be removed.
9. Total of 5858 rows have both __end_lat__ and __end_lng__ missing which needs to be removed.
10. __member_casual__ column has 2 uniqued values as member or casual rider.

    ![image](https://user-images.githubusercontent.com/125132307/226212522-aec43490-5d86-4e2e-a92e-b3bf52050415.png)

11. Columns that need to be removed are start_station_id and end_station_id as they do not add value to analysis of our current problem. Longitude and latitude location columns may not be used in analysis but can be used to visualise a map.

