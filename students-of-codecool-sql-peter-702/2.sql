-- Mentort adatokat tároló tábla
CREATE TABLE mentors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    hire_date DATE,
    salary INT,
    email VARCHAR(246)
);

-- Diákok adatait tároló tábla
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    birth_date DATE,
    gender VARCHAR(20),-- javítva booleanrol varcharra(20)
    city VARCHAR(50),
    country VARCHAR(50),
    email VARCHAR(246)
    );


-- Kurzusok adatait tároló tábla
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    description TEXT,
    start_date DATE,
    price INT,
    mentor_id INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(id)
);


-- Feladatokhoz (assignments) tartozó metaadatokat tároló tábla

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    type VARCHAR(50),
    description VARCHAR(100)
);

-- Egy assignmenthez tartozó kisebb feladatokat (task) tároló tábla
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    assignment_id INT,
    task_title VARCHAR(100),
    task_description TEXT,
    FOREIGN KEY (assignment_id) REFERENCES assignments(id)
);

-- Feladataikhoz tartozó háttéranyagokat tároló tábla
CREATE TABLE assignment_material (
    id SERIAL PRIMARY KEY,
    url TEXT,
    title VARCHAR(100),
    assignments_id INT,
    FOREIGN KEY (assignments_id) REFERENCES assignments(id)
);

-- Kurzusok és diákok kapcsolatát tároló tábla 
CREATE TABLE courses_and_students (
    id SERIAL PRIMARY KEY,
    students_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (students_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Kurzusok és assignmentek kapcsolatát tároló tábla 
CREATE TABLE courses_and_assignments (
    id SERIAL PRIMARY KEY,
    assignments_id INT,
    course_id INT,
    FOREIGN KEY (assignments_id) REFERENCES assignments(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- A diákok fizetéseit/utalásait tároló tábla
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    courses_and_students_id INT,
    amount INT,
    date DATE,
    method VARCHAR(50),
    status BOOLEAN,
    FOREIGN KEY (courses_and_students_id) REFERENCES courses_and_students(id)
);

-- A diákok értékeléseit (assigmentek eredményeit) tároló tábla
CREATE TABLE evaluation (
    id SERIAL PRIMARY KEY,
    student_id INT,
    evaluator_id INT,
    assignment_id INT,
    passed_exam BOOLEAN,
    comment TEXT,
    evaluation_date DATE,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (evaluator_id) REFERENCES students(id), -- javítva mentor(id)-ról , students(id) re.
    FOREIGN KEY (assignment_id) REFERENCES assignments(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
    );



