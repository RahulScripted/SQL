-- Write a query to find out the average of column 'Payout' across 'Department' which has more than 3 employees from the table 'employee'. The output table should have the name of the department and their respective average pay. Rename the column header for the 2nd column as 'avg_payout'.




SELECT Department, 
AVG(Payout) AS 'avg_payout'
FROM employee
GROUP BY Department
HAVING COUNT(*) > 3;