

--Feladat
The Head of Sales wants to know which products are the ten worst performing. 
List product names and the total sum of the order values.
Order the results by the sum column to start with the worst performing product. 
Save the SQL query as task-3.sql.

The result of the query is the following.

           product_name     | sum
  --------------------------+------
  Chocolade                 | 1369
  Geitost                   | 1648
  Genen Shouyu              | 1785
  Laughing Lumberjack Lager | 2397
  Longlife Tofu             | 2433
  Gravad lax                | 2688
  Aniseed Syrup             | 3044
  Filo Mix                  | 3233
  Louisiana Hot Spiced Okra | 3383
  Valkoinen suklaa          | 3438
The result of your query contains ten rows


SELECT * FROM order_details;

SELECT *FROM ORDERS;


SELECT products.product_name, 
ROUND (SUM (order_details.quantity * (order_details.unit_price - (order_details.unit_price * order_details.discount)))) as sum
FROM products
INNER JOIN order_details ON products.product_id=order_details.product_id
GROUP BY product_name
ORDER BY sum ASC
LIMIT 10;

SELECT products.product_name, ROUND(SUM(order_details.unit_price * quantity * (1-discount))) AS sum FROM Products
JOIN order_details ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY sum ASC
LIMIT 10;