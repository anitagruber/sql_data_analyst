Create table "user"
(name VARCHAR(100),age INT);

sELECT * from "user";

insert into "user"
(name,age) values
('John',20),
('Jeremy',30),
('Kate',17),
('Brigi',30),
('Tomi',18),
('Clara',16);

sELECT * from "user" where age >= 18;