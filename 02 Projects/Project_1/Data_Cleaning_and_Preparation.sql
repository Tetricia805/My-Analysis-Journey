-- Data cleaning and preparation
-- This is goiong to involve loading of the data, exploring, removing duplicates, 
-- standardizing ,removing null and unwanted or unnecessary columns or rows

SHOW DATABASES;

USE data_cleaning_and_preparation;

SELECT * 
FROM data_cleaning_and_preparation.layoffs;

CREATE TABLE data_cleaning_and_preparation.staging
LIKE data_cleaning_and_preparation.layoffs;

INSERT staging
SELECT * FROM data_cleaning_and_preparation.layoffs;

SELECT * 
FROM data_cleaning_and_preparation.staging LIMIT 20;




