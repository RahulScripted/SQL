-- Write a query to do the following

-- 1.  Add a column 'Designation' to the table 'employee' and set 'Null' as the default value.

-- 2.  Output the entire table.

-- Original table has the following rows
-- ┌─────────────┬────────────────┬────────────┐
-- │ Employee_id │ Employee_Name  │ Department │
-- ├─────────────┼────────────────┼────────────┤
-- │ 1           │ Kayla Thompson │ Sales      │
-- │ 2           │ Ethan Chen     │ Operations │
-- │ 3           │ Julia Lee      │ Hr         │
-- └─────────────┴────────────────┴────────────┘





ALTER TABLE employee
ADD COLUMN Designation TEXT default NULL;


SELECT * FROM employee;