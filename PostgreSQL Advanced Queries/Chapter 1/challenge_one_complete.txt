-- Find the number of orders placed in March and April for each customer

select customer,
	count(*) as total_orders,
	count(*) filter (where order_date >= '2021-03-01' and order_date <= '2021-03-31') as march_orders,
	count(*) filter (where order_date between '2021-04-01' and '2021-04-30') as april_orders
from orders
group by customer;