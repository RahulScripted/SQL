-- Write a query to output the following on separate lines

-- 1.  The Average age of the students of the school. Rename the column header as 'avg_age'

-- 2.  Total Outstanding Fee of the students in 'Arts' department. Rename the column header as 'fee_outstanding'.





SELECT AVG(Age) AS avg_age  
FROM student;


SELECT SUM(Fee_outstanding) AS fee_outstanding
FROM student
WHERE Department = "Arts";