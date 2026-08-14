-- Database Creation
-- database name is datamites
CREATE DATABASE Datamites;
-- Create the db and db name will be Sql
CREATE DATABASE mysql;
CREATE DATABASE Siddarth;
-- Check how many database are there
SHOW databases;
-- how to drop/delete the database
-- we will drop student db
drop database student_db;
show databases;
-- table student 
-- utilize/use the database 
use Datamites;
-- student table 
-- stu_id
-- stu_name
-- stu_age
-- stu_city
create table student(
stu_id int,
stu_name varchar(20),
stu_age int,
stu_location varchar(30),
stu_marks decimal(10,2),
stu_class int,
stu_course varchar(30));
select*from student;

-- create the emp 
-- rmp_id
-- emp_name
-- emp_doj
use Datamites;
create table emp(
emp_id int,
emp_name varchar(20),
emp_doj datetime);

show tables;
-- Mysql is not case sensitive
select*from EMP;

