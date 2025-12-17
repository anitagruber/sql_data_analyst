CREATE TABLE users
(id INT,
 name VARCHAR(50));

INSERT INTO users
(id, name)
values
(1, 'Jane'),
(2, 'John'),
(3, 'Dave'),
(4,'Emma'),
(5,'Robert');

CREATE TABLE todos
(id INT,
task VARCHAR(100),
user_id INT,
done BOOLEAN);

INSERT INTO todos (id, task, user_id, done)
values
(1, 'Setup pgAdmin', 2, false),
(2, 'Download Git', 2, false),
(3, 'Setup VS Code', 1, true),
(4, 'Download PostgreSQL', 2, false),
(5, 'Install server', 2, false),
(6, 'Create superuser', 2, false),
(7, 'Create database', 2, false),
(8, 'Create tables', 2, false),
(9, 'Wash the dishes', 3, false),
(10, 'Read the PostgreSQL manual', 4, false),
(11, 'Exercise', 3, false),
(12, 'Wake up in time!', 5, true),
(13, 'Go to the gym', 3, false),
(14, 'Wash the dishes', 5, true)


