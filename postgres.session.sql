create TABLE Books
(id INT,
title VARCHAR(100),
author VARCHAR(150),
published_year int,
genre VARCHAR(150),
available BOOLEAN);

SELECT * FROM books;

INSERT INTO books (id,
title,
author,
published_year,
genre,
available) 
values
(1,
'To Kill a Mockingbird',
'Harper Lee',
1960,
'Fiction',
True);

SELECT * from books;

INSERT INTO books
 
values
(2,
'1984',
'George Orwell',
1949,
'Dystopian',
True);

SELECT * FROM books
SELECT * from books WHERE id=2;
SELECT title, available FROM books WHERE id=2;

INSERT INTO books
VALUES
(3,'The Great gatsby',
'F. Scott Fitzgerald',1925,
'Novel',
False);

SELECT * FROM books;

SELECT * from books WHERE genre='Dystopian';

UPDATE books SET available=False where title='1984';

DELETE FROM Books WHERE title='To Kill a Mockingbird';

SELECT * FROM books

SELECT * FROM books WHERE published_year<1930 and available=True;
SELECT * FROM books WHERE published_year<1930 and available=False;

Select author,title from books WHERE published_year<1930 and available=False;
SELECT * FROM books