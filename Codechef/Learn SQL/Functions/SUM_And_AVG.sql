-- Write a query to output the following on separate lines from the table 'Employee'

-- Total Payout for the Product department.
-- Rename the column header as 'product_total_pay'

-- Average Payout for Operations department.
-- Rename the column header as 'ops_avg_pay'




SELECT SUM(Payout) AS 'product_total_pay'
FROM employee
where Department='Product';

SELECT AVG(Payout) AS 'ops_avg_pay'
FROM employee
where Department='Operations';