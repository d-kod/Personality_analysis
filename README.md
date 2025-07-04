# Personality_analysis

## About
This project analyzes behavioral patterns to classify individuals as Introverts or Extroverts based on factors such as social activity, time spent alone, friend circle size, and post frequency. The goal is to explore how these traits correlate with personality types, helping in psychological research, marketing segmentation, or social behavior studies.The dataset was obtained from [Kaggle Prediction Personality Data](https://www.kaggle.com/datasets/shalmamuji/personality-prediction-data-introvert-extrovert)

## Aim of the Project
The aim is to spot interesting patterns that help us understand personality differences better, whether for psychology, marketing, or just curiosity.

## About Data
This dataset was obtained from [Kaggle Prediction Personality Data](https://www.kaggle.com/datasets/shalmamuji/personality-prediction-data-introvert-extrovert).It contains various characteristics that are used to classify individuals as Introverts or Extroverts.The data contains 8 columns and 5001 rows

| Column Name               | Description                          | Data Type     |
|---------------------------|--------------------------------------|---------------|
|  time_alone              | Hours spent alone                    | INT           |
|  stage_fear              | Whether the person has stage fear    | VARCHAR(15)   |
|  social_event_attendance | Number of social events attended     | INT           |
|  going_out               | Days per week spent outside home     | INT           |
|  drained_after_socializing | Whether social interactions drain energy | VARCHAR(5) |
|  friends_circle          | Approximate number of close friends  | INT           |
|  post_frequency          | Social media posts per week          | INT           |
|  personality             | Personality classification           | VARCHAR(15)   |

## Analysis List
### 1.Descriptive Analysis
Conduct analysis on the data to understand basic trends and demographics in the dataset
### 2.Correlation Analysis
Shows potential relationships between variables
### 3.Comparative Analysis
This aims to compare groups or condition thus identifying differences between predifined groups
### 4.Prediction Analysis
Aims to give likelihoods or statistical inferences
### 5.Anomaly Detection
Aims in identifying outliers or inconsistencies. Its purpose is to clean data or flag unusual cases for review
### 6.Segmentation Analysis
Divides data into meaningful subgroups for targeted analysis

## Analysis Question to answer
### 1.Descriptive
1. Count of introverts vs. extroverts
2. Average time spent alone by personality type

### 2.Correlation 
1. Distribution of stage fear (Yes/No) by personality

### 3.Comparative 
1. Do extroverts attend more social events than introverts?
2. Do people with stage fear have smaller friend circles?
3. Is post frequency higher for extroverts?

### 4.Prediction
1. If someone has stage fear, what’s the probability they’re an introvert?
2. What combination of factors best predicts personality type?

### 5.Anomaly Detection
1. Extroverts who rarely go outside 
2. Introverts with unusually large friend circles
3. People who report high social attendance but low going out

### 6.Segmentation
1. Among frequent social attendees, what % are introverts?

## Code
For the rest of the code, check [MySQL Local.session.sql](https://github.com/d-kod/Personality_analysis/blob/main/MySQL%20Local.session.sql) file

```sql
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
```


