select * from sales.customers

select newsletter, count(*), max(newsletter)
from sales.customers
group by newsletter

select state, count(*), bool_and(newsletter), bool_or(newsletter)
from sales.customers
group by state