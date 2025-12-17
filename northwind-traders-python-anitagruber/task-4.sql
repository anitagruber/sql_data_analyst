--Feladat
Business developers want to know the 
list of countries with more than five customers.
Save the SQL query as task-4.sql.

The result of the query is the following.

country | number_of_customers
--------+---------------------
USA     |                  13
France  |                  11
Germany |                  11
Brazil  |                   9
UK      |                   7
The result of your query contains five rows.

CREATE TABLE customers (
    customer_id bpchar NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);

SELECT * FROM CUSTOMERS;

SELECT * from orders;


SELECT 
country,
COUNT(DISTINCT customer_id) AS number_of_customers
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT customer_id) > 5
ORDER BY number_of_customers DESC;

