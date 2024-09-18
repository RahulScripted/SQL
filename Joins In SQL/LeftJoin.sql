-- Left Join

CREATE DATABASE IF NOT EXISTS Left_join;
USE Left_join;

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


-- NOW WE WILL JOIN THIS 2 TABLE VIA LEFT JOIN

SELECT * 
FROM  STUDENT_INFO 
LEFT JOIN COURSE_INFO 
ON STUDENT_INFO.Student_id = COURSE_INFO.Student_id;

-- OUTPUT:
-- 101	Adam		
-- 102	Bob		102	English
-- 103	Casey	103	Science