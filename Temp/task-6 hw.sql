-- Update John's tasks and mark them as done
UPDATE todos
SET done = true
WHERE user_id = 2;

SELECT * FROM todos;

SELECT * FROM todos ORDER BY id;

DELETE FROM todos a
USING todos b
WHERE a.id = b.id
AND a.ctid > b.ctid;

UPDATE todos
SET done = true
WHERE user_id = 2;

SELECT * FROM todos;


SELECT * FROM todos ORDER BY id;