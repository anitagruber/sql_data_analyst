CREATE TABLE sales (
sale_id SERIAL PRIMARY KEY,
product_id INT,
customer_id INT,
sale_date DATE,
quantity INT,
unit_price DECIMAL(10, 2)
);

DROP TABLE sales;

INSERT INTO sales (product_id, customer_id, sale_date, quantity,
unit_price) VALUES
(1, 101, '2024-03-01', 5, 10.00),
(2, 102, '2024-03-01', 3, 15.50),
(1, 103, '2024-03-02', 2, 10.00),
(3, 101, '2024-03-02', 4, 20.00),
(2, 104, '2024-03-03', 6, 15.50),
(1, 105, '2024-03-03', 3, 10.00);

SELECT * FROM sales;

SELECT 
sale_date, SUM(quantity * unit_price) AS total_sales_amount
FROM sales
GROUP BY sale_date;

SELECT customer_id, SUM(quantity * unit_price) AS total_sales_amount
FROM sales GROUP BY customer_id;

SELECT product_id, SUM (quantity) AS total_sales_quantity FROM sales GROUP BY product_id;

SELECT product_id, AVG (unit_price) AS average_unit_price FROM sales GROUP BY product_id
HAVING AVG (unit_price)>15;

SELECT sale_date, COUNT (product_id) FROM sales GROUP BY sale_date;



