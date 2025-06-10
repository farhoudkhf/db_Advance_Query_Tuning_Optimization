select company,
	first_value(company) over(order by company
		rows between unbounded preceding and unbounded following),
	last_value(company) over(order by company
		rows between unbounded preceding and unbounded following),
	nth_value(company, 3) over(order by company
		rows between unbounded preceding and unbounded following)
from sales.customers
order by company;

select * from sales.orders;

select distinct customer_id,
	first_value(order_date)
		over (partition by customer_id
			 order by order_date
			 rows between unbounded preceding and unbounded following),
	last_value(order_date)
		over (partition by customer_id
			 order by order_date
			 rows between unbounded preceding and unbounded following)
from sales.orders
order by customer_id;











