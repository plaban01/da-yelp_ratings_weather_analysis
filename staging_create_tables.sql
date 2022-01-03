CREATE DATABASE UDACITYPROJECT;

USE DATABASE UDACITYPROJECT;

CREATE SCHEMA STAGING;

USE SCHEMA STAGING;

-- Create file formats (JSON and CSV)
create or replace file format mycsvformat 
type='CSV' compression='auto'
field_delimiter=',' record_delimiter = '\n'  
skip_header=1 error_on_column_count_mismatch=true 
null_if = ('NULL', 'null') empty_field_as_null = true;

--create or replace file format myjsonformat type='JSON' strip_outer_array=true;
CREATE or REPLACE file FORMAT myjsonformat TYPE=JSON COMPRESSION=AUTO TRIM_SPACE=TRUE STRIP_OUTER_ARRAY=true;

-- create tables
DROP TABLE IF EXISTS TEMPERATURE;
CREATE TABLE TEMPERATURE (date STRING, min STRING, max STRING, normal_min STRING, normal_max STRING);

DROP TABLE IF EXISTS PRECIPITATION;
CREATE TABLE PRECIPITATION (date STRING, precipitation STRING, precipitation_normal STRING);

DROP TABLE IF EXISTS BUSINESS;
CREATE TABLE BUSINESS(data VARIANT);

DROP TABLE IF EXISTS CHECKIN;
CREATE TABLE CHECKIN(data VARIANT);

DROP TABLE IF EXISTS REVIEW;
CREATE TABLE REVIEW(data VARIANT);

DROP TABLE IF EXISTS TIP;
CREATE TABLE TIP(data VARIANT);

DROP TABLE IF EXISTS USER;
CREATE TABLE USER(data VARIANT);

DROP TABLE IF EXISTS COVID_FEATURES;
CREATE TABLE COVID_FEATURES(data VARIANT);

