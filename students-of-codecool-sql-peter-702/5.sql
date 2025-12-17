


-- 1 Assignments are listed by courses

SELECT 
  courses.course_name,
  assignments.title
FROM courses
JOIN courses_and_assignments 
  ON courses.id = courses_and_assignments.course_id
JOIN assignments 
  ON assignments.id = courses_and_assignments.assignments_id;


--2/1. Minden assignment minden kapcsolódó adattal, soronként külön
--(de így vannak ismétlődések): 

SELECT 
    assignments.id AS assignment_id,
    assignments.title AS assignment_title,
    tasks.task_title AS task_title,
    tasks.task_description AS task_description,
    assignment_material.title AS assignment_material_title,
    assignment_material.url AS assignment_material_url,
    evaluation.student_id AS evaluation_student_id,
    evaluation.passed_exam AS evaluation_passed_exam,
    evaluation.comment AS evaluation_comment,
    courses_and_assignments.course_id AS course_id
FROM assignments
LEFT JOIN tasks 
ON assignments.id = tasks.assignment_id
LEFT JOIN assignment_material 
ON assignments.id = assignment_material.assignments_id
LEFT JOIN evaluation 
ON assignments.id = evaluation.assignment_id
LEFT JOIN courses_and_assignments 
ON assignments.id = courses_and_assignments.assignments_id;

--2/2 Minden assignment egy sorban, a kapcsolódó elemek összefűzve (string-aggregálva):

SELECT 
    assignments.id AS assignment_id,
    assignments.title AS assignment_title,
    STRING_AGG(DISTINCT tasks.task_title, ', ') AS all_tasks,
    STRING_AGG(DISTINCT assignment_material.title, ', ') AS all_materials,
    STRING_AGG(DISTINCT evaluation.comment, '; ') AS all_evaluations
FROM assignments
LEFT JOIN tasks 
ON assignments.id = tasks.assignment_id
LEFT JOIN assignment_material 
ON assignments.id = assignment_material.assignments_id
LEFT JOIN evaluation 
ON assignments.id = evaluation.assignment_id
GROUP BY assignments.id, assignments.title;


-- 3 Diakok listazva kurzusonkent 

SELECT courses.course_name, students.name FROM courses
JOIN courses_and_students 
ON courses.id = courses_and_students.course_id
JOIN students 
ON courses_and_students.students_id = students.id
ORDER BY courses.course_name, students.name;


--4 A diákok értékelései feladatonként, az eredményeik alapján, az értékelés minden részletével együtt.


SELECT 
    students.name AS student_name,                -- aki vizsgázott
    assignments.title AS assignment_title,
    evaluation.passed_exam,
    evaluation.comment,
    evaluation.evaluation_date,
    evaluation.course_id,
    evaluation.score,
    evaluator.name AS evaluator_name              -- aki ellenőrzött (név)
FROM evaluation
JOIN students ON evaluation.student_id = students.id
JOIN students AS evaluator ON evaluation.evaluator_id = evaluator.id -- fuu bazmeg
JOIN assignments ON evaluation.assignment_id = assignments.id;


SELECT  students.name AS evaluator_name FROM evaluation
JOIN students ON evaluation.evaluator_id = students.id

--5 diakok osztalyzata atlag szerint 



SELECT students.name,
    ROUND(AVG(score)) AS avg_score,
    CASE
        WHEN ROUND(AVG(score)) = 5 THEN 'Perfect'
        WHEN ROUND(AVG(score)) = 4 THEN 'Good'
        WHEN ROUND(AVG(score)) = 3 THEN 'Medium'
        WHEN ROUND(AVG(score)) = 2 THEN 'Sufficient'
        ELSE 'FAIL'
    END AS rating
FROM evaluation
JOIN students ON evaluation.student_id = students.id
GROUP BY evaluation.student_id,students.name;



--6 legjobban teljesito diak pontszam alapjan 

SELECT students.name AS student ,
ROUND(AVG(score)) AS avg_score FROM evaluation
JOIN students ON evaluation.student_id = students.id
GROUP BY students.name
ORDER BY avg_score DESC
LIMIT 3




-- 7 Ki mennyit fizetett külön szedve

SELECT students.name,payments.amount FROM courses_and_students
JOIN students ON courses_and_students.students_id = students.id
JOIN payments ON courses_and_students.id= payments.id

-- 8 ki mennyit  fizetett egyben 

SELECT students.name,SUM(payments.amount) FROM courses_and_students
JOIN students ON courses_and_students.students_id = students.id
JOIN payments ON courses_and_students.id= payments.id
GROUP BY students.name 
ORDER BY SUM(payments.amount) DESC;



SELECT * from payments
SELECT * from courses_and_students
SELECT * from courses