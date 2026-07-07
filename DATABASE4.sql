use datamites;
-- try find out the data where only art only available 
select * from sales where subcategory='art';
-- try to find out the data where the region is east and west
select * from sales where region = 'west' or region = 'east';
select * from sales where region in ('east','west');
-- try to find out the data where category is furniture, region is east, sales >5
select * from sales where category = 'furniture' and region = 'east' and sales>5;
-- 2nd and 3rd largest profit based on east region
select * from sales where region='east' order by profit desc limit 1,2;


-- str_to_date
-- we use beacause the data type is text so we want in date 
-- text --> date ( orderdate,shipdate)
-- when a date is stored as text and we want to convert it into a proper date format that MySQL understands.
-- If you have a date like "25-06-2026" stored as text and want to use it as a real date: SELECT STR_TO_DATE('25-06-2026', '%d-%m-%Y');
-- Output → 2026-06-25 (MySQL's proper date format)
select *from sales order by str_to_date(shipdate,'%d-%m-%Y') asc;
select * from sales order by str_to_date(orderdate,'%d-%m-%Y') asc;

-- between 
-- quantity in between 5 to 10
-- if you want to output in specific range we use between 
select * from sales where  quantity between 5 and 10;
-- find out data where sales between 10 to 20
select * from sales where sales between 10 and 20;
-- find out data where profit between 5 to 10
select * from sales where profit between 5 and 10;

-- LIKE
-- '% '  -- Any number of characters -- 'Ra%' means starts with Ra
-- ' _' --Exactly one character -- 'R_j' means R + any 1 letter + j
-- try to find out data using LIKE where region is east
select * from sales where region like 'e%';
select * from sales where region like '%as%';
select * from sales where region like 'e%t';
select * from sales where region like 'e___';
select * from sales where region like '%as_';
-- try to find out data where subcategory is phones
select * from sales where subcategory like 'p%s';
select * from sales where subcategory like '%on%';
-- try to find out data where category is technology
select * from sales where category like 't%y';
select * from sales where category like '%no%';
select * from sales where category like '%nolog_';

-- COUNT
--  is used to count the number of rows in a table or group.
--  how many unique subcategory  is there 
select count(distinct subcategory) from sales;
-- how many unique region is there
select count(distinct region) from sales;
-- how many times technology is there
select count(*) from sales where category = 'technology';
-- how many times art is there
select count(*) from sales where subcategory = 'art';
-- how many times the category is technology and state is texas
select count(*) from sales where category = 'technology' and state = 'Texas';

-- SUM 
--  is used to add up all values in a number column.
-- find out the total sales  upto two decimals
select round(sum(sales),2) from sales;
-- find total profit where region is south
select round(sum(profit),2) from sales where region = 'south';

-- AVG
-- is used to find the average value of a number column.
-- try to find out the average quantity where segment is consumer 
select avg(quantity) from sales where segment = 'consumer';

-- MIN and MAX
-- try to find out minimun profit region is central
select MIN(profit) from sales where region = 'central';
-- try to find out maximun sales where subcategory is phones 
select MAX(sales) from sales where subcategory = 'phones';

-- GROUP BY 
--  is used to group rows that have the same value in a column and then perform calculations on each group.
-- try to find put the total sales based on region
select region,sum(sales) from sales group by region;
-- try to find out the total sales for each and every category
select category,sum(sales) FROM sales group by category;
-- find out the average quantity for each and every segment
select segment,avg(quantity) from sales group by segment;
-- find out the total 1st 5 profit based on sun category , profit in desecnding order 
select subcategory, sum(profit) from sales group by subcategory order by sum(profit) desc limit 5;

-- HAVING CLAUSE
-- HAVING is used to filter groups after GROUP BY — just like WHERE filters rows, HAVING filters groups.
-- find out the total 1st 5 profit based on sun category , profit in desecnding order whsoe profit is >200 
SELECT subcategory, SUM(profit) AS total_profit
FROM sales 
GROUP BY subcategory 
HAVING SUM(profit) > 200 
ORDER BY SUM(profit) DESC 
LIMIT 5;
-- Always Follow This Order
-- SELECT        -- 1. what columns
-- FROM         -- 2. which table
-- WHERE         -- 3. filter rows
-- GROUP BY      -- 4. group them
-- HAVING        -- 5. filter groups
-- ORDER BY      -- 6. sort results
-- LIMIT         -- 7. limit rows 
