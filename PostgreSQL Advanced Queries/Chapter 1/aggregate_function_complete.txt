select sku, product_name, size, price
from inventory.products;

select product_name,
	count(*) as "number of products",
	max(price) as "highest price",
	max(size) as "largest size",
	min(price) as "lowest price",
	avg(price) as "average price"
from inventory.products
group by product_name;