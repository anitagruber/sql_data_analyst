Create table travellers (name varchar(100),country varchar(50));

insert into travellers (name,country) 
values
('Jason', 'Canada'),
('Kate','USA'),
('Felipe','Mexico'),
('Natalie','Russia'),
('Anna','France'),
('Tomi','Italy'),
('Max', 'Italy'),
('Ines', 'Spain'),
('Lil','Iceland');

select * from travellers WHERE country not in ('Canada','USA','Mexico');
