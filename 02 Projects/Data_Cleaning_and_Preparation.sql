-- Data cleaning and preparation
-- This the project will involve loading of the data, exploring, removing duplicates, 
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

DESCRIBE staging;

SELECT 
'company' AS column_name,
COUNT(DISTINCT company) AS total_number_of_unique_companies
FROM data_cleaning_and_preparation.staging;

SELECT DISTINCT company unique_companies
FROM data_cleaning_and_preparation.staging;

SELECT DISTINCT country 
FROM data_cleaning_and_preparation.staging;

SELECT 
'country' AS column_name,
COUNT(DISTINCT country) AS total_number_of_unique_countries
FROM data_cleaning_and_preparation.staging;

SELECT * FROM staging;

 SELECT * ,
 ROW_NUMBER() OVER( 
 PARTITION BY  company, industry, total_laid_off, `date`) row_num
 FROM data_cleaning_and_preparation.staging ;

 SELECT company, industry, total_laid_off, `date`,
 ROW_NUMBER() OVER( 
 PARTITION BY  company, industry, total_laid_off, `date`) row_num
 FROM data_cleaning_and_preparation.staging ;
 
 SELECT *
 FROM(
 SELECT company, industry, total_laid_off, `date`,
 ROW_NUMBER() OVER( 
 PARTITION BY  company, industry, total_laid_off, `date`) row_num
 FROM data_cleaning_and_preparation.staging ) duplicates
 WHERE row_num > 1;
 
WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised) AS row_num
FROM staging)
SELECT * 
FROM duplicate_cte WHERE row_num > 1;


CREATE TABLE `staging2` (
  `company` text,
  `location` text,
  `total_laid_off` text,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` int DEFAULT NULL,
  `country` text,
  `date_added` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO 
staging2
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM staging;

SELECT * 
FROM staging2 where row_num >1;

DELETE  
FROM staging2 where row_num >1;

-- standardizing the data

select * from staging;

SELECT DISTINCT industry
FROM staging;

SELECT * 
FROM staging 
WHERE industry = '' 
AND industry = 'NULL' ;

SELECT * 
FROM staging 
WHERE industry LIKE 'crypto%';

UPDATE  staging 
SET industry = 'crytpo'
WHERE industry LIKE 'crypto%';

SELECT DISTINCT industry
FROM staging2;

SELECT DISTINCT country
FROM staging2 ORDER BY 1 DESC;

SELECT * FROM staging2;

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y') date2
FROM staging2;

UPDATE staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE staging2
MODIFY `date` Date;

SELECT *
FROM staging2;

SELECT date_added
FROM staging2;

SELECT date_added,
STR_TO_DATE(date_added, '%m/%d/%Y') date2
FROM staging2;

UPDATE staging2
SET date_added = STR_TO_DATE(date_added, '%m/%d/%Y');

ALTER TABLE staging2
MODIFY date_added  Date;

SELECT date_added 
FROM staging2;

SELECT *
 FROM staging2;
 
 SELECT * 
 FROM staging2
 WHERE percentage_laid_off =''OR percentage_laid_off IS NULL ;
 
 SELECT * 
 FROM staging2 WHERE total_laid_off = ''  OR total_laid_off  IS NULL
 AND percentage_laid_off ='' OR percentage_laid_off is NULL;
 
 SELECT DISTINCT industry from staging;
SELECT industry 
FROM staging2
WHERE industry IS NULL OR industry = '';

UPDATE staging2
SET industry = NULL
WHERE industry = '';

SELECT t1.industry, t2.industry
FROM staging2 t1
JOIN staging2 t2
ON t1.company = t2.company
WHERE  (t1.industry IS NULL)
AND t2.industry IS NOT NULL;

UPDATE staging2 t1
JOIN staging2 t2
ON t1.company = t2.company
SET t1.insdustry = t2. industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;









