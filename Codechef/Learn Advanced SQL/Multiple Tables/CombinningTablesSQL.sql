-- Write a query which does the following

-- 1.  Join the tables 'student' and 'course'

-- 2.  Uses 'Course_id' to match both the tables and output the joined table

-- 3.  Output all entries from the joined table





SELECT *
FROM student S
JOIN course C
ON S.Course_id = C.Course_id;