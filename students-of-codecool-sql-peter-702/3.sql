-- Students
INSERT INTO students (name, birth_date, gender, city, country, email)
VALUES 
    ('András',  '1994-11-22', 'Férfi', 'Budapest', 'Hungary', 'andras@example.com'),--1
    ('Polett',  '1995-02-10', 'Nő', 'Debrecen', 'Hungary', 'polett@example.com'),--2
    ('Ani',     '1993-08-03', 'Nő', 'Győr',     'Hungary', 'ani@example.com'),--3
    ('Kristóf', '1994-05-17', 'Férfi', 'Szeged',   'Hungary', 'kristof@example.com'),--4
    ('Zoli',    '1996-01-29', 'Férfi', 'Pécs',     'Hungary', 'zoli@example.com');--5

-- Mentors
INSERT INTO mentors (name, hire_date, salary, email)
VALUES
    ('Tamás',  '2019-04-12', 650000, 'tamas.mentor@example.com'),
    ('Józsi',  '2020-02-18', 600000, 'jozsi.mentor@example.com'),
    ('István', '2018-11-05', 700000, 'istvan.mentor@example.com');


    SELECT * FROM mentors


-- Courses
INSERT INTO courses (course_name, description, start_date, price, mentor_id)
VALUES
    ('Full-stack Developer Course', 'Intenzív full-stack képzés', '2025-09-01', 450000, 1),--1
    ('Front End Development Course', 'Modern webfejlesztő képzés', '2025-11-15', 250000, 3),--2
    ('Software Tester Course', 'Szoftvertesztelő képzés', '2026-01-10', 200000, 2),--3
    ('Data Analyst Course', 'Adat-elemző képzés', '2026-03-01', 300000, 1),--4
    ('Cyber Security Course', 'Kiberbiztonsági képzés', '2025-10-20', 320000, 3);--5


-- Courses and Students (2 diák több kurzuson)
INSERT INTO courses_and_students (students_id, course_id, enrollment_date)
VALUES
    -- András: Full-stack + Cyber Security
    (1, 1, '2025-09-01'), 
    (1, 5, '2026-02-15'),

    -- Polett: Front End
    (2, 2, '2025-11-15'),

    -- Ani: Software Tester + Data Analyst
    (3, 3, '2026-01-10'), 
    (3, 4, '2026-04-01'), 

    -- Kristóf: Full-stack
    (4, 1, '2025-09-01'), 

    -- Zoli: Cyber Security
    (5, 5, '2025-10-20'); 

-- Assignments
INSERT INTO assignments (title, type, description)
VALUES
    ('SQL Basics Exercise', 'Exercise', 'Alap SQL lekérdezések gyakorlása'),
    ('HTML & CSS Tutorial', 'Tutorial', 'Egyszerű weboldal készítése HTML és CSS segítségével'),
    ('Python Functions', 'Exercise', 'Függvények írása és hívása Pythonban'),
    ('OOP Mini Project', 'Project', 'Objektumorientált programozási feladat'),
    ('Webshop Full Project', 'Project', 'Teljes webshop alkalmazás készítése'),
    ('Git & GitHub Workflow', 'Tutorial', 'Git alapok és verziókezelési gyakorlat'),
    ('API Basics Exercise', 'Exercise', 'REST API hívások és JSON feldolgozása'),
    ('Data Analysis Intro', 'Exercise', 'Egyszerű adatfeldolgozás és riport készítése');

-- Courses and Assignments

INSERT INTO courses_and_assignments (course_id, assignments_id)
VALUES
    -- Full-stack Developer Course (1)
    (1, 1),  -- SQL Basics
    (1, 2),  -- HTML & CSS
    (1, 3),  -- Python Functions
    (1, 4),  -- OOP Mini Project
    (1, 5),  -- Webshop Project
    (1, 6),  -- Git Workflow
    (1, 7),  -- API Basics

    -- Front End Development Course (2)
    (2, 2),  -- HTML & CSS
    (2, 5),  -- Webshop Project
    (2, 6),  -- Git Workflow

    -- Software Tester Course (3)
    (3, 1),  -- SQL Basics
    (3, 6),  -- Git Workflow
    (3, 7),  -- API Basics

    -- Data Analyst Course (4)
    (4, 1),  -- SQL Basics
    (4, 3),  -- Python Functions
    (4, 8),  -- Data Analysis Intro

    -- Cyber Security Course (5)
    (5, 5),  -- Webshop Project (security audit szerep)
    (5, 6),  -- Git Workflow
    (5, 7);  -- API Basics


-- Tasks
INSERT INTO tasks (assignment_id, task_title, task_description)
VALUES
    -- SQL Basics Exercise
    (1, 'SELECT alapok', 'Egyszerű SELECT lekérdezések futtatása'),
    (1, 'WHERE feltételek', 'Adatok szűrése WHERE használatával'),
    (1, 'JOIN gyakorlat', 'Táblák összekapcsolása INNER JOIN segítségével'),

    -- HTML & CSS Tutorial
    (2, 'Egyszerű weboldal készítése', 'HTML struktúra kialakítása'),
    (2, 'Oldal stílusozása', 'CSS hozzáadása a layout kialakításához'),
    (2, 'Reszponzív dizájn', 'Mobilnézet kialakítása'),

    -- Python Functions Practice
    (3, 'Függvény írása', 'Paraméteres függvény implementálása'),
    (3, 'Return érték használata', 'Értéket visszaadó függvény megírása'),
    (3, 'Több függvény összekötése', 'Függvények egymásból történő hívása'),

    -- OOP Mini Project
    (4, 'Osztály létrehozása', 'Saját osztály definiálása'),
    (4, 'Objektumok példányosítása', 'Osztályból objektumok létrehozása'),
    (4, 'Metódusok implementálása', 'Osztályhoz tartozó metódusok írása'),

    -- Webshop Full Project
    (5, 'Adatbázis modell tervezése', 'A webshop adatstruktúrájának kialakítása'),
    (5, 'Termékek kezelése', 'Új termék hozzáadása, szerkesztése, törlése'),
    (5, 'Kosár funkció implementálása', 'Vásárlói kosár működésének kialakítása'),
    (5, 'Rendelési folyamat', 'Checkout és rendeléskezelés'),

    -- Git & GitHub Workflow
    (6, 'Repository létrehozása', 'Új Git repo inicializálása'),
    (6, 'Commit készítése', 'Kód módosítások commitolása'),
    (6, 'Branching workflow', 'Ágak létrehozása és merge-elése'),

    -- API Basics Exercise
    (7, 'GET endpoint hívása', 'Nyilvános API adatainak beolvasása'),
    (7, 'POST kérés küldése', 'Adat küldése API felé'),
    (7, 'JSON feldolgozás', 'Kapott JSON adatok parse-olása'),

    -- Data Analysis Intro
    (8, 'Adatimport', 'CSV fájl beolvasása Pythonban'),
    (8, 'Adattisztítás', 'Hiányzó értékek kezelése'),
    (8, 'Riport készítése', 'Egyszerű statisztikák és grafikonok');


-- Assignment Materials (fake URLs)
INSERT INTO assignment_material (url, title, assignments_id)
VALUES
    -- SQL Basics Exercise
    ('https://sql.minta.hu/alapok', 'SQL alapok útmutató', 1),
    ('https://gyakorlo.minta.hu/sqlbolt', 'Interaktív SQL gyakorlóanyag', 1),

    -- HTML & CSS Tutorial
    ('https://web.minta.hu/html', 'HTML alapok magyarázat', 2),
    ('https://web.minta.hu/css', 'CSS stílusok kezdőknek', 2),

    -- Python Functions Practice
    ('https://python.minta.hu/functions', 'Python függvények röviden', 3),

    -- OOP Mini Project
    ('https://python.minta.hu/oop', 'OOP alapok osztályok és objektumok', 4),

    -- Webshop Full Project
    ('https://project.pelda.hu/webshop', 'Webshop fejlesztés lépésről lépésre', 5),
    ('https://backend.pelda.hu/django/start', 'Backend útmutató webshophoz', 5),

    -- Git & GitHub Workflow
    ('https://git.pelda.hu/kezdo', 'Git kezdőknek', 6),
    ('https://git.pelda.hu/github', 'GitHub workflow minta', 6),

    -- API Basics Exercise
    ('https://api.demo.hu/rest', 'REST API magyarázat', 7),
    ('https://api.demo.hu/postman', 'API tesztelése Postmannel', 7),

    -- Data Analysis Intro
    ('https://data.minta.hu/pandas', 'Pandas adatkezelés alapok', 8),
    ('https://data.minta.hu/numpy', 'NumPy számítási műveletek', 8);



-- Evaluation adatok
INSERT INTO evaluation (student_id, evaluator_id, assignment_id, passed_exam, comment, evaluation_date, course_id)
VALUES
    
    -- (2  Polett), evaluator 1 (András)
    -- Polett kurzusa: FrontEnd (course 2)
    -- FrontEnd assignment-ek: 2,5,6
    (2, 1, 2, TRUE,  'Szép munka, jó SQL alapok.', '2026-02-10', 2),

    -- (3 → Ani), evaluator 1 (András)
    -- Ani kurzusai: Tester (3) és Data Analyst (4)
    -- Eredeti: assignment 7 (API Basics) a Tester kurzushoz
    (3, 1, 7, TRUE,  'Jól megírt függvények.', '2026-02-12', 3),

    -- (4 → Kristóf), evaluator 1 (András)
    -- Kristóf kurzusa: Fullstack (1)
    -- Eredeti assignment 4 
    (4, 1, 4, FALSE, 'Projekt részben készült el.', '2026-02-15', 1),

    -- (1 → András), evaluator 3 (Ani)
    -- András kurzusa: Fullstack (1)
    -- assignment 4 
    (1, 3, 4, TRUE,  'Nagyon jó.', '2026-03-01', 1),

    -- (5 → Zoli), evaluator 3 (Ani)
    -- Zoli kurzusa: CyberSec (5)
    -- assignment 6 
    (5, 3, 6, TRUE,  'Szép git workflow.', '2026-03-05', 5),

    -- (2 → Polett), evaluator 3 (Ani)
    -- Polett kurzusa: FrontEnd (2)
    -- assignment 2 → OK
    (2, 3, 2, TRUE,  'Szép HTML és CSS.', '2026-03-10', 2),

    -- (3 → Ani), evaluator 2 (Polett)
    -- Ani kurzusa: Data Analyst (4)
    -- Data Analyst assignments: 1,3,8
    -- assignment 1 → jó, mehet a Data Analyst kurzusban is
    (3, 2, 1, TRUE,  'SQL alapok rendben.', '2026-03-15', 4),

    -- (5 → Zoli), evaluator 4 (Kristóf)
    -- Zoli kurzusa: CyberSec (5)
    -- Eredeti assignment 8 → rossz (DA kurzus)
    -- Javítás: assignment 7 (API) – CyberSec kurzusban van
    (5, 4, 7, TRUE,  'Jó adatfeldolgozás.', '2026-03-20', 5),

    -- (1 → András), evaluator 5 (Zoli)
    -- András kurzusa: CyberSec is (5)
    -- assignment 5 → Webshop → benne van a CyberSec kurzusban
    (1, 5, 5, FALSE, 'A webshop projekt hiányos, de jó alapok.', '2026-03-25', 5);

-- Payments (mennyi befizetés volt, mikor, modja, statusz)
INSERT INTO payments (courses_and_students_id, amount, date, method, status)
VALUES
    (1, 450000, '2025-09-05', 'bank transfer', TRUE),
    (2, 320000, '2026-02-20', 'card', TRUE),
    (3, 250000, '2025-11-18', 'bank transfer', TRUE),
    (4, 200000, '2026-01-12', 'card', TRUE),
    (5, 300000, '2026-04-05', 'bank transfer', TRUE),
    (6, 450000, '2025-09-03', 'card', TRUE),
    (7, 320000, '2025-10-22', 'bank transfer', TRUE);