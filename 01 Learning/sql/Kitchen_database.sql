-- more practice 

DROP DATABASE iF EXISTS kitchen;

CREATE
DATABASE kitchen;

USE kitchen;

CREATE TABLE appliances(
appliance_id INT NOT NULL  PRIMARY KEY,
appliance_name VARCHAR(100),
available_number INT);


INSERT INTO appliances( appliance_id, appliance_name, available_number)
VALUES 
(001, 'stove', 1),
(002, 'microwave', 3),
(0003, 'cooker',1);

SELECT *
FROM appliances;
 

CREATE TABLE Cookware(
cookware_id INT NOT NULL PRIMARY KEY,
cookware_name VARCHAR(100),
cookware_number INT );

SELECT * 
FROM Cookware;

INSERT INTO Cookware(cookware_id, cookware_name,cookware_number)
VALUES
(001, 'saucepan',20);

CREATE TABLE food_ingredients(
food_id INT NOT NULL PRIMARY KEY,
food_name VARCHAR(100),
food_number INT );

SELECT *
FROM  food_ingredients;


CREATE TABLE utensils_tools(
utensil_id INT NOT NULL PRIMARY KEY,
utensil_name VARCHAR(100),
available_number INT);

SELECT * FROM utensils_tools;

CREATE TABLE  dinnerware_drinkware(
ware_id INT NOT NULL PRIMARY KEY,
ware_name VARCHAR(100),
available_number INT );

SELECT * FROM dinnerware_drinkware;

CREATE TABLE  containers(
container_id INT NOT NULL PRIMARY KEY,
container_name VARCHAR(100),
available_number INT );

SELECT * FROM containers;

CREATE TABLE cleaning_supplies(
supply_id INT NOT NULL PRIMARY KEY,
supply_name VARCHAR(100),
available_number INT );

SELECT*
FROM cleaning_supplies;


CREATE TABLE linen_safety(
linen_id INT NOT NULL PRIMARY KEY,
linen_name VARCHAR(100),
available_number INT );

SELECT *
FROM linen_safety;






