 DROP TABLE  IF EXISTS employees; 
CREATE TABLE employees ( 
    employee_id SERIAL PRIMARY KEY, 
    title VARCHAR(5), 
    full_name VARCHAR(100), 
    birth_date DATE, 
    hire_date DATE, 
    salary NUMERIC(10, 2), 
    department_id INT, 
    commission NUMERIC(10, 2), 
    email CHAR(100) 
); 


INSERT INTO employees (title, full_name, birth_date, hire_date, salary, 
department_id, commission, email) 
VALUES 
    ('Mr', 'John Doe', '1980-05-15', '2010-07-01', 60000.00, 1, 1000.00, 
'john.doe@example.com'), 
    ('Mrs', 'Jane Smith', '1985-08-20', '2012-03-15', 55000.00, 1, 500.00, 
'jane.smith@example.com'), 
    ('Mr', 'Michael Johnson', '1975-12-10', '2005-01-10', 65000.00, 2, 
1500.00, 'michael.johnson@example.com'), 
    ('Mrs', 'Emily Brown', '1990-04-25', '2018-09-20', 48000.00, 2, NULL, 
'emily.brown@example.com'), 
    ('Mr','William Davis', '1982-10-30', '2014-06-05', 70000.00, 1, 
2000.00, 'william.davis@example.com'), 
    ('Mrs','Jessica Wilson', '1978-03-12', '2008-12-01', 58000.00, 3, 
800.00, 'jessica.wilson@example.com'), 
    ('Mr',' xxxDavid Martinez', '1987-07-18', '2016-04-10', 62000.00, 3, 
1200.00, 'david.martinez@example.com'), 
    ('Mrs','Mary Taylor', '1993-01-05', '2020-02-15', 52000.00, 2, 400.00, 
'mary.taylor@example  .com'), 
    ('Mr','Christopher Anderson', '1970-09-03', '2000-11-20', 75000.00, 1, 
NULL, 'christopher.anderson@example.com'  ), 
    ('Mrs','Linda Thomas', '1983-06-08', '2013-08-10', 60000.00, 3, 
1000.00, 'linda. xxx thomas@example.com'); 


SELECT * FROM employees;


--Calculate the total number of employees in the "employees" table.
SELECT COUNT(*) FROM employees;

 --Find the average salary of all employees.
SELECT AVG(salary) from employees;


 --Determine the highest and lowest salaries in the "employees" table. 
--Sztem ide nem kell avg
SELECT AVG(salary),MAX(salary),MIN(salary) from employees;
SELECT MAX(salary),MIN(salary) from employees;

--Count the number of employees in each department
--DEPARTMENTENKÉNT A DOLGOZÓK LÉTSZÁMA
SELECT department_id, COUNT(employee_id),AVG(salary),MAX(salary),MIN(salary) from employees
GROUP BY department_id;

SELECT department_id, COUNT(employee_id) from employees
GROUP BY department_id;

--AHOL LEGALÁBB maximum 3 A DOLGOZÓk LÉTSZÁMA
SELECT department_id, COUNT(employee_id),AVG(salary),MAX(salary),MIN(salary) from employees
GROUP BY department_id
HAVING COUNT(employee_id) <4;

--STRING FUNCTIONS
-- . Extract the first name and last name from the "full_name" column in the "employees" table.

SELECT 
  LEFT(full_name, POSITION(' ' IN full_name) - 1) AS first_name,
  RIGHT(full_name, LENGTH(full_name) - POSITION(' ' IN full_name)) AS last_name
FROM employees;

 LEFT() and RIGHT() FÜGGVÉNY PÉLDA
 : Extracts the leftmost or rightmost characters from a string.
 SELECT LEFT('PostgreSQL', 4) AS LeftPart; -- Result: 'Post'
 SELECT RIGHT('PostgreSQL', 4) AS RightPart; -- Result: 'SQL'

POSITION FÜGGVÉNY ÉS LENGTH FÜGGVÉNY
 POSITION()
 : Returns the position of the first occurrence of a substring within a string.
 SELECT POSITION('world' IN 'Hello world') AS SubstringPosition; -- 
Result: 7
LENGTH(): Returns the length of a string.
 SELECT LENGTH(email) AS email_length FROM users; 
 
-- másik verzió
 SPLIT_PART()  PÉLDA
 : Splits a string on a specified delimiter and returns the nth substring.
 SELECT SPLIT_PART('2024-09-23', '-', 2) AS Month; -- Result: '09'


SELECT SPLIT_PART(full_name,' ',2) AS last_name FROM employees;

SELECT SPLIT_PART(full_name, ' ',1) AS first_name FROM employees;

SELECT 
  SPLIT_PART(full_name, ' ', 1) AS first_name,
  SPLIT_PART(full_name, ' ', 2) AS last_name
FROM employees;


 --Convert all email addresses to uppercase.
SELECT UPPER(email) as nagybetus_email FROM employees;

SELECT email FROM employees;


-- . Trim leading and trailing spaces from the "address" column.
--csak az elejéről és végéről törli a karaktert
SELECT BTRIM(email, 'x') AS javitott_email
FROM employees;

SELECT BTRIM(full_name, 'z') AS javitott_nev
FROM employees;

--mindenhonnan törli a megadott karaktert
SELECT REPLACE(email, 'x', '') AS javitott_email
FROM employees;


 --Replace all occurrences of 'Mrs.' with 'Ms.' in the "title" column.

SELECT REPLACE(title, 'Mrs', 'Ms') AS title
FROM employees;


  Exercise 3: Date and Time Functions

-- . Calculate the age of each employee based on their birth date.
SELECT AGE(NOW(),birth_date) AS kor FROM employees;

--EZT KI LEHET MÉG EXTRAKTÁLNI, MEGMUTATJA HÁNY EVES AZ EMBER
SELECT EXTRACT(YEAR FROM AGE(NOW(),birth_date)) AS kor FROM employees;

SELECT NOW ();

select now (), CURRENT_date;
select now (), CURRENT_time;

CREATE table log (
    id SERIAL PRIMARY KEY,
    description VARCHAR(50),
    date timestamp default NOW()
);


INSERT INTO log(description)
VALUES ('hello');

CREATE table log (
    id SERIAL PRIMARY KEY,
    description VARCHAR(50) NOT NULL,
    date timestamp default NOW()
);

INSERT INTO log(ID, description)
VALUES (1,'VALAMI');

drop table log;
SELECT * FROM log;
SELECT * FROM employees;

--Extract the month and year from the "hire_date" column.

 SELECT EXTRACT(YEAR FROM hire_date) AS year,
EXTRACT(MONTH FROM hire_date) AS month
FROM employees;

--HÓNAPOKNAK ADJUNK NEVET

SELECT EXTRACT(MONTH FROM hire_date) AS month,
CASE
WHEN EXTRACT(MONTH FROM hire_date)= 1 THEN 'Jan'
WHEN EXTRACT(MONTH FROM hire_date)= 2 THEN 'Feb'
ELSE EXTRACT(MONTH FROM hire_date)::TEXT
END AS month_name
 FROM employees;


SELECT 
  EXTRACT(MONTH FROM hire_date) AS month,
  TO_CHAR(hire_date, 'Mon') AS month_name
FROM employees;

-- Find employees who have been with the company for more than 5 years.

SELECT *
FROM employees
WHERE hire_date <= CURRENT_DATE - INTERVAL '5 years';

 --Calculate the number of days between the current date and the "hire_date" for each employee.

SELECT full_name,
       hire_date,
       CURRENT_DATE - hire_date AS days_with_company
FROM employees;

--NUMERIC Functions

 Exercise 4: Numeric Functions
 --Calculate the square of each employee's salary.

--SALARIT EMELJUK NEGYZETRE

SELECT POWER(salary,2) from employees;

 . Round the average salary to the nearest integer.
SELECT ROUND(POWER(salary,2),2) from employees;

LEFELÉ
SELECT FLOOR(POWER(salary,2)) from employees;

SELECT FLOOR(PI());

SELECT CEILING (PI());
Roundnál meg lehet adni hány tizedesig kerekítsen

--LEVÁGJA A TIZEDESEKET
SELECT TRUNC(POWER(salary,2)) from employees; 
select trunc (pi());

 -- Find the highest salary that is a multiple of 1000.
 találjuk meg a legnagyobb ezerrel osztható számot a táblázatban, mode, 
 visszaadja a maradékot, ahol a maradék nulla. MAXIMUM SALARY ÉRTÉKET VENNI, AHOL OSZTHATÓ 5000-REL
 EZÉRT KELL A WHERE

 (VAGY MAX, VAGY LEORDEREZEM ÉS DESC ÉS LIMIT 1)

SELECT MAX(salary) from employees
WHERE
MOD(SALARY,5000)=0;

SELECT salary from employees
WHERE 
MOD(SALARY,5000)=0
ORDER BY SALARY DESC
LIMIT 1;


--Calculate the absolute difference between the highest and lowest salaries.
MAXBÓL KIVONJUK A MINT ÉS MEGKAPJUK A KÜLÖNBSÉGET

SELECT MAX(Salary)-MIN(SALAry) from employees;


 Exercise 5: Conditional Functions
 . Assign a bonus of 10% to employees with a salary greater than 50000.
 
 --Classify employees into three categories based on their salary: Low (<30000), Medium (30000
50000), and High (>50000).

SELECT SALARY,
CASE
WHEN salary < 30000 THEN 'LOW'
WHEN salary between 30000 AND 50000 THEN 'medium'
ELSE 'HIGH'
END as fizetes_besorolas
FROM employees;


 . Replace NULL values in the "commission" column with 0.
 . Determine if an employee has exceeded the sales target (e.g., commission > 1000).
 
 
 Exercise 6: Miscellaneous Functions
 . Convert the "hire_date" column to a readable date format.
 . Cast the "salary" column to a char data type.
 . Use the COALESCE function to handle NULL values in the "commission" column
 -