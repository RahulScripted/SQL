-- Practice Question : 2

-- Create a database college and then create a student and fill with desired values and run for multiple queries


CREATE DATABASE College_Problem;  
USE College_Problem;

CREATE TABLE Student(
	RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT NOT NULL,
    Grade VARCHAR(1),
    City VARCHAR(20)
);

INSERT INTO Student 
(RollNo,Name,Marks,Grade,City) 
VALUES 
(101,"Anil",78,"C","PUNE"),
(102,"Bhumika",93,"A","Mumbai"),
(103,"Chetan",85,"B","Mumbai"),
(104,"Farah",96,"A","Delhi"),
(105,"Akash",12,"F","Kolkata"),
(106,"Rahul",86,"B","Delhi");
    
  
-- 1. Print Whole Table
SELECT * From Student;
  
-- 2. Print stuent name and their respective marks only 
SELECT Name, Marks From Student;

-- 3. Print distinct city 
SELECT DISTINCT city From Student;

-- 4. print student details where marks >= 80
SELECT * From Student WHERE Marks >= 80;

-- 5. print student details where city is mumbai
SELECT * From Student WHERE City = "Mumbai";

-- 6. print student details where if we add 10 marks more than it become greater than 100
SELECT * From Student WHERE Marks + 10 > 100;

-- 7. print student details where marks = 93
SELECT * From Student WHERE Marks = 93;

-- 8. print student details where marks > 90 and city = Mumbai
SELECT * From Student WHERE Marks > 90 AND city = "Mumbai";

-- 9. print student details where marks > 90 or city = Mumbai
SELECT * From Student WHERE Marks > 90 OR city = "Mumbai";

-- 10. print student details where marks in between 80 to 90
SELECT * From Student WHERE Marks BETWEEN 80 AND 90;

-- 11. print student details where city in Delhi & Mumbai 
SELECT * From Student WHERE City IN ("Delhi","MUmbai");

-- 12. print student details where city are not in Delhi & Mumbai 
SELECT * From Student WHERE City NOT IN ("Delhi","MUmbai");

-- 13. print student details for limit 3 only
SELECT * From Student LIMIT 3;

-- 14. print student details and sort city in ascending order
SELECT * From Student ORDER BY City ASC;