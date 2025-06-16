-- ch6
-- Additional Querying Techniques for Common Problems

-- ch6_1 - row_number() over()
-- Output row numbers with query results
select * from inventory.products;

select 
	sku,
	product_name,
	size,
	row_number() over (order by sku)
from inventory.products;

select 
	sku,
	product_name, 
	size,
	row_number() over ()
from inventory.products;

select 
	row_number() over (partition by product_name order by sku),
	sku,
	product_name,
	size
from inventory.products
;


-- ch6_2 - ::
-- Cast values to a different data type
select * from sales.orders;

select 
	order_id,
	order_date::"text",
	customer_id
from sales.orders;

-- ch6_3 - lag(___, xx) over (partition by ___ order by ___)
-- 		 - lead(___, xx) over (partition by ___ order by ___)
-- Move rows within a result with LEAD and LAG
select 
	order_id,
	order_date,
	customer_id
from sales.orders
order by  customer_id, order_date;

select 
	order_id,
	customer_id, 
	order_date,
	lag(order_date, 1) 
		over (partition by customer_id order by order_date) 
		as previous_order_date,
	-- can use "order by order_id" too
	lead(order_date, 1) 
		over (partition by customer_id order by order_date) 
		as "next order"
from sales.orders
order by customer_id, order_date
;
 
select 
	order_id,
	customer_id, 
	order_date,
	lag(order_date, 1) over (partition by customer_id order by order_date),
	order_date - 
		lag(order_date, 1) over (partition by customer_id order by order_date) 
		as lag_days,
	lead(order_date, 1) 
		over (partition by customer_id order by order_date) -
		order_date as "lead days"
from sales.orders
order by customer_id, order_date
;


-- ch6_4 - IN
-- Use an IN function with a subquery
select *
from inventory.products
where product_name = 'Delicate'
	or product_name = 'Bold'
	or product_name = 'Light'
;

select *
from inventory.products
where product_name in  ('Delicate', 'Bold', 'Light')
;

select product_name, count(*)
from inventory.products
group by product_name
having count(*) >= 5
;

select *
from inventory.products
where product_name in (
	select product_name
	from inventory.products
	group by product_name
	having count(*) >= 5
	)
;

-- ch6_5 - generate_series(start, end, interval)
-- Define WHERE criteria with a series
select generate_series(100, 120, 5); 

select * from generate_series(100, 120, 5);

select *
from sales.orders
where order_id in (
	select generate_series(0, 5000, 10)
	)
order by order_id;

select generate_series('2021-03-15'::timestamp, '2021-03-31'::timestamp, '5 days');

select *
from sales.orders
where order_date  in (
	select generate_series('2021-03-15'::timestamp, '2021-03-31'::timestamp, '5 days')
	)
order by order_id;


