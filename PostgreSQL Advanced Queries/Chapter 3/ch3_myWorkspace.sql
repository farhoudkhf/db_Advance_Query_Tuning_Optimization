-- ch3 my workspace
-- Statistics Based on Sorted Data within Groups

-- ch3_1 - percentile_disc | percentile_cont
-- Calculate the median value of a dataset
select * from public.people_heights;

select height_inches
from public.people_heights
order by height_inches;

select 
	gender,
	round(avg(height_inches), 2)
from public.people_heights
group by rollup (gender);

select 
	round(avg(height_inches), 2)
from public.people_heights
;

select height_inches
from public.people_heights
order by height_inches
;

select 
	percentile_disc(0.5) within group (order by height_inches) as "descret median",
	percentile_cont(0.5) within group (order by height_inches) as "continuous median"
from public.people_heights;

select
	gender,
	percentile_disc(0.5) within group (order by height_inches) as "descret median",
	percentile_cont(0.5) within group (order by height_inches) as "continuous median"
from public.people_heights
group by rollup (gender)
;

-- ch3_2 - percentile_cont(0.25)...
-- Calculate the first and third quartiles of a dataset
select * from public.people_heights;

select 
	percentile_cont(0.25) within group (order by height_inches),
	percentile_cont(0.5) within group (order by height_inches),
	percentile_cont(0.75) within group (order by height_inches)
from public.people_heights;

select 
	gender,
	percentile_cont(0.25) within group (order by height_inches) as "1st quartile",
	percentile_cont(0.5) within group (order by height_inches) as "median",
	percentile_cont(0.75) within group (order by height_inches) as "3rd quartile"
from public.people_heights
group by rollup (gender)
;

-- just dividing the list to 4 equal groups, instead should use Ranking
select 
	name, 
	height_inches,
	ntile(4) over (order by height_inches)
from public.people_heights;

select
(select
	count(*)
from public.people_heights
where height_inches <= 63.72) as "#of below 1st quartile",
(select
	count(*)
from public.people_heights
where height_inches >= 69.56) as "#of above 3rd quartile"
;

-- ch3_3 - MODE
-- Find the most frequent value within a dataset with MODE
SELECT
	mode() within group (order by height_inches)
from public.people_heights
;

-- this will return the correct mode
select height_inches, count(*)
from public.people_heights
group by height_inches
order by count(*) DESC
; 

-- ch3_4 - 
-- Determine the range of values within a dataset
select 
	gender,
	min(height_inches),
	max(height_inches),
	max(height_inches) - min(height_inches) as range
from public.people_heights
group by rollup (gender)
order by range
;



