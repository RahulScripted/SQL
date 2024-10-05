-- Your order management system sometimes has a bug and does not capture the order_time - i.e., order_time is blank. Write a query to output the order ids which faced this bug.

-- Expected output
-- ┌────────────┐
-- │  order_id  │
-- ├────────────┤
-- │ 2304111242 │
-- │ 2304111245 │
-- └────────────┘




SELECT order_id  
FROM Orders
WHERE order_time IS NULL;