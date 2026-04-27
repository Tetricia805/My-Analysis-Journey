
DROP DATABASE IF EXISTS "small_retail_shop";

CREATE DATABASE "small_reatil_shop";

USE "small_retail_shop";

CREATE TABLE goods (
    good_id INT NOT NULL PRIMARY KEY,
    good_name VARCHAR(50),
    expiry_date DATE,
    stock_date DATETIME,
    good_price DECIMAL(10,2) 
);

DROP TABLE good; --- for deleting a table from a databse

DELETE FROM goods; -- for deleting all rows

INSERT INTO
goods(good_id, good_name, expiry_date,stock_date, good_price)

VALUES
(001, 'oil', '2026-10-01', '2024-10-01', "20000"),
(002, 'maize', '2026-12-01', '2025-12-01', "20000");

UPDATE goods
SET  good_name = 'maize_flour'

WHERE good_id =002


CRAETE TABLE customer(
    customer_id INT NOT NULL PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(50),
    customer_phone_numebr VARCHAR(20),

);


CREATE TABLE retailer( 
    retailer_id INT NOT NULLL PRIMARY KEY,
    retailer_name VARCHAR(100),
    retailer_phone_number VARCHAR(20),
    retailer_email VARCHAR(50)


)

CREATE TABLE orders(
    order_id INT NOT NULL PRIMARY KEY,
    order_date DATETIME,
    order_amount DECIMAL,
    customer_id
    FOREIGN KEY (customer_id) REEFENCES customer(customer_id)
)


INSERT INTO
orders(order_id, order_date, order_amount, customer_id )
VALUES
(001, '2026-04-10', '200000', 002);


-- This is the "Bridge Table" (The Receipt Lines)
-- It links  Orders to Goods
CREATE TABLE order_items (
    order_item_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id INT, -- Links to the Orders table
    good_id INT,  -- Links to the Goods table
    quantity INT, -- How many did they buy?
    price_at_sale DECIMAL(10,2), -- Price changes,!
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (good_id) REFERENCES goods(good_id)
);

