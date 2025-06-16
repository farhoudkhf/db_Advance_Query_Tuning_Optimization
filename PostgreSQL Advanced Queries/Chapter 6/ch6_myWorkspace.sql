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
-- 		 - 
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


-- ch6_4 - 
-- 



-- ch6_5 - 
-- 




