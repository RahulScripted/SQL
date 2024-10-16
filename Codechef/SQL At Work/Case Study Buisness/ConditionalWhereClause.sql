-- Write a query to output all entries of the 'Financials' table in the month of March when the pandemic lockdowns were initiated and in the month of February - just before the pandemic.





SELECT * FROM Financials
WHERE month = 'Mar'OR month = 'Feb';