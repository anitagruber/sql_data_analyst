-- Add a column to the todo table

CREATE TABLE todo
(id INT,
task VARCHAR(100),
user_id INT);

INSERT into todo 
(id,task,user_id)
values
(1,'math',1);

SELECT * FROM todo;


ALTER TABLE todo Add COLUMN done BOOLEAN DEFAULT false;


