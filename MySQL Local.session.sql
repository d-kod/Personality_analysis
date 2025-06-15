-- create database
CREATE DATABASE personality_analysis;

-- create tabel
CREATE Table personality_traits(
    time_alone INT,
    stage_fear VARCHAR(15),
    social_event_attendance INT,
    going_out  INT,
    drained_after_socializing VARCHAR(5),
    friends_circle INT,
    post_frequency INT,
    personality VARCHAR(15),
);

-- Descriptive analysis
-- distribution of introverts and extroverts
SELECT 
    personality,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM personality_traits), 2) AS Percentage
FROM 
    personality_traits
GROUP BY 
    personality;

-- average time alone for introverts and extroverts
SELECT 
    personality,
    SUM(time_alone) AS Total_Time_Alone,
    AVG(time_alone) AS Average_Time_Alone    
    FROM
    personality_traits
GROUP BY
    personality;

-- correlation between stage fear and personality 
SELECT 
    personality,
    stage_fear,
    COUNT(*) AS Count
FROM 
    personality_traits
GROUP BY 
    personality, stage_fear
ORDER BY 
    personality, stage_fear;


-- Comparative analysis
-- social event attendance by personality 
SELECT
     personality,
     sum(social_event_attendance) AS total_attendance,
     round(avg(social_event_attendance), 2) AS average_attendance
     from personality_traits
     group BY personality;

-- stage fear by friends circle   
SELECT
      stage_fear,
      sum(friends_circle) AS total_friends_circle_size,
      round(avg(friends_circle), 2) AS avg_friends_circle_size
      from personality_traits
      group BY stage_fear;

-- post frequency for extroverts
SELECT
    personality,
 sum(post_frequency) AS total_posts,
 round(avg(post_frequency), 2) AS avg_posts
 from personality_traits
 GROUP BY personality;

--Prediction analysis
-- predicting personality type based on stage fear 
-- total count of individuals with stage fear
SELECT
    COUNT(*) AS stage_fear_count
FROM
    personality_traits
WHERE
    stage_fear = 'Yes';

-- count of introverts with stage fear
select 
   count(*) as stage_fear_introverts
from
   personality_traits
where
   stage_fear = 'Yes'
   and personality = 'Introvert';  

-- probability of being an introvert given stage fear
SELECT
    (SELECT COUNT(*) FROM personality_traits WHERE stage_fear = 'Yes' AND personality = 'Introvert') /
    (SELECT COUNT(*) FROM personality_traits WHERE stage_fear = 'Yes') AS Introvert_Probability;  

 --What combination of factors best predicts personality type  
 -- find correlation between personality and the other factors
 SELECT
    personality,
    COUNT(*) AS total_individuals, -- Total count for each personality type

    -- Time Spent Alone
    round(AVG(time_alone),2) AS avg_time_alone_hours,
    MIN(time_alone) AS min_time_alone_hours,
    MAX(time_alone) AS max_time_alone_hours,

    -- Stage Fear
    round(AVG(CASE WHEN stage_fear = 'Yes' THEN 1 ELSE 0 END),2) AS proportion_stage_fear_yes,
    round(AVG(CASE WHEN stage_fear = 'No' THEN 1 ELSE 0 END), 2) AS proportion_stage_fear_no,

    -- Social Event Attendance
    round(AVG(social_event_attendance), 2) AS avg_social_event_attendance,
    MIN(social_event_attendance) AS min_social_event_attendance,
    MAX(social_event_attendance) AS max_social_event_attendance,

    -- Going Outside 
    round(AVG(going_out), 2) AS avg_going_outside,
    MIN(going_out) AS min_going_outside,
    MAX(going_out) AS max_going_outside,

    -- Drained After Socializing
    round(AVG(CASE WHEN drained_after_socializing = 'Yes' THEN 1 ELSE 0 END), 2) AS proportion_drained_yes,
    round(AVG(CASE WHEN drained_after_socializing = 'No' THEN 1 ELSE 0 END), 2) AS proportion_drained_no,

    -- Friends Circle Size 
    round(AVG(friends_circle), 2) AS avg_friends_circle_size,
    MIN(friends_circle) AS min_friends_circle_size,
    MAX(friends_circle) AS max_friends_circle_size,

    -- Post Frequency
    round(AVG(post_frequency), 2) AS avg_post_frequency,
    MIN(post_frequency) AS min_post_frequency,
    MAX(post_frequency) AS max_post_frequency

FROM
    personality_traits -- Make sure this matches your actual table name
GROUP BY
    personality;


-- Anomaly Detection
--Extroverts who rarely go outside 
--finding average going_out
select
round(avg(going_out)) as avg_going_out
from personality_traits;
     
-- extroverts below average     
select 
 count (*) as below_avg_extrovert
from personality_traits
WHERE
  personality = 'Extrovert' AND going_out < 4 ;      

--Introverts with unusually large friend circles
-- average friends circle
select
round(avg(friends_circle)) as avg_friends_size
from personality_traits;
     
-- above average introverts     
select 
 count (*) as above_avg_introverts
from personality_traits
WHERE
  personality = 'Introvert' AND friends_circle > 7 ;   

-- People who report high social attendance but low going out
-- average social attendance
SELECT 
round(avg(social_event_attendance)) as avg_social_event
FROM personality_traits;

-- average going out
SELECT
round(avg(going_out)) as avg_going_out
from personality_traits;

--peculiar set where social attendance is above average whereas going out is below average
SELECT
personality,
count(*) as 'peculiar_set'
FROM personality_traits
WHERE
   social_event_attendance > 5 and going_out <  4
GROUP BY
personality;

-- Segmentation Analysis
-- percentage of introverts among high post frequency
-- average post frequency
SELECT
round(avg(post_frequency)) as average
from personality_traits;

-- percentage of introverts among high posters
SELECT
 (select count(*) from personality_traits where personality = "Introvert" and post_frequency > 5)/
 (select count(*) from personality_traits where post_frequency > 5) * 100 as percentage_introverts;


