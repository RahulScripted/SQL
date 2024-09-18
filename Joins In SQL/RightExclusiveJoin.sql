-- Right ExclusiveJoin

CREATE DATABASE IF NOT EXISTS Right_Exclusive_join;
USE Right_Exclusive_join;

CREATE TABLE STUDENT_INFO(
	Student_id INT PRIMARY KEY,
    Student_Name VARCHAR(20)
);

INSERT INTO STUDENT_INFO
(Student_id,Student_Name)
VALUES
(101,"Adam"),
(102,"Bob"),
(103,"Casey");

CREATE TABLE COURSE_INFO(
	Student_id INT PRIMARY KEY,
    Course_Name VARCHAR(20)
);

INSERT INTO COURSE_INFO
(Student_id,Course_Name)
VALUES
(102,"English"),
(105,"Math"),
(103,"Science"),
(107,"IT");


-- NOW WE WILL JOIN THIS 2 TABLE VIA RIGHT EXCLUSIVE JOIN

SELECT * 
FROM  STUDENT_INFO 
RIGHT JOIN COURSE_INFO 
ON STUDENT_INFO.Student_id = COURSE_INFO.Student_id
WHERE STUDENT_INFO.Student_id IS NULL;

-- OUTPUT:
-- 		105	Math
-- 		107	IT