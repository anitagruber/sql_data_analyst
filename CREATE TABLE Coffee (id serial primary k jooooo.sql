CREATE TABLE Coffee (id serial primary key, name VARCHAR(50));

CREATE TABLE Employee (id serial primary key, name VARCHAR(50), department_id INT, 
email varchar(256));


SELECT * FROM employee


CREATE TABLE Departments (id serial primary key, name VARCHAR(50));

CREATE TABLE CoffeeMaking
 (id serial primary key,
 coffee_id INT, employee_id INT, date DATE, quantity INT, 
 FOREIGN KEY(coffee_id) REFERENCES Coffee(id), 
 FOREIGN KEY(employee_id) REFERENCES Employee(id));

SELECT * FROM coffeemaking;

 Insert  INTO Departments (name) values ('IT'),
 ('SALES'), ('FINANCE');

 SELECT * FROM departments;

INSERT INTO Employee (name, department_id, email) VALUES
('Arpad',1,'arpad@email.com'),
'Zol(tan',2,'zoltan@email.com'),
('Anita',4,'anita@email.com'),
('Polett',1,NULL),
('Andras',2,NULL);

SELECT * FROM departments INNER JOIN employee ON employee.department_id = departments.id

SELECT * FROM employee LEFT OUTER JOIN departments ON employee.department_id = departments.id

SELECT * FROM employee LEFT OUTER JOIN 
departments ON employee.department_id = departments.id ORDER BY employee.id DESC;

SELECT * FROM employee RIGHT OUTER JOIN 
departments ON employee.department_id = departments.id ORDER BY employee.id DESC;


SELECT * FROM employee FULL OUTER JOIN departments ON employee.department_id = departments.id;

SELECT departments.id, departments.name FROM employee FULL OUTER JOIN 
departments ON employee.department_id = departments.id
WHERE department_id is NULL

INSERT INTO Coffee (name) VALUES
('Espresso'),
('Cappucino'),
('Americano');

INSERT INTO CoffeeMaking (coffee_id, employee_id, date, quantity) VALUES
(1,1,'2025-11-06',1);


INSERT INTO CoffeeMaking (coffee_id, employee_id, date, quantity)
 VALUES  
 (3,2,'2025-11-06',2),
 (2,1,'2025-05-11',2),
 (2,1,'2025-05-11',1),
 (1,3,'2025-05-11',1);


SELECT * FROM Employee;
SELECT * FROM CoffeeMaking;

ALTER TABLE departments ADD CoffeeMaking_id serial REFERENCES CoffeeMaking (id);
Insert INTO Departments (CoffeeMaking_id) values (1), (1);
Select * from Departments;

Create table Coffeemachine (id serial PRIMARY key, machine_name varchar(50), price int);

SELECT * from Coffeemachine;

INSERT INTO Coffeemachine (machine_name, price) VALUES
('Delonghi', 15000),
('Dolche Gusto', 20000),
('Melitta',12000);

DELETE FROM Coffeemachine WHERE id>3;

SELECT * from Coffeemachine;

ALTER TABLE CoffeeMaking ADD 

ALTER TABLE CoffeeMaking ADD Coffemachine_id INT REFERENCES Coffemachine(id);

UPDATE CoffeeMaking SET Coffemachine_id = case id
when 1 then 1
when 2 then 3
when 4 then 2
end;

SELECT * FROM CoffeeMaking;

SELECT * FROM CoffeeMaking INNER JOIN Coffemachine ON CoffeeMaking.Coffemachine_id = Coffemachine.id;

--ANDRIS HELPJE
Alter TABLE CoffeeMaking
ADD COLUMN machine_id INT;

UPDATE CoffeeMaking SET machine_id = 1 WHERE id = 1;
UPDATE CoffeeMaking SET machine_id = 1 WHERE id = 2;
UPDATE CoffeeMaking SET machine_id = 3 WHERE id = 3;
UPDATE CoffeeMaking SET machine_id = 4 WHERE id = 4;
UPDATE CoffeeMaking SET machine_id = 3 WHERE id = 5;

SELECT coffeemaking.*, employee.name as employee, 
coffee.name as coffee, 
coffeemachine.machine_name 
FROM coffeemaking 
INNER JOIN coffee on coffeemaking.coffee_id=coffee.id
JOIN employee on coffeemaking.employee_id=employee.id 
JOIN coffeemachine on coffeemaking.machine_id=coffeemachine.id;


--EZEK NEM FUTNAK LE, MERT AZ EGESZ SZARUL VAN ÍRVAA BY Kristóf

--„Melyik dolgozó összesen hány csésze kávét készített?”
--“How many cups of coffee did each employee make in total?”
SELECT employee_id, SUM(quantity)
FROM CoffeeMaking
GROUP BY employee_id;


--Dolgozónként átlagosan mennyi kávét készítettek egy alkalommal?”
--On average, how much coffee does each employee make per entry?”

SELECT employee_id, avg (quantity) 
FROM coffeemaking
GROUP BY employee_id;

/*
AKármi
még még még
*/

--Dolgozónként mennyi volt a legtöbb, a legkevesebb, az összes és az átlagosan készített kávémennyiség?”
--For each employee, what are the maximum, minimum, total, and average coffee quantities they made?”
SELECT employee_id, MAX (quantity),
MIN (quantity), SUM (quantity), AVG (quantity) FROM
coffeemaking
GROUP BY employee_id;


--Mely dolgozók készítettek összesen több mint 3 adag kávét?”
--Which employees made more than 3 total coffee portions?”

--GROUP BY EXAMPLE
SELECT employee_id, SUM (quantity) AS total 
FROM CoffeeMaking
GROUP BY employee_id
HAVING SUM (quantity)>3;




