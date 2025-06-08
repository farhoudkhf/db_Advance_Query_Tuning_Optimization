select * from sales.orders;

select * from sales.customers;

select * from sales.order_lines;

select order_id,
	order_date,
	customer_id
from sales.orders;

select 
	customer_id,
	count(*),
	-- march
	count(*) filter(where order_date between '2021-03-01' and '2021-03-31') as "march",
	-- filter april
	count(*) filter (where order_date between '2021-04-01' and '2021-04-30') as "april"
from sales.orders
group by customer_id;



SELECT 
	so.customer_id,
	sc.company,
	-- filter march
	count(*) filter (where so.order_date between '2021-03-01' and '2021-03-31') as "march",
	-- filter april
	count(*) filter (where so.order_date between '2021-04-01' and '2021-04-30') as "april",
	count(*) as ttlCount
from sales.orders so
	JOIN sales.customers sc on sc.customer_id = so.customer_id
group by so.customer_id, sc.customer_id
order by ttlCount DESC
;

-- give correct answer on the course portal 
SELECT 
	customer,
	count(*) as Total_Orders,
	-- filter march
	count(*) filter (where order_date between '2021-03-01' and '2021-03-31') as "MARCH_ORDERS",
	-- filter april
	count(*) filter (where order_date between '2021-04-01' and '2021-04-30') as "APRIL_ORDERS",
from orders
group by customer
order by count(*) desc;


--
SELECT 
	so.customer_id,
	sc.company,
	count(*) as ttlCount,
	-- filter march
	count(*) filter (where so.order_date >= '2021-03-01' and so.order_date <= '2021-03-31') as "march",
	-- filter april
	count(*) filter (where so.order_date >= '2021-04-01' and so.order_date <= '2021-04-30') as "april"
from sales.orders so
	JOIN sales.customers sc on sc.customer_id = so.customer_id
group by so.customer_id, sc.customer_id
order by ttlCount DESC
;


-- with use of EXTRACT
SELECT 
	so.customer_id,
	sc.company,
	count(*) as ttlCount,
	-- filter march
	count(*) filter (where extract(month from so.order_date) = 3) as "march",
	-- filter april
	count(*) filter (where extract(month from so.order_date) = 4) as "april"
from sales.orders so
	JOIN sales.customers sc on sc.customer_id = so.customer_id
group by so.customer_id, sc.customer_id
order by ttlCount DESC
;

-- use of extract
SELECT 
	order_date, 
	extract(month from order_date) as month,
	extract(year from order_date) as year
from sales.orders
group by order_date
having extract(month from order_date) = 3;
