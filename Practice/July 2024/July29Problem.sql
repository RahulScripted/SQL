-- Products
-- 		Product_id			Product_name		Category_id			price		Stock_quantity
-- 			1					Laptop				1				1000			 50
-- 			2				  Smartphone			2				 700			 150
-- 			3					Tablet				2				 300			 100
-- 			4				  Headphones			3				 100			 200
-- 			5					Monitor				1				 200			 75

-- Categories
-- 		Category_id			Category_name
-- 			1				 Electronics
-- 			2					Mobile
-- 			3				  Accessories

-- Customers
-- 		Customer_id			First_name			Last_name			  Email					  City
-- 			1					John				Doe			john.doe@example.com		New York
-- 			2					Jane			   Smith		jane.smith@example.com	   Los Angeles
-- 			3					Mary			  Johnson		mary.j@example.com			 Chicago
-- 			4					James			  Williams		james.w@example.com			 Houston
-- 			5				  Patricia			   Brown		pat.b@example.com			 Phoenix

-- Orders
-- 		Order_id		Customer_id			Order_date			Total_amount
-- 			1				1				2024-07-01				1200
-- 			2				2				2024-07-02				 700
-- 			3				3				2024-07-03				 300
-- 			4				4				2024-07-04				1000
-- 			5				5				2024-07-05				 900

-- Order_items
-- 	Order_item_id		Order_id		Product_id		Quantity		Price
-- 		 1					1				1				1			1000
-- 		 2					1				4				2			 100
-- 		 3					2				2				1			 700
-- 		 4					3				3				1			 300
-- 		 5					4				1				1			1000
-- 		 6					5				5				3			 200

-- Questions
-- Q1: List all products along with their category names.
-- Q2: Identify the products ordered by each customer along with the quantities.
-- Q3: List the names of customers who have placed orders in July 2024.
-- Q4: Get the average total amount of orders for each customer.
-- Q5: Find the total quantity of each product ordered across all orders.
-- Q6: List the products that have been ordered more than once.
-- Q7: Identify the customer who has spent the most on orders.
-- Q8: Get the details of orders that include 'Laptop'.
-- Q9: Calculate the total revenue generated from each product.
-- Q10: List the customers who have placed more than one order.
-- Q11: Find the products that have not been ordered yet.
-- Q12: Identify the orders with a total amount greater than $1000.
-- Q13: List the customers who have not placed any orders.


-- Answers

CREATE DATABASE IF NOT EXISTS July29Problem; 
USE July29Problem;

CREATE TABLE Products(
	Product_id INT PRIMARY KEY,
    Product_name VARCHAR(50),
    Category_id INT,
    price INT,
    Stock_quantity INT
);

INSERT INTO Products
(Product_id,Product_name,Category_id,price,Stock_quantity)
VALUES
(1,"Laptop",1,1000,50),
(2,"Smartphone",2,700,150),
(3,"Tablet",2,300,100),
(4,"Headphones",3,100,200),
(5,"Monitor",1,200,75);

CREATE TABLE Categories(
	Category_id INT PRIMARY KEY,
    Category_name VARCHAR(50)
);

INSERT INTO Categories
(Category_id,Category_name)
VALUES
(1,"Electronics"),
(2,"Mobile"),
(3,"Accessories");

CREATE TABLE Customers(
	Customer_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
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
(1,1,"2024-07-01",1200),
(2,2,"2024-07-02",700),
(3,3,"2024-07-03",300),
(4,4,"2024-07-04",1000),
(5,5,"2024-07-05",900);

CREATE TABLE Order_items(
	Order_item_id INT PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT,
    Price INT
);

INSERT INTO Order_items
(Order_item_id,Order_id,Product_id,Quantity,Price)
VALUES
(1,1,1,1,1000),
(2,1,4,2,100),
(3,2,2,1,700),
(4,3,3,1,300),
(5,4,1,1,1000),
(6,5,5,3,200);


-- Q1: List all products along with their category names.
SELECT P.Product_id,P.Product_name,C.Category_name
FROM Products P
JOIN Categories C
ON P.Category_id = C.Category_id;

-- Q2: Identify the products ordered by each customer along with the quantities.
SELECT C.Customer_id,C.First_name,C.Last_name,P.Product_id,P.Product_name,OI.Quantity
FROM Customers c
JOIN Orders O ON C.Customer_id = O.Customer_id
JOIN Order_items OI ON O.Order_id = OI.Order_id
JOIN Products P ON OI.Product_id = P.Product_id;

-- Q3: List the names of customers who have placed orders in July 2024.
SELECT C.Customer_id,C.First_name,C.Last_name,O.Order_date
FROM Customers c
JOIN Orders O ON C.Customer_id = O.Customer_id
WHERE MONTH(O.Order_date) = 7 AND YEAR(O.Order_date) = 2024;

-- Q4: Get the average total amount of orders for each customer.
SELECT C.Customer_id,C.First_name,C.Last_name,ROUND(AVG(OI.Quantity * OI.Price),2) AS total_amount
FROM Customers C
JOIN Orders O ON C.Customer_id = O.Customer_id
JOIN Order_items OI ON O.Order_id = OI.Order_id
GROUP BY C.Customer_id,C.First_name,C.Last_name;

-- Q5: Find the total quantity of each product ordered across all orders.
SELECT P.Product_id,P.Product_name,SUM(OI.Quantity) AS total_amount
FROM Products P
JOIN Order_items OI
ON P.Product_id = OI.Product_id
GROUP BY P.Product_id;

-- Q6: List the products that have been ordered more than once.
SELECT P.Product_id,P.Product_name,COUNT(OI.Product_id) AS noProducts
FROM Products P
JOIN Order_items OI
ON P.Product_id = OI.Product_id
GROUP BY P.Product_id
HAVING COUNT(OI.Product_id) > 1;

-- Q7: Identify the customer who has spent the most on orders.
SELECT C.Customer_id,C.First_name,C.Last_name,MAX(OI.Quantity * OI.Price) AS total_amount
FROM Customers C
JOIN Orders O ON C.Customer_id = O.Customer_id
JOIN Order_items OI ON O.Order_id = OI.Order_id
GROUP BY C.Customer_id,C.First_name,C.Last_name
ORDER BY total_amount DESC
LIMIT 1;

-- Q8: Get the details of orders that include 'Laptop'.
SELECT C.Customer_id,C.First_name,C.Last_name
FROM Customers C
JOIN Orders O ON C.Customer_id = O.Customer_id
JOIN Order_items OI ON O.Order_id = OI.Order_id
JOIN Products P ON P.Product_id = OI.Product_id
WHERE P.Product_name = 'Laptop';

-- Q9: Calculate the total revenue generated from each product.
SELECT P.Product_id,P.Product_name,SUM(OI.Quantity * OI.Price) AS total_amount
FROM Products P
JOIN Order_items OI
ON P.Product_id = OI.Product_id
GROUP BY P.Product_id;

-- Q10: List the customers who have placed more than one order.
SELECT C.Customer_id,C.First_name,C.Last_name,COUNT(OI.Order_id) AS noOrder
FROM Customers C
JOIN Orders O ON C.Customer_id = O.Customer_id
JOIN Order_items OI ON O.Order_id = OI.Order_id
GROUP BY C.Customer_id,C.First_name,C.Last_name
HAVING noOrder > 1;

-- Q11: Find the products that have not been ordered yet.
SELECT P.Product_id,P.Product_name
FROM Products P
LEFT JOIN Order_items OI
ON P.Product_id = OI.Product_id
WHERE OI.Product_id IS NULL;

-- Q12: Identify the orders with a total amount greater than $1000.
SELECT O.Order_id,SUM(OI.Quantity * OI.Price) AS total_amount
FROM Orders O
JOIN Order_items OI
ON O.Order_id = OI.Order_id
GROUP BY O.Order_id
HAVING SUM(OI.Quantity * OI.Price) > 1000;

-- Q13: List the customers who have not placed any orders.
SELECT C.Customer_id,C.First_name,C.Last_name
FROM Customers C
LEFT JOIN Orders O ON C.Customer_id = O.Customer_id
WHERE O.Order_id IS NULL;