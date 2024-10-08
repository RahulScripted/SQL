-- Write a query to output the following

-- 1.  Find the total outstanding fee of the students for each department. Rename the column header as 'fee_outstanding'.

-- 2.  Group by each department




SELECT Department,SUM(Fee_outstanding) AS fee_outstanding
FROM student
GROUP BY Department;