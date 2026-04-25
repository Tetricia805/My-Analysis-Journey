-- WHERE Clause 

SELECT *
FROM parks_and_recreation.employee_demographics 
WHERE first_name = "Leslie";

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_salary WHERE first_name = "Leslie";

SELECT * 
FROM parks_and_recreation.employee_salary where salary > 70000;

SELECT *  
FROM parks_and_recreation.employee_salary WHERE salary <= 60000;


SELECT *
FROM parks_and_recreation.employee_demographics WHERE gender = "Female";

SELECT *
FROM parks_and_recreation.employee_demographics WHERE gender != "Female";

SELECT * 
FROM parks_and_recreation.employee_demographics WHERE birth_date < "1979-09-25";

-- AND OR NOT Logical Operators

SELECT * 
FROM parks_and_recreation.employee_demographics WHERE birth_date < "1979-09-25" and gender = "female";

-- LIKE Statment
-- % & _

SELECT *
FROM parks_and_recreation.employee_demographics WHERE first_name LIKE 'Don%';

SELECT *
FROM parks_and_recreation.employee_demographics WHERE first_name LIKE '%er%';

SELECT *
FROM parks_and_recreation.employee_demographics WHERE first_name LIKE 'a%';

SELECT *
FROM parks_and_recreation.employee_demographics WHERE first_name LIKE 'a__%';

-- GROUP BY
SELECT gender,  avg(age)
FROM parks_and_recreation.employee_demographics GROUP BY gender;

SELECT gender,max(age), min(age), count(age)
FROM parks_and_recreation.employee_demographics GROUP BY gender;

-- ORDER BY

SELECT *
FROM parks_and_recreation.employee_demographics order by gender, age desc;

-- Limit and Alaising



