-- Write a query to do the following

-- 1.  Join the tables 'student' and 'course' and output all its entries.

-- 2.  Check if you can find the course with id ENG201 in the output.





SELECT *
FROM student S 
INNER JOIN course C
ON S.Course_id = C.Course_id;