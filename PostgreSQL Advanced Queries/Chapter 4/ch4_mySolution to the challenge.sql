-- ch4_challenge


-- SQL request(s) below
-- rank products by price overall, segmented by category, and segmented by size

select product_name,
	category_id,
	size,
	price,
	dense_rank() over (order by price desc) as "overal_rank",
	dense_rank() over (partition by category_id order by price desc) as "category_rank",
	dense_rank() over (partition by size order by price desc) as "size_rank"
from inventory.products;


select distinct(category_id)
from inventory.products;

-- solution on the portal with correct result
select product_name,
	category,
	size,
	price,
	dense_rank() over (order by price desc) as "OVERALL_RANK",
	dense_rank() over (partition by category order by price desc) as "CATEGORY_RANK",
	dense_rank() over (partition by size order by price desc) as "SIZE_RANK"
from products
order by category, price desc;

