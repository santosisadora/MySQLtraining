/*
Name(s): Isadora Simoes de Azevedo 
Purpose: To create a database with a table therein that stores information about employees. 
         Populate the table with employee data. Display the structure and contents of the table.
         Modify the structure of the table.
*/

-- set the environment
SET SQL_SAFE_UPDATES = 0;
SET DEFAULT_STORAGE_ENGINE = INNODB;

-- drop existing database, if it exists
DROP DATABASE IF EXISTS db_employee;    
-- create the database 
CREATE DATABASE db_employee;

-- I DO NOT HAVE A USE STATEMENT. Notice the use of the database name db_employee to qualify the table name in all the following statements

-- create the table structurethat will store information about employees
CREATE TABLE db_employee.tbl_employee(
	employee_number	  CHAR(4) PRIMARY KEY,										-- the unique identification number of the employee
	employee_name 	  VARCHAR(40) NOT NULL,										-- the name of the employee
	job_description	  VARCHAR(20)  NOT NULL DEFAULT 'UNASSIGNED',				-- the job description of the employee
	manager_numbers	  VARCHAR(10),												-- the employee number of the manager of this employee
	hire_date 	      DATE,      						      					-- the date the employee was hired
    years_in_job	  TINYINT UNSIGNED,											-- the number of years the employee has been in this job    
	monthly_salary 	  DEC(7,2) UNSIGNED  NOT NULL,								-- the monthly salary of the employee
	
    
    FOREIGN KEY(manager_numbers) REFERENCES db_employee.tbl_employee(employee_number)
    
    -- manager_number is a 'self-referential' foreign key, that 'draws' its value from the employee number field of the same table
);

--  inserting records into the table
INSERT INTO db_employee.tbl_employee(employee_number,employee_name,job_description,manager_numbers, hire_date, years_in_job, monthly_salary)
VALUES
('7839', 'KING', 'PRESIDENT',NULL, '1981-11-17', 38, 5000),
('7698', 'BLAKE', 'MANAGER', '7839', '1981-05-01', 39, 2850),
('7782', 'CLARK', 'MANAGER','7839', '1981-06-09', 39, 2450),
('7566', 'JONES', 'MANAGER','7839', '1981-04-02', 39, 2975),
('7654', 'MARTIN', 'SALESMAN','7698', '1981-09-28', 39, 1250),
('7499', 'ALLEN', 'SALESMAN','7698', '1981-02-20', 39,  1600),
('7844', 'TURNER', 'SALESMAN','7698', '1981-09-08', 39,  1500),
('7900', 'JAMES', 'CLERK','7698', '1981-12-03',38,  950),
('7521', 'WARD', 'SALESMAN','7698', '1981-02-22', 39, 1250),
('7902', 'FORD', 'ANALYST','7566', '1981-12-03', 38, 3000),
('7369', 'SMITH', 'CLERK','7902', '1980-12-17', 39, 800),
('7788', 'SCOTT', 'ANALYST','7566', '1982-12-09', 37, 3000),
('7876', 'ADAMS', 'CLERK','7788', '1983-01-12', 37, 1100),
('7934', 'MILLER', 'CLERK','7782', '1982-01-23', 38, 1300);

-- describe/display the structure of the table
SHOW COLUMNS FROM db_employee.tbl_employee;
-- show all the records of the table
SELECT * FROM db_employee.tbl_employee;



/*1.At least one instance of the ‘Add Column’ to add a new RELEVANT field of type string to the table– adding a new column is just like adding a field definition in 
the Create Table command. Ensure it has all the properties you need, for example NOT NULL etc. You may add more than one column, if required, to make the following update 
requirement work.
Now update all the existing records to populate this new column(s) with relevant data using one or more string functions. Hint: You could always split an existing string 
field data into more than one fields. 
*/
-- add new column to store the postal code of each employee, so the company can send them documents by mail
ALTER TABLE db_employee.tbl_employee
ADD COLUMN employee_postalcode VARCHAR(7) AFTER employee_name;

-- display the table structure
DESC db_employee.tbl_employee;

-- select all records from the table
SELECT *  FROM db_employee.tbl_employee;

-- update all the existing records to populate the employee_postalcode column with data
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 001' WHERE employee_name = 'SMITH'; 
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 002' WHERE employee_name = 'ALLEN'; 
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 003' WHERE employee_name = 'WARD';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 004' WHERE employee_name = 'JONES';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 005' WHERE employee_name = 'MARTIN';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 006' WHERE employee_name = 'BLAKE';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 007' WHERE employee_name = 'CLARK';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 008' WHERE employee_name = 'SCOTT';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 009' WHERE employee_name = 'KING';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 010' WHERE employee_name = 'TURNER';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 011' WHERE employee_name = 'ADAMS';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 012' WHERE employee_name = 'JAMES';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 013' WHERE employee_name = 'FORD';
UPDATE db_employee.tbl_employee SET employee_postalcode = 'L4M 014' WHERE employee_name = 'MILLER';
 
SELECT *  FROM db_employee.tbl_employee;

/* 2.At least one instance of the ‘Modify Column’ to modify something RELEVANT about a field. Recall you have to rewrite all properties you want to keep, for example 
NOT NULL etc. Move the column to a different position too. */
-- Modify the monthly salary default to Ontario's minimum wage
ALTER TABLE db_employee.tbl_employee
MODIFY COLUMN monthly_salary 	  DEC(7,2) NOT NULL DEFAULT 2240;	

/* 3.At least one instance of the ‘Change Column’ to change the name (follow naming conventions and give a meaningful name) and another RELEVANT property of a field. 
Recall you have to rewrite all properties you want to keep, for example NOT NULL etc. Move the column to a different position too.
*/
-- Change employee_name field to employee_last_name and change the size of the field from 40 to 10, which is more than enough for a last name
ALTER TABLE db_employee.tbl_employee
CHANGE COLUMN employee_name employee_last_name VARCHAR(10) NOT NULL;

#4.At least one instance of the ‘Drop Column’ to drop an IRRELEVANT field in the table. No information should be lost, assuming it can be obtained from other column(s).
-- Drop the column years_in_job
ALTER TABLE db_employee.tbl_employee
DROP COLUMN years_in_job;

#5.Just change the name of a field using the ‘Rename Column’ command. Ensure you follow the naming conventions and give it a meaningful name.
-- Change name of column from job_description to employee_position
ALTER TABLE db_employee.tbl_employee
CHANGE COLUMN job_description employee_position	 VARCHAR(20)  NOT NULL DEFAULT 'UNASSIGNED';

SELECT *  FROM db_employee.tbl_employee;

/*6.Adding a UNIQUE constraint to one of the RELEVANT field in the table. If you cannot think of any that qualifies, then you can add a new field and then add the constraint. 
I want to see an ‘independent’ constraint statement, not to be combined with any add, modify or change column. 
*/
-- Make the field employee_last_name unique
ALTER TABLE db_employee.tbl_employee
ADD CONSTRAINT UNIQUE KEY(employee_last_name);

#7.	Now display the structure of the table and all its data after you have completed all the above. This will help me ensure that all the requirements have been met. 
-- describe/display the structure of the table
SHOW COLUMNS FROM db_employee.tbl_employee;
-- show all the records of the table
SELECT * FROM db_employee.tbl_employee;