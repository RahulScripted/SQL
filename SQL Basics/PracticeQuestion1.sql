-- Practice Question: 1
--  Create a database for your company named XYZ
--  Create a table inside this DB to store employee info(id,name,salary);
--  Add following information: (1,"Adam",250000),(2,"Bob",300000),(3,"Casey",400000)
--  Select & view all the table

CREATE DATABASE IF NOT EXISTS XYZ_Company; -- Creating Database
USE XYZ_Company; -- Using Database

CREATE TABLE Employee_info( -- Creating Table
	Employee_id INT PRIMARY KEY,
    Employee_name VARCHAR(50),
    Employee_salary INT
);

INSERT INTO Employee_info -- Inserting Value
(Employee_id,Employee_name,Employee_salary) 
VALUES
(1,"Adam",250000),
(2,"Bob",300000),
(3,"Casey",400000);

SELECT * FROM Employee_info; -- Printing Tables