-- Write a query to find the Average of the column 'Payout' from the table 'employee'. Rename the column header as 'avg_payout'.




SELECT AVG(Payout) AS avg_payout  
FROM employee;