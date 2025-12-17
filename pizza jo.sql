DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS courier;
DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS customer;


-- 
-- Tábla courier
-- 

CREATE TABLE courier (
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(30),
  phone_number INT
);

-- 
-- Tábla adatok: courier
-- 

INSERT INTO courier ("name", phone_number) VALUES ('Hurricane', '123456');
INSERT INTO courier ("name", phone_number) VALUES ('Villám', '666666');
INSERT INTO courier ("name", phone_number) VALUES ('Sonic', '258369');


-- 
-- Tábla szerkezet: pizza
-- 

CREATE TABLE pizza (
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(30),
  price INT
);

-- 
-- Tábla adatok: pizza
-- 

INSERT INTO pizza ("name", price) VALUES ('Margerita', 1050);
INSERT INTO pizza ("name", price) VALUES ('Frutti di Mare', 1350);
INSERT INTO pizza ("name", price) VALUES ('Hawaii', 850);



-- 
-- Tábla szerkezet: orders
-- 

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  courier_id INT,
  customer_id INT,
  pizza_id INT,
  qty INT
);

-- 
-- Tábla adatok: order
-- 

INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (3, 2, 2, 3);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (1, 2, 1, 4);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (1, 1, 3, 6);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (2, 1, 1, 2);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (3, 2, 3, 1);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (2, 3, 3, 1);



-- 
-- Tábla szerkezet: customer
-- 

CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  "name" VARCHAR(30),
  address VARCHAR(30)
);
  

-- 
-- Tábla adatok: customer
-- 

INSERT INTO customer VALUES (1, 'Beni', 'New York');
INSERT INTO customer VALUES (2, 'Kati', 'London');
INSERT INTO customer VALUES (3, 'Dani', 'Miskolc');


ALTER TABLE orders ADD CONSTRAINT FK_orders_courier FOREIGN KEY (courier_id) REFERENCES courier(id);
ALTER TABLE orders ADD CONSTRAINT FK_orders_customer FOREIGN KEY (customer_id) REFERENCES customer(id);
ALTER TABLE orders ADD CONSTRAINT FK_orders_pizza FOREIGN KEY (pizza_id) REFERENCES pizza(id);


