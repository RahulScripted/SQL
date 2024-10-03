-- Write a query to do the following:

-- 1.  Set the Department as 'HR', for the employee with employee_id - 02 to the existing table employee

-- 2.  Output all the entries of the table

-- Original table has the following entries
-- ┌─────────────┬────────────────┬────────────┐
-- │ Employee_id │ Employee_Name  │ Department │
-- ├─────────────┼────────────────┼────────────┤
-- │ 1           │ Kayla Thompson │ Sales      │
-- │ 2           │ Ethan Chen     │ Operations │
-- │ 3           │ Julia Lee      │ Hr         │
-- └─────────────┴────────────────┴────────────┘




UPDATE employee
SET Department = "HR" 
WHERE Employee_id = 2;

SELECT * FROM employee;