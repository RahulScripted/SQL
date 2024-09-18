-- Name(varchar(20) 		Roll number(3) 		dept(varchar2(4) 		sem(varchar(3) 			marks number(3)
-- 		Amit 					  10 					CSE 				 4TH 					  50
-- 		Raja 					  15 					ECE 				 6TH 					  64
-- 		Ram 					  16 					 EE 				 6TH 					  85
-- 		shyam 					  23 					 ME 				 4TH 					  49
-- 	   subrata 					  28 					CSE 				 6TH 					  53
-- 	   animesh 					  31 					CSE 				 6TH 					  78
-- 	    Ananya 					  36 				    ECE 				 4TH 					  46
-- 		Apurba 					  45 					 EE 				 4TH 					  67
-- 	   debashis 				  8 					 ME 				 2ND 					  69
-- 		manoj 					 21 					AEIE 				 2ND 					  89
-- 		payel 					  2 					AEIE 				 6TH 					  92
-- 	   Priyam 					 41 					CSE 				 6TH  					  93

-- Q1: CREATE TABLE WITH GIVEN ATTRIBUTE NAME AND TYPE.
-- Q2: SHOW THE DESCRIPTION OF THE TABLE.
-- Q3: FIND THE NAME OF THE STUDENTS OF THE DEPARTMENT OF CSE.
-- Q4: FIND THE NAME OF THE STUDENTS OF THE DEPARTMENT OF ECE.
-- Q5: FIND THE NAME OF THE STUDENTS OF 4TH SEM
-- Q6: FIND THE NAME OF THE STUDENT OF 4TH SEM AND CSE DEPT.
-- Q7. Find the names of the students who scored more than 60 marks.
-- Q8: Find the names of students who have marks less than 50.
-- Q9: Find the names of students in the 6th semester with marks greater than 75.
-- Q10: Find the names of students from the ME department.
-- Q11: Find the names of students who are not in the 4th semester.
-- Q12: Find the names of students in the AEIE department who are in the 2nd semester.
-- Q13: Find the names of students with marks between 60 and 80.
-- Q14: Find the average marks of students in the CSE department.
-- Q15: Find the total number of students in each department.
-- Q16: Find the highest marks obtained by a student in the EE department.
-- Q17: Find the names of students who have the same marks.
-- Q18. Find the names and departments of students who are in the 6th semester.



CREATE DATABASE IF NOT EXISTS Student_info;
USE Student_info;

CREATE TABLE Student(
	Name VARCHAR(20),
    Roll INT,
    Department VARCHAR(4),
    Semester varchar(3),
    Marks INT
);

INSERT INTO Student
(Name,Roll,Department,Semester,Marks)
VALUES
("Amit",10,"CSE","4th",50),
("Raja",15,"ECE","6th",64),
("Ram",16,"EE","6th",85),
("Shyam",23,"ME","4th",49),
("Subrata",28,"CSE","6th",53),
("Animesh",31,"CSE","6th",78),
("Ananya",36,"ECE","4th",46),
("Apurba",45,"EE","4th",67),
("Debashis",8,"ME","2nd",69),
("Manoj",21,"AEIE","2nd",89),
("Payel",2,"AEIE","6th",92),
("Priyam",41,"CSE","6th",93);


-- Q1: CREATE TABLE WITH GIVEN ATTRIBUTE NAME AND TYPE.
-- Q2: SHOW THE DESCRIPTION OF THE TABLE.
SELECT * FROM Student;

-- Q3: FIND THE NAME OF THE STUDENTS OF THE DEPARTMENT OF CSE.
SELECT Name FROM Student WHERE Department = "CSE";

-- Q4: FIND THE NAME OF THE STUDENTS OF THE DEPARTMENT OF ECE.
SELECT Name FROM Student WHERE Department = "ECE";

-- Q5: FIND THE NAME OF THE STUDENTS OF 4TH SEM
SELECT Name FROM Student WHERE Semester = "4th";

-- Q6: FIND THE NAME OF THE STUDENT OF 4TH SEM AND CSE DEPT.
SELECT Name FROM Student WHERE Department = "CSE" AND Semester = "4th";

-- Q7. Find the names of the students who scored more than 60 marks.
SELECT Name FROM Student WHERE Marks > 60;

-- Q8: Find the names of students who have marks less than 50.
SELECT Name FROM Student WHERE Marks < 50;

-- Q9: Find the names of students in the 6th semester with marks greater than 75.
SELECT Name FROM Student WHERE Semester = "6th" AND Marks > 75;

-- Q10: Find the names of students from the ME department.
SELECT Name FROM Student WHERE Department = "ME";

-- Q11: Find the names of students who are not in the 4th semester.
SELECT Name FROM Student WHERE Semester != "4th";

-- Q12: Find the names of students in the AEIE department who are in the 2nd semester.
SELECT Name FROM Student WHERE Department = "AEIE" AND Semester = "2nd";

-- Q13: Find the names of students with marks between 60 and 80.
SELECT Name FROM Student WHERE Marks BETWEEN 60 AND 80;

-- Q14: Find the average marks of students in the CSE department.
SELECT AVG(Marks) FROM Student WHERE Department = "CSE";

-- Q15: Find the total number of students in each department.
SELECT COUNT(Department) FROM Student GROUP BY Department;

-- Q16: Find the highest marks obtained by a student in the EE department.
SELECT MAX(Marks) FROM Student WHERE Department = "EE";

-- Q17: Find the names of students who have the same marks.
SELECT Name, Marks FROM Student
WHERE Marks IN (
    SELECT Marks
    FROM Student
    GROUP BY Marks
    HAVING COUNT(*) > 1
);

-- Q18. Find the names and departments of students who are in the 6th semester.
SELECT Name,Department FROM Student WHERE Semester = "6th";