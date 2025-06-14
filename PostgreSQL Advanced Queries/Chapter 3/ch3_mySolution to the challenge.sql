-- ch3 challenge
select * from inventory.products;
select * from inventory.categories;

--  avg and range
select 
	--p.category_id,
	category_description,
	min(price),
	avg(price),
	max(price),
	max(price) - min(price) as "range"
from inventory.products p
	join inventory.categories c on c.category_id = p.category_id
group by rollup (c.category_description)
order by c.category_description
;

-- median
select price from inventory.products order by price;

select
	percentile_disc(0.5) within group (order by price) as "perc_disc",
	percentile_cont(0.5) within group (order by price) as "perc_cont"
from inventory.products
;

select
	c.category_description,
	min(price) as "min_price",
	percentile_cont(0.25) within group (order by price) as "first_quartile",
	percentile_cont(0.5) within group (order by price) as "secont_quartile",
	percentile_cont(0.75) within group (order by price) as "third_quartile",
	max(price) as "max_price",
	max(price) - min(price) as "price_range"
from inventory.products p
	join inventory.categories c on c.category_id = p.category_id
group by rollup (c.category_description);


-- from the portal
select
	category,
	min(price) as "MIN_PRICE",
	percentile_cont(0.25) within group (order by price) as "FIRST_QUARTILE",
	percentile_cont(0.5) within group (order by price) as "SECOND_QUARTILE",
	percentile_cont(0.75) within group (order by price) as "THIRD_QUARTILE",
	max(price) as "MAX_PRICE",
	max(price) - min(price) as "PRICE_RANGE"
from products
group by category;


