-- Customers
-- 		Customer_id			First_name			Last_name			Email			Join_date
-- 			1				  Alice	       		 Johnson	alice@example.com		2022-01-15
-- 			2				   Bob				  Smith		  bob@example.com		2021-07-22
-- 			3				 Charlie			  Brown		charlie@example.com		2020-11-30
-- 			4				  Diana				 Wilson		 diana@example.com		2019-03-18
-- 			5				   Eve				  Davis		 eve@example.com		2021-05-05

-- Products
-- 		Product_id			Product_name			Category			Price			Stock_quantity
-- 			1				Smartphone			   Electronics			699.00				50
-- 			2				  Laptop			   Electronics			999.00				30
-- 			3			   Office Chair				Furniture			199.00				100
-- 			4			   Water Bottle				 Kitchen			29.00				200
-- 			5				 Notebook				Stationery			 5.00				500

-- Orders
-- 		Order_id			Customer_id			Order_date			Total_amount
-- 			1					1				2023-01-15			  728.00
-- 			2					2				2023-02-20			 1024.00
-- 			3					3				2023-03-05			  204.00
-- 			4					4				2023-04-10			   58.00
-- 			5					5				2023-05-25			  104.00

-- OrderItems
-- 		Order_item_id			Order_id			Product_id			Quantity			Price
-- 			1						1					1					1				699.00
-- 			2						1					4					1				 29.00
-- 			3						2					2					1				999.00
-- 			4						2					5					5				 25.00
-- 			5						3					3					1				199.00
-- 			6						3					4					1				  5.00
-- 			7						4					4					2				 29.00
-- 			8						5					5					2				  5.00
-- 			9						5					1					1				 99.00

-- Questions
-- Q1: List all customers along with their email and join date.
-- Q2: Find the total number of orders placed by each customer.
-- Q3: Identify the products that have been ordered more than 100 times.
-- Q4: List all orders along with the total amount spent by each customer.
-- Q5: Get the details of orders that include the product "Smartphone".
-- Q6: Calculate the total revenue generated from each product category.
-- Q7: Find the customers who have placed orders in 2023.
-- Q8: List the products that are out of stock.
-- Q9: Identify the top 3 customers based on the total amount spent.
-- Q10: Calculate the average order value for each customer.
-- Q11: Find the most popular product category based on the number of orders.
-- Q12: List the customers who have never placed an order.
-- Q13: Get the details of the most expensive order.



CREATE DATABASE IF NOT EXISTS August05Problem;
USE August05Problem;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE
);

INSERT INTO Customers (customer_id, first_name, last_name, email, join_date)
VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', '2022-01-15'),
(2, 'Bob', 'Smith', 'bob@example.com', '2021-07-22'),
(3, 'Charlie', 'Brown', 'charlie@example.com', '2020-11-30'),
(4, 'Diana', 'Wilson', 'diana@example.com', '2019-03-18'),
(5, 'Eve', 'Davis', 'eve@example.com', '2021-05-05');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO Products (product_id, product_name, category, price, stock_quantity)
VALUES
(1, 'Smartphone', 'Electronics', 699.00, 50),
(2, 'Laptop', 'Electronics', 999.00, 30),
(3, 'Office Chair', 'Furniture', 199.00, 100),
(4, 'Water Bottle', 'Kitchen', 29.00, 200),
(5, 'Notebook', 'Stationery', 5.00, 500);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2023-01-15', 728.00),
(2, 2, '2023-02-20', 1024.00),
(3, 3, '2023-03-05', 204.00),
(4, 4, '2023-04-10', 58.00),
(5, 5, '2023-05-25', 104.00);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 1, 699.00),
(2, 1, 4, 1, 29.00),
(3, 2, 2, 1, 999.00),
(4, 2, 5, 5, 25.00),
(5, 3, 3, 1, 199.00),
(6, 3, 4, 1, 5.00),
(7, 4, 4, 2, 29.00),
(8, 5, 5, 2, 5.00),
(9, 5, 1, 1, 99.00);


-- Answers

-- Q1: List all customers along with their email and join date.
SELECT customer_id, first_name, last_name, email, join_date
FROM Customers;

-- Q2: Find the total number of orders placed by each customer.
SELECT C.customer_id, C.first_name, C.last_name,COUNT(O.order_id) AS total_number
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name;

-- Q3: Identify the products that have been ordered more than 100 times.
SELECT P.product_id, P.product_name, P.category,COUNT(OI.product_id) AS ordered
FROM Products P
LEFT JOIN OrderItems OI ON P.product_id = OI.product_id
GROUP BY P.product_id
HAVING COUNT(OI.product_id) > 100;

-- Q4: List all orders along with the total amount spent by each customer.
SELECT O.order_id, O.customer_id, C.first_name, C.last_name, O.order_date, O.total_amount
FROM Orders O
JOIN Customers C ON C.customer_id = O.customer_id;

-- Q5: Get the details of orders that include the product "Smartphone".
SELECT O.order_id, O.customer_id,C.first_name, C.last_name
FROM Orders O
LEFT JOIN Customers C ON C.customer_id = O.customer_id
LEFT JOIN OrderItems OI ON O.order_id = OI.order_id
LEFT JOIN Products P ON P.product_id = OI.product_id
WHERE P.Product_name = 'Smartphone';

-- Q6: Calculate the total revenue generated from each product category.
SELECT P.category, SUM(OI.quantity * OI.price) AS total_revenue
FROM Products P
JOIN OrderItems OI ON P.product_id = OI.product_id
GROUP BY P.category;

-- Q7: Find the customers who have placed orders in 2023.
SELECT C.customer_id, C.first_name, C.last_name
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id
WHERE YEAR(Order_date) = 2023;

-- Q8: List the products that are out of stock.
SELECT P.product_id, P.product_name, P.category
FROM Products P
WHERE P.Stock_quantity = 0;

-- Q9: Identify the top 3 customers based on the total amount spent.
SELECT C.customer_id, C.first_name, C.last_name, SUM(O.total_amount) AS total_spent
FROM Orders O
JOIN Customers C ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
ORDER BY total_spent DESC
LIMIT 3;

-- Q10: Calculate the average order value for each customer.
SELECT C.customer_id, C.first_name, C.last_name, ROUND(AVG(O.total_amount),2) AS average_order_value
FROM Orders O
JOIN Customers C ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name;

-- Q11: Find the most popular product category based on the number of orders.
SELECT P.product_id, P.product_name,P.category,COUNT(OI.order_id) AS number_of_orders
FROM Products P
LEFT JOIN OrderItems OI ON P.product_id = OI.product_id
GROUP BY P.product_id, P.product_name,P.category
ORDER BY number_of_orders DESC
LIMIT 1;

-- Q12: List the customers who have never placed an order.
SELECT C.customer_id, C.first_name, C.last_name
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
HAVING COUNT(O.order_id) = 0; 

-- Q13: Get the details of the most expensive order.
WITH MaxOrderAmount AS (
    SELECT MAX(total_amount) AS max_amount
    FROM Orders
)
SELECT O.order_id, O.customer_id, O.order_date, O.total_amount
FROM Orders O
JOIN MaxOrderAmount MO ON O.total_amount = MO.max_amount;