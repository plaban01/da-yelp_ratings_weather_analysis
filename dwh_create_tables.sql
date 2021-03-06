CREATE SCHEMA DWH;
USE SCHEMA DWH;

-- Dim business
DROP TABLE IF EXISTS DIM_BUSINESS
CREATE TABLE DIM_BUSINESS(
    BUSINESS_ID STRING PRIMARY KEY,
    NAME STRING, 
    ADDRESS STRING, 
    STATE STRING, 
    CITY STRING,
    POSTAL_CODE STRING,
    REVIEW_COUNT INT,
    STARS INT,
    IS_OPEN INT
);

-- Dim user
DROP TABLE IF EXISTS DIM_USER;
CREATE TABLE DIM_USER (
    USER_ID STRING PRIMARY KEY,
    NAME STRING NOT NULL,
    AVERAGE_STARS FLOAT,
    YELPING_SINCE TIMESTAMP,
    REVIEW_COUNT INT
);

-- Dim date
DROP TABLE IF EXISTS DIM_DATE
CREATE TABLE DIM_DATE(
    DATE DATE,
    DAY INT,
    WEEK INT,
    MONTH INT,
    QUARTER INT,
    YEAR INT
);

-- Dim temperature
DROP TABLE IF EXISTS DIM_TEMPERATURE
CREATE TABLE DIM_TEMPERATURE(
    DATE DATE PRIMARY KEY,
    MIN FLOAT,
    MAX FLOAT,
    NORMAL_MIN FLOAT,
    NORMAL_MAX FLOAT
);

-- Dim precipitation
DROP TABLE IF EXISTS DIM_PRECIPITATION
CREATE TABLE DIM_PRECIPITATION (
    DATE DATE PRIMARY KEY,
    PRECIPITATION FLOAT,
    PRECIPITATION_NORMAL FLOAT
);

-- Fact review
DROP TABLE IF EXISTS FACT_REVIEW
CREATE TABLE FACT_REVIEW(
    REVIEW_ID STRING PRIMARY KEY,
    BUSINESS_ID STRING FOREIGN KEY REFERENCES DIM_BUSINESS(BUSINESS_ID),
    USER_ID STRING FOREIGN KEY REFERENCES DIM_USER(USER_ID),
    DATE DATE,
    STARS INT,
    COOL INT,
    FUNNY INT,
    USEFUL INT,
    REVIEW_TXT STRING
);

