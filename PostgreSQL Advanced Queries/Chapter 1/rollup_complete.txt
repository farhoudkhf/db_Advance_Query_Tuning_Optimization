select category_id,
	product_name,
	count(*),
	min(price) as "lowest price",
	max(price) as "highest price",
	avg(price) as "average price"
from inventory.products
group by rollup (category_id, product_name)
order by category_id, product_name;