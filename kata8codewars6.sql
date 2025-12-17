create table people1 (id int, name varchar(50), age int);

select * from people1;

Insert into people1 (id, name, age) values
(1, 'Kim', 40),
(2, 'Kiss', 59),
(3, 'Nagy', 74),
(4, 'Kiss', 63),
(5, 'Vall', 7),
(6, 'Lemmmai', 70),
(7, 'Zarna', 49),
(8, 'Jarai', 50),
(9, 'Assan', 54),
(10, 'Barna', 29);

Select * from people1 where age>50 order by age DESC;