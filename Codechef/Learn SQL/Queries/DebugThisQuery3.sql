-- Output the customer_names for the following query conditions

-- 1.  Customers who live in pincodes 122001 OR 122002
-- 2.  Who placed an order before 12.30 PM
-- 3.  Who stay on the 3rd floor or higher

-- Expected output
-- ┌───────────────┐
-- │ customer_name │
-- ├───────────────┤
-- │ Anna          │
-- │ Alba          │
-- │ John          │
-- │ Diya          │
-- │ Avni          │
-- └───────────────┘





SELECT customer_name 
FROM Orders
WHERE (address_pincode = 122001 OR address_pincode = 122002)
AND order_time < 12.3
AND apartment_floor >= 3;