-- Create two tables, one to store the users and one for the todos
CREATE TABLE users
(id INT,
 name VARCHAR(50));

CREATE TABLE todos
(id INT,
task VARCHAR(100),
user_id INT);

