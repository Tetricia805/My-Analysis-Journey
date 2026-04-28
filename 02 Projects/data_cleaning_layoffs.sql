-- Data Cleaning using the layoff dataset 

-- Remove duplicates if there is any
-- Standardize the data
-- Deal with the null and missing values
-- Remove any columnns or rows that are no necessary


SELECT * 
FROM data_cleaning_world_layoffs.layoffs;


-- Creating a copy of the raw data to work with

CREATE TABLE 
layoffs_staging LIKE data_cleaning_world_layoffs.layoffs;

DROP TABLE layoffs_staging;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM data_cleaning_world_layoffs.layoffs;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised) AS row_num
FROM layoffs_staging)
SELECT * 
FROM duplicate_cte WHERE row_num > 1;

SELECT *
FROM layoffs_staging 
WHERE company = 'Casper';





