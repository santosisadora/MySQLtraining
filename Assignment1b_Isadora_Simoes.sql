/*
Name(s): Isadora Simoes de Azevedo Silva Santos
Date: 02-10-2020
Purpose: Create a database and a table to store student information. Populate the table with data records.
Select data from the table using different criteria.
*/
-- set the environment variables
SET SQL_MODE = "STRICT_ALL_TABLES";


-- drop the database if it exists
DROP DATABASE IF EXISTS georgian_college;
-- create a database 
CREATE DATABASE georgian_college ;
-- use the database
USE georgian_college;


--  create a table structure- the fields and their type, to store student information
CREATE TABLE student_information  
(
-- the identification number of the student
student_id			CHAR(10) PRIMARY KEY, 					        -- unique in every record, cannot have a null value 
-- the name of the student
student_name		VARCHAR(40) NOT NULL,					        -- cannot have a null value
-- the email of the student
student_email		VARCHAR(40) UNIQUE NOT NULL,			        -- unique in every record, cannot be null
-- the data of birth of the student
date_of_birth		DATE NOT NULL,							        -- cannot contain a null value
-- the age of the student
age					TINYINT UNSIGNED,						        -- default value is NULL
-- the semester fee the student has paid
semester_fee		DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT 3000, 	-- valid values are 0 to 9999.99, default value is 3000, cannot be null
-- is the student a domestic student
domestic_student	ENUM('Yes','No','Y','N') NOT NULL DEFAULT 'Yes' -- valid values are listed in the list, default value is Yes, cannot be null
);

-- display the structure of the table
DESC student_information;

-- insert records/rows in the table

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES
('1234567890', 'Anju Chawla', 'anju.chawla@georgiancollege.ca', '1998-10-10', 21, 9400.25,'No');


INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('2345678901', 'Ross Bigelow', 'ross.bigelow@georgiancollege.ca', '1995-12-11', 24, 2050,'Yes' );


INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('3456789012', 'Rich Freeman', 'rich.freeman@georgiancollege.ca',  '1990-02-11', 30, 3200, 'Yes' );


INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('4567890123', 'Jaret Wright', 'jaret.wright@georgiancollege.ca', '1992-01-21', 28, 3400.50, 'Yes' );


INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('5678901234', 'Mike O\'Connor', 'mico@gmail.com', '2000-06-25', 20, 9000,'No' );

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('6789012345', 'Wayne Brown', 'wayne.brown@georgiancollege.ca', '1995-12-25', 24, 8000.95,'No' );

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('7890123456','Ian McWilliam', 'Ian.McWilliam@georgiancollege.ca', '1995-12-11', 24, 2200.50,'Yes' );


INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('8901234567','Scott McCrindle', 'scott.mccrindle@georgiancollege.ca', '1994-10-10', 25, 1200,'Yes' );



INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age)
VALUES 
('9012345678', 'Ryan Smith', 'Ryan.Smith@hotmail.com', '1985-02-11', 45);

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee)
VALUES 
('1234567891', 'Bob Cooper', 'Bob.Cooper@gmail.com', '1995-12-11', 24, 2290 );

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('2345678911', 'Susan Hunter', 'Susan.Hunter@georgiancollege.ca', '1995-12-11', 24, 3000,'Yes' );

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth,  semester_fee, domestic_student)
VALUES 
('2345678996', 'Romeo Rodrigo', 'romeo@gmail.com', '1995-12-11', 3500.75, DEFAULT);

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES 
('2345678995', 'Sam Chawla', 'Sam_Chawla@hotmail.com', '1995-12-11', null, default, default);

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth)
VALUES 
('9012345679', 'Jo Jackson', 'jojo@hotmail.com', '1980-02-11');

INSERT INTO student_information(student_id, student_name, student_email, date_of_birth, age, semester_fee, domestic_student)
VALUES
('2234567890', 'Tom Pointon', 'Tom.Pointon@gmail.com', '1965-01-25', 55, 9000,'No');

-- example of commenting expectation of SELECT statement
-- display all information of all students
-- Criteria satisfied - 0, 100, ... fake :)
SELECT * FROM student_information;

-- Select student name and age where age is different from 24 
SELECT student_name, age
FROM student_information
WHERE age <> 24;

-- Select student email and the age, with age >=50
SELECT student_email , age
FROM student_information
WHERE age >= 50;

-- Select students with semester fees between 2000 and 5000
SELECT * 
FROM student_information
WHERE NOT semester_fee < 2000 AND NOT semester_fee > 5000 ;

-- Find the students with semester fee more than 5000, younger than 20 years old or domestic student
SELECT semester_fee, age, domestic_student
FROM student_information
WHERE semester_fee>5000 OR age>=20 OR domestic_student='yes';

-- Select students with names between A and K
SELECT * 
FROM student_information
WHERE student_name BETWEEN 'A' AND 'K';

-- use a string function
SELECT * 
FROM student_information
WHERE LEFT(student_name,1) BETWEEN 'A' AND 'K';

-- Select students that do not have %Mc% in their names
SELECT * FROM student_information
WHERE student_name NOT LIKE '%Mc%';

-- Select students with names that do not have a single character followed by 'er'
SELECT * FROM student_information
WHERE TRIM(student_name) NOT LIKE '_er%';

-- Select all students with a name that has a single character followed by pple; the wildcard character _ stands for one character
SELECT * FROM student_information
WHERE student_email LIKE '%_@georgiancollege.ca';

-- Select students with semester fees less than 7000
SELECT * FROM student_information
WHERE semester_fee <=7000;

-- Select students that are domestic and international
SELECT domestic_student FROM student_information 
WHERE domestic_student IN ('yes','no');

-- Select students born in '1998-10-10'
SELECT student_name, date_of_birth
FROM student_information
WHERE date_of_birth = CAST('1998-10-10' AS DATE);

-- Display students age in descending order
SELECT *
FROM student_information
ORDER BY age DESC;

-- Select students with age 'NULL'
SELECT * 
FROM student_information
WHERE age IS NULL; 

-- Select students born after 1964 AND that are domestic. Display in ascending order by age
SELECT student_name, date_of_birth, domestic_student
FROM student_information
WHERE date_of_birth >= CAST( '1964-12-31' AS DATE) AND domestic_student IN( 'yes')
ORDER BY age ASC;

-- Select the first 5 records of the table
SELECT * 
FROM student_information
LIMIT 0,5; 

-- Select the first 7 records of the table, except the first ( display 7 records starting from the second record)
SELECT * 
FROM student_information
LIMIT 1,7; 

-- Display records with all fields of the table
SELECT *
FROM student_information;

-- Display only student names and student id fields of the table
SELECT student_name, student_id 
FROM student_information;