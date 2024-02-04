# Google Business Intelligence Capstone Project: Buying Behaviour Analysis of Cyclistic Customers

[Google Business Intelligence Professional Certificate: Course Page](https://www.coursera.org/professional-certificates/google-business-intelligence)

# Preface

Business Intelligence Professional Certificate designed by Google consisted of three courses:

  1. Foundations of Business Intelligence
  2. The Path to Insights: Data Models and Piplines
  3. Decisions, Decisions: Dashboards and Reports

To complete the course and obtain the certification Capstone Project on choosen case needs to be delivered. I did choose the case of Chicago based bike rental company - Cyclistic. 

My task was to act as a Junior Data Analyst that would analyse company data and based on the analysis outcomes recommend to the company management ways of increasing sales amongst two customer groups. I did perform end-to-end Business Intelligence process designed by Google i.e. Ask, Prepare, Process, Analyze, Share and Act.

# Project Links

Data Source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

SQL Queries:  
[01. Combining Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/01.%20Combining%20Data.sql)  
[02. Exploring Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/02.%20Exploring%20Data.sql)  
[03. Cleaning Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/03.%20Cleaning%20Data.sql)  
[04. Analyzing Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/04.%20Analyzing%20Data.sql)  

Tableau Report Link: [Customer Buying Behaviour: Year 2020 - 2022 Analysis](https://public.tableau.com/app/profile/liwia2886/viz/CyclisticCustomerBuyingBehaviourAnalysisGoogleBICertificationCapstoneProject/Dashboard)

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
SQL Query: [01. Combining Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/01.%20Combining%20Data.sql)  
34 csv files were uploaded as tables and then union into one table named "t_2020_2021_2022_divvy_tridata", containing 14,804,382 rows of data.

### Data Exploration
In this phase I was focused on exploring the data by checking if data for all months and years has been loaded, checking length of ride IDs, checking the number of NULL values for all fields, checking the number of stations and membership types.
SQL Query: [02. Exploring Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/02.%20Exploring%20Data.sql)  

### Data Cleaning
SQL Query: [03. Cleaning Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/03.%20Cleaning%20Data.sql)  
Whithin this step all the rows having NULL values are deleted.
  
### Stage 4: Analyze and Share
SQL Query: [04. Analysing Data](https://github.com/LiwiaWagner/Google-Business-Intelligence-Capstone-Project-Cyclistic/blob/main/04.%20Analyzing%20Data.sql)  
Data Visualization: [Tableau Report](https://public.tableau.com/app/profile/liwia2886/viz/CyclisticCustomerBuyingBehaviourAnalysisGoogleBICertificationCapstoneProject/Dashboard)  
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau. The analysis question is: What is the buying behaviour of Cyclistic Customers?  



