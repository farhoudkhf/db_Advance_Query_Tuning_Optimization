-- ch2 my workspace
-- Use Window Functions to Perform Calculations across Row Sets

-- ch2_1 - OVER
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

-- ch2_4 -- over (partition by ___ order by ___)
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
	o.order_date,
	o.customer_id,
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
	p.price * ol.quantity as "line total",
	sum(p.price * ol.quantity) 
		over (partition by ol.order_id) as "order total",
	sum(p.price * ol.quantity) 
		over (partition by ol.order_id order by ol.line_id) as "running total"
from
	sales.order_lines ol
	inner join inventory.products p on p.sku = ol.sku
;

-- my code with window
select
	ol.order_id,
	ol.line_id,
	ol.sku,
	ol.quantity,
	p.price as "each price",
	p.price * ol.quantity as "line total",
	avg(p.price * ol.quantity) over(wdw) as "line avg",
	sum(p.price * ol.quantity) over(partition by ol.order_id) as "order total",
	sum(p.price * ol.quantity) over(wdw) as "order running total"
from
	sales.order_lines ol
	inner join inventory.products p on p.sku = ol.sku
window wdw as(partition by ol.order_id order by ol.line_id)
;


-- ch2_5 -- over (order by ___ rows between _ preceding and _ following)
-- Calculate a moving average with a sliding window
select * from sales.orders;

select 
	order_id,
	sum(order_id) over (order by order_id) as "running total"
from sales.orders;


select 
	order_id,
	sum(order_id) over (order by order_id rows between 0 preceding and 2 following) 
		as "3 period leading sum"
from sales.orders;

select 
	order_id,
	sum(order_id) over (order by order_id rows between 0 preceding and 2 following) 
		as "3 period leading sum",
	sum(order_id) over (order by order_id rows between 2 preceding and 0 following) 
		as "3 period trailing sum",
	avg(order_id) over (order by order_id rows between 1 preceding and 1 following) 
		as "3 period moving avg"
from sales.orders;


-- ch2_6
-- Return values at specific locations within a window
select * from sales.customers order by company;

select 
	company,
	first_value(company) over (order by company),
	last_value(company) over (order by company),
	nth_value(company, 3) over (order by company)
from sales.customers
order by company;

SELECT
	company,
	first_value(company) over (order by company
		rows between unbounded preceding and unbounded following),
	last_value(company) over (order by company
		rows between unbounded preceding and unbounded following),
	nth_value(company, 3) over (order by company
		rows between unbounded preceding and unbounded following)
from sales.customers
order by company;

select * from sales.orders;
select 
	customer_ID,
	count(*) 
from sales.orders 
group by customer_id
order by customer_id;

-- my code with DISTINCT value
select 
	distinct o.customer_id,
	company,
	count(*) over(partition by o.customer_id) as "number of orders",
	-- count(*) over() as "total",
	round(((count(*) over(partition by o.customer_id)) * 100.0 / (count(*) over())), 2) 
		as "% of total",
	first_value(order_date) 
		over (partition by o.customer_id 
				order by order_date
				rows between unbounded preceding and unbounded following),
	last_value(order_date) 
		over (partition by o.customer_id 
				order by order_date
				rows between unbounded preceding and unbounded following)
from sales.orders o
	join sales.customers c on c.customer_id = o.customer_id
order by company;






