-- Write a query to output the customer id of all distinct users whose name end with the letter 'a'.

-- Expected output
-- ┌─────────────┐
-- │ customer_id │
-- ├─────────────┤
-- │ 12445       │
-- │ 12345       │
-- │ 22213       │
-- │ 22217       │
-- │ 22219       │
-- └─────────────┘





SELECT DISTINCT customer_id 
FROM Orders
WHERE customer_name LIKE '%A';