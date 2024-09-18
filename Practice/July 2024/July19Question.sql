-- Books
-- 	Book_id			 Title				Author_id			Genre_id		Publication_year
-- 		1		The Great Gatsby			1					1				   1925
-- 		2		To Kill a Mockingbird		2					2				   1960
-- 		3			  1984					3					3				   1949
-- 		4		Pride and Prejudice			4					4				   1813
-- 		5	   The Catcher in the Rye		5					5				   1951

-- Authors
-- 	Author_id		First_name		 Last_name
-- 		1			 F. Scott		Fitzgerald
-- 		2			  Harper			Lee
-- 		3			  George		   Orwell
-- 		4			   Jane			   Austen
-- 		5			   J.D.			  Salinger

-- Genres
-- 	Genre_id		Genre_name
-- 		1			  Fiction
-- 		2			   Drama
-- 		3			 Dystopian
-- 		4			  Romance
-- 		5		   Coming-of-Age

-- Loans
-- 	Loan_id		Book_id			Member_id		Loan_date		Return_date
-- 		1			1				101			2024-01-15		2024-02-15
-- 		2			3				102			2024-03-01		2024-03-15
-- 		3			2				103			2024-04-10		2024-04-20
-- 		4			5				101			2024-05-18		2024-06-18
-- 		5			4				104			2024-06-20		2024-07-20

-- Members
-- 	Member_id		  First_name		Last_name
-- 		101				Alice			 Johnson
-- 		102				 Bob			  Smith
-- 		103			    Charlie			  Davis
-- 		104				Diana			  Wilson


-- Questions
-- Q1: List all books along with their author names.
-- Q2: Find the total number of loans each member has made.
-- Q3: Identify the books loaned by each member.
-- Q4: List the names of members who have loaned books in January 2024.
-- Q5: Get the average publication year of books for each genre.
-- Q6: Find the total number of books for each genre.
-- Q7: List the books that were published before 1950.
-- Q8: Identify the genre with the highest number of books.
-- Q9: Get the details of members who have loaned 'The Great Gatsby'.
-- Q10: Calculate the total number of days each member has borrowed books.
-- Q11: List all genres and the number of books in each genre.
-- Q12: Identify the members who have loaned both '1984' and 'Pride and Prejudice'.
-- Q13: Find the books written by 'George Orwell'.
-- Q14:  Get the titles and publication years of books for each genre, sorted by genre name and then by title.
-- Q15: List the members who have not loaned any books.



CREATE DATABASE IF NOT EXISTS July19thProblem;
USE July19thProblem;

CREATE TABLE Books(
	Book_id INT PRIMARY KEY,
    Title VARCHAR(60),
    Author_id INT,
    Genre_id INT,
    Publication_year INT
);

INSERT INTO Books
(Book_id,Title,Author_id,Genre_id,Publication_year)
VALUES
(1,"The Great Gatsby",1,1,1925),
(2,"To Kill a Mockingbird",2,2,1960),
(3,"1984",3,3,1949),
(4,"Pride and Prejudice",4,4,1813),
(5,"The Catcher in the Rye",5,5,1951);

CREATE TABLE Authors(
	Author_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50)
);

INSERT INTO Authors
(Author_id,First_name,Last_name)
VALUES
(1,"F. Scott","Fitzgerald"),
(2,"Harper","Lee"),
(3,"George","Orwell"),
(4,"Jane","Jane"),
(5,"J.D.","Salinger");

CREATE TABLE Genres(
	Genre_id INT PRIMARY KEY,
    Genre_name VARCHAR(50)
);

INSERT INTO Genres
(Genre_id,Genre_name)
VALUES
(1,"Fiction"),
(2,"Drama"),
(3,"Dystopian"),
(4,"Romance"),
(5,"Coming-of-Age");

CREATE TABLE Loans(
	Loan_id INT PRIMARY KEY,
    Book_id INT,
    Member_id INT,
    Loan_date DATE,
    Return_date DATE
);

INSERT INTO Loans
(Loan_id,Book_id,Member_id,Loan_date,Return_date)
VALUES
(1,1,101,"2024-01-15","2024-02-15"),
(2,3,102,"2024-03-01","2024-03-15"),
(3,2,103,"2024-04-10","2024-04-20"),
(4,5,101,"2024-05-18","2024-06-18"),
(5,4,104,"2024-06-20","2024-07-20");

CREATE TABLE Members(
	Member_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50)
);

INSERT INTO Members
(Member_id,First_name,Last_name)
VALUES
(101,"Alice","Johnson"),
(102,"Bob","Smith"),
(103,"Charlie","Davis"),
(104,"Diana","Wilson");


-- Q1: List all books along with their author names.
SELECT B.Book_id,B.Title,A.First_name,A.Last_name
FROM Books B
JOIN Authors A
ON B.Author_id = A.Author_id;

-- Q2: Find the total number of loans each member has made.
SELECT M.Member_id,M.First_name,M.Last_name,COUNT(L.Loan_id)
FROM Members M
JOIN Loans L
ON M.Member_id = L.Member_id
GROUP BY M.Member_id,M.First_name;

-- Q3: Identify the books loaned by each member.
SELECT B.Book_id,B.Title,M.First_name,M.Last_name
FROM Books B
JOIN Loans L
ON B.Book_id = L.Book_id
JOIN Members M
ON L.Member_id = M.Member_id;

-- Q4: List the names of members who have loaned books in January 2024.
SELECT M.Member_id,M.First_name,M.Last_name
FROM Members M
JOIN Loans L
ON M.Member_id = L.Member_id
WHERE MONTH(L.Loan_date) = '01' AND YEAR(L.Loan_date) = '2024';

-- Q5: Get the average publication year of books for each genre.
SELECT G.Genre_name,AVG(B.Publication_year)
FROM Books B
JOIN Genres G
ON B.Genre_id = G.Genre_id
GROUP BY G.Genre_id;

-- Q6: Find the total number of books for each genre.
SELECT G.Genre_name,COUNT(B.Book_id) AS totalNumberOfBooks 
FROM Genres G
JOIN Books B
ON G.Genre_id = B.Genre_id
GROUP BY G.Genre_id;

-- Q7: List the books that were published before 1950.
SELECT B.Book_id,B.Title
FROM Books B
WHERE B.Publication_year < 1950;

-- Q8: Identify the genre with the highest number of books.
SELECT G.Genre_name,COUNT(B.Book_id) AS HighestNumber
FROM Genres G
JOIN Books B
ON G.Genre_id = B.Genre_id
GROUP BY G.Genre_id
ORDER BY HighestNumber DESC
LIMIT 1;

-- Q9: Get the details of members who have loaned 'The Great Gatsby'.
SELECT M.Member_id,M.First_name,M.Last_name,B.Title
FROM Members M
JOIN Loans L
ON M.Member_id = L.Member_id
JOIN Books B
ON L.Book_id = B.Book_id
WHERE B.Title = 'The Great Gatsby';

-- Q10: Calculate the total number of days each member has borrowed books.
SELECT M.Member_id,M.First_name,M.Last_name,SUM(DATEDIFF(L.Return_date,L.Loan_date)) AS TotalNumberOfDays
FROM Members M
JOIN Loans L
ON M.Member_id = L.Member_id
GROUP BY M.Member_id,M.First_name,M.Last_name;

-- Q11: List all genres and the number of books in each genre.
SELECT G.Genre_name,G.Genre_id,COUNT(B.Book_id)
FROM Genres G
JOIN Books B
ON G.Genre_id = B.Genre_id
GROUP BY G.Genre_id;

-- Q12: Identify the members who have loaned both '1984' and 'Pride and Prejudice'.
SELECT M.Member_id, M.First_name, M.Last_name
FROM Members M
JOIN Loans L1 ON M.Member_id = L1.Member_id
JOIN Books B1 ON L1.Book_id = B1.Book_id
JOIN Loans L2 ON M.Member_id = L2.Member_id
JOIN Books B2 ON L2.Book_id = B2.Book_id
WHERE B1.Title = '1984' AND B2.Title = 'Pride and Prejudice'
GROUP BY M.Member_id, M.First_name, M.Last_name;

-- Q13: Find the books written by 'George Orwell'.
SELECT A.First_name,A.Last_name,B.Title
FROM Authors A
JOIN Books B
ON A.Author_id = B.Author_id
WHERE A.First_name = 'George' AND A.Last_name = 'Orwell';

-- Q14:  Get the titles and publication years of books for each genre, sorted by genre name and then by title.
SELECT B.Title,B.Publication_year
FROM Books B
JOIN Genres G
ON B.Genre_id = G.Genre_id
ORDER BY G.Genre_name,B.Title;

-- Q15: List the members who have not loaned any books.
SELECT M.Member_id,M.First_name,M.Last_name
FROM Members M
LEFT JOIN Loans L
ON M.Member_id = L.Member_id
WHERE L.Member_id IS NULL;