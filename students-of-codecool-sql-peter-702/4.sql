--1-5 ig értékeléseit az UPDATE el az evaluation tablaba

ALTER TABLE evaluation
ADD COLUMN score INT;


SELECT * FROM evaluation


UPDATE evaluation
SET score = 
    CASE 
        WHEN passed_exam = FALSE THEN 1
        ELSE floor(random() * 4) + 2  -- random 2,3,4,5
    END;

DROP TABLE evaluation



SELECT * from evaluation



