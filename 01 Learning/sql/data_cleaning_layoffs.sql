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


INSERT INTO `world_layoffs`.`layoffs_staging2`
(`company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
`row_num`)
SELECT `company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		world_layoffs.layoffs_staging;

-- now that we have this we can delete rows were row_num is greater than 2

DELETE FROM world_layoffs.layoffs_staging2
WHERE row_num >= 2;



-- 2. Standardize Data


