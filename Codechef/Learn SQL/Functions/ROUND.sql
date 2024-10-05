-- Write a query to display the values in the column Taxable_Pay rounded to 2 decimal places from the table employee. Rename the column header as 'taxable_pay'.





SELECT ROUND(Taxable_Pay, 2) AS 'taxable_pay'
FROM employee;