-- ch1
-- Obtain Summary Statistics by Grouping Rows

-- ch1_1 
-- Using GROUP BY to aggregate data rows
SELECT * 
FROM inventory.products
WHERE price > 20;

SELECT size AS "Product Size", count(*) AS "Number of products"
FROM inventory.products
GROUP BY size
HAVING count(*) > 10
ORDER BY size DESC;

-- ch1_2
-- Obtain general-purpose aggregate statistics
select sku, product_name, size, price
from inventory.products;

select product_name, count(*), max(price)
from inventory.products
GROUP BY product_name;


select product_name,
	count(*) as "number of products",
	max(price) as "highest price",
	max(size) as "largest size",
	min(price) as "lowest price",
	avg(price) as "average price"
from inventory.products
group by product_name;
