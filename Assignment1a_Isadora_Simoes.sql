/*
Name: Isadora Simoes de Azevedo Silva Santos
#200449748
Purpose:create a script for an Online Store called S&S Face Masks, that sells face masks made with sustainable materials, create a table to store the Suppliers information 
*/

-- create database 
CREATE DATABASE face_masks ;

-- use the database 
USE face_masks ;

-- create a table structure to store supplier information
CREATE TABLE IF NOT EXISTS supplier_information 
(
-- the name of the supplier
supplier_name       VARCHAR(40) PRIMARY KEY,                          -- primary key is unique in every record & cannot have a null value
-- the supplier´s phone number
supplier_phone      CHAR(10) UNIQUE,                                  -- has to be unique
-- the email of the supplier´s manager              
supplier_email      VARCHAR(40) UNIQUE DEFAULT NULL,                  -- unique in every record, default value is NULL    
-- the starting date of the contract with the supplier
contract_date       DATE,                                             -- should be in the format yyyy-mm-dd
-- the duration of contract with the supplier in months          
contract_duration   TINYINT UNSIGNED NOT NULL,                        -- valid values are 0 to 255, cannot contain NULL value
-- the yearly paid amount for the supplier                              
supplier_cost       FLOAT DEFAULT 30000,                              -- default value is 30000
-- the quantity of product delivered every month by the supplier
product_quantity    SMALLINT UNSIGNED,                                -- valid values are 0 to 65535
-- if the supplier supplies a national product
national_product    ENUM("yes", "no", "y", "n") DEFAULT "yes"         -- valid values are listed in the list, default value is yes
) ;

-- show the table in the database
SHOW TABLES;

-- display the structure of the table
DESC supplier_information;

-- insert records/rows in the table
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('Best CottonCloths', '2343456778', 'cottoncloths@gmail.com', '2020-01-20', 12, 10000, 4000, 'yes');

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES 
('Joe´s Silk Cloths', '2435365465', 'silkcloths@gmail.com,', '2019-12-11', 24, 15000, 5000, 'no');

-- providing a complete field list in a different order
INSERT INTO supplier_information(supplier_phone, supplier_name, supplier_email, contract_date, contract_duration, supplier_cost, national_product, product_quantity)
VALUES
('2345678911', 'ElasticBands&Go', 'elastic@gmail.com', '2019-2-11', 18, 1200, 'yes', 3000);

-- providing an incomplete field list
INSERT INTO supplier_information(supplier_name, supplier_phone, contract_date, contract_duration, product_quantity)
VALUES
('Barrie Delivery Boxes', '1234567891', '2020-5-4', 12, 1000 );

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('Rita´s Sewing Machines', '9878695867', 'sewing@gmail.com', '2020-2-11', 12, 25000, 3000, 'yes');

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('Customizers-Customization products', '3746574657', 'customizers@gmail.com', '2020-8-12', 24, 10000, 30000, 'yes');

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('The Best Fabric Paint', '9878695807', 'tbfp@gmail.com', '2020-8-15', 12, 25000, 3000, 'no');

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('Sheona´s Delivery Trucks', '9878695860', 'sheonadelivery@gmail.com', '2020-7-2', 12, 8000, 10, 'yes');

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('BeProtected Hand Sanitizers', '9878695367', 'bphandsanitizers@gmail.com', '2020-4-10', 12, 1000, 1000, 'yes');

-- providing a complete field list - have to insert all values
INSERT INTO supplier_information(supplier_name, supplier_phone, supplier_email, contract_date, contract_duration, supplier_cost, product_quantity, national_product)
VALUES
('CleaningBuddy', '9278695867', 'cleaningbuddy@gmail.com', '2020-9-9', 6, 2000, 15, 'no');

-- display all records in the table, the * means display all columns
SELECT * FROM supplier_information;
