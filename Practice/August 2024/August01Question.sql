-- Students
-- 	Student_id		First_name		Last_name		Date_of_birth		Gender		Major
-- 		1				John		   Doe			 2000-05-15	 		 M		Computer Sci
-- 		2				Jane		  Smith			 1999-07-20			 F		 Mathematics
-- 		3				Sam			  Brown	 		 2001-09-30			 M		   Physics
-- 		4				Lisa		 Wilson			 2002-12-12			 F	   	  Chemistry
-- 		5				Tom			  Davis			 1998-03-22			 M		   Biology

-- Courses
-- 		Course_id			Course_name				Credits
-- 			1			Introduction to CS				3
-- 			2				Calculus I					4
-- 			3			  General Physics				4
-- 			4			 Organic Chemistry				3
-- 			5			 Molecular Biology				3

-- Enrollments
-- 		Enrollment_id			Student_id			Course_id			Semester		  Grade
-- 			1						1					1				2024 Fall			A
-- 			2						1					2			   2024 Spring			B
-- 			3						2					2				2024 Fall			A
-- 			4						3					3			   2024 Spring			B
-- 			5						4					4				2024 Fall			C
-- 			6						5					5			   2024 Spring			B
-- 			7						1					3			   2024 Spring			A
-- 			8						2					1			   2024 Spring			C

-- Questions
-- Q1: List all students along with their majors.
-- Q2: Find the total number of courses each student is enrolled in.
-- Q3: Identify the courses each student is enrolled in along with their grades.
-- Q4: List the names of students who have enrolled in the '2024 Fall' semester.
-- Q5: Get the average grade for each student (assuming A=4, B=3, C=2, etc.).
-- Q6: Find the total credits each student has earned based on their grades.
-- Q7: List the courses that have been taken by more than one student.
-- Q8: Identify the student with the highest average grade.
-- Q9: Get the details of enrollments for courses with more than 3 credits.
-- Q10: Calculate the total number of students enrolled in each course.
-- Q11: List the students who have enrolled in more than one course.
-- Q12: Find the courses that no students have enrolled in.
-- Q13: Identify the enrollments where the grade is 'B' or better.
-- Q14: Get the names and total number of enrollments for each student, sorted by total number of enrollments in descending order.
-- Q15: List the students who have not enrolled in any courses.



CREATE DATABASE IF NOT EXISTS August01Problem;
USE August01Problem;

CREATE TABLE Students (
    Student_id INT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    Date_of_birth DATE,
    Gender CHAR(1),
    Major VARCHAR(100)
);

INSERT INTO Students (Student_id, First_name, Last_name, Date_of_birth, Gender, Major)
VALUES
(1, 'John', 'Doe', '2000-05-15', 'M', 'Computer Sci'),
(2, 'Jane', 'Smith', '1999-07-20', 'F', 'Mathematics'),
(3, 'Sam', 'Brown', '2001-09-30', 'M', 'Physics'),
(4, 'Lisa', 'Wilson', '2002-12-12', 'F', 'Chemistry'),
(5, 'Tom', 'Davis', '1998-03-22', 'M', 'Biology');

CREATE TABLE Courses (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(100),
    Credits INT
);

INSERT INTO Courses (Course_id, Course_name, Credits)
VALUES
(1, 'Introduction to CS', 3),
(2, 'Calculus I', 4),
(3, 'General Physics', 4),
(4, 'Organic Chemistry', 3),
(5, 'Molecular Biology', 3);

CREATE TABLE Enrollments (
    Enrollment_id INT PRIMARY KEY,
    Student_id INT,
    Course_id INT,
    Semester VARCHAR(20),
    Grade CHAR(1)
);

INSERT INTO Enrollments (Enrollment_id, Student_id, Course_id, Semester, Grade)
VALUES
(1, 1, 1, '2024 Fall', 'A'),
(2, 1, 2, '2024 Spring', 'B'),
(3, 2, 2, '2024 Fall', 'A'),
(4, 3, 3, '2024 Spring', 'B'),
(5, 4, 4, '2024 Fall', 'C'),
(6, 5, 5, '2024 Spring', 'B'),
(7, 1, 3, '2024 Spring', 'A'),
(8, 2, 1, '2024 Spring', 'C');


-- Anwers

-- Q1: List all students along with their majors.
SELECT Student_id, First_name, Last_name, Major
FROM Students;

-- Q2: Find the total number of courses each student is enrolled in.
SELECT S.Student_id,S.First_name,S.Last_name,COUNT(E.Course_id)
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
GROUP BY S.Student_id;

-- Q3: Identify the courses each student is enrolled in along with their grades.
SELECT S.Student_id,S.First_name,S.Last_name,E.Course_id,E.Grade
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
ORDER BY S.Student_id;

-- Q4: List the names of students who have enrolled in the '2024 Fall' semester.
SELECT S.Student_id,S.First_name,S.Last_name,E.Semester
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
WHERE E.Semester = '2024 Fall';

-- Q5: Get the average grade for each student (assuming A=4, B=3, C=2, etc.).
SELECT S.Student_id,S.First_name,S.Last_name,ROUND(AVG(CASE WHEN E.Grade = 'A' THEN 4
													  WHEN E.Grade = 'B' THEN 3
                                                      WHEN E.Grade = 'C' THEN 2
                                                      ELSE 0 END),2) AS average_grade
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
GROUP BY S.Student_id;

-- Q6: Find the total credits each student has earned based on their grades.
SELECT S.Student_id,S.First_name,S.Last_name,SUM(CASE WHEN E.Grade = 'A' THEN 4 * C.Credits
													  WHEN E.Grade = 'B' THEN 3 * C.Credits
                                                      WHEN E.Grade = 'C' THEN 2 * C.Credits
                                                      ELSE 0 END) / SUM(C.Credits) AS total_credits
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
LEFT JOIN Courses C
ON E.Course_id = C.Course_id
GROUP BY S.Student_id;

-- Q7: List the courses that have been taken by more than one student.
SELECT C.Course_id,C.Course_name
FROM Courses C
LEFT JOIN Enrollments E
ON E.Course_id = C.Course_id
GROUP BY C.Course_id, C.Course_name
HAVING COUNT(DISTINCT E.Student_id) > 1;

-- Q8: Identify the student with the highest average grade.
SELECT S.Student_id,S.First_name,S.Last_name,ROUND(AVG(CASE WHEN E.Grade = 'A' THEN 4
													  WHEN E.Grade = 'B' THEN 3
                                                      WHEN E.Grade = 'C' THEN 2
                                                      ELSE 0 END),2) AS average_grade
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
GROUP BY S.Student_id
ORDER BY average_grade DESC
LIMIT 1;

-- Q9: Get the details of enrollments for courses with more than 3 credits.
SELECT E.Enrollment_id,E.Student_id,E.Course_id,E.Semester
FROM Enrollments E
LEFT JOIN Courses C
ON E.Course_id = C.Course_id
GROUP BY E.Enrollment_id,E.Student_id,E.Course_id,C.Credits
HAVING C.Credits > 3;

-- Q10: Calculate the total number of students enrolled in each course.
SELECT COUNT(S.Student_id) AS total_number_students
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
GROUP BY E.Course_id;

-- Q11: List the students who have enrolled in more than one course.
SELECT S.Student_id,S.First_name,S.Last_name
FROM Students S
INNER JOIN Enrollments E
ON S.Student_id = E.Student_id
GROUP BY S.Student_id
HAVING COUNT(DISTINCT E.Course_id) > 1;

-- Q12: Find the courses that no students have enrolled in.
SELECT C.Course_id,C.Course_name
FROM Courses C
LEFT JOIN Enrollments E
ON E.Course_id = C.Course_id
WHERE E.Student_id IS NULL;

-- Q13: Identify the enrollments where the grade is 'B' or better.
SELECT E.Enrollment_id,E.Student_id,E.Course_id,E.Semester
FROM Enrollments E
WHERE E.Grade IN ('A','B');

-- Q14: Get the names and total number of enrollments for each student, sorted by total number of enrollments in descending order.
SELECT S.Student_id,S.First_name,S.Last_name,COUNT(E.Student_id) AS total_number_of_enrollments
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
GROUP BY S.Student_id
ORDER BY total_number_of_enrollments DESC;

-- Q15: List the students who have not enrolled in any courses.
SELECT S.Student_id,S.First_name,S.Last_name
FROM Students S
LEFT JOIN Enrollments E
ON S.Student_id = E.Student_id
WHERE E.Course_id IS NULL;