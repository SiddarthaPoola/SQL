use datamites;
CREATE TABLE adenai (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO adenai (id, name, department, salary) VALUES
(1, 'John', 'HR', 50000),
(2, 'Alex', 'IT', 70000),
(3, 'Mike', 'IT', 90000),
(4, 'Sara', 'Sales', 60000);

WITH avg_sal AS
(
SELECT AVG(salary) AS avg_salary
FROM adenai
)

SELECT *
FROM adenai
JOIN avg_sal
ON adenai.salary > avg_sal.avg_salary;

-- Multiple CTEs
-- You can create multiple temporary tables.

WITH

IT AS
(
SELECT *
FROM adenai
WHERE department='IT'
),

HighSalary AS
(
SELECT *
FROM IT
WHERE salary>80000
)

SELECT *
FROM HighSalary;