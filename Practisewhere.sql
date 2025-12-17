CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price NUMERIC(10, 2),
stock_quantity INT
);

SELECT * FROM products;


INSERT INTO products (product_name, category, price, stock_quantity)
VALUES
('Laptop', 'Electronics', 1200.00, 15),
('Smartphone', 'Electronics', 800.00, 20),
('T-shirt', 'Clothing', 25.00, 100),
('Jeans', 'Clothing', 50.00, 75),
('Headphones', 'Electronics', 50.00, 10),
('Desk Lamp', 'Home & Kitchen', 35.00, 5),
('Microwave Oven', 'Home & Kitchen', 150.00, 8);

SELECT * FROM products;

Delete from products where price>100;

SELECT * FROM products;

Delete from products where category='Electronics';

Delete from products where price>50 and price<100;
Delete from products where price between 50 and 100;

Delete from products where stock_quantity<10;

Delete from products where category='Clothing' or stock_quantity>50;

Delete from products where product_name like 'A%';

Delete from products WHERE category='Electronics' or category='Clothing';

SELECT * FROM products;