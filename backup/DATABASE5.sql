use datamites;
select * from cars;
-- import cars.csv from adas754 account , sql notes_1 repo 
-- ORDER BY is used to sort the results of a query in ascending or descending order.
-- find the average selling price of cars for each brand
select brand, avg(selling_price) as avg_price from cars group by brand order by avg_price desc;
-- calculate the total selling price grouped by fuel type
select fuel,sum(selling_price) as totalprice from cars group by fuel  order by totalprice;
-- find the no of cars available for  each owner categoery 
select owner, count(*) as no_of_car from cars group by owner;
-- write a query to get the mininimum kilometers driven for cars in each fuel
select fuel,MIN(km_driven) as min_km_driven from cars group by fuel;
-- determine the highest selling price for each brand
select brand,max(selling_price) as highest_price from cars group by brand order by highest_price  desc limit 1;

select brand,sum(selling_price) as highest_price from cars group by brand order by highest_price  desc limit 1;
-- List the brands whose average selling price is grater than 500000
select brand,avg(selling_price) as avg_price from cars group by brand having avg_price >500000;
-- try to find out fuel type have more than 50 cars 
select fuel, count(*) as no_of_car from cars group by fuel having no_of_car>50;
-- Identify owner types where the total selling price of cars exceeds 1,000,000.
select owner, sum(selling_price) as total from cars group by owner having total>1000000;
-- caluclate the average kilometers driven for each brand
select brand,avg(km_driven) from cars group by brand;
-- find out brands that have more than one car listed in dataset 
select brand,count(*) as no_of_car from cars group by brand having no_of_car>1;

-- JOINS
-- download users1.csv and group.csv from github and rename group as g 
select * from datamites.g;
select * from g;
select * from users1;
-- 1 2 3 4 8 11
-- 1 2 3 7
-- cross join 
-- CROSS JOIN combines every row of Table A with every row of Table B 
-- It gives us every possible combinations
select * from g cross join users1;

-- download membership.csv file from adas754 sql notes 1 github
select * from membership;
select distinct user_id from membership;
-- 1 2 3 4 5 6 
select * from users1;
select distinct user_id from users1;
-- 1 2 3 4 8 11 

-- INNER JOIN
-- INNER JOIN returns only the matching rows from both tables. If no match, that row is completely excluded.
select * from users1 t1 inner join membership t2 on t1.user_id = t2.user_id;
-- unique user_id
select distinct(t1.user_id),t1.name,t1.age from users1 t1 inner join membership t2 on t1.user_id=t2.user_id;

-- LEFT JOIN
-- LEFT JOIN returns ALL rows from the LEFT table and only the matching rows from the RIGHT table. 
-- If no match, it shows NULL for right table columns.
select * from users1 t1 left join membership t2 on t1.user_id = t2.user_id;

select t1.name,t1.age, t1.emergency_contact,t2.user_id  
from 
users1 t1 left join membership t2
on t1.user_id = t2.user_id;
select * from membership;
-- users 1 as left hand side and memebership as right ahnd side 
select * from users1 t1 left join membership t2
on t1.user_id = t2.user_id;
-- memebership is lhs table and users1 is rhs table 
select * from membership t1 left join users t2
on t1.user_id = t2.user_id;

-- RIGHT JOIN
-- RIGHT JOIN returns ALL rows from the RIGHT table and only the matching rows from the LEFT table.
-- If no match, it shows NULL for left table columns.
-- users1 lhs table membership rhs table
select * from users1 t1 right join membership t2
on t1.user_id = t2.user_id;
-- membership lhs table and users1 rhs table 
select * from membership t1 right join users t2
on t1.user_id = t2.user_id;

