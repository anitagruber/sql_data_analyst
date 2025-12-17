
--Feladat
Your CEO asks you to help her create her end-of-year presentation. 
Provide her with the numbers for the year 1997 broken down by months.
 Save the SQL query as task-5.sql.

The result of the query is the following.

year | month | order_count | revenue
-----+-------+-------------+---------
1997 |     1 |          85 |   61258
1997 |     2 |          79 |   38484
1997 |     3 |          77 |   38547
1997 |     4 |          81 |   53033
1997 |     5 |          96 |   53781
1997 |     6 |          76 |   36363
1997 |     7 |          77 |   51021
1997 |     8 |          84 |   47288
1997 |     9 |          95 |   55629
1997 |    10 |         106 |   66749
1997 |    11 |          89 |   43534
1997 |    12 |         114 |   71398

SELECT * FROM ORDERS;
sELECT * FROM products;
SELECT * FROM order_details;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS total_orders,
    Round(SUM(order_details.unit_price* order_details.quantity * (1-order_details.discount))) AS revenue
FROM orders JOIN order_details on orders.order_id = order_details.order_id
WHERE EXTRACT(YEAR FROM order_date) = 1997
GROUP BY year, month
ORDER BY year, month;


--jo megoldas

SELECT products.product_name, ROUND(SUM(order_details.unit_price * quantity * (1-discount))) AS sum FROM Products
JOIN order_details ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY sum ASC
LIMIT 10;


--PETI ORAI MEGOLDÁS JO

SELECT 
EXTRACT(YEAR FROM order_date) AS Year, 
EXTRACT(MONTH FROM order_date) AS Month, 
COUNT(*) AS Order_count,
SUM(t2.revenue)
FROM orders
JOIN 
(
    SELECT order_details.order_id, ROUND(SUM(order_details.unit_price * order_details.quantity * (1-order_details.discount))) AS revenue
    FROM order_details
    GROUP BY order_id
) AS t2
ON orders.order_id = t2.order_id
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
HAVING EXTRACT(YEAR FROM order_date) = 1997;

