-- Write a query to do the following

-- 1.  For each department where the average outstanding fee is less than 500.

-- 2.  Find the average marks (round to 2 decimal places) of the students. Rename the column header as 'avg_marks'





SELECT Department,ROUND(AVG(Marks),2) AS avg_marks 
FROM student
WHERE Department = "Science" OR Department = "Statistics"
GROUP BY Department;