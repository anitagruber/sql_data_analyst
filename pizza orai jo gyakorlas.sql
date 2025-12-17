
Mely pizzák olcsóbbak 2000 Ft-nál?

select pizza.name , pizza.price from pizza where pizza.price < 2000;


Ki szállította házhoz az első (egyes sorszámú) rendelést?

SELECT courier.name
FROM courier
JOIN orders ON courier.id = orders.courier_id
where orders.id = 1;


Milyen pizzákat evett Kati?

SELECT pizza.name, customer.name FROM pizza
JOIN orders ON pizza.id = orders.pizza_id
JOIN customer ON customer.id = orders.customer_id
WHERE customer.name = 'Kati';

PIZZA átlagár?

select AVG (pizza.price) from pizza;
(CSAK 1 árat keresünk)


Melyik pizza ára van 500 Ft és 1000 Ft között?

select * from pizza 
where price between 500 and 1000;

Ki szállított házhoz Katinak?

select courier.name
FROM courier
JOIN orders ON courier_id = orders.courier_id
JOIN customer ON customer.id = orders.customer_id
WHERE customer.name = 'Kati';

SELECT courier.name 
FROM courier
JOIN orders on courier.id=orders.courier_id
join customer on customer.id=orders.customer_id
where customer.name='Kati';



Mennyit költött pizzára Kati? ki mennyiért vásárolt  (mi van ha több kati van?
ekkor kell még a customer.id is)

select customer.name, customer.id, sum (qty * price) From customer
JOIN ORDERS ON customer.id = ORDERS.customer_id
JOIN PIZZA ON pizza.id = ORDERS.pizza_id
Group by customer.name, customer.id
HAVING customer.name = 'Kati';


SELECT customer.name, 
SUM (pizza.price * qty) FROM customer
JOIN orders on customer.id=orders.customer_id
join pizza ON pizza.id=orders.pizza_id
GROUP BY customer.name
HAVING customer.name='Kati';

--HAVING customer.name = 'Kati';



egyes rendelesek alkalmaval ki ki szallitott hazhoz?

Select courier.name, customer.name From courier
JOIN ORDERS ON courier.id = orders.courier_id
JOIN customer ON orders.customer_id =customer.id;

futar neve alapjan rendezd sorba

Select courier.name, customer.name From courier
JOIN ORDERS ON courier.id = orders.courier_id
JOIN customer ON orders.customer_id =customer.id
order by courier.name desc, customer.name ASC;


Hány alkalommal rendelt valaki Hawaii pizzát?

SELECT pizza.name, count (*)
FROM PIZZA
JOIN ORDERS on pizza.id = orders.pizza_id
WHERE pizza.name = 'Hawaii'
Group by pizza.name;


Ki ette a legtöbb pizzát?

Select * From pizza;
limit 2;

SELECT customer.name, SUM (qty) as TOTAL
 from customer
join orders on customer.id = orders.customer_id
GROUP BY customer.name
ORDER BY total DESC
LIMIT 3;


Ki hány darab rendelést adott le?
SELECT customer.name, COUNT(*) AS total_orders
FROM customer
JOIN orders ON customer.id = orders.customer_id
GROUP BY customer.name
ORDER BY total_orders DESC
LIMIT 3;

SELECT * FROM ORDERS;

Hány pizzát evett Beni?

SELECT SUM (orders.qty)
from orders
JOIN customer on customer.id=orders.customer_id
join pizza on pizza.id=orders.pizza_id
where customer.name='Beni';

 
Hány darab Hawaii (3-as id) pizza fogyott összesen?

SELECT pizza.name, SUM (qty)
FROM ORDERS 
JOIN PIZZA ON pizza.id=orderS.pizza_id
WHERE pizza.id=3
GROUP BY pizza.name;



Mennyit költöttek pizzára az egyes vevők?

SELECT customer.name, SUM(price*qty)
from customer
JOIN orders on customer.id=orders.customer_id
JOIN pizza on pizza.id=orders.pizza_id
Group by customer.name;


Ki hány pizzát szállított házhoz összesen?
select courier.name, sum(qty)
from ORDERS
join courier on courier.id=orders.courier_id
Group by courier.name;

A fogyasztás alapján mi a pizzák népszerűségi sorrendje?


A rendelések összértéke alapján mi a vevők sorrendje?


Melyik a legdrágább pizza?
select pizza.name, pizza.price from pizza
ORDER by price DESC
limit 1;

Ki szállította házhoz a legtöbb pizzát?

select

Ki ette a legtöbb pizzát?;

select customer.name, SUM(qty)
FROM orders
JOIN pizza ON pizza.id=ORDERS.pizza_id
JOIN customer on customer.id=orders.customer_id
GROUP BY customer.name
limit 2;

SELECT courier.name from courier
INNER JOIN orders on orders.courier_id=courier.id
where orders.id=1;


SELECT pizza.name, customer.name FROM pizza
JOIN orders on pizza.id=orders.pizza_id
JOIN customer on customer.id=orders.customer_id
WHERE customer.name='Kati';

SELECT AVG (PIzza.price) FROM pizza;

SELECT pizza.name from pizza
WHERE pizza.price BETWEEN 500 and 1000;


SELECT courier.name FROM courier
JOIN orders on courier.id=orders.courier_id
join customer on customer.id=orders.customer_id
where customer.name='Kati';

SELECT pizza.price, customer.name FROM customer,
SUM (pizza.price * qty)
JOIN customer on customer.id=orders.customer_id
GROUP BY customer.name
WHERE customer.name='Kati';

ki ette a legtobb pizzát
select customer.name count(orders.id) 
from orders
JOIN