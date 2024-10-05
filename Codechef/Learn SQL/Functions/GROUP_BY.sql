-- Write a query to find the Average of the column 'Payout' across 'Department' from the table 'employee'. The output table should have the average payout of each department. Rename the column header as 'avg_payout' Code it out in the IDE.




SELECT Department,
AVG(Payout) as 'avg_payout'
FROM employee
GROUP BY Department;