-- Write a query to do the following

-- 1.  Output the name of employees from the table 'Employee' who meet the following condition

-- 2.  Employee age is less than the average age of the employees of the department 'Sales'.





SELECT emp_name
FROM employee 
WHERE emp_age < (SELECT AVG(emp_age)
FROM employee
WHERE emp_dept= 'Sales');