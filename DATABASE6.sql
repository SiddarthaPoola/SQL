use datamites;

-- SELF JOIN
-- A SELF JOIN is when a table is joined with itself — useful when rows in a table relate to other rows in the same table 
-- (like an employee and their manager, both stored in the same table).
select * from users1;
select* from users1 t1 join users1 t2 on t1.user_id = t2.emergency_contact;

-- FULL OUTER JOIN
-- FULL OUTER JOIN returns ALL rows from BOTH tables — matched rows together, and unmatched rows with NULL on the missing side.
-- FULL OUTER JOIN we cant use in MY sql so we use left join and union right join
select * from users1 t1 left join membership t2
on t1.user_id = t2.user_id
union
select * from users1 t1 right join membership t2
on t1.user_id = t2.user_id;

-- FOREIGN KEY
-- A FOREIGN KEY is a column that links one table to another table — 
-- it points to a PRIMARY KEY in another table, creating a relationship between them.

-- CREATE DEPARTMENTS TABLE
create table departments(
  dept_id int primary key,
  dept_name varchar(50),
  location varchar(50)
  );

-- CREATE EMPLOYEES TABLE
create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    salary decimal(10,2),
    dept_id int,
    foreign key (dept_id) references
    departments(dept_id)
    );
    
-- insert records into departments table
INSERT INTO departments (dept_id, dept_name, location)
VALUES
(1, 'IT', 'Mumbai'),
(2, 'HR', 'Delhi'),
(3, 'Finance', 'Banglore'),
(4, 'marketing','chennai'),
(5, 'Operations','pune');

-- insert records into employees table
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES
(101, 'amit', 75000, 1),
(102, 'priya', 55000, 2),
(103, 'rahul', 65000, 3),
(104, 'sneha', 45000, 1),
(105, 'ann', 70000, NULL);

-- changing dept_id of rahul to 1 and sneha to 3
UPDATE employees
SET dept_id = 1
WHERE emp_name = 'rahul';

UPDATE employees
SET dept_id = 3
WHERE emp_name = 'sneha';

-- Retrive employee names laong with departments name
select t1.emp_name,t2.dept_name from employees t1 join departments t2 on t1.dept_id = t2.dept_id;
-- Display all employeees including those without department
SELECT t1.emp_name, t2.dept_name 
FROM employees t1 
LEFT JOIN departments t2 
ON t1.dept_id = t2.dept_id;
-- Find the employees not assigned to any department 
SELECT emp_name, dept_id
FROM employees
WHERE dept_id IS NULL;
-- also 
SELECT * from employees where dept_id is null;

-- find departments  with no employees
SELECT d.dept_id, d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
-- also 
SELECT t1.emp_name, t2.dept_name 
FROM employees t1 
RIGHT JOIN departments t2 
ON t1.dept_id = t2.dept_id
WHERE emp_id is null ;

-- Display the employee nmaes with the departmnet locations
SELECT t1.emp_name, t2.location
FROM employees t1
JOIN departments t2
ON t1.dept_id = t2.dept_id;

-- count the number of employees in each departmnet 
SELECT t1.dept_name, COUNT(t2.emp_id) AS total_employees
FROM departments t1
LEFT JOIN employees t2
ON t1.dept_id = t2.dept_id
GROUP BY t1.dept_name;

-- also
select t1.dept_name, count(*) as no_emp from departments t1 JOIN employees t2 ON t1.dept_id = t2.dept_id
GROUP By t1.dept_name;

-- list employees working in IT department

SELECT t1.emp_name, t2.dept_name
FROM employees t1
JOIN departments t2
ON t1.dept_id = t2.dept_id
WHERE t2.dept_name = 'IT';

-- display all combinations of employees and departmants

select * from employees t1 CROSS JOIN departments t2;

-- also 
SELECT t1.emp_name, t2.dept_name
FROM employees t1
CROSS JOIN departments t2;

-- retrive employees with salary greater than 60000 along with department names 

SELECT t1.emp_name, t1.salary, t2.dept_name
FROM employees t1
JOIN departments t2
ON t1.dept_id = t2.dept_id
WHERE t1.salary > 60000; 




