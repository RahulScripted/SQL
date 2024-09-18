-- Table: books
-- book_id (INT, Primary Key): Unique identifier for each book.
-- title (VARCHAR(255)): Title of the book.
-- author (VARCHAR(255)): Author's name.
-- genre (VARCHAR(50)): Genre of the book (e.g., Fiction, Non-Fiction, History).
-- publication_year (INT): Year the book was published.
-- Sample Data:

-- 		book_id				title					  author				    genre					publication_year
-- 		   1		To Kill a Mockingbird			Harper Lee				   Fiction						 1960
-- 		   2		A Brief History of Time		  Stephen Hawking			  Non-Fiction					 1988
-- 		   3		 The Lord of the Rings		   J.R.R. Tolkien			    Fantasy						 1954
-- 		   4		  Pride and Prejudice			Jane Austen					Fiction						 1813
-- 		   5	  	The Hitchhiker's Guide			Douglas Adams			Science Fiction					 1979
-- 		   6		The Catcher in the Rye			J.D. Salinger			     Fiction					 1951
-- 		   7	 One Hundred Years of Solitude	Gabriel Garcia Marquez		Magical Realism					 1967
-- 		   8	         Frankenstein				Mary Shelley			 Gothic Fiction					 1818


-- Q1.  Write the SQL statement to create the books table with the specified columns and data types.
-- Q2.	Write a query to display the titles of all fiction books along with their authors.
-- Q3.	How can you count the number of books in each genre?
-- Q4.	Imagine the library wants to add a new column available (BOOLEAN) to indicate if a book is currently available for borrowing. How would you modify the table structure to include this new column?
-- Q5.	Print the oldest book in the library.
-- Q6.	Print all the books written by a specific author (e.g., J.R.R. Tolkien).
-- Q7.	Display the titles of all books with a publication year between 1900 and 1990 (inclusive).
-- Q8.	Sort the books alphabetically by title.
-- Q9.	Find the most popular genre (genre with the most books).
-- Q10.	Update the genre of a specific book (e.g., change "Science Fiction" to "Comedy" for book ID 5).
-- Q11.	Delete a book from the table (e.g., by book ID).
-- Q12.	Show only the first 3 books from the table. 
-- Q13.	Search for books that contain a specific keyword in the title (e.g., "history")
-- Q14.	Calculate the average publication year for all the books.


CREATE DATABASE IF NOT EXISTS Books_Information;
USE Books_Information;

-- Q1.  Write the SQL statement to create the books table with the specified columns and data types.
CREATE TABLE Books_info(
	Book_id INT PRIMARY KEY,
    Title VARCHAR(90),
    Author VARCHAR(50),
    Genre VARCHAR(50),
    Publication_year INT
);

INSERT INTO Books_info
(Book_id,Title,Author,Genre,Publication_year)
VALUES
(1,"To Kill a Mockingbird","Harper Lee","Fiction",1960),
(2,"A Brief History of Time","Stephen Hawking","Non-Fiction",1988),
(3,"The Lord of the Rings","J.R.R. Tolkien","Fantasy",1954),
(4,"Pride and Prejudice","Jane Austen","Fiction",1813),
(5,"The Hitchhiker's Guide","Douglas Adams","Science Fiction",1979),
(6,"The Catcher in the Rye","J.D. Salinger","Fiction",1951),
(7,"One Hundred Years of Solitude","Gabriel Garcia Marquez","Magical Realism",1967),
(8,"Frankenstein","Mary Shelley","Gothic Fiction",1818);

-- Q2.	Write a query to display the titles of all fiction books along with their authors.
SELECT Title,Author FROM Books_info WHERE Genre = "Fiction";

-- Q3.	How can you count the number of books in each genre? (Hint: Use a GROUP BY clause)
SELECT COUNT(Book_id) FROM Books_info GROUP BY Genre;

-- Q4.	Imagine the library wants to add a new column available (BOOLEAN) to indicate if a book is currently available for borrowing. How would you modify the table structure to include this new column?
ALTER TABLE Books_info ADD (Available BOOLEAN);
SELECT * FROM  Books_info;

-- Q5.	Print the oldest book in the library.
SELECT MIN(Publication_year) AS Oldest_book FROM Books_info;

-- Q6.	Print all the books written by a specific author (e.g., J.R.R. Tolkien).
SELECT Title FROM Books_info WHERE Author = "J.R.R. Tolkien";

-- Q7.	Display the titles of all books with a publication year between 1900 and 1990 (inclusive).
SELECT Title FROM Books_info WHERE Publication_year between 1900 and 1990;

-- Q8.	Sort the books alphabetically by title.
SELECT Title FROM Books_info ORDER BY Title ASC;

-- Q9.	Find the most popular genre (genre with the most books).
SELECT Genre FROM Books_info
GROUP BY Genre 
HAVING COUNT(*) = 
(SELECT MAX(Genre_COUNT) FROM 
(SELECT Genre, COUNT(*) AS Genre_COUNT
FROM Books_info
GROUP BY Genre)
AS SUBQUERY);

-- Q10.	Update the genre of a specific book (e.g., change "Science Fiction" to "Comedy" for book ID 5).
UPDATE Books_info SET Genre = "Comedy" WHERE Book_id = 5;
SELECT * FROM  Books_info;

-- Q11.	Delete a book from the table (e.g., by book ID).
DELETE Books_info FROM  Books_info WHERE Book_id = 5;
SELECT * FROM  Books_info;

-- Q12.	Show only the first 3 books from the table. 
SELECT * FROM Books_info LIMIT 3;

-- Q13.	Search for books that contain a specific keyword in the title (e.g., "history")
SELECT * FROM Books_info WHERE Title LIKE '%History%';

-- Q14.	Calculate the average publication year for all the books.
SELECT AVG(Publication_year) FROM Books_info;