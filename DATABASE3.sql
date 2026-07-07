use datamites;
select*from emp4;

-- Update
update emp4 set emp_name= 'Sidda' where emp_name = 'Siddah';
update emp4 set emp_des = 'micro biologist' ,emp_age = 23 where emp_id = 111;
select *from emp4;
update emp4 set emp_des = 'Data Engineer'where emp_id = 111;
update emp4 set emp_id = '113'where emp_name = 'Garima';

-- delete the entire row 
delete from emp4 where emp_id = 110;
select *from emp4;
-- you want to keep entire record 
-- except that emp_name
-- if you want to delete specific you can use update 
update emp4 set emp_name= null where emp_id= 111;

-- new column 
-- emp_exp
-- alter 
-- add
alter table emp4 add emp_exp int;
select* from emp4;
-- update emp_exp =2
-- where emp_id = 113 
update emp4 set emp_exp =2 where emp_id = 113;
update emp4 set emp_exp =3 where emp_id = 111;
update emp4 set emp_exp =4 where emp_id = 112;

-- Drop column
alter table emp4 drop emp_exp;

-- changing datatype
-- emp_des datatype
-- varchar(30) 
-- modify varchar(30) to varchar(40)
-- modify
alter table emp4 modify emp_des varchar(40);

-- RENAME
-- Rename emp_age to employee_age 
alter table emp4 rename column emp_age to employee_age;
alter table emp4 rename column emp_des to employee_designation;
select * from emp4;

-- Change table name 
alter table emp4 rename to employee4;
select * from employee4;

-- Truncate 
-- deletes entire data in the table 
-- Drop 
-- drop deletes the entire table 
-- Delete
-- you have to mention the specific function to delete the data 
truncate emp3;
select * from emp3;

-- after  downloading and importing table from github adas754 sqlnotes 1 and sales.csv
select *from sales;
-- if you want only specific columns
select orderid,orderdate,country from sales;
select city,sales,profit from sales;

-- if you want to find unique value we use DISTINCT
-- it shows how many unique values are there in that column 
select Distinct(category) from sales;
-- unique values in subcategory
select Distinct(subcategory) from sales;

-- ALIAS
-- Use alias whenever your column name or table name is confusing, long, or repeated! 
select orderid as id from sales;
select customerid as cust_id from sales;

-- WHERE Clause
-- Extract data where sales is greater than 50
select *from sales where sales>50;
-- try to find out the data where region is west
select * from sales where region='west';
-- try to find out only the technology related data 
select * from sales where category= 'technology';
-- try to find out the quantity gretar than equal 10
select*from sales where quantity>=10;

-- AND gate 
-- a b y
-- 0 0 0
-- 0 1 0
-- 1 0 0
-- 1 1 1
-- extract the value where state = texas and category is technology
-- AND is used for different Coloumns
select * from sales where category = 'technology' and state = 'Texas';
-- try to find out the data where subcategory is paper 
-- sales >10
-- state = texas
select *from sales where subcategory = 'paper' and sales>10 and state='Texas';


-- OR gate 
-- a b y
-- 0 0 0
-- 0 1 1
-- 1 0 1
-- 1 1 1
-- subcategory paper 
-- phones is there
-- OR we are using in the same column 
select * from sales where subcategory ='phones' or subcategory = 'paper';
-- try to find out region is west and east
select * from sales where region = 'west' or region = 'east';

-- NOR gate
-- i dont want data from central
select * from sales where not region='central';
-- extract the data where technology will be not there  
select * from sales where not category='technology';

-- ORDER BY
-- sales will be in asc order in default if you use ORDER BY
select * from sales order by sales;
select * from sales order by sales desc;
select * from sales order by sales asc;
-- try to find out data where category is technology where sales desc
select * from sales where category = 'Technology' ORDER BY sales desc;


-- IS NULL / IS NOT NULL
-- we will check wheter is there any null value or not
select * from sales where category is null;
select * from sales where category is not null;
-- in that region is there any null value
select * from sales where region is null;

-- LIMIT 
select * from sales order by sales limit 5;
-- try to extract the 10 data where category is technology and sales in desc order
select * from sales where category = 'Technology'  order by sales desc limit 10;
-- first larget sales in where category is  technology 
select * from sales where category = 'Technology'  order by sales desc limit 1,1;
-- third larget sales in where category is technology 
select * from sales where category = 'Technology'  order by sales desc limit 2,1;
-- fourth larget sales in where category is technology
select * from sales where category = 'Technology'  order by sales desc limit 3,1;

select * from sales where category = 'Technology'  order by sales desc limit 1,2;
-- if you want 5th and 6th largest data 
-- 4,2 means it prints the next highest value also that is 6th 
select * from sales where category = 'Technology'  order by sales desc limit 4,2;
-- if you want to find 2nd 3rd and 4th largest data 
select * from sales where category = 'Technology'  order by sales desc limit 1,3;

-- IN 
 -- it is used to return records by specifying multiple conditions
 select * from sales where subcategory in ('phones', 'art','paper');
 






