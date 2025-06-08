select size, avg(price) as "average price"
from inventory.products
group by size
order by size;

select sku,
	product_name,
	size,
	category_id,
	price,
	avg(price) over(partition by size) as "average price for size",
	price - avg(price) over(partition by size) as "difference"
from inventory.products
order by sku, size;