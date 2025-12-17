
create table students1 (name varchar(50), age int, semester int, mentor varchar(50), tuition_recieved boolean);


select * from students1;

insert into students1  (name, age, semester, mentor, tuition_recieved)
values 
('Kate', 23, 2, 'Juan',true),
('Mark', 24, 3,'Freddy',false),
('Mira',21,1,'Tx',false),
('Jersy',22,2,'Juan',false),
('Erik',24,3,'Freddy',false),
('Mila',23,2,'Juan',false),
('Kitty',21,1,'Tx',false);
 
 
 Select * from students1 where tuition_recieved=false;