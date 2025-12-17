--Feladat
Get order numbers for each customer from the US with less than 5 orders

Your colleague wants to manually check the printed
 order labels. You have to create a sheet with all
  US customers with less than 5 orders. 
Display the total number of orders made by them. 
Include a comma-separated list of the order numbers.


The result of the query is the following.

SELECT company_name FROM customers;
SELECT * FROM customers;

SELECT * FROM orders;
SELECT * FROM order_details;



          company_name            | orders |        order_ids
----------------------------------+--------+-------------------------
Lazy K Kountry Store              |      2 | 10482,10545
The Cracker Box                   |      3 | 10624,10775,11003
Trail's Head Gourmet Provisioners |      3 | 10574,10577,10822
Let's Stop N Shop                 |      4 | 10579,10719,10735,10884
The Big Cheese                    |      4 | 10310,10708,10805,10992
The result of the query contains five rows.



SELECT 
    c.company_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    STRING_AGG(DISTINCT o.order_id::text, ', ') AS order_numbers
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.country = 'USA'
GROUP BY c.customer_id, c.company_name
HAVING COUNT(DISTINCT o.order_id) < 5
ORDER BY total_orders ASC;

--PETI ORAI
SELECT customers.company_name, COUNT(orders.order_id) AS order_number, ARRAY_AGG(order_id), STRING_AGG(CAST(order_id As text),', ')
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE customers.country LIKE 'US%'
GROUP BY customers.company_name
HAVING COUNT(orders.order_id) < 5
ORDER BY order_number ASC;