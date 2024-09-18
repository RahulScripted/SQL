-- Products
--   Product_id		Product_name		Category_id			Price			Stock
-- 		 1				Laptop				  1				 1200			 30
-- 		 2			   Smartphone			  2				  800			 50
-- 		 3				 Tablet				  1				  600			 20
-- 		 4			   Headphones			  3				  150			 100
-- 		 5			   Smartwatch			  2				  200			 40

-- Categories
-- 		Category_id			Category_name
-- 			  1				  Computers
-- 			  2				   Mobiles
-- 			  3				  Accessories

-- Questions

-- Q1: List all products along with their category names.
-- Q2: Find the total stock value (price * stock) for each category.
-- Q3: Identify the product with the highest price in each category.
-- Q4: Find the average price of products in each category.
-- Q5: List the names of categories that have more than one product.
-- Q6: Get the total number of products in each category.
-- Q7: Find the category with the lowest average price.
-- Q8: List the products that have a stock of less than 50.
-- Q9: Identify products that belong to the 'Mobiles' category.
-- Q10: Calculate the total value of all products in stock.
-- Q11: Find the total number of products that have a price greater than $500.
-- Q12: List all categories that have a total stock value of more than $10,000.
-- Q13: Identify products whose names start with the letter 'S'.
-- Q14: Get the average stock of products in the 'Computers' category.
-- Q15: List the names and prices of products in each category, sorted by price in descending order.
-- Q16: Identify all products that have a price between $100 and $1000. 


CREATE DATABASE IF NOT EXISTS Product_Categories;
USE Product_Categories;

CREATE TABLE Products(
	Product_id INT PRIMARY KEY,
    Product_name VARCHAR(20),
    Category_id INT,
    Price INT,
    Stock INT
);

INSERT INTO Products
(Product_id,Product_name,Category_id,Price,Stock)
VALUES
(1,"Laptop",1,1200,30),
(2,"Smartphone",2,800,50),
(3,"Tablet",1,600,20),
(4,"Headphones",3,150,100),
(5,"Smartwatch",2,200,40);

CREATE TABLE Categories(
	Category_id INT PRIMARY KEY,
    Category_name VARCHAR(30)
);

INSERT INTO Categories
(Category_id,Category_name)
VALUES
(1,"Computers"),
(2,"Mobiles"),
(3,"Accessories");

-- Q1: List all products along with their category names.
SELECT  
	P.Product_id,
    P.Product_name,
    C.Category_id,
    C.Category_name
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id;

-- Q2: Find the total stock value (price * stock) for each category.
SELECT C.Category_name,SUM(P.Price * P.Stock) AS TotalStock
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
GROUP BY C.Category_name;

-- Q3: Identify the product with the highest price in each category.
SELECT C.Category_name,MAX(P.Price) AS HighestPrice
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
GROUP BY C.Category_name;

-- Q4: Find the average price of products in each category.
SELECT C.Category_name,AVG(P.Price) AS AveragePrice
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
GROUP BY C.Category_name;

-- Q5: List the names of categories that have more than one product.
SELECT C.Category_name
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
GROUP BY C.Category_id
HAVING COUNT(*) > 1;

-- Q6: Get the total number of products in each category.
SELECT C.Category_name,COUNT(C.Category_id)
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
GROUP BY C.Category_id;

-- Q7: Find the category with the lowest average price.
SELECT C.Category_name 
FROM Categories C
JOIN(
	SELECT Category_id,AVG(Price) AS AveragePrice
    FROM Products
    GROUP BY Category_id
) 
AS P ON P.Category_id = C.Category_id
ORDER BY AveragePrice ASC
LIMIT 1;

-- Q8: List the products that have a stock of less than 50.
SELECT P.Product_id,P.Product_name
FROM Products P
WHERE P.Stock < 50;

-- Q9: Identify products that belong to the 'Mobiles' category.
SELECT P.Product_id,P.Product_name
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
WHERE C.Category_name = "Mobiles";

-- Q10: Calculate the total value of all products in stock.
SELECT SUM(P.Stock) AS TotalValue
FROM Products P;

-- Q11: Find the total number of products that have a price greater than $500.
SELECT COUNT(DISTINCT P.Stock) AS TotalNumberOfProducts
FROM Products P 
WHERE P.Price > 500;

-- Q12: List all categories that have a total stock value of more than $10,000.
SELECT C.Category_name, SUM(P.Price * P.Stock) AS TotalStockValue
FROM Categories C
JOIN Products P
ON C.Category_id = P.Category_id
GROUP BY C.Category_id
HAVING SUM(P.Price * P.Stock) > 10000;

-- Q13: Identify products whose names start with the letter 'S'.
SELECT P.Product_name
FROM Products P
WHERE P.Product_name LIKE "%S%";

-- Q14: Get the average stock of products in the 'Computers' category.
SELECT AVG(P.Stock)
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
WHERE C.Category_name = "Mobiles";

-- Q15: List the names and prices of products in each category, sorted by price in descending order.
SELECT P.Product_name,P.Price
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id
ORDER BY C.Category_id DESC,P.Product_name ASC;

-- Q16: Identify all products that have a price between $100 and $1000. 
SELECT P.Product_name,P.Price
FROM Products P
WHERE P.Price BETWEEN 100 AND 1000;