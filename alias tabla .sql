CREATE TABle students (id INT PRIMARY KEY, name VARCHAR(50));

INSERT INTO students VALUES
(1, 'Peter'),
(2, 'Anita'),
(3, 'Polett');

CREATE TABLE EVALUATION
(id Int PRIMARY KEY,
student_id INT,
reviewer_id INT,
FOREIGN KEY (student_id) REFERENCES students(id),
FOREIGN KEY (reviewer_id) REFERENCES students(id));

INSERT INTO evaluation VALUES(1,1,2),
(2,3,2), (3,2,3);

SELECT * FROM evaluation
JOIN students ON EVALUATION.STUDENT_ID=STUDENTs.id
JOIN students ON EVALUATION.reviewer_id=students.id;

--ALIAS AS TABLA ÁTNEVEZÉS

SELECT EVALUATION.id, S.name AS Student, R.name AS Reviewer FROM EVALUATION
JOIN STUDENTS S ON EVALUATION.student_id = S.id
JOIN STUDENTS R ON EVALUATION.reviewer_id = R.id