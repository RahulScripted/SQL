-- Students
-- 	Student_id		First_name		Last_name		Major_id		Enrollment_year
-- 		 1				Emma		  Brown			  101			      2021
-- 		 2				Liam		  Smith			  102				  2022
-- 		 3			   Olivia		 Johnson		  103				  2020
-- 		 4				Noah		  Davis			  101				  2023
-- 		 5				Ava	      	  Wilson		  102				  2021

-- Majors
-- 	Major_id			Major_name
-- 	   101			  Computer Science
-- 	   102			      Business
-- 	   103				  Biology

-- Courses
-- 		Course_id			 Course_name			 Major_id			Credits
-- 			201				Intro to CS			   		101					4
-- 			202			   Data Structures				101					3
-- 			203			    Accounting 101				102					4
-- 			204				   Marketing				102					3
-- 			205				  Biology 101				103					4
-- 			206				    Genetics				103					3

-- Enrollments
-- 		Student_id			Course_id			 Semester
-- 			1					201				Fall 2021
-- 			1					202				Spring 2022
-- 			2					203				Fall 2022
-- 			3					205				Fall 2020
-- 			3					206				Spring 2021
-- 			4					201				Fall 2023
-- 			5					204				Fall 2021

-- Questions
-- Q1: List all students along with their major names.
-- Q2: Find the total number of credits each student is enrolled in.
-- Q3: Identify the courses each student is enrolled in.
-- Q4: List the names of students who enrolled in courses in the Fall 2021 semester.
-- Q5: Get the average number of credits per course for each major.
-- Q6: Find the total number of students enrolled in each major.
-- Q7: List the courses that have more than 3 credits.
-- Q8: Get the details of students who enrolled in 'Intro to CS' course.
-- Q9: Calculate the total credits for courses taken by each student.
-- Q10: List the students who have not enrolled in any course.


CREATE DATABASE IF NOT EXISTS Another18thJulyProblem;
USE Another18thJulyProblem;

CREATE TABLE Students(
	Student_id INT PRIMARY KEY,
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Major_id INT,
    Enrollment_year YEAR
);

INSERT INTO Students
(Student_id,First_name,Last_name,Major_id,Enrollment_year)
VALUES
(1,"Emma","Brown",101,"2021"),
(2,"Liam","Smith",102,"2022"),
(3,"Olivia","Johnson",103,"2020"),
(4,"Noah","Davis",101,"2023"),
(5,"Ava","Wilson",102,"2021");

CREATE TABLE Majors(
	Major_id INT PRIMARY KEY,
    Major_name VARCHAR(30)
);

INSERT INTO Majors
(Major_id,Major_name)
VALUES
(101,"Computer Science"),
(102,"Business"),
(103,"Biology");

CREATE TABLE Courses(
	Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Major_id INT,
    Credits INT
);

INSERT INTO Courses
(Course_id,Course_name,Major_id,Credits)
VALUES
(201,"Intro to CS",101,4),
(202,"Data Structures",101,3),
(203,"Accounting 101",102,4),
(204,"Marketing",102,3),
(205,"Biology 101",103,4),
(206,"Genetics",103,3);

CREATE TABLE Enrollments(
	Student_id INT,
    Course_id INT,
    Semester VARCHAR(50)
);

INSERT INTO Enrollments
(Student_id,Course_id,Semester)
VALUES
(1,201,"Fall 2021"),
(1,202,"Spring 2022"),
(2,203,"Fall 2022"),
(3,205,"Fall 2020"),
(3,206,"Spring 2021"),
(4,201,"Fall 2023"),
(5,204,"Fall 2021");


-- Q1: List all students along with their major names.
SELECT S.Student_id,S.First_name,S.Last_name,M.Major_name
FROM Students S
JOIN Majors M
ON S.Major_id = M.Major_id;

-- Q2: Find the total number of credits each student is enrolled in.
SELECT S.Student_id,S.First_name,S.Last_name,SUM(C.Credits) AS TotalCredit
FROM Students S
JOIN Enrollments E
ON S.Student_id = E.Student_id
JOIN Courses C
ON S.Major_id = C.Major_id
GROUP BY S.Student_id,S.First_name,S.Last_name;

-- Q3: Identify the courses each student is enrolled in.
SELECT S.Student_id,S.First_name,S.Last_name,C.Course_name
FROM Students S
JOIN Enrollments E
ON S.Student_id = E.Student_id
JOIN Courses C
ON S.Major_id = C.Major_id
ORDER BY S.Student_id,C.Course_name;

-- Q4: List the names of students who enrolled in courses in the Fall 2021 semester.
SELECT S.Student_id,S.First_name,S.Last_name
FROM Students S
JOIN Enrollments E
ON S.Student_id = E.Student_id
WHERE E.Semester = "Fall 2021";

-- Q5: Get the average number of credits per course for each major.
SELECT C.Major_id,AVG(C.Credits) ASAverageCredit
FROM Courses C
GROUP BY C.Major_id;

-- Q6: Find the total number of students enrolled in each major.
SELECT M.Major_name,COUNT(S.Student_id)
FROM Students S
JOIN Majors M
ON S.Major_id = M.Major_id
GROUP BY M.Major_id;

-- Q7: List the courses that have more than 3 credits.
SELECT C.Course_name,C.Credits
FROM Courses C
WHERE C.Credits > 3;

-- Q8: Get the details of students who enrolled in 'Intro to CS' course.
SELECT S.*
FROM Students S
JOIN Enrollments E
ON S.Student_id = E.Student_id
JOIN Courses C
ON E.Course_id = C.Course_id
WHERE C.Course_name = "Intro to CS";

-- Q9: Calculate the total credits for courses taken by each student.
SELECT S.Student_id,SUM(C.Credits) AS TotalCredits
FROM Students S
JOIN Enrollments E
ON S.Student_id = E.Student_id
JOIN Courses C
ON E.Course_id = C.Course_id
GROUP BY S.Student_id;

-- Q10: List the students who have not enrolled in any course.
SELECT S.Student_id, S.First_name, S.Last_name
FROM Students S
LEFT OUTER JOIN Enrollments E ON S.Student_id = E.Student_id
WHERE E.Student_id IS NULL; 