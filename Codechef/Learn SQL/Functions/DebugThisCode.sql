/* Debug the below query */

-- SELECT  Avg(Age) as 'avg_age'
-- FROM employee
-- HAVING Count(Department) > 3;


-- Solution
SELECT Department, Avg(Age) as 'avg_age'
FROM employee
GROUP BY Department
HAVING Count(Department) > 3;