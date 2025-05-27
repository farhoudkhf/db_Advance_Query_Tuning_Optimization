select product_name, category_id, size, price
from inventory.products
where price > 20.00;

select size as "product size", count(*) as "number of products"
from inventory.products
group by size
having count(*) > 10
order by size DESC;