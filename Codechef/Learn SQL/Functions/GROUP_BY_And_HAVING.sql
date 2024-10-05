-- Write a query to output the following from the table 'employee'

-- 1.  Department and average payout on a single line
-- 2.  Where total payout of the department is more than 40
-- 3.  Rename the header for the 2nd column as 'avg_payout'





SELECT Department, Avg(Payout) AS 'avg_payout'
FROM employee
GROUP BY Department
HAVING Sum(Payout) > 40;