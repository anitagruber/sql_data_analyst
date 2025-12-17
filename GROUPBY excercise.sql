CREATE TABLE sales (
sale_id SERIAL PRIMARY KEY,
product_id INT,
customer_id INT,
sale_date DATE,
quantity INT,
unit_price DECIMAL(10, 2)
);


INSERT INTO sales (product_id, customer_id, sale_date, quantity,
unit_price) VALUES
(1, 101, '2024-03-01', 5, 10.00),
(2, 102, '2024-03-01', 3, 15.50),
(1, 103, '2024-03-02', 2, 10.00),
(3, 101, '2024-03-02', 4, 20.00),
(2, 104, '2024-03-03', 6, 15.50),
(1, 105, '2024-03-03', 3, 10.00);

SELECT * FROM sales;

--Calculate the total sales amount for each day.
--Számítsd ki az egyes napokra eső teljes értékesítési összeget!
SELECT sale_date,
SUM(quantity * unit_price) AS total_sales_amount
FROM sales
GROUP BY sale_date;


--. Find the total sales amount for each customer.
--Add meg az ügyfelenkénti összes értékesítési összeget!
SELECT 
customer_id,
SUM(quantity * unit_price) AS total_sales_amount
FROM sales
GROUP BY customer_id;


 --. Determine the total quantity sold for each product.
 --Határozd meg a termékenként eladott összes mennyiséget
SELECT product_id, SUM (quantity) AS total_quantity_sold
FROM sales
GROUP BY product_id;

SELECT product_id,
SUM (quantity) AS total_sales_quantity
FROM sales
GROUP BY product_id;

 --Calculate the average unit price for each product.
--Mennyi az egyes termékek átlagos egységára?
SELECT 
product_id,
AVG(unit_price) AS average_unit_price
FROM sales
GROUP BY product_id;

--Hány darab értékesítés történt naponta?
--How many sales were made each day?
SELECT sale_date,
COUNT (product_id)
FROM sales
GROUP BY sale_date;

--Mely termékek átlagos egységára nagyobb, mint 15?
--Which products have an average unit price greater than 15?
SELECT product_id,
AVG (unit_price) AS average_unit_price
FROM sales 
GROUP BY product_id
HAVING AVG (unit_price)>15;


--Mely termékek átlagos egységára kisebb, mint 15?
  SELECT product_id, AVG(unit_price) as average_unit_price
 from sales
 GROUP BY product_id
 HAVING AVG(unit_price) <15
 ORDER BY AVG(unit_price) ASC;
