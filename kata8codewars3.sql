Create table participants1 (name varchar(50), age int, attending boolean);


SELECT * FROM participants1;

Insert into participants1 (name, age, attending) values
('Ani',25,true),
('Anna',22,true),
('Felix',23,true),
('Mira',17,false);

 Select * from participants1 where age >21;
