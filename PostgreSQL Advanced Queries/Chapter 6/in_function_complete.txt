-- us an in() function with a list
select *
from inventory.products
where product_name in('Delicate', 'Bold', 'Light');

-- use an in function with a sub select query
select *
from inventory.products
where product_name in(
		select product_name
		from inventory.products
		group by product_name
		having count(*) >= 5
);

-- determine the query used as a sub select above
select product_name, count(*)
from inventory.products
group by product_name
having count(*) >= 5;