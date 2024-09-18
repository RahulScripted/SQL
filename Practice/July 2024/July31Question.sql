-- Books
-- 	Book_id			 Title				Author_id			Genre_id		Publication_year			Stock_quantity
-- 		1		The Great Gatsby			1					1				   1925						   10
-- 		2	  To Kill a Mockingbird			2					2				   1960							5
-- 		3			  1984					3					3				   1949							8
-- 		4		Pride and Prejudice			4					4				   1813							4
-- 		5	   The Catcher in the Rye		5					5				   1951							6

-- Authors
-- 		Author_id			First_name				Last_name
-- 			1				 F. Scott				Fitzgerald
-- 			2				  Harper					Lee
-- 			3				  George				   Orwell
-- 			4				   Jane				   	   Austen
-- 			5					J.D.				   Salinger

-- Genres
-- 		Genre_id			Genre_name
-- 			1				  Fiction
-- 			2				Historical
-- 			3				 Dystopian
-- 			4				  Romance
-- 			5				Coming of Age

-- Members
-- 		Member_id			First_name			Last_name			Date_of_birth			 City
-- 			1				   Alice			  Johnson			  1985-05-15		   New York
-- 			2					Bob				   Smith			  1990-07-20		  Los Angeles
-- 			3				   Charlie			   Brown			  1978-09-30			Chicago
-- 			4				    Diana			   Wilson			  1982-12-12			Houston
-- 			5					 Eve			   Davis			  1995-03-22			Phoenix

-- Borrowings
-- 		Borrowing_id		Book_id			Member_id		Borrow_date			Return_date
-- 			1					1				1			2024-07-01			2024-07-10
-- 			2					2				2			2024-07-02			2024-07-12
-- 			3					3				3			2024-07-03			2024-07-13
-- 			4					4				4			2024-07-04			2024-07-14
-- 			5					5				5			2024-07-05			2024-07-15
-- 			6					1				2			2024-07-10			2024-07-20
-- 			7					3				4			2024-07-11			2024-07-21

-- Questions
-- Q1: List all books along with their authors and genres.
-- Q2: Find the total number of books borrowed by each member.
-- Q3: Identify the books borrowed by each member along with the borrow and return dates.
-- Q4: List the names of members who have borrowed books in July 2024.
-- Q5: Get the average number of books borrowed by members.
-- Q6: Find the total stock quantity of each genre.
-- Q7: List the books that have been borrowed more than once.
-- Q8: Identify the member who has borrowed the most books.
-- Q9: Get the details of borrowings for books written by 'George Orwell'.
-- Q10: Calculate the total number of books borrowed in each genre.
-- Q11: List the members who have borrowed more than one book.
-- Q12: Find the books that have not been borrowed yet.
-- Q13: Identify the borrowings with a return date later than 2024-07-10.
-- Q14: Get the names and total number of borrowings for each member, sorted by total number of borrowings in descending order.
-- Q15: List the members who have not borrowed any books.



CREATE DATABASE IF NOT EXISTS July31Problem;
USE July31Problem;

CREATE TABLE Books(
	Book_id INT PRIMARY KEY,
    Title VARCHAR(150),
    Author_id INT,
    Genre_id INT,
    Publication_year INT,
    Stock_quantity INT
);

INSERT INTO Books
(Book_id,Title,Author_id,Genre_id,Publication_year,Stock_quantity)
VALUES
(1,"The Great Gatsby",1,1,1925,10),
(2,"To Kill a Mockingbird",2,2,1960,5),
(3,"1984",3,3,1949,8),
(4,"Pride and Prejudice",4,4,1813,4),
(5,"The Catcher in the Rye",5,5,1951,6);

CREATE TABLE Authors (
    Author_id INT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100)
);

INSERT INTO Authors
(Author_id, First_name, Last_name)
VALUES
(1, 'F. Scott', 'Fitzgerald'),
(2, 'Harper', 'Lee'),
(3, 'George', 'Orwell'),
(4, 'Jane', 'Austen'),
(5, 'J.D.', 'Salinger');

CREATE TABLE Genres (
    Genre_id INT PRIMARY KEY,
    Genre_name VARCHAR(100)
);

INSERT INTO Genres
(Genre_id, Genre_name)
VALUES
(1, 'Fiction'),
(2, 'Historical'),
(3, 'Dystopian'),
(4, 'Romance'),
(5, 'Coming of Age');

CREATE TABLE Members (
    Member_id INT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    Date_of_birth DATE,
    City VARCHAR(100)
);

INSERT INTO Members
(Member_id, First_name, Last_name, Date_of_birth, City)
VALUES
(1, 'Alice', 'Johnson', '1985-05-15', 'New York'),
(2, 'Bob', 'Smith', '1990-07-20', 'Los Angeles'),
(3, 'Charlie', 'Brown', '1978-09-30', 'Chicago'),
(4, 'Diana', 'Wilson', '1982-12-12', 'Houston'),
(5, 'Eve', 'Davis', '1995-03-22', 'Phoenix');

CREATE TABLE Borrowings (
    Borrowing_id INT PRIMARY KEY,
    Book_id INT,
    Member_id INT,
    Borrow_date DATE,
    Return_date DATE,
    FOREIGN KEY (Book_id) REFERENCES Books(Book_id),
    FOREIGN KEY (Member_id) REFERENCES Members(Member_id)
);

INSERT INTO Borrowings
(Borrowing_id, Book_id, Member_id, Borrow_date, Return_date)
VALUES
(1, 1, 1, '2024-07-01', '2024-07-10'),
(2, 2, 2, '2024-07-02', '2024-07-12'),
(3, 3, 3, '2024-07-03', '2024-07-13'),
(4, 4, 4, '2024-07-04', '2024-07-14'),
(5, 5, 5, '2024-07-05', '2024-07-15'),
(6, 1, 2, '2024-07-10', '2024-07-20'),
(7, 3, 4, '2024-07-11', '2024-07-21');


-- Answers

-- Q1: List all books along with their authors and genres.
SELECT  B.Book_id,B.Title,A.Author_id,A.First_name,A.Last_name,G.Genre_name
FROM Books B
LEFT JOIN Authors A ON B.Author_id = A.Author_id
LEFT JOIN Genres G ON G.Genre_id = B.Genre_id;

-- Q2: Find the total number of books borrowed by each member.
SELECT BW.Member_id,COUNT(DISTINCT BW.Book_id) AS borrowed_book
FROM Borrowings BW
GROUP BY BW.Member_id;

-- Q3: Identify the books borrowed by each member along with the borrow and return dates.
SELECT BW.Member_id,BW.Book_id,BW.Borrow_date,BW.Return_date
FROM Borrowings BW;

-- Q4: List the names of members who have borrowed books in July 2024.
SELECT M.Member_id,M.First_name,M.Last_name
FROM Members M
JOIN Borrowings BW ON M.Member_id = BW.Member_id
WHERE MONTH(BW.Borrow_date) = 7 AND YEAR(Borrow_date) = 2024;

-- Q5: Get the average number of books borrowed by members.
SELECT AVG(book_count) AS average_books_borrowed
FROM(
	SELECT Member_id,COUNT(Book_id) AS book_count
    FROM Borrowings
    GROUP BY Member_id
) AS subquery;

-- Q6: Find the total stock quantity of each genre.
SELECT G.Genre_name,SUM(B.Stock_quantity)
FROM Genres G
JOIN Books B ON B.Genre_id = G.Genre_id
GROUP BY G.Genre_name;

-- Q7: List the books that have been borrowed more than once.
SELECT  B.Book_id,B.Title,COUNT(BW.Book_id) AS BorrowedCount
FROM Books B
JOIN Borrowings BW ON B.Book_id = BW.Book_id
GROUP BY B.Book_id
HAVING COUNT(BW.Book_id) > 1;

-- Q8: Identify the member who has borrowed the most books.
SELECT M.Member_id,M.First_name,M.Last_name,COUNT(BW.Book_id) AS MostBook
FROM Members M
JOIN Borrowings BW ON M.Member_id = BW.Member_id
GROUP BY M.Member_id
ORDER BY COUNT(BW.Book_id) DESC
LIMIT 1;

-- Q9: Get the details of borrowings for books written by 'George Orwell'.
SELECT BW.Borrowing_id,BW.Book_id,BW.Member_id,BW.Borrow_date,BW.Return_date
FROM Borrowings BW
JOIN Books B ON B.Book_id = BW.Book_id
JOIN Authors A ON A.Author_id = B.Author_id
WHERE A.First_name LIKE '%George%' AND A.Last_name LIKE '%Orwell%';

-- Q10: Calculate the total number of books borrowed in each genre.
SELECT G.Genre_name,COUNT(BW.Book_id) AS TotalBorrowed
FROM Borrowings BW
JOIN Books B ON B.Book_id = BW.Book_id
JOIN Genres G ON B.Genre_id = G.Genre_id
GROUP BY G.Genre_name;

-- Q11: List the members who have borrowed more than one book.
SELECT  M.Member_id,M.First_name,M.Last_name,COUNT(BW.Book_id) AS BorrowedCount
FROM Members M
JOIN Borrowings BW ON M.Member_id = BW.Member_id
GROUP BY M.Member_id
HAVING COUNT(BW.Book_id) > 1;

-- Q12: Find the books that have not been borrowed yet.
SELECT  B.Book_id,B.Title
FROM Books B
LEFT JOIN Borrowings BW ON B.Book_id = BW.Book_id
WHERE BW.Book_id IS NULL;

-- Q13: Identify the borrowings with a return date later than 2024-07-10.
SELECT BW.Borrowing_id,BW.Book_id,BW.Member_id,BW.Borrow_date,BW.Return_date
FROM Borrowings BW
WHERE BW.Return_date > '2024-07-10';

-- Q14: Get the names and total number of borrowings for each member, sorted by total number of borrowings in descending order.
SELECT M.Member_id,M.First_name,M.Last_name,COUNT(BW.Book_id) AS MostBook
FROM Members M
JOIN Borrowings BW ON M.Member_id = BW.Member_id
GROUP BY M.Member_id
ORDER BY COUNT(BW.Book_id) DESC;

-- Q15: List the members who have not borrowed any books.
SELECT M.Member_id,M.First_name,M.Last_name,BW.Book_id
FROM Members M
LEFT JOIN Borrowings BW ON M.Member_id = BW.Member_id
WHERE BW.Book_id IS NULL;