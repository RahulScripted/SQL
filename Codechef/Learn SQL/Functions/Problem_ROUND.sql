-- Write a query to output the following from the employee 'table': Round the column Payout to 2 decimal places. Rename the column header as 'payout'.





SELECT ROUND(Payout ,2) AS 'payout'
FROM employee;