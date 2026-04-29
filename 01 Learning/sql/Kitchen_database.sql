-- KITCHEN DATABASE

DROP DATABASE IF EXISTS kitchen;

CREATE DATABASE kitchen;
USE kitchen;

-- 1. APPLIANCES

CREATE TABLE appliances (
    appliance_id   INT AUTO_INCREMENT PRIMARY KEY, 
    appliance_name VARCHAR(100) NOT NULL,
    available_number INT DEFAULT 0                  --  DEFAULT 0
);

INSERT INTO appliances (appliance_name, available_number)  
VALUES
    ('Stove',          1),
    ('Microwave',      3),
    ('Pressure Cooker',1),
    ('Blender',        2),
    ('Oven',           1),
    ('Air Fryer',      2);

SELECT * FROM appliances;


-- 2. COOKWARE

CREATE TABLE cookware (                            
    cookware_id     INT AUTO_INCREMENT PRIMARY KEY,
    cookware_name   VARCHAR(100) NOT NULL,
    cookware_number INT DEFAULT 0
);

INSERT INTO cookware (cookware_name, cookware_number)
VALUES
    ('Saucepan',     5),
    ('Frying Pan',   4),
    ('Stock Pot',    2),
    ('Wok',          3),
    ('Casserole Dish',2),
    ('Grill Pan',    1);

SELECT * FROM cookware;


-- 3. UTENSILS & TOOLS

CREATE TABLE utensils_tools (
    utensil_id       INT AUTO_INCREMENT PRIMARY KEY,
    utensil_name     VARCHAR(100) NOT NULL,
    available_number INT DEFAULT 0
);

INSERT INTO utensils_tools (utensil_name, available_number)
VALUES
    ('Chef Knife',    3),
    ('Spatula',       6),
    ('Ladle',         4),
    ('Whisk',         5),
    ('Peeler',        4),
    ('Tongs',         3),
    ('Cutting Board', 2);

SELECT * FROM utensils_tools;


-- 4. DINNERWARE & DRINKWARE

CREATE TABLE dinnerware_drinkware (
    ware_id          INT AUTO_INCREMENT PRIMARY KEY,
    ware_name        VARCHAR(100) NOT NULL,
    ware_type        VARCHAR(50),                  
    available_number INT DEFAULT 0
);

INSERT INTO dinnerware_drinkware (ware_name, ware_type, available_number)
VALUES
    ('Dinner Plate',  'dinnerware', 12),
    ('Side Plate',    'dinnerware', 12),
    ('Soup Bowl',     'dinnerware',  8),
    ('Mug',           'drinkware',  10),
    ('Wine Glass',    'drinkware',   6),
    ('Water Glass',   'drinkware',  12),
    ('Serving Dish',  'dinnerware',  4);

SELECT * FROM dinnerware_drinkware;

-- 5. CONTAINERS

CREATE TABLE containers (
    container_id     INT AUTO_INCREMENT PRIMARY KEY,
    container_name   VARCHAR(100) NOT NULL,
    available_number INT DEFAULT 0,
    material         VARCHAR(50)                    
);

INSERT INTO containers (container_name, available_number, material)
VALUES
    ('Glass Jar',        10, 'glass'),
    ('Plastic Tupperware', 8, 'plastic'),
    ('Steel Lunch Box',   4, 'steel'),
    ('Ziplock Bags',     50, 'plastic'),
    ('Mixing Bowl',       3, 'steel'),
    ('Bread Box',         1, 'wood');

SELECT * FROM containers;

-- 6. CLEANING SUPPLIES

CREATE TABLE cleaning_supplies (
    supply_id        INT AUTO_INCREMENT PRIMARY KEY,
    supply_name      VARCHAR(100) NOT NULL,
    available_number INT DEFAULT 0
);

INSERT INTO cleaning_supplies (supply_name, available_number)
VALUES
    ('Dish Soap',        3),
    ('Sponge',          10),
    ('Scrub Brush',      4),
    ('Dishwasher Tabs', 30),
    ('Kitchen Spray',    5),
    ('Rubber Gloves',    2);

SELECT * FROM cleaning_supplies;


-- 7. LINEN & SAFETY

CREATE TABLE linen_safety (
    linen_id         INT AUTO_INCREMENT PRIMARY KEY,
    linen_name       VARCHAR(100) NOT NULL,
    linen_type       VARCHAR(50),                  
    available_number INT DEFAULT 0
);

INSERT INTO linen_safety (linen_name, linen_type, available_number)
VALUES
    ('Kitchen Towel',   'linen',   6),
    ('Oven Mitt',       'safety',  4),
    ('Apron',           'linen',   3),
    ('Table Cloth',     'linen',   2),
    ('Fire Blanket',    'safety',  1),
    ('Pot Holder',      'safety',  5);

SELECT * FROM linen_safety;


-- 8. FOOD INGREDIENTS 
          
CREATE TABLE food_ingredients (
    food_id      INT AUTO_INCREMENT PRIMARY KEY,
    food_name    VARCHAR(100) NOT NULL,
    category     VARCHAR(50),                       -- e.g. vegetable, spice, protein
    food_number  INT DEFAULT 0,                     -- quantity in stock
    unit         VARCHAR(20),                       -- kg, litres, pieces
    unit_price   DECIMAL(10,2) DEFAULT 0.00         --  for aggregation
);

INSERT INTO food_ingredients (food_name, category, food_number, unit, unit_price)
VALUES
    ('Tomato',       'vegetable',  20, 'pieces', 0.30),
    ('Onion',        'vegetable',  15, 'pieces', 0.20),
    ('Garlic',       'spice',      10, 'pieces', 0.10),
    ('Chicken',      'protein',     5, 'kg',     5.00),
    ('Beef',         'protein',     3, 'kg',     8.00),
    ('Rice',         'grain',      10, 'kg',     1.50),
    ('Pasta',        'grain',       8, 'kg',     1.20),
    ('Olive Oil',    'condiment',   4, 'litres', 6.00),
    ('Salt',         'spice',       5, 'kg',     0.50),
    ('Black Pepper', 'spice',       3, 'kg',     3.00),
    ('Egg',          'protein',    24, 'pieces', 0.25),
    ('Milk',         'dairy',       6, 'litres', 1.00),
    ('Butter',       'dairy',       4, 'kg',     4.00),
    ('Flour',        'grain',      10, 'kg',     0.80),
    ('Carrot',       'vegetable',  10, 'pieces', 0.25);

SELECT * FROM food_ingredients;


-- 9. RECIPES                   

CREATE TABLE recipes (
    recipe_id     INT AUTO_INCREMENT PRIMARY KEY,
    recipe_name   VARCHAR(150) NOT NULL,
    cuisine       VARCHAR(50),
    prep_time_min INT,                              -- prep time in minutes
    cook_time_min INT,                              -- cook time in minutes
    servings      INT DEFAULT 1
);

INSERT INTO recipes (recipe_name, cuisine, prep_time_min, cook_time_min, servings)
VALUES
    ('Spaghetti Bolognese', 'Italian',  15, 45, 4),
    ('Chicken Stir Fry',    'Asian',    10, 20, 2),
    ('Vegetable Soup',      'African',  10, 30, 6),
    ('Fried Rice',          'Asian',     5, 15, 3),
    ('Beef Stew',           'African',  20, 90, 5),
    ('Omelette',            'French',    5, 10, 1),
    ('Pasta Carbonara',     'Italian',  10, 20, 2);

SELECT * FROM recipes;

-- 10. RECIPES_INGREDIENTS       

CREATE TABLE recipes_ingredients (
    recipe_id   INT NOT NULL,
    food_id     INT NOT NULL,
    quantity    DECIMAL(8,2),
    unit        VARCHAR(20),
    PRIMARY KEY (recipe_id, food_id),              -- Composite primary key
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
        ON DELETE CASCADE,
    FOREIGN KEY (food_id)   REFERENCES food_ingredients(food_id)
        ON DELETE CASCADE
);

INSERT INTO recipes_ingredients (recipe_id, food_id, quantity, unit)
VALUES
    -- Spaghetti Bolognese (recipe 1)
    (1, 4, 0.5, 'kg'),       -- Chicken (using as protein substitute)
    (1, 1, 3,   'pieces'),   -- Tomato
    (1, 2, 1,   'pieces'),   -- Onion
    (1, 3, 2,   'pieces'),   -- Garlic
    (1, 7, 0.4, 'kg'),       -- Pasta

    -- Chicken Stir Fry (recipe 2)
    (2, 4, 0.3, 'kg'),       -- Chicken
    (2, 3, 3,   'pieces'),   -- Garlic
    (2, 8, 0.05,'litres'),   -- Olive Oil

    -- Vegetable Soup (recipe 3)
    (3, 1, 4,   'pieces'),   -- Tomato
    (3, 2, 2,   'pieces'),   -- Onion
    (3, 15,3,   'pieces'),   -- Carrot
    (3, 9, 0.01,'kg'),       -- Salt

    -- Fried Rice (recipe 4)
    (4, 6, 0.3, 'kg'),       -- Rice
    (4, 11,2,   'pieces'),   -- Egg
    (4, 2, 1,   'pieces'),   -- Onion
    (4, 8, 0.02,'litres'),   -- Olive Oil

    -- Omelette (recipe 6)
    (6, 11,3,   'pieces'),   -- Egg
    (6, 12,0.05,'litres'),   -- Milk
    (6, 13,0.02,'kg'),       -- Butter
    (6, 9, 0.005,'kg');      -- Salt

SELECT * FROM recipes_ingredients;



-- Practice: SELECT, JOIN, GROUP BY, HAVING, Subqueries,
--           Window Functions, CTEs, Triggers, Views

-- SELECT, DISTINCT, WHERE, ORDER BY, LIMIT

SELECT * 
FROM kitchen.appliances;

SELECT appliance_name, available_number
FROM appliances;

SELECT DISTINCT  appliance_name 
FROM appliances;

SELECT * 
FROM food_ingredients;

SELECT food_name,category
FROM food_ingredients;

SELECT DISTINCT category 
FROM food_ingredients;

SELECT * 
FROM linen_safety;

SELECT DISTINCT linen_type
FROM linen_safety;

SELECT linen_name, linen_type 
FROM linen_safety
WHERE linen_type = 'safety';

SELECT * FROM linen_safety
WHERE linen_type = 'linen';


SELECT * 
FROM  cleaning_supplies WHERE supply_name = 'Kitchen Spray';

SELECT linen_type, linen_name
FROM linen_safety  WHERE linen_type = 'safety' ORDER BY linen_type ASC;


SELECT linen_type, linen_name
FROM linen_safety  WHERE linen_type = 'safety' ORDER BY linen_type ASC LIMIT 1;


-- Filtering 

SELECT * 
FROM recipes;

SELECT  recipe_name, cuisine
FROM recipes 
WHERE cuisine = 'African' AND cook_time_min LIKE '3%';

SELECT  recipe_name, cuisine
FROM recipes 
WHERE cuisine = 'African' AND cook_time_min LIKE '%0%';

SELECT * 
FROM recipes;

SELECT recipe_name, cook_time_min 
FROM recipes WHERE cook_time_min > 20;

SELECT recipe_name, cuisine, servings, cook_time_min
FROM recipes WHERE prep_time_min > 5 
AND servings BETWEEN 2 AND 6
AND cook_time_min >20;



