-- ch6_challenge

-- SQL request(s) below
-- Sort people by their height
-- Calculate how much taller they are than the person below

select person_id,
	name,
	height_inches
from public.people_heights;

select generate_series(001, 010);

select person_id,
	name,
	height_inches,
	lead(height_inches, 1) over (order by height_inches),
	lag(height_inches, 1) over (order by height_inches),
	height_inches - lag(height_inches, 1) over (order by height_inches) as by_this_many_inches
from public.people_heights
order by height_inches DESC
;


select person_id,
	name,
	height_inches,
	lag(name, 1) over (order by height_inches) as is_taller_than,
	height_inches - lag(height_inches, 1) over (order by height_inches) as by_this_many_inches
from public.people_heights
order by height_inches DESC
;


-- my solution on the portal
select person_id,
	name,
	height_inches,
	lag(name, 1) over (order by height_inches) as is_taller_than,
	height_inches - lag(height_inches, 1) over (order by height_inches) as by_this_many_inches
from people_heights
order by height_inches DESC;