-- Employees
-- 	Employee_id			First_name			Last_name			Department_id			Salary			Hire_date
-- 		1				   John					Doe					 101				70000			2019-03-15
-- 		2				   Jane				   Smith				 102				80000			2020-06-01
-- 		3				   Mary				  Johnson				 103				60000			2018-09-23
-- 		4				  James				  Williams				 101				90000			2021-01-10
-- 		5				 Patricia			   Brown				 102				75000			2019-11-25

-- Departments
-- 		Department_id			Department_name
-- 			101						    HR
-- 			102							IT
-- 			103						  Finance

-- Projects
-- 		Project_id				Project_name			Department_id
-- 			201					Project Alpha				101
-- 			202					Project Beta				102
-- 			203					Project Gamma				103
-- 			204					Project Delta				102

-- Employee_projects
-- 		Employee_id				Project_id
-- 			1						201
-- 			2						202
-- 			3						203
-- 			4						201
-- 			5						204

-- Salaries
-- 		Salary_id			Employee_id			Amount			   Date
-- 			1					  1				 70000			2023-01-01
-- 			2					  2				 80000			2023-01-01
-- 			3					  3				 60000			2023-01-01
-- 			4					  4				 90000			2023-01-01
-- 			5					  5				 75000	   		2023-01-01

-- Questions
-- Q1: List all employees along with their department names.
-- Q2: Find the total salary expense for each department.
-- Q3: Identify the projects each employee is working on.
-- Q4: Find the average salary of employees in each department.
-- Q5: List the names of employees who are working on more than one project.
-- Q6: Get the highest and lowest salary in each department.
-- Q7: Find the number of employees in each department.
-- Q8: List the projects and the number of employees working on each project.
-- Q9: Identify employees who are not assigned to any project.
-- Q10: Find the total number of projects each department is handling.
-- Q11: List the employees who were hired before 2020.
-- Q12: Calculate the total salary expense for each project.
-- Q13: Find the departments that have a total salary expense greater than $150,000.
-- Q14: Identify the employee with the highest salary in each department.
-- Q15: Get the details of projects handled by the 'IT' department.
-- Q16: List the employees who have not received a salary in 2023.
-- Q17: Find the employees who joined the company after January 1, 2020.
-- Q18: Find the projects handled by employees who have a salary greater than $75,000.
-- Q19: List the names of employees along with their project names who are working in the 'HR' department.
-- Q20: Identify the employees who are assigned to 'Project Alpha' and 'Project Beta'.


CREATE DATABASE IF NOT EXISTS July20Problem;
USE July20Problem;

CREATE TABLE Employees(
	Employee_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Department_id INT,
    Salary INT,
    Hire_date DATE
);

INSERT INTO Employees
(Employee_id,First_name,Last_name,Department_id,Salary,Hire_date)
VALUES
(1,"John","Doe",101,70000,"2019-03-15"),
(2,"Jane","Smith",102,80000,"2020-06-01"),
(3,"Mary","Johnson",103,60000,"2018-09-23"),
(4,"James","Williams",101,90000,"2021-01-10"),
(5,"Patricia","Brown",102,75000,"2019-11-25");

CREATE TABLE Departments(
	Department_id INT PRIMARY KEY,
    Department_name VARCHAR(50)
);

INSERT INTO Departments
(Department_id,Department_name)
VALUES
(101,"HR"),
(102,"IT"),
(103,"Finance");

CREATE TABLE Projects(
	Project_id INT PRIMARY KEY,
    Project_name VARCHAR(50),
    Department_id INT
);

INSERT INTO Projects
(Project_id,Project_name,Department_id)
VALUES
(201,"Project Alpha",101),
(202,"Project Beta",102),
(203,"Project Gamma",103),
(204,"Project Delta",102);

CREATE TABLE Employee_projects(
	Employee_id INT PRIMARY KEY,
    Project_id INT
);

INSERT INTO Employee_projects
(Employee_id,Project_id)
VALUES
(1,201),
(2,202),
(3,203),
(4,201),
(5,204);

CREATE TABLE Salaries(
	Salary_id INT PRIMARY KEY,
    Employee_id INT,
    Amount INT,
    Date DATE
);

INSERT INTO Salaries
(Salary_id,Employee_id,Amount,Date)
VALUES
(1,1,70000,"2023-01-01"),
(2,2,80000,"2023-01-01"),
(3,3,60000,"2023-01-01"),
(4,4,90000,"2023-01-01"),
(5,5,75000,"2023-01-01");


-- Q1: List all employees along with their department names.
SELECT E.Employee_id,E.First_name,E.Last_name,D.Department_name
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id;

-- Q2: Find the total salary expense for each department.
SELECT D.Department_name,SUM(E.Salary) AS TotalSalary
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY D.Department_name;

-- Q3: Identify the projects each employee is working on.
SELECT E.Employee_id,E.First_name,E.Last_name,EP.Project_id,P.Project_name
FROM Employees E
JOIN Employee_projects EP
ON E.Employee_id = EP.Employee_id
JOIN Projects P
ON EP.Project_id = P.Project_id;

-- Q4: Find the average salary of employees in each department.
SELECT D.Department_name,AVG(E.Salary) AS AverageSalary
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY D.Department_name;

-- Q5: List the names of employees who are working on more than one project.
SELECT E.Employee_id,E.First_name,E.Last_name
FROM Employees E
JOIN Employee_projects EP
ON E.Employee_id = EP.Employee_id
GROUP BY E.Employee_id,E.First_name,E.Last_name
HAVING COUNT(EP.Project_id) > 1;

-- Q6: Get the highest and lowest salary in each department.
SELECT D.Department_name,MAX(E.Salary) AS HighestSalary,MIN(E.Salary) AS LowestSalary
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY D.Department_name;

-- Q7: Find the number of employees in each department.
SELECT D.Department_name,count(E.Employee_id)
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY D.Department_name;

-- Q8: List the projects and the number of employees working on each project.
SELECT P.Project_id,P.Project_name,COUNT(EP.Employee_id) AS NumberOfEmployee
FROM Projects P
JOIN Employee_projects EP
ON EP.Project_id = P.Project_id
GROUP BY P.Project_id;

-- Q9: Identify employees who are not assigned to any project.
SELECT E.Employee_id,E.First_name,E.Last_name
FROM Employees E
LEFT JOIN Employee_projects EP
ON E.Employee_id = EP.Employee_id
WHERE EP.Project_id  IS NULL;

-- Q10: Find the total number of projects each department is handling.
SELECT D.Department_name,COUNT(P.Project_id) AS NoOfProjects
FROM Departments D
JOIN Projects P
ON D.Department_id = P.Department_id
GROUP BY D.Department_name;

-- Q11: List the employees who were hired before 2020.
SELECT E.Employee_id,E.First_name,E.Last_name
FROM Employees E
WHERE YEAR(E.Hire_date) < 2020;

-- Q12: Calculate the total salary expense for each project.
SELECT P.Project_id,P.Project_name,SUM(E.Salary) AS TotalSalary
FROM Projects P
JOIN Employee_projects EP
ON P.Project_id = EP.Project_id
JOIN Employees E
ON EP.Employee_id = E.Employee_id
GROUP BY P.Project_id,P.Project_name;

-- Q13: Find the departments that have a total salary expense greater than $150,000.
SELECT D.Department_name,SUM(E.Salary) AS TotalSalary
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY D.Department_name
HAVING TotalSalary > 150000;

-- Q14: Identify the employee with the highest salary in each department.
SELECT D.Department_name,E.Employee_id,E.First_name,E.Last_name,E.Salary AS HighestSalary
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id
JOIN ( SELECT Department_id, MAX(Salary) AS MaxSalary
	   FROM Employees E
       GROUP BY Department_id
) AS MaxSalaries ON E.Department_id = MaxSalaries.Department_id AND E.Salary = MaxSalaries.MaxSalary;

-- Q15: Get the details of projects handled by the 'IT' department.
SELECT P.Project_id,P.Project_name
FROM Projects P
JOIN Departments D
ON D.Department_id = P.Department_id
WHERE D.Department_name = "IT";

-- Q16: List the employees who have not received a salary in 2023.
SELECT E.Employee_id,E.First_name,E.Last_name
FROM Employees E
LEFT JOIN Salaries S
ON E.Employee_id = S.Employee_id
AND YEAR(S.Date) = "2023"
WHERE E.Employee_id IS NULL;

-- Q17: Find the employees who joined the company after January 1, 2020.
SELECT E.Employee_id,E.First_name,E.Last_name
FROM Employees E
WHERE E.Hire_date >= "2020-01-01";

-- Q18: Find the projects handled by employees who have a salary greater than $75,000.
SELECT P.Project_id,P.Project_name
FROM Projects P
JOIN Employee_projects EP
ON P.Project_id = EP.Project_id
JOIN Employees E
ON EP.Employee_id = E.Employee_id
WHERE E.Salary > 75000;

-- Q19: List the names of employees along with their project names who are working in the 'HR' department.
SELECT E.Employee_id,E.First_name,E.Last_name,P.Project_id,P.Project_name
FROM Employees E
JOIN Departments D
ON E.Department_id = D.Department_id 
JOIN Employee_projects EP
ON E.Employee_id = EP.Employee_id
JOIN Projects P
ON EP.Project_id = P.Project_id
WHERE D.Department_name = 'HR';

-- Q20: Identify the employees who are assigned to 'Project Alpha' and 'Project Beta'.
SELECT E.Employee_id,E.First_name,E.Last_name,P.Project_id,P.Project_name
FROM Employees E
JOIN Employee_projects EP
ON E.Employee_id = EP.Employee_id
JOIN Projects P
ON EP.Project_id = P.Project_id
WHERE P.Project_name = 'Project Alpha' OR P.Project_name = 'Project Beta';