-- ch2_mySolution to the challenge

-- SQL request(s)​​​​​​‌‌​‌​‌‌‌‌‌​‌​‌‌‌​​​‌‌​​​​ below
-- Obtain product pricing comparisons within the same category classification

select 
	-- distinct category,
	product_name,
	category,
	price,
	min(price) over (wdw_cat) as cat_min_price,
	max(price) over (wdw_cat) as cat_max_price,
	avg(price) over (wdw_cat) as cat_avg_price,
	count(*) over (wdw_cat) as cat_count
from products
window wdw_cat as (partition by category)
order by category, price;
