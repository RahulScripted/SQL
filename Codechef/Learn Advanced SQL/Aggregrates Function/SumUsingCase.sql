-- Write a query to find the sum of fee paid by the students, aged above 20 across departments.




SELECT Department,
SUM(CASE WHEN Age > 20 THEN Fee ELSE 0 END) as Sum_Senior_Fee 
FROM student
GROUP BY 1;