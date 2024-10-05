-- The Query written in the console is trying to find the minimum and maximum value of payout rounded to 2 decimal places in the table employee. Debug this query to output the minimum and maximum value of payout, rounded to 2 decimal places.




SELECT ROUND(MIN(Payout),2) AS 'min_pay', ROUND(MAX(Payout),2) AS 'max_pay'
FROM employee;