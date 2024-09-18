--  Create following tables and run following queries

-- SALE Table
-- 		sale_id		product_id		quantity_sold		sale_date		total_price
-- 			1			101				 5				2024-01-01		  2500.00
-- 			2			102				 3				2024-01-02		   900.00
-- 			3			103				 2				2024-01-02			60.00
-- 			4			104				 4				2024-01-03			80.00
-- 			5			105				 6				2024-01-03			90.00 

-- PRODUCT Table
-- 		product_id			product_name		 category		unit_price
-- 		  101					Laptop			Electronics		  500.00
-- 		  102				  Smartphone		Electronics		  300.00
-- 		  103				  Headphones		Electronics		   30.00
-- 		  104				   Keyboard			Electronics		   20.00
-- 		  105					Mouse			Electronics		   15.00

-- Q1. Retrieve all columns from the Sales table.
-- Q2. Retrieve the product_name and unit_price from the Products table.
-- Q3. Retrieve the sale_id and sale_date from the Sales table.
-- Q4. Filter the Sales table to show only sales with a total_price greater than $100.
-- Q5. Filter the Products table to show only products in the ‘Electronics’ category.
-- Q6. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.
-- Q7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.
-- Q8. Calculate the total revenue generated from all sales in the Sales table.
-- Q9. Calculate the average unit_price of products in the Products table.
-- Q10. Calculate the total quantity_sold from the Sales table.
-- Q11. Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
-- Q12. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
-- Q13. Retrieve the total_price of all sales, rounding the values to two decimal places.
-- Q14. Calculate the average total_price of sales in the Sales table.
-- Q15. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as ‘YYYY-MM-DD’.
-- Q16. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
-- Q17. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.

CREATE DATABASE IF NOT EXISTS Sale;
USE Sale;

CREATE TABLE Sale_Information(
	Sale_id INT PRIMARY KEY,
    Product_id INT,
    Quality_sold INT,
    Sale_date DATE,
    Total_price DECIMAL(10,2)
);

INSERT INTO Sale_Information
(Sale_id,Product_id,Quality_sold,Sale_date,Total_price)
VALUES
(1,101,5,'2024-01-01',2500.00),
(2,102,3,'2024-01-02',900.00),
(3,103,2,'2024-01-02',60.00),
(4,104,4,'2024-01-03',80.00),
(5,105,6,'2024-01-03',90.00);


CREATE TABLE Product_Information(
	Product_id INT PRIMARY KEY,
    Product_name VARCHAR(50),
    Category VARCHAR(50),
    Unit_price DECIMAL(10,2)
);

INSERT INTO Product_Information
(Product_id,Product_name,Category,Unit_price)
VALUES
(101,"Laptop","Electronics",500.00),
(102,"Smartphone","Electronics",300.00),
(103,"Headphones","Electronics",30.00),
(104,"Keyboard","Electronics",20.00),
(105,"Mouse","Electronics",15.00);

-- Q1. Retrieve all columns from the Sales table.
SELECT * FROM Sale_Information;

-- Q2. Retrieve the product_name and unit_price from the Products table.
SELECT Product_name,Unit_price FROM Product_Information;

-- Q3. Retrieve the sale_id and sale_date from the Sales table.
SELECT Sale_id,Sale_date FROM Sale_Information;

-- Q4. Filter the Sales table to show only sales with a total_price greater than $100.
SELECT * FROM Sale_Information WHERE Total_price > 100;

-- Q5. Filter the Products table to show only products in the ‘Electronics’ category.
SELECT * FROM Product_Information WHERE Category = "Electronics";

-- Q6. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.
SELECT Sale_id,Total_price FROM Sale_Information WHERE Sale_date = '2024-01-03';

-- Q7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.
SELECT Product_id,Product_name FROM Product_Information WHERE Unit_price > 100;

-- Q8. Calculate the total revenue generated from all sales in the Sales table.
SELECT SUM(Total_price) AS Total_revenue FROM Sale_Information;

-- Q9. Calculate the average unit_price of products in the Products table.
SELECT AVG(Unit_price) AS Average_unit_price FROM Product_Information;

-- Q10. Calculate the total quantity_sold from the Sales table.
SELECT SUM(Quality_sold) AS Total_quantity_sold FROM Sale_Information;

-- Q11. Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
SELECT Sale_id,Product_id,Total_price FROM Sale_Information WHERE Quality_sold > 4;

-- Q12. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
SELECT Product_name,Unit_price FROM Product_Information ORDER BY Unit_price DESC;

-- Q13. Retrieve the total_price of all sales, rounding the values to two decimal places.
SELECT ROUND(SUM(Total_price),2) FROM Sale_Information;

-- Q14. Calculate the average total_price of sales in the Sales table.
SELECT AVG(Total_price) FROM Sale_Information;

-- Q15. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as ‘YYYY-MM-DD’.
SELECT Sale_id,DATE_FORMAT(Sale_date, '%y-%m-%d') AS DATE_FORMATTED FROM Sale_Information;

-- Q16. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
SELECT Product_name,Unit_price FROM Product_Information WHERE Unit_price BETWEEN 20 AND 600;

-- Q17. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.
SELECT Product_name,Category FROM Product_Information ORDER BY Category ASC;