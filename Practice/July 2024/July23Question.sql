-- Customers
-- 	Customer_id			First_name			Last_name			 		Email					 City
-- 		1				   John				   Doe				john.doe@example.com		   New York
-- 		2				   Jane				  Smith				jane.smith@example.com		  Los Angeles
-- 		3				   Mary				 Johnson			  mary.j@example.com			Chicago
-- 		4				  James				 Williams		   	 james.w@example.com		    Houston
-- 		5				 Patricia			  Brown				   pat.b@example.com			Phoenix

-- Orders
-- 	Order_id		Customer_id			Order_date			Total_amount
-- 		101				  1				2024-01-15				200
-- 		102				  2				2024-01-20				150
-- 		103				  1				2024-02-15				300
-- 		104				  3				2024-03-01				250
-- 		105				  4				2024-03-10				100

-- Products
-- 	Product_id			Product_name			Price
-- 		1				    Laptop				1000
-- 		2				  Smartphone			 700
-- 		3					Tablet				 300
-- 		4				  Headphones			 100
-- 		5				  Smartwatch			 200

-- Order_items
-- 	Order_item_id		Order_id		Product_id			Quantity
-- 			1				101				1					1
-- 			2				102				2					1
-- 			3				103				3					2
-- 			4				104				4					2
-- 			5				105				5					1

-- Questions
-- Q1: List all customers along with their cities.
-- Q2: Find the total amount spent by each customer.
-- Q3: Identify the products ordered by each customer.
-- Q4: List the names of customers who have placed orders in January 2024.
-- Q5: Get the average total amount of orders for each customer.
-- Q6: Find the total number of products ordered in each order.
-- Q7: List the products that have been ordered more than once.
-- Q8: Identify the customer who has spent the most.
-- Q9: Get the details of orders that include 'Laptop'.
-- Q10: Calculate the total quantity of each product ordered.
-- Q11: List the customers who have placed more than one order.
-- Q12: Find the products that have not been ordered yet.
-- Q13: Identify the orders with a total amount greater than $200.
-- Q14: Get the names and total amounts of orders for each customer, sorted by total amount in descending order.
-- Q15: List the customers who have not placed any orders.



CREATE DATABASE IF NOT EXISTS July232024;
USE July232024;

CREATE TABLE Customers(
	Customer_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(200),
    City VARCHAR(50)
);

INSERT INTO Customers
(Customer_id,First_name,Last_name,Email,City)
VALUES
(1,"John","Doe","john.doe@example.com","New York"),
(2,"Jane","Smith","jane.smith@example.com","Los Angeles"),
(3,"Mary","Johnson","mary.j@example.com","Chicago"),
(4,"James","Williams","james.w@example.com","Houston"),
(5,"Patricia","Brown","pat.b@example.com","Phoenix");

CREATE TABLE Orders(
	Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_date DATE,
    Total_amount INT
);

INSERT INTO Orders
(Order_id,Customer_id,Order_date,Total_amount)
VALUES
(101,1,"2024-01-15",200),
(102,2,"2024-01-20",150),
(103,1,"2024-02-15",300),
(104,3,"2024-03-01",250),
(105,4,"2024-03-10",100);

CREATE TABLE Products(
	Product_id INT PRIMARY KEY,
    Product_name VARCHAR(50),
    Price INT
);

INSERT INTO Products
(Product_id,Product_name,Price)
VALUES
(1,"Laptop",1000),
(2,"Smartphone",700),
(3,"Tablet",300),
(4,"Headphones",100),
(5,"Smartwatch",200);


CREATE TABLE Order_items(
	Order_item_id INT PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT
);

INSERT INTO Order_items
(Order_item_id,Order_id,Product_id,Quantity)
VALUES
(1,101,1,1),
(2,102,2,1),
(3,103,3,2),
(4,104,4,2),
(5,105,5,1);


-- Q1: List all customers along with their cities.
SELECT First_name,Last_name,City
FROM Customers;

-- Q2: Find the total amount spent by each customer.
SELECT C.Customer_id,C.First_name,C.Last_name,COUNT(O.Total_amount) AS TotalSpent
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
GROUP BY C.Customer_id;

-- Q3: Identify the products ordered by each customer.
SELECT  C.Customer_id,C.First_name,C.Last_name,P.Product_name
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
JOIN Order_items OI
ON O.Order_id = OI.Order_id
JOIN Products P
ON OI.Product_id = P.Product_id;

-- Q4: List the names of customers who have placed orders in January 2024.
SELECT C.Customer_id,C.First_name,C.Last_name
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
WHERE MONTH(O.Order_date) = 1 AND YEAR(O.Order_date) = 2024;

-- Q5: Get the average total amount of orders for each customer.
SELECT C.Customer_id,C.First_name,C.Last_name,AVG(O.Total_amount) AS TotalSpent
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
GROUP BY C.Customer_id;

-- Q6: Find the total number of products ordered in each order.
SELECT O.Order_id,COUNT(OI.Quantity) AS NumberOfProducts
FROM Order_items OI
JOIN Orders O
ON O.Order_id = OI.Order_id
GROUP BY OI.Order_id;

-- Q7: List the products that have been ordered more than once.
SELECT P.Product_id,P.Product_name
FROM Products P
INNER JOIN Order_items OI
ON P.Product_id = OI.Product_id
GROUP BY P.Product_id 
HAVING COUNT(*) > 1;

-- Q8: Identify the customer who has spent the most.
SELECT  C.Customer_id,C.First_name,C.Last_name,SUM(OI.Quantity * P.Price) AS MaximumSpent
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
JOIN Order_items OI
ON O.Order_id = OI.Order_id
JOIN Products P
ON OI.Product_id = P.Product_id
GROUP BY C.Customer_id
ORDER BY MaximumSpent DESC
LIMIT 1;

-- Q9: Get the details of orders that include 'Laptop'.
SELECT O.Order_id,O.Customer_id,O.Order_date,O.Total_amount
FROM Orders O
JOIN Order_items OI
ON O.Order_id = OI.Order_id
JOIN Products P
ON OI.Product_id = P.Product_id
WHERE P.Product_name LIKE 'Laptop';

-- Q10: Calculate the total quantity of each product ordered.
SELECT OI.Product_id,SUM(OI.Quantity) AS TotalQuantity
FROM Order_items OI
GROUP BY OI.Product_id;

-- Q11: List the customers who have placed more than one order.
SELECT  C.Customer_id,C.First_name,C.Last_name,COUNT(DISTINCT O.Order_id) AS NoOfOrder
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
JOIN Order_items OI
ON O.Order_id = OI.Order_id
GROUP BY C.Customer_id
HAVING COUNT(DISTINCT O.Order_id) > 1;

-- Q12: Find the products that have not been ordered yet.
SELECT P.Product_id,P.Product_name
FROM Products P
LEFT JOIN Order_items OI
ON P.Product_id = OI.Product_id
WHERE OI.Quantity IS NULL;

-- Q13: Identify the orders with a total amount greater than $200.
SELECT O.Customer_id,O.Order_date,O.Total_amount,O.Total_amount
FROM Orders O
WHERE O.Total_amount > 200;

-- Q14: Get the names and total amounts of orders for each customer, sorted by total amount in descending order.
SELECT  C.Customer_id,C.First_name,C.Last_name,SUM(O.Total_amount) AS TotalSpent
FROM Customers C
JOIN Orders O
ON C.Customer_id = O.Customer_id
GROUP BY C.Customer_id
ORDER BY TotalSpent DESC;

-- Q15: List the customers who have not placed any orders.
SELECT  C.Customer_id,C.First_name,C.Last_name
FROM Customers C
LEFT JOIN Orders O
ON C.Customer_id = O.Customer_id
WHERE O.Order_id IS NULL;