-- Write a query to output all from the following columns in the table 'employee'

-- 1.  Rename employee_id as 'Serial'
-- 2.  Rename employee_name as 'Name'
-- 3.  Rename department as 'Dept'




SELECT employee_id AS 'Serial', employee_name as 'Name', department as 'Dept'
FROM employee;