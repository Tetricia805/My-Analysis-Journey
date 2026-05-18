
-- Find the names of the customer that are either:
-- referred by any customer with id != 2.
-- not referred by any customer.

SELECT
name 
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

-- Write your MySQL query statement below
-- Write a solution to find the name, population, and area of the big countries

SELECT name, population, area
FROM World
WHERE
area >= 3000000 OR population >= 25000000;

-- Write a solution to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order

SELECT 
DISTINCT author_id AS id
FROM 
Views
WHERE
author_id = viewer_id 
ORDER BY id ASC ;

-- OR
SELECT DISTINCT(author_id) AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY author_id, viewer_id
HAVING count(*) >= 1
ORDER BY author_id ASC;
