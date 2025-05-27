select category_id,
	count(*) as "count all",
	avg(price) as "average price",
	-- small products
	count(*) filter (where size <=16) as "count small",
	avg(price) filter (where size <= 16) as "average price small",
	-- large products
	count(*) filter (where size >16) as "count large",
	avg(price) filter (where size >16) as "average price large"
from inventory.products
group by rollup (category_id)
order by category_id