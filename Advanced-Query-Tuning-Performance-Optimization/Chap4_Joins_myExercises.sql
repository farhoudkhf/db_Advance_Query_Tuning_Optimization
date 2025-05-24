-- 
Explain SELECT s.id, s.last_name, cr.country
FROM staff s
INNER JOIN company_regions cr 
ON cr.region_id = s.region_id;

-- force to use nested loop
SET enable_nestloop=true;
SET enable_hashjoin=false;
SET enable_mergejoin=false; 

Explain SELECT s.id, s.last_name, cr.country
FROM staff s
INNER JOIN company_regions cr 
ON cr.region_id = s.region_id;

-- Hash Join
SET enable_nestloop=false;
SET enable_hashjoin=true;
SET enable_mergejoin=false; 

Explain SELECT 
s.id, 
s.last_name,
s.job_title, 
cr.country
FROM staff s
INNER JOIN company_regions cr 
ON cr.region_id = s.region_id;

-- Merge Join
SET enable_nestloop=false;
SET enable_hashjoin=false;
SET enable_mergejoin=true; 

Explain SELECT 
s.id, 
s.last_name, 
s.job_title,
cr.country
FROM staff s
INNER JOIN company_regions cr 
ON cr.region_id = s.region_id;