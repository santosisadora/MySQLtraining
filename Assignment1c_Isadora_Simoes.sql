/*
Name(s): Isadora Simoes de Azevedo Silva Santos
Date: Oct 8, 2020
Purpose: Update and delete statements in a database and table that stores student information.
*/
-- set the environment variables
SET SQL_MODE = "STRICT_ALL_TABLES";

#set the environment variables so is possible to update statements in the table
SET SQL_SAFE_UPDATES = 0 ;


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
student_email		VARCHAR(42) UNIQUE NOT NULL,			        -- unique in every record, cannot be null
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

-- display all information of all students
SELECT * FROM student_information;

#1.UPDATE one column in a single record using the primary key
#Update a student id to a new number.
UPDATE student_information
SET student_id = 01234567890
WHERE student_id =  1234567890 ; 

#2.Only one column is updated in some, but not all, records
#Update semester fee for students who pay 3000 or less
UPDATE student_information
SET semester_fee = semester_fee + 500
WHERE semester_fee <= 3000;

#3.One update statement only to set more than one column/field in a single record without using the primary key. Think of a field, other than the primary key field which you can use that will only update a single record
#Update semester fee and set the student to domestic - because he became a canadian citizen, by using the student's birth date
UPDATE student_information
SET semester_fee = semester_fee - 500,
domestic_student = 'yes'
WHERE date_of_birth = '2000-06-25';

#4.One update statement only to set more than one column/field in some, but not all, records
#Update the email from students with gerogian college email, because the college changed it's email domain
UPDATE student_information 
SET student_email = CONCAT(student_email, '.com ')
WHERE student_email LIKE '%@georgiancollege.ca';

#5.One or more fields/columns are updated in ALL records
#Update semester fee for all students increasing the value
UPDATE student_information
SET semester_fee = semester_fee + 500.99;

#6.SET involves a mathematical operation
#Update semester fee by decreasing 0.99 cents
UPDATE student_information
SET semester_fee = semester_fee - .99;

#7.SET sets a field value to NULL of one or more, but not all records (obviously, this field cannot be defined with NOT NULL in its definition) 
#Update the age of some students - it is not realistic to change people's age. Using the age field because it is the only one that can be NULL in the table.
UPDATE student_information
SET age = NULL
WHERE age >=30;

#8.A statement with SET, WHERE, ORDER BY and LIMIT 
#Update the age to 35 where age is null, ordering by students name and excluding the first 2 records
UPDATE student_information
SET age = 35
WHERE age IS NULL
ORDER BY student_name
LIMIT 2;

#9.WHERE condition involves a compound condition, each simple condition using a relational operator
#Delete students that are 25 and pay semester fees equal to 3050
DELETE FROM student_information
WHERE age = 24 AND semester_fee = 3050;

#10.WHERE condition uses the NOT Boolean operator
#Delete students 21 and younger
DELETE FROM student_information
WHERE NOT(age > 21);

#11.WHERE condition uses BETWEEN and a String function with CHAR/VARCHAR field 
#Delete records with student name initials from I until K 
DELETE FROM student_information
WHERE student_name BETWEEN 'I' AND 'K';

#12.WHERE condition checks for NULL or NOT NULL on a certain field 
#Delete records in which age is null
DELETE FROM student_information
WHERE age IS NULL;

#13.WHERE works with a DATE field data (do not forget to CAST the literal value) 
#Delete record where the birth date is 1994-10-10
DELETE FROM student_information
WHERE date_of_birth = CAST('1994-10-10' AS DATE);

#14.A statement with WHERE, ORDER BY and LIMIT 
#Delete records with domestic students, ordering by the students name, and deleting the first 2 of the list
DELETE FROM student_information
WHERE domestic_student = 'yes'
ORDER BY student_name
LIMIT 2;
