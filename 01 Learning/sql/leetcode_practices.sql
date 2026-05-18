
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
