-- employees
-- employee_id		first_name		last_name		department_id		salary
-- 		1			   John			   Doe				  1				 70000
-- 		2			   Jane			  Smith				  2				 80000
-- 		3			   Mary			 Johnson			  1				 60000
-- 		4			  James			 Williams			  3				 90000
-- 		5			Patricia		  Brown				  2				 75000

-- departments
-- department_id	department_name
-- 		1				    HR
-- 		2					IT
-- 		3				  Finance

-- projects
-- 	  project_id		project_name		department_id
-- 		101			    Project Alpha			  1	
-- 		102				Project Beta			  2
-- 		103				Project Gamma			  3
-- 		104				Project Delta			  2

-- employee_projects
-- 	employee_id			project_id
-- 		1				    101
-- 		2					102
-- 		3					101
-- 		4					103
-- 		5					102
-- 		2					104

-- Questions:

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


CREATE DATABASE IF NOT EXISTS Employee_Project;
USE Employee_Project;

CREATE TABLE Employee(
	Employee_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Department_id INT,
    Salary INT
);

INSERT INTO Employee
(Employee_id,First_name,Last_name,Department_id,Salary)
VALUES
(1,"John","Doe",1,70000),
(2,"Jane","Smith",2,80000),
(3,"Mary","Johnson",1,60000),
(4,"James","Williams",3,90000),
(5,"Patricia","Brown",2,75000);

CREATE TABLE Departments(
	Department_id INT PRIMARY KEY,
    Department_Name VARCHAR(10)
);

INSERT INTO Departments
(Department_id,Department_Name)
values
(1,"HR"),
(2,"IT"),
(3,"Finance");

CREATE TABLE Projects(
	Project_id INT PRIMARY KEY,
    Project_name VARCHAR(50),
    Department_id INT
);

INSERT INTO Projects
(Project_id,Project_name,Department_id)
VALUES
(101,"Project Alpha",1),
(102,"Project Beta",2),
(103,"Project Gamma",3),
(104,"Project Delta",2);


CREATE TABLE Employee_Projects(
	Employee_id INT,
    Project_id INT
);

INSERT INTO Employee_Projects
(Employee_id,Project_id)
VALUES
(1,101),
(2,102),
(3,101),
(4,103),
(5,102),
(2,104);

-- Q1: List all employees along with their department names.
SELECT 
	E.Employee_id,
    E.First_name,
    E.Last_name,
    D.Department_id,
    D.Department_Name
FROM Employee E
LEFT JOIN Departments D
ON E.Department_id = D.Department_id;

-- Q2: Find the total salary expense for each department.
SELECT Department_id,SUM(Salary)
FROM Employee
GROUP BY Department_id;

-- Q3: Identify the projects each employee is working on.
SELECT 
	E.Employee_id,
    E.First_name,
    E.Last_name,
    P.Project_id,
    P.Project_name
FROM Employee E
JOIN Employee_Projects EP
ON E.Employee_id = EP.Employee_id
JOIN Projects P
ON P.Project_id = EP.Project_id;

-- Q4: Find the average salary of employees in each department.
SELECT Department_id,AVG(Salary)
FROM Employee
GROUP BY Department_id;

-- Q5: List the names of employees who are working on more than one project.
SELECT 
	E.Employee_id,
    E.First_name,
    E.Last_name
FROM Employee E
JOIN Employee_Projects EP
ON E.Employee_id = EP.Employee_id
GROUP BY E.Employee_id, E.First_name, E.Last_name
HAVING COUNT(DISTINCT Project_id) > 1;

-- Q6: Get the highest and lowest salary in each department.
SELECT D.Department_Name, 
MAX(E.Salary) AS Maximum,
MIN(E.Salary) AS Minimum
FROM Employee E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY D.Department_Name;

-- Q7: Find the number of employees in each department.
SELECT D.Department_Name,COUNT(E.Department_id)
FROM Employee E
JOIN Departments D
ON E.Department_id = D.Department_id
GROUP BY E.Department_id;

-- Q8: List the projects and the number of employees working on each project.
SELECT EP.Project_id,COUNT(EP.Project_id) AS NoOfEmployee
FROM Employee_Projects EP
GROUP BY EP.Project_id;

-- Q9: Identify employees who are not assigned to any project.
SELECT 
	E.Employee_id,
    E.First_name,
    E.Last_name
FROM Employee E
LEFT JOIN Employee_Projects EP
ON E.Employee_id = EP.Employee_id
WHERE EP.Employee_id IS NULL;

-- Q10: Find the total number of projects each department is handling. 
SELECT D.Department_Name,COUNT(P.Department_id)
FROM Projects P
JOIN Departments D
ON P.Department_id = D.Department_id
GROUP BY D.Department_id;