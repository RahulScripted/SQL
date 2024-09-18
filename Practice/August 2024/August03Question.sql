-- Employees
-- 	Employee_id			First_name			Last_name			Email			Hire_date		Department_id
-- 		1					John				Doe		john.doe@example.com	2020-01-15			1
-- 		2					Jane			   Smith	jane.smith@example.com	2019-02-20			2
-- 		3					 Sam			   Brown	sam.brown@example.com	2021-03-10			1
-- 		4					Lisa			   Wilson	lisa.wilson@example.com	2018-07-18			3
-- 		5					 Tom			   Davis	tom.davis@example.com	2022-05-25			2

-- Departments
-- 		Department_id			Department_name
-- 				1					 Sales
-- 				2				   Marketing
-- 				3					   HR

-- Projects
-- 		Project_id			Project_name			Start_date			End_date			Budget
-- 			1				Project Alpha			2023-01-15			2023-06-30			50000
-- 			2				Project Beta			2023-03-20			2023-12-31			75000
-- 			3				Project Gamma			2023-04-10			2023-10-25			60000
-- 			4				Project Delta			2023-02-01			2023-08-15			40000
-- 			5				Project Epsilon			2023-05-05			2023-11-30			55000

-- EmployeeProjects
-- 		Employee_project_id			Employee_id			Project_id			Hours_worked
-- 				1						1					1					120
-- 				2						2					2					100
-- 				3						3					1					150
-- 				4						4					3					 90
-- 				5						5					4					110
-- 				6						1					2					130
-- 				7						2					3					140
-- 				8						3					4					 80
-- 				9						4					5					120
-- 				10						5					1					100

-- Questions
-- Q1: List all employees along with their department names.
-- Q2: Find the total number of projects each employee is working on.
-- Q3: Identify the projects each employee is working on along with the hours worked.
-- Q4: List the names of employees who have worked more than 100 hours on any project.
-- Q5: Get the total hours worked by each employee across all projects.
-- Q6: Find the average budget of all projects.
-- Q7: List the projects that started in 2023.
-- Q8: Identify the employee who has worked the most hours on projects.
-- Q9: Get the details of projects with a budget greater than $50,000.
-- Q10: Calculate the total number of employees working in each department.
-- Q11: List the employees who are not working on any projects.
-- Q12: Find the projects that have employees from more than one department.
-- Q13: Identify the projects where the total hours worked is more than 300.
-- Q14: Get the names and total number of projects for each employee, sorted by total number of projects in descending order.
-- Q15: List the employees who joined before 2020.



CREATE DATABASE IF NOT EXISTS August03Problem;
USE August03Problem;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    hire_date DATE,
    department_id INT
);

INSERT INTO Employees (employee_id, first_name, last_name, email, hire_date, department_id)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2020-01-15', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2019-02-20', 2),
(3, 'Sam', 'Brown', 'sam.brown@example.com', '2021-03-10', 1),
(4, 'Lisa', 'Wilson', 'lisa.wilson@example.com', '2018-07-18', 3),
(5, 'Tom', 'Davis', 'tom.davis@example.com', '2022-05-25', 2);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR');

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2)
);

INSERT INTO Projects (project_id, project_name, start_date, end_date, budget)
VALUES
(1, 'Project Alpha', '2023-01-15', '2023-06-30', 50000),
(2, 'Project Beta', '2023-03-20', '2023-12-31', 75000),
(3, 'Project Gamma', '2023-04-10', '2023-10-25', 60000),
(4, 'Project Delta', '2023-02-01', '2023-08-15', 40000),
(5, 'Project Epsilon', '2023-05-05', '2023-11-30', 55000);

CREATE TABLE EmployeeProjects (
    employee_project_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    hours_worked INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO EmployeeProjects (employee_project_id, employee_id, project_id, hours_worked)
VALUES
(1, 1, 1, 120),
(2, 2, 2, 100),
(3, 3, 1, 150),
(4, 4, 3, 90),
(5, 5, 4, 110),
(6, 1, 2, 130),
(7, 2, 3, 140),
(8, 3, 4, 80),
(9, 4, 5, 120),
(10, 5, 1, 100);



-- Q1: List all employees along with their department names.
SELECT E.Employee_id,E.First_name,E.Last_name,D.Department_name
FROM Employees E
JOIN Departments D ON E.Department_id = D.Department_id;

-- Q2: Find the total number of projects each employee is working on.
SELECT EP.Employee_id,COUNT(P.project_id) AS NumberOfProjects
FROM EmployeeProjects EP
JOIN Projects P ON EP.project_id = P.project_id
GROUP BY EP.Employee_id;

-- Q3: Identify the projects each employee is working on along with the hours worked.
SELECT E.Employee_id,P.project_id, P.project_name,EP.hours_worked
FROM Employees E
JOIN EmployeeProjects EP ON E.Employee_id = EP.Employee_id
JOIN Projects P ON EP.project_id = P.project_id;

-- Q4: List the names of employees who have worked more than 100 hours on any project.
SELECT E.Employee_id,P.project_id, P.project_name,EP.hours_worked
FROM Employees E
JOIN EmployeeProjects EP ON E.Employee_id = EP.Employee_id
JOIN Projects P ON EP.project_id = P.project_id
WHERE EP.hours_worked > 100;

-- Q5: Get the total hours worked by each employee across all projects.
SELECT E.Employee_id,SUM(EP.hours_worked) AS TotalHours
FROM Employees E
JOIN EmployeeProjects EP ON E.Employee_id = EP.Employee_id
GROUP BY E.Employee_id;

-- Q6: Find the average budget of all projects.
SELECT ROUND(AVG(P.Budget),2) AS Average_Budget
FROM Projects P;

-- Q7: List the projects that started in 2023.
SELECT P.project_id, P.project_name
FROM Projects P
WHERE YEAR(P.start_date) = '2023';

-- Q8: Identify the employee who has worked the most hours on projects.
SELECT E.Employee_id, E.First_name, E.Last_name, TotalHours
FROM Employees E
JOIN (
    SELECT Employee_id, SUM(hours_worked) AS TotalHours
    FROM EmployeeProjects
    GROUP BY Employee_id
    ORDER BY TotalHours DESC
    LIMIT 1
) AS MaxHours ON E.Employee_id = MaxHours.Employee_id;

-- Q9: Get the details of projects with a budget greater than $50,000.
SELECT P.project_id, P.project_name, P.start_date, P.end_date
FROM Projects P
WHERE P.budget >= 50000;

-- Q10: Calculate the total number of employees working in each department.
SELECT D.department_name,COUNT(E.Employee_id) AS total_employees
FROM Departments D
JOIN Employees E ON D.department_id = E.department_id
GROUP BY D.department_name;

-- Q11: List the employees who are not working on any projects.
SELECT E.employee_id, E.first_name, E.last_name
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.Employee_id = EP.Employee_id
WHERE EP.project_id IS NULL;

-- Q12: Find the projects that have employees from more than one department.
SELECT P.project_id, P.project_name
FROM Projects P
INNER JOIN EmployeeProjects EP ON EP.project_id = P.project_id
INNER JOIN Employees E ON EP.Employee_id = E.Employee_id
GROUP BY P.project_id
HAVING COUNT(DISTINCT E.Department_id) > 1;

-- Q13: Identify the projects where the total hours worked is more than 300.
SELECT P.project_id, P.project_name
FROM Projects P
INNER JOIN EmployeeProjects EP ON EP.project_id = P.project_id
GROUP BY P.project_id
HAVING SUM(EP.hours_worked) > 300;

-- Q14: Get the names and total number of projects for each employee, sorted by total number of projects in descending order.
SELECT E.first_name, E.last_name, COUNT(P.project_id) AS total_projects
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.employee_id = EP.employee_id
LEFT JOIN Projects P ON EP.project_id = P.project_id
GROUP BY E.employee_id
ORDER BY total_projects DESC;

-- Q15: List the employees who joined before 2020.
SELECT E.Employee_id, E.First_name, E.Last_name
FROM Employees E
WHERE YEAR(E.Hire_date) < '2020';