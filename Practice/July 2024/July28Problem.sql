-- Students
-- 		Student_id			First_name			Last_name			Date_of_birth				City
-- 			1					John				Doe				  2005-04-15			  New York
-- 			2					Jane			   Smith			  2006-07-20	         Los Angeles
-- 			3					Mary			  Johnson			  2005-09-30			   Chicago
-- 			4				   James			  Williams			  2007-12-12			   Houston
-- 			5				  Patricia			   Brown			  2006-03-22			   Phoenix

-- Courses
-- 		Course_id			Course_name			Instructor_id
-- 			1				Mathematics				 101
-- 			2			English Literature			 102
-- 			3				  Physics				 103
-- 			4				 Chemistry				 104
-- 			5				  History				 105

-- Instructors
-- 		Instructor_id			  First_name			Last_name			Department
-- 			101						Alice				  Adams				 Science
-- 			102						 Bob				  Baker				Humanities
-- 			103					   Charlie				  Clark				 Science
-- 			104						Diana				  Davis				 Science
-- 			105						Edward				  Evans				Humanities

-- Enrollments
-- 		Enrollment_id			Student_id			Course_id		  Enrollment_date
-- 			1						1					1				2023-09-01
-- 			2						2					2				2023-09-01
-- 			3						3					3				2023-09-01
-- 			4						4					4				2023-09-01
-- 			5						5					5				2023-09-01
-- 			6						1					3				2023-09-01
-- 			7						2					4				2023-09-01

-- Questions
-- Q1: List all students along with their cities.
-- Q2: Find the total number of courses each student is enrolled in.
-- Q3: Identify the instructors for each course.
-- Q4: List the names of students who are enrolled in 'Physics'.
-- Q5: Get the average number of courses students are enrolled in.
-- Q6: Find the total number of students enrolled in each course.
-- Q7: List the courses that have more than one student enrolled.
-- Q8: Identify the student who is enrolled in the most courses.
-- Q9: Get the details of enrollments for courses taught by 'Alice Adams'.
-- Q10: Calculate the total number of courses offered by each department.
-- Q11: List the students who are not enrolled in any courses.
-- Q12: Find the courses that have not been enrolled by any student.
-- Q13: Identify the students who are enrolled in 'Mathematics' and 'Physics'.
-- Q14: Get the names and total number of students enrolled in each course, sorted by course name.
-- Q15: List the instructors who are teaching more than one course.



CREATE DATABASE IF NOT EXISTS July28Problem;
USE July28Problem;

CREATE TABLE Students(
	Student_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Date_of_birth DATE,
    City VARCHAR(50)
);

INSERT INTO Students
(Student_id,First_name,Last_name,Date_of_birth,City)
VALUES
(1,"John","Doe","2005-04-15","New York"),
(2,"Jane","Smith","2006-07-20","Los Angeles"),
(3,"Mary","Johnson","2005-09-30","Chicago"),
(4,"James","Williams","2007-12-12","Houston"),
(5,"Patricia","Brown","2006-03-22","Phoenix");


CREATE TABLE Courses(
	Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Instructor_id INT
);

INSERT INTO Courses
(Course_id,Course_name,Instructor_id)
VALUES
(1,"Mathematics",101),
(2,"English Literature",102),
(3,"Physics",103),
(4,"Chemistry",104),
(5,"History",105);

CREATE TABLE Instructors(
	Instructor_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Instructors
(Instructor_id,First_name,Last_name,Department)
VALUES
(101,"Alice","Adams","Science"),
(102,"Bob","Baker","Humanities"),
(103,"Charlie","Clark","Science"),
(104,"Diana","Davis","Science"),
(105,"Edward","Evans","Humanities");

CREATE TABLE Enrollments(
	Enrollment_id INT PRIMARY KEY,
    Student_id INT,
    Course_id INT,
    Enrollment_date DATE
);

INSERT INTO Enrollments
(Enrollment_id,Student_id,Course_id,Enrollment_date)
VALUES
(1,1,1,"2023-09-01"),
(2,2,2,"2023-09-01"),
(3,3,3,"2023-09-01"),
(4,4,4,"2023-09-01"),
(5,5,5,"2023-09-01"),
(6,1,3,"2023-09-01"),
(7,2,4,"2023-09-01");


-- Answers

-- Q1: List all students along with their cities.
SELECT Student_id,First_name,Last_name,City
FROM Students;

-- Q2: Find the total number of courses each student is enrolled in.
SELECT S.Student_id,S.First_name,S.Last_name,COUNT(C.Course_id) AS total_number_courses
FROM Courses C
JOIN Enrollments E
ON C.Course_id = E.Course_id
JOIN Students S
ON E.Student_id = S.Student_id
GROUP BY S.Student_id;

-- Q3: Identify the instructors for each course.
SELECT I.Instructor_id,I.First_name,I.Last_name,C.Course_name
FROM Instructors I 
LEFT JOIN Courses C
ON I.Instructor_id = C.Instructor_id;

-- Q4: List the names of students who are enrolled in 'Physics'.
SELECT S.Student_id,S.First_name,S.Last_name
FROM Students S
LEFT JOIN Enrollments E ON E.Student_id = S.Student_id
LEFT JOIN Courses C ON C.Course_id = E.Course_id
WHERE C.Course_name = 'Physics'
ORDER BY S.Student_id;

-- Q5: Get the average number of courses students are enrolled in.
SELECT AVG(course_count) AS average_courses_per_student
FROM (
  SELECT COUNT(C.Course_id) AS course_count
  FROM Enrollments E
  JOIN Courses C ON C.Course_id = E.Course_id
  GROUP BY E.Student_id
) AS subquery;

-- Q6: Find the total number of students enrolled in each course.
SELECT C.Course_name,COUNT(E.Student_id) AS total_number_students
FROM Enrollments E
JOIN Courses C ON C.Course_id = E.Course_id
GROUP BY C.Course_id;

-- Q7: List the courses that have more than one student enrolled.
SELECT C.Course_id,C.Course_name,COUNT(E.Student_id) AS total_number_students
FROM Courses c
JOIN Enrollments E
ON C.Course_id = E.Course_id
GROUP BY C.Course_id
HAVING COUNT(E.Student_id) > 1;

-- Q8: Identify the student who is enrolled in the most courses.
WITH StudentCourseCount AS(
	SELECT S.Student_id,S.First_name,S.Last_name,COUNT(C.Course_id) AS course_count
    FROM Students S
    JOIN Enrollments E ON E.Student_id = S.Student_id
	JOIN Courses C ON C.Course_id = E.Course_id
	GROUP BY S.Student_id,S.First_name,S.Last_name
)
SELECT Student_id,First_name,Last_name,course_count
FROM StudentCourseCount
WHERE course_count = (SELECT MAX(course_count) FROM StudentCourseCount);

-- Q9: Get the details of enrollments for courses taught by 'Alice Adams'.
SELECT E.Enrollment_id,E.Student_id,E.Course_id,C.Course_name
FROM Enrollments E
JOIN Courses C ON C.Course_id = E.Course_id
JOIN Instructors I ON C.Instructor_id = I.Instructor_id
WHERE I.First_name = 'Alice' AND I.Last_name = 'Adams';

-- Q10: Calculate the total number of courses offered by each department.
SELECT I.Department,COUNT(C.Course_id) AS course_count
FROM Courses C
JOIN Instructors I ON C.Instructor_id = I.Instructor_id
GROUP BY I.Department;

-- Q11: List the students who are not enrolled in any courses.
SELECT S.Student_id,S.First_name,S.Last_name
FROM Students S
LEFT JOIN Enrollments E ON E.Student_id = S.Student_id
WHERE E.Student_id IS NULL;

-- Q12: Find the courses that have not been enrolled by any student.
SELECT C.Course_id,C.Course_name
FROM Courses C
LEFT JOIN Enrollments E
ON C.Course_id = E.Course_id
WHERE E.Student_id IS NULL;

-- Q13: Identify the students who are enrolled in 'Mathematics' and 'Physics'.
SELECT S.Student_id,S.First_name,S.Last_name
FROM Students S
WHERE EXISTS(
	SELECT *
    FROM Enrollments E
    JOIN Courses C
    ON C.Course_id = E.Course_id
    WHERE E.Student_id = S.Student_id AND C.Course_name = 'Physics'
) AND EXISTS(
	SELECT *
    FROM Enrollments E
    JOIN Courses C
    ON C.Course_id = E.Course_id
    WHERE E.Student_id = S.Student_id AND C.Course_name = 'Mathematics'
)ORDER BY S.Student_id;

-- Q14: Get the names and total number of students enrolled in each course, sorted by course name.
SELECT C.Course_name,COUNT(E.Student_id) AS total_number_students
FROM Courses C
LEFT JOIN Enrollments E
ON C.Course_id = E.Course_id
GROUP BY C.Course_name
ORDER BY C.Course_name;

-- Q15: List the instructors who are teaching more than one course.
SELECT I.Instructor_id,I.First_name,I.Last_name,COUNT(C.Course_id) AS no_of_courses
FROM Instructors I
JOIN Courses C
ON C.Instructor_id = I.Instructor_id
GROUP BY I.Instructor_id
HAVING COUNT(C.Course_id) > 1;