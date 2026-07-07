use datamites;
-- Entering values into the table 
-- while creating table you can use emp_id int not null
INSERT INTO emp(emp_id, emp_name, emp_doj)
VALUES
(101, 'Rahul', '2026-06-23'),
(102, 'Priya', '2026-06-24'),
(103, 'Ajay', '2026-06-25');

-- unique
create table emp1(
emp_id int unique,
emp_name varchar(30));
insert into emp1(emp_id,emp_name) values(106,'Sid'),(107,'red');
select *from emp1;

-- Primary key
create table emp2(
emp_id int primary key,
emp_name varchar(30));
insert into emp2(emp_id,emp_name) values(108,'Sid'),(109,'red');
-- to check table 
select * from emp2;

-- Check
create table Student1(
       stu_id int primary key,
       stu_age int check(stu_age>18));
       -- check will follow the condition
insert into Student1(stu_id,stu_age) values(1,19);

-- Default
create table ticket(
       ticket_id int primary key auto_increment,
       p_name varchar(30),
       train_time datetime default current_timestamp);
insert into ticket(p_name) values ('Asha'),('Sid'),('Red');
select * from ticket;

-- auto increment 
create table emp3(
       emp_id int primary key auto_increment,
       emp_name varchar(10),
       emp_age int default 20)
       auto_increment = 10;
insert into emp3(emp_name) values ('Garima'),('Ghaley'),('Rathod');
select* from emp3;
insert into emp3(emp_name) values ('sub'),('Dha');
select* from emp3;

-- Update
create table emp4(
        emp_id varchar(30),
        emp_name varchar(30),
        emp_des varchar(30),
        emp_age int);
insert into emp4(emp_id,emp_name,emp_des,emp_age) values (110,'Siddarth','Developer', 23),
(111,'Siddah','Tester', 24),
(112,'Hemanth','Deveops Engineer', 29);
select *from emp4;
update emp4 set emp_des = ' Software Tester' WHERE emp_des = 'Tester';
	insert into emp4(emp_id,emp_name,emp_des,emp_age) values (111, 'Garima', 'micro biologist', 24);
    select* from emp4;
update emp4 set emp_des = 'Devops Engineer' Where emp_des = 'Deveops Engineer';

