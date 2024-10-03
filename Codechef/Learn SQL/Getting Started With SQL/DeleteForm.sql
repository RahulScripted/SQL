-- Write a query which does the following

-- 1.  Delete all rows in the employee table whose Department is 'Hr'.

-- 2.  Output all the entires of the table

-- Original table has the following rows
-- ┌─────────────┬────────────────┬────────────┐
-- │ Employee_id │ Employee_Name  │ Department │
-- ├─────────────┼────────────────┼────────────┤
-- │ 1           │ Kayla Thompson │ Sales      │
-- │ 2           │ Ethan Chen     │ Operations │
-- │ 3           │ Julia Lee      │ Hr         │
-- │ 4           │ Marcus Garcia  │ Product    │
-- └─────────────┴────────────────┴────────────┘




DELETE FROM employee 
WHERE Department = "Hr";

SELECT * FROM employee;