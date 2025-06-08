select order_id,
sum(order_id) over (order by order_id rows between 0 preceding and 2 following)
	as "3 period leading sum",
sum(order_id) over (order by order_id rows between 2 preceding and 0 following)
	as "3 period trailing sum",
avg(order_id) over (order by order_id rows between 1 preceding and 1 following)
	as "3 period moving average"
from sales.orders;