-- Write a query to do the following

-- 1.  Cross join the table 'student' and 'course' and check out all possible courses a student can opt.

-- 2.  Output only two columns, the name of the student as 'St_Name' and courses as 'Course_Name'.






SELECT St_Name,Course_Name 
FROM student
CROSS JOIN course;