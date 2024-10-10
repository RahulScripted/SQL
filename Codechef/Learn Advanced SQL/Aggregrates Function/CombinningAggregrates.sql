-- Write a query to find the percentage of fee paid by the students, aged above 20 to the total fee by all the students across department. Alias the resulting percentage column as Senior_Fee_Percentage. Output the columns 'Department' and 'Senior_Fee_Percentage'.






SELECT Department, (100*(SUM(CASE WHEN Age >20 THEN Fee ELSE 0 END)) / SUM(Fee)) as Senior_Fee_Percentage
FROM student
GROUP BY 1;