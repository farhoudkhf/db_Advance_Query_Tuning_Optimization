-- ch2 my workspace
-- Use Window Functions to Perform Calculations across Row Sets

-- ch2_1
-- Create a window function with an OVER clause
SELECT * from inventory.products;

SELECT category_id, avg(price)
from inventory.products
GROUP by category_id;

SELECT avg(price)
from inventory.products;

SELECT min(price)
from inventory.products;

SELECT 
	sku,
	product_name,
	size,
	price, 
	avg(price) OVER()
from inventory.products;


-- ch2_2
-- Partition rows within a window
select * from inventory.products;

select size, avg(price)
from inventory.products
group by size 
order by size
;

SELECT 
	sku,
	product_name,
	size,
	price, 
	avg(price) OVER()
from inventory.products
order by sku, size
;

SELECT 
	sku,
	product_name,
	size,
	category_id,
	price, 
	avg(price) OVER(partition by size) as "avg price for size",
	price - avg(price) over(partition by size) as "difference"
from inventory.products
order by sku, size
;


-- ch2_3
-- Streamline partition queries with a WINDOW clause
select
	sku,
	product_name,
	size,
	price,
	min(price) over(partition by size) as "min price for size",
	avg(price) over(partition by size) as "avg price for size",
	max(price) over(partition by size) as "max price for size",
	price - avg(price) over(partition by size) as "differece"
from inventory.products
order by sku, size;

select
	sku,
	product_name,
	size,
	price,
	min(price) over(w_size) as "min price for size",
	avg(price) over(w_size) as "avg price for size",
	max(price) over(w_size) as "max price for size",
	price - avg(price) over(w_size) as "differece"
from inventory.products
window w_size as (partition by size)
order by sku, size;

select
	sku,
	product_name,
	size,
	price,
	min(price) over(wdw) as "min price for size",
	avg(price) over(wdw) as "avg price for size",
	max(price) over(wdw) as "max price for size",
	price - avg(price) over(wdw) as "differece"
from inventory.products
window wdw as (partition by category_id)
order by sku, size;

-- ch2_4
-- Ordering data within a partition
select * from inventory.categories;

select 
	category_id,
	category_description,
	sum(category_id) over() as "sum total"
from inventory.categories;

select 
	category_id,
	category_description,
	sum(category_id) over(order by category_id) as "running total"
from inventory.categories;

select * from sales.order_lines;

SELECT * FROM pg_catalog.pg_tables WHERE schemaname='sales';

select * from sales.orders;

select
	o.order_id,
	order_date,
	customer_id,
	ol.quantity
from
	sales.orders o
	inner join sales.order_lines ol on ol.order_id = o.order_id;


select
	ol.order_id,
	ol.line_id,
	ol.sku,
	ol.quantity,
	p.price as "each price",
	p.price * ol.quantity as "line total"
from
	sales.order_lines ol
	inner join inventory.products p on p.sku = ol.sku
;

select
	ol.order_id,
	ol.line_id,
	ol.sku,
	ol.quantity,
	p.price as "each price",
	p.price * ol.quantity as "line total"
from
	sales.order_lines ol
	inner join inventory.products p on p.sku = ol.sku
;

select
	ol.order_id,
	ol.line_id,
	ol.sku,
	ol.quantity,
	p.price as "each price",
	p.price * ol.quantity as "line total",
	sum(p.price * ol.quantity) 
		over (partition by ol.order_id) as "order total",
	sum(p.price * ol.quantity) 
		over (partition by ol.order_id order by ol.line_id) as "running total"
from
	sales.order_lines ol
	inner join inventory.products p on p.sku = ol.sku
;


-- my code 
select
	ol.order_id,
	ol.line_id,
	ol.sku,
	ol.quantity,
	p.price as "each price",
	p.price * ol.quantity as "line total",
	avg(p.price * ol.quantity) over(wdw) as "line avg",
	sum(p.price * ol.quantity) over(wdw) as "order running total"
from
	sales.order_lines ol
	inner join inventory.products p on p.sku = ol.sku
window wdw as(partition by ol.order_id order by ol.line_id)
;






-- ch2_5
-- 



-- ch2_6
-- 


