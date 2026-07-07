use datamites;

Select * from sales;

-- SUB QUERY 
-- A SUBQUERY is a query inside another query — the inner query runs first and its result is used by the outer query.
-- find out the minimun sales
select min(sales) from sales;
-- if you want entire row we use sub query
select * from sales where sales=(select min(sales) from sales);
-- if you want to find the maximum sales
select * from sales where sales=(select max(sales) from sales);
-- find out the avg quantity 
select * from sales where quantity = (select min(quantity) from sales);
-- find the sales greater than the avg sales 
select * from sales where sales > ( select avg(sales) from sales);
-- find the profit less thna the avg profit
select * from sales where profit<(select avg(profit) from sales);
-- find out the region with the highest sales
select region from sales where sales =( select max(sales) from sales);
-- find out the customer who got the highest profit 
select customername from sales where profit=(select max(profit) from sales);
-- find out the customer who got the minimum slaes
select customername from sales where sales=(select min(sales) from sales);
-- find out the category with the highest qunatity
select category from sales where quantity =(select max(quantity) from sales);
-- find the earliest order
SELECT * FROM sales 
WHERE STR_TO_DATE(orderdate, '%d-%m-%Y') = 
(SELECT MIN(STR_TO_DATE(orderdate, '%d-%m-%Y')) FROM sales);

-- in github adas754 sql_note_1 download and import movies.csv
select * from movies;

-- find out the movie with the highest rating
select * from movies where score =( select max(score) from movies);
-- find the director name with  the lowest rated movie
select director from movies where score = ( select min(score) from movies);
-- find out the recent released movie
Select name, released
from movies
where SUBSTRING(released, -4) = (select MAX(SUBSTRING(released, -4)) from movies);

Select name, released
from movies
order by STR_TO_DATE(SUBSTRING_INDEX(released, ' (', 1), '%M %d, %Y') DESC
LIMIT 1;

-- date format 
select name, 
       DATE_FORMAT(
           STR_TO_DATE(SUBSTRING_INDEX(released, ' (', 1), '%M %d, %Y'),
           '%d-%m-%Y'
       ) as formatted_date
from movies;

-- using Substring index and date format
SELECT name,
       DATE_FORMAT(
           STR_TO_DATE(SUBSTRING_INDEX(released, ' (', 1), '%M %d, %Y'),
           '%d-%m-%Y'
       ) AS formatted_date
FROM movies
ORDER BY STR_TO_DATE(SUBSTRING_INDEX(released, ' (', 1), '%M %d, %Y') DESC
LIMIT 1; 

-- 