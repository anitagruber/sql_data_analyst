-- Delete tasks from the todo table that are done already

delete from todos WHERE done=true;

SELECT * FROM todos;