-- ch5
-- Define Output Values with Conditional Expressions

-- ch5_1 - case when then else end
-- Define values with CASE statements
select
	case 
		when 0 = 0
		then 'A'
		when 1 = 1
		then 'B'
		else 'C'
	end
;

select * from inventory.categories;
select * from inventory.products;
	
select 
	sku, 
	product_name, 
	category_id,
	case
		when category_id = 1 then 'Olive oils'
		when category_id = 2 then 'Flavor Infused Oils '
		when category_id = 3 then 'Bath and Beauty'
		else 'Category Unknown'
	end as "Category Description",
	size, 
	price
from inventory.products
;


-- ch5_2 - coalesce 
-- Merge columns with COALESCE
select coalesce (null, 'B', 'C');
select coalesce (null, null, null);

select * from inventory.categories;

-- insert into inventory.categories (category_id, product_line)
-- values (4, 'test')

insert into inventory.categories
values (4, null, 'Gift Baskets');

select 
	category_id,
	coalesce (category_description, product_line) as "cat_desc",
	product_line
from inventory.categories
;


-- ch5_3 -NULLIF
-- Convert values to null with NULLIF
select nullif ('A', 'B');
select nullif ('A', 'A');

select * from inventory.products;

select 
	sku,
	product_name,
	category_id,
	nullif (size, 32) as "size",
	price
from inventory.products
;
