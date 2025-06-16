select nullif('A', 'A');

select * from inventory.products;

select sku, product_name, category_id,
	nullif(size, 32) as "size",
	price
from inventory.products;