-- You are given a table - employee (mentioned below). Write a query which does the following

-- 1.  Add a new column 'Hourly_Pay' to the table employee and set the value as 100 by default.

-- 2.  Output the entire table

-- Original table has the following rows
-- ┌─────────────┬────────────────┬────────────┐
-- │ Employee_id │ Employee_Name  │ Department │
-- ├─────────────┼────────────────┼────────────┤
-- │ 1           │ Kayla Thompson │ Sales      │
-- │ 2           │ Ethan Chen     │ Hr         │
-- │ 3           │ Julia Lee      │ Operations │
-- │ 4           │ Marcus Garcia  │ Hr         │
-- └─────────────┴────────────────┴────────────┘





ALTER TABLE employee 
ADD COLUMN Hourly_Pay INT DEFAULT 100;

SELECT * FROM employee;