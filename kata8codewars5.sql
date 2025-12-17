Create table students2 (ID INT, Firstname varchar(50), Lastname varchar(50), IsActive Boolean);

Select * from students2;

Insert into students2 (ID, Firstname, Lastname, Isactive) values
(1,'Kim','Huba',1),
(2,'Kiss','Pal',0),
(3,'Nagy','Mark',1),
(4,'Kiss','Tomi',0),
(5,'Vall','Zerka',1),
(6,'Lemmmai','Nora',0),
(7,'Zarna','Vilma',0),
(8,'Jarai','Clara',1),
(9,'Assan','Loren',0),
(10,'Barna','Mara',0);
 
 Select * from students2 where IsActive=1;