select
mode() within group (order by height_inches)
from public.people_heights;

select height_inches, count(*)
from public.people_heights
group by height_inches
order by count(*) desc;