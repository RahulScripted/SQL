-- Write a query to output employee id and name of the part time employees from the table 'employee'.





SELECT emp_id,emp_name 
FROM employee
INTERSECT
SELECT emp_id,emp_name 
FROM pt_employee;