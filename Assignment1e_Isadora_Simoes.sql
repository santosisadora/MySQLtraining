/*
Name : Isadora Simoes de Azevedo
Purpose: To create a database with a table therein that stores information about marks obtained by students enrolled in various courses.  
Retrieve information from the table tbl_grade_center using advanced SELECT statements.
*/
-- set the environment - DO NOT COMMENT THE SET statements. If your code does not work, figure out another solution:)
SET SQL_MODE = "STRICT_ALL_TABLES";
SET SQL_MODE = "ONLY_FULL_GROUP_BY";

-- drop existing database, if any. Recreate one by same name and use it.
DROP DATABASE IF EXISTS db_grade_center;
CREATE DATABASE db_grade_center;
USE db_grade_center;

-- create the table structure to store information
CREATE TABLE tbl_grade_center
    (
      first_name  		VARCHAR(30) NOT NULL,
      last_name   		VARCHAR(30) NOT NULL,
      student_number 	CHAR(10) NOT NULL,
      course_code      	CHAR(8) NOT NULL,
      grade       		TINYINT UNSIGNED NOT NULL DEFAULT 0,
      
       PRIMARY KEY(student_number, course_code)
    );

-- decribe the table structure
DESC tbl_grade_center;

-- insert records in the table
INSERT INTO tbl_grade_center VALUES ('Phineas', 'Flynn', '1234510001','COMP2003', 88);
INSERT INTO tbl_grade_center VALUES ('Ferb', 'Fletcher', '1234510002','COMP2003', 100);
INSERT INTO tbl_grade_center VALUES ('Candace','Fletcher', '1234510003','COMP2003', 60);
INSERT INTO tbl_grade_center VALUES ('Baljeet', 'Singh', '1234510004','COMP2003', 100);
INSERT INTO tbl_grade_center VALUES ('Major', 'Monogram ', '1234510005','COMP2003', 50);
INSERT INTO tbl_grade_center VALUES ('Dr.', 'Doofenshmirtz', '1234510006','COMP2003', 55);
INSERT INTO tbl_grade_center VALUES ('Isabella', 'Garcia-Shapiro', '1234510007','COMP2003', 90);
INSERT INTO tbl_grade_center VALUES ('Phineas', 'Flynn', '1234510001','COMP2007', 79);
INSERT INTO tbl_grade_center VALUES ('Ferb', 'Fletcher', '1234510002','COMP2007', 99);
INSERT INTO tbl_grade_center VALUES ('Candace', 'Fletcher', '1234510003','COMP2007', 72);
INSERT INTO tbl_grade_center VALUES ('Baljeet', 'Singh', '1234510004','COMP2007', 98);
INSERT INTO tbl_grade_center VALUES ('Major', 'Monogram ', '1234510005','COMP2007', 68);
INSERT INTO tbl_grade_center VALUES ('Dr.', 'Doofenshmirtz', '1234510006','COMP2007', 78);
INSERT INTO tbl_grade_center VALUES ('Isabella', 'Garcia-Shapiro', '1234510007','COMP2007', 88);
INSERT INTO tbl_grade_center VALUES ('Anju', 'Chawla', '1234567890','COMP2003', 88);

-- show the description of the table
DESC tbl_grade_center;
-- show all records of the table
SELECT * FROM tbl_grade_center;

-- 1)	The course code and the maximum grade achieved in the course, for all courses. Sort the result on the course code in ascending order.
SELECT course_code 'Course' , MAX(grade) 'Maximum Grade in this course'
FROM tbl_grade_center
GROUP BY course_code
ORDER BY course_code;

-- show all records of the table
SELECT * FROM tbl_grade_center;

-- 2)	The course code and the number of students (how many) enrolled in the course, only for courses that have 5 or more students. 
--      Sort the result in descending order on the number of students in the course.
SELECT course_code 'Course', COUNT(first_name) 'Nº of Registered Students in the Course'
FROM tbl_grade_center
GROUP BY course_code
HAVING count(*) > 5
ORDER BY 2 DESC;

-- show all records of the table
SELECT * FROM tbl_grade_center;

-- 3)	The student number of all student(s) who is/are only enrolled in one course.
SELECT COUNT(course_code) 'Course'
FROM tbl_grade_center
HAVING count(*) =1
ORDER BY first_name ASC;

-- show all records of the table
SELECT * FROM tbl_grade_center;

-- 4)	For all courses, display the course code and the average mark in the course, rounded to an integer. For example, 90.6 will round to 91 
--      and 82.4 will round to 82 
SELECT course_code 'Course',ROUND(AVG(grade)) 'Average Mark in this Course'
FROM tbl_grade_center
GROUP BY course_code
ORDER BY course_code;

-- show all records of the table
SELECT * FROM tbl_grade_center;

-- 5)	List the student records (no repetitions please) displaying student number, full name (first name followed by last name, separated by a blank), 
--      that have a grade in the range 90 to 100, limits inclusive. Display the result in descending order of student number.
SELECT CONCAT(first_name,' ', last_name) 'Students with grade range 90 to 100',student_number 'Student Number', grade 'Mark'
FROM tbl_grade_center
WHERE grade >=90 AND grade <=100
ORDER BY student_number DESC;

-- show all records of the table
SELECT * FROM tbl_grade_center;


-- 6) Display the lowest grade and number of students that have achieved the lowest grade in COMP 2007. The column heading should be clear and complete, 
--    showing the course code too. No peeking in the table data to ‘look up’ the lowest grade. Hint: First, find the lowest grade in the course using an 
--    aggregate function and then use this value to find the number of students who scored the lowest grade.
SELECT MIN(grade) FROM tbl_grade_center WHERE course_code = 'COMP2007';

SELECT student_number 'Student with lowest grade in COMP2007', grade 'Mark'
FROM tbl_grade_center
WHERE grade =68;


-- show all records of the table
SELECT * FROM tbl_grade_center;


-- 7) Display information of all students who have achieved the highest grade scored in COMP2003 - the full name (first name followed by last name, 
--    separated by a blank) and grade. Display the records in ascending order of student number. No peeking in the table data to ‘look up’ the highest grade. 
--    Hint: First, find the highest grade using an aggregate function and then use it to display the records of the students who scored the highest grade.
SELECT MAX(grade) FROM tbl_grade_center WHERE course_code = 'COMP2003';

SELECT CONCAT(first_name,' ', last_name) 'Students with highest grade possible in COMP2003', student_number 'Student Number', grade 'Mark'
FROM tbl_grade_center
WHERE grade = 100
ORDER BY student_number ASC;

-- show all records of the table
SELECT * FROM tbl_grade_center;

-- 8)	List all the course codes (no repetitions please), where in a student has scored a grade of 100. Display the result in ascending order of course code.
SELECT course_code 'Course', MAX(grade) ' Maximum Grade gotten by a student in this course' 
FROM tbl_grade_center WHERE course_code = 'COMP2003' OR 'COMP2007'
GROUP BY course_code
ORDER BY course_code ASC;

-- show all records of the table
SELECT * FROM tbl_grade_center;

