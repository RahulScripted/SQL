-- Write a query to find the highest and lowest 'Hourly_pay' of the employees from the table 'employee'.

-- 1.   Rename the column header for highest pay as 'max_pay'
-- 2.   Rename the column header for lowest pay as 'min_pay'




SELECT MAX(Hourly_pay) AS 'max_pay' 
FROM employee;

SELECT MIN(Hourly_pay) AS 'min_pay' 
FROM employee;