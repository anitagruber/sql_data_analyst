-- Add a column to the todo table

CREATE TABLE todos
(id INT,
task VARCHAR(100),
user_id INT,
Done BOOLEAN);

ALTER TABLE todos Add COLUMN done BOOLEAN DEFAULT false;


