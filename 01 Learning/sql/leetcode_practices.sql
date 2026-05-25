
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

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

SELECT
    tweet_id
FROM 
    Tweets 
WHERE
    CHAR_LENGTH(content) > 15;

-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

-- Return the result table in any order.

SELECT 
    ui.unique_id, e.name
FROM
    EmployeeUNI as ui
RIGHT JOIN Employees e
ON 
ui.id = e.id;

-- 1068. Product Sales Analysis
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

-- Return the resulting table in any order.
SELECT
    p.product_name,s.year, s.price
FROM 
    Sales s
JOIN 
    Product p
ON 
s.product_id = p.product_id;
