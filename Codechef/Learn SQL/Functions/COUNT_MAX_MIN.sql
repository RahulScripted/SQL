-- Write 3 separate queries to output the entries for the following:

-- 1.  Count the number of employees in the department 'Sales'. Rename the column header as 'count_sales'.

-- 2.  Maximum Hourly pay for the department 'Operations'. Rename the column header as 'ops_max_pay'.

-- 3.  Minimum Hourly pay for the department 'Operations'. Rename the column header as 'ops_min_pay'.





SELECT count(*) as 'count_sales'
FROM employee
where Department='Sales';

SELECT MAX(Hourly_Pay) as 'ops_max_pay'
FROM employee
where Department='Operations';

SELECT MIN(Hourly_Pay) as 'ops_min_pay'
FROM employee
where Department='Operations';