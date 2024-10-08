-- Find the Minimum and the Maximum marks scored by the students in the department 'Science'. Rename the respective column headers as 'min_marks' and 'max_marks' respectively. Output these marks on separate lines.




SELECT MIN(Marks) AS min_marks   
FROM student
WHERE Department = "Science";

SELECT MAX(Marks) AS max_marks  
FROM student
WHERE Department = "Science";