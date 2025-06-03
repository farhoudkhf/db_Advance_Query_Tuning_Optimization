-- get the list of tables in SCHEMA
SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND 
    schemaname != 'information_schema';

-- ch1
-- Obtain Summary Statistics by Grouping Rows

-- ch1_1 
-- Using GROUP BY to aggregate data rows
SELECT * 
FROM inventory.products
WHERE price > 20;

select * FROM inventory.products;

SELECT size AS "Product Size"
FROM inventory.products
GROUP BY size
HAVING count(*) > 10
ORDER BY size DESC
;

SELECT size AS "Product Size", count(*) AS "Number of products"
FROM inventory.products
GROUP BY size
HAVING count(*) > 10
ORDER BY size DESC;

-- ch1_2
-- Obtain general-purpose aggregate statistics
select sku, product_name, size, price
from inventory.products;

select product_name, count(*), max(price) AS "Max Price per Group"
from inventory.products
GROUP BY product_name
ORDER By max(price) DESC;

select product_name, count(*), max(price) AS "Max Price per Group", max(size)
from inventory.products
GROUP BY product_name
-- ORDER By max(price) DESC
;

select product_name,
	count(*) as "number of products",
	max(price) as "highest price",
	max(size) as "largest size",
	min(price) as "lowest price",
	avg(price) as "average price"
from inventory.products
group by product_name;

-- ch1_3
-- boolean_complete
SELECT * from sales.customers;

SELECT *
FROM sales.customers
WHERE not newsletter;

select newsletter, count(*)
FROM sales.customers
GROUP BY newsletter;

SELECT state, count(*), bool_and(newsletter), bool_or(newsletter)
from sales.customers
GROUP by state;

-- ch1_4
-- Find the standard deviation and variance of a dataset
-- N = total number of data point in dataset
-- mean X[mean]
-- sqrRoot(aggregate(Xi - X[mean])^2 / (N -1))
SELECT * from  public.people_heights;

SELECT gender, count(*), avg(height_inches), min(height_inches), max(height_inches)
from public.people_heights
GROUP BY gender
;


-- select count(*) as N, avg(height_inches) as X_mean, (sum(height_inches - avg(height_inches)) + count(*)) as test
-- from public.people_heights
-- -- group by gender
-- ;


-- pop = population
-- samp = sample (sub samples)
SELECT gender, count(*), avg(height_inches), min(height_inches), max(height_inches),
	stddev_samp(height_inches),
	stddev_pop(height_inches),
	var_samp(height_inches),
	var_pop(height_inches)
from public.people_heights
GROUP BY gender
;






