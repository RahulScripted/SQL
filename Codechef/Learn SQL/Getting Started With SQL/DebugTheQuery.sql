-- The Query written in the console is trying to insert data to the table employee. Debug this query to output the entire table. Your table is named 'employee' and has the following columns

-- 1.   Id (INT)
-- 2.   Name (TEXT),
-- 3.   Age (INT),
-- 4.   Address (TEXT)





INSERT INTO employee(Id,Name,Age,Address)
VALUES  (1, 'John Smith', 25,  '123 Main St'),
        (2, 'Sarah Johnson', 30, '456 Broadway');

SELECT * FROM employee;