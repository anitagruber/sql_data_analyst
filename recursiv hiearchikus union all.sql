CREATE TABLE employees ( 
id SERIAL PRIMARY KEY, 
name VARCHAR(100), 
    manager_id INTEGER REFERENCES employees(id));

    drop table employees;

INSERT INTO employees (name, manager_id) VALUES
    ('Alice', NULL),     -- CEO, nincs főnöke
    ('Bob', 1),          -- Bob főnöke: Alice
    ('Charlie', 2),      -- Charlie főnöke: Bob
    ('David', 2),        -- David főnöke: Bob
    ('Eve', 3),          -- Eve főnöke: Charlie
    ('Frank', 4),        -- Frank főnöke: David
    ('Grace', 1),        -- Grace főnöke: Alice
    ('Henry', 7);        -- Henry főnöke: Grace


WITH RECURSIVE emp_h AS (
  SELECT id, name, manager_id, 1 AS depth
  FROM employees
  WHERE manager_id IS NULL
  
  UNION ALL
  
  SELECT e.id, e.name, e.manager_id, h.depth + 1
  FROM employees e
  JOIN emp_h h ON e.manager_id = h.id
)
SELECT *
FROM emp_h
ORDER BY depth, id;


--kiírva
WITH RECURSIVE employee_hierarchy AS (

    -- Alapszint: top-level vezetők (CEO-k)
    SELECT 
        id, 
        name, 
        manager_id, 
        1 AS depth
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Rekurzív rész: az alá tartozó alkalmazottak
    SELECT 
        employees.id,
        employees.name,
        employees.manager_id,
        employee_hierarchy.depth + 1
    FROM employees
    JOIN employee_hierarchy ON employees.manager_id = employee_hierarchy.id
)

SELECT *
FROM employee_hierarchy
ORDER BY depth, id;

