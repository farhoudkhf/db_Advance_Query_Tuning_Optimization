-- ch4 my workspace
-- Ranking Data with Windows and Hypothetical Sets

-- ch4_1 - dense_rank() over (partition by ___ order by ___ DESC)
-- Rank rows with a window function
select * from public.people_heights;

select name, height_inches 
from public.people_heights
order by height_inches DESC
;

select 
	name, 
	height_inches,
	rank() over (order by height_inches DESC),
	dense_rank() over (order by height_inches DESC)
from public.people_heights
-- order by height_inches  
-- order by name
;

select 
	name, 
	height_inches,
	gender,
	rank() over (partition by gender order by height_inches DESC),
	dense_rank() over (partition by gender order by height_inches DESC)
from public.people_heights
order by gender, height_inches DESC
;


-- ch4_2 - rank(##) within group (order by ___ DESC)
-- Find a hypothetical rank
select 
	name,
	height_inches
from 
	public.people_heights
order by height_inches DESC
;

select 
	name,
	height_inches,
	rank() over (order by height_inches DESC)
from 
	public.people_heights
order by height_inches DESC
;

select  
	gender,
	rank(70) within group (order by height_inches DESC)
from public.people_heights
group by rollup (gender)
;


-- ch4_3 - percent_rank() over (order by ___ desc) case/when/then/else/end
-- View top performers with percentile ranks
select 
	name,
	height_inches,
	gender,
	percent_rank() over (order by height_inches desc),
	case
		when percent_rank() over (order by height_inches desc) < 0.25 then '1st'
		when percent_rank() over (order by height_inches desc) < 0.50 then '2nd'
		when percent_rank() over (order by height_inches desc) < 0.75 then '3rd'
		else '4th'
	end as "quartile rank"
from public.people_heights
;


-- ch4_4 - 
-- Evaluate probability with cumulative distribution





