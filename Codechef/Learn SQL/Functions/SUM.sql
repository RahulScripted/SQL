-- Write a query to find the sum of the Payout from the table EMPLOYEE. Rename the column header as 'total_payout'.




SELECT SUM(Payout) AS total_payout 
FROM EMPLOYEE;