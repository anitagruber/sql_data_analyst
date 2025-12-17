
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
City VARCHAR(50)
);

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
Product VARCHAR(100),
OrderDate DATE
);


INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'John Doe', 'New York'),
(2, 'Jane Smith', 'Los Angeles'),
(3, 'Michael Brown', 'Chicago'),
(4, 'Emily Davis', 'San Francisco');


INSERT INTO Orders (OrderID, CustomerID, Product, OrderDate) VALUES
(101, 1, 'Laptop', '2023-08-01'),
(102, 2, 'Smartphone', '2023-08-02'),
(103, 2, 'Tablet', '2023-08-05'),
(104, 4, 'Monitor', '2023-08-10');


Select * FROM customers;
SELECT * FROM orders;

Select * FROM Customers INNER JOIN Orders ON CUSTOMERS.CustomerId = Orders.CustomerId;

SELECT 
Customers.CustomerID, 
Customers.CustomerName, 
Orders.Product, 
 Orders.OrderDate
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

SELECT 
Customers.CustomerID, 
Customers.CustomerName, 
Orders.Product, 
Orders.OrderDate
FROM Customers
LEFT OUTER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;


SELECT 
Customers.CustomerID, 
Customers.CustomerName, 
Orders.Product, 
Orders.OrderDate
FROM Customers
RIGHT OUTER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

SELECT 
Customers.CustomerID, 
Customers.CustomerName, 
Orders.Product, 
Orders.OrderDate
FROM Customers
FULL OUTER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

SELECT 
    Customers.CustomerID,
    Customers.CustomerName,
    Orders.Product,
    Orders.OrderDate
FROM Customers
CROSS JOIN Orders;

SELECT 
    Customers.CustomerID,
    Customers.CustomerName,
    Orders.Product,
    Orders.OrderDate
FROM Customers
INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID;




