-- Table – EmployeeDetails

-- 		EmpId			FullName			ManagerId			DateOfJoining		 	City
-- 		 121			John Snow			  321				  01/31/2019	   	   Toronto
-- 		 321		  Walter White			  986				  01/30/2020		  California
-- 		 421		  Kuldeep Rana			  876				  27/11/2021		   New Delhi


-- Table – EmployeeSalary

-- 		EmpId			Project			Salary			Variable
-- 		121				  P1			 8000			  500
-- 		321				  P2			 10000			  1000
-- 		421				  P1			 12000				0

-- Q1.  Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
-- Q2.  Write an SQL query to fetch the different projects available from the EmployeeSalary table.
-- Q3.  Write an SQL query to fetch the count of employees working in project ‘P1’
-- Q4.  Write an SQL query to find the maximum, minimum, and average salary of the employees.
-- Q5.  Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
-- Q6.  Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
-- Q7.  Write an SQL query to fetch all those employees who work on Projects other than P1.


CREATE DATABASE IF NOT EXISTS Employee_info;
USE Employee_info;

CREATE TABLE EmployyeDetails(
	EmpId INT PRIMARY KEY,
    FullName VARCHAR(50),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(50)
);

INSERT INTO EmployyeDetails
(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES
(121,"John Snow",321,'2019-01-31',"Toronto"),
(321,"Walter White",986,'2020-01-30',"California"),
(421,"Kuldeep Rana",876,'2021-11-27',"New Delhi");

CREATE TABLE Employyesalary(
	EmpId INT PRIMARY KEY,
    Project VARCHAR(2),
    Salary INT,
    Variable INT
);

INSERT INTO Employyesalary
(EmpId,Project,Salary,Variable)
VALUES
(121,"P1",8000,500),
(321,"P2",10000,1000),
(421,"P1",12000,0);


-- Q1.  Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
SELECT EmpId,FullName FROM EmployyeDetails WHERE ManagerId = 986;

-- Q2.  Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT Project FROM Employyesalary GROUP BY Project;

-- Q3.  Write an SQL query to fetch the count of employees working in project ‘P1’
SELECT COUNT(EmpId) FROM Employyesalary WHERE Project = "P1";

-- Q4.  Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT MAX(Salary),MIN(Salary),AVG(Salary) FROM Employyesalary;

-- Q5.  Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT EmpId FROM Employyesalary WHERE Salary BETWEEN 9000 AND 15000;

-- Q6.  Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT * FROM EmployyeDetails WHERE City = "Toronto" AND ManagerId = 321;

-- Q7.  Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT * FROM Employyesalary WHERE NOT Project = "P1";
