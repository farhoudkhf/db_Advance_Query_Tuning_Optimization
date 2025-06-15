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


-- ch4_3 - 
-- View top performers with percentile ranks




-- ch4_4 - 
-- 



