-- Write a query to output a single table with the names of employees in both the table 'employee' and 'pt_employee'. Employee names are added on the field emp_name in both the tables.




SELECT emp_name 
FROM employee
UNION ALL
SELECT emp_name 
FROM pt_employee;