-- Write a query to create a table employee with the mentioned constraints on the columns :

-- employee_id - INTEGER PRIMARY KEY,
-- employee_Name - TEXT UNIQUE,
-- Department - TEXT NOT NULL




CREATE TABLE  employee(
    Employee_id INTEGER PRIMARY KEY,
    Employee_Name TEXT UNIQUE,
    Department TEXT NOT NULL
);