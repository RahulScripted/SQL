-- You are given a table - employee (mentioned below).

-- Write a query which does the following:

-- 1.  Delete the row where the department is Client.

-- 2.  Output the entire table.

-- Original table has the following rows
-- ┌─────────────┬────────────────┬────────────┐
-- │ Employee_id │ Employee_Name  │ Department │
-- ├─────────────┼────────────────┼────────────┤
-- │ 1           │ Kayla Thompson │ Sales      │
-- │ 2           │ Ethan Chen     │ Operations │
-- │ 3           │ Julia Lee      │ Client     │
-- │ 4           │ Marcus Garcia  │ Product    │
-- └─────────────┴────────────────┴────────────┘




DELETE FROM employee 
WHERE Department = 'Client';

SELECT * FROM employee;