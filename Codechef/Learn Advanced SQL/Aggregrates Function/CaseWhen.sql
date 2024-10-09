-- Write a query to do the following: Categorize the students based on the marks into grades.

-- 1.  Marks Less than 50 - C,
-- 2.  Marks between 50 and 80 - B,
-- 3.  Marks more than 80 - A


-- You need to output the following - 'Grades' and 'student_count'. Give the Alias name for the CASE as 'Grades'. Count the students in each category and assign it the alias 'student_count'





SELECT CASE
    WHEN marks < 50 THEN 'C'
    WHEN marks BETWEEN 50 AND 80 THEN 'B'
    WHEN marks > 80 THEN 'A'
    ELSE 'NA'
    END AS Grades,
    COUNT(*) AS Student_count
FROM marks
GROUP BY 1;