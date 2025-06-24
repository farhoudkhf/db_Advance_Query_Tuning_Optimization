-- number of skills covered by each course that includes 'python' in its skills
select
	c.cert_name,
	count(sl.cert_id) as py_and_other_skills
from 
	certificate.certificates c
	join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.skills s on s.skill_id = sl.skill_id
where c.cert_id in
		(select 
			sl.cert_id
		from 
			certificate.certificates c
			join certificate.skill_lines sl on sl.cert_id = c.cert_id
			join certificate.skills s on s.skill_id = sl.skill_id
		where s.skill_name ~* 'python'
		group by sl.cert_id)
group by c.cert_name;


-- number of skills covered by each course that includes 'R' in its skills
--use of reg_ex
select
	c.cert_name,
	count(sl.cert_id) as py_and_other_skills
from 
	certificate.certificates c
	join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.skills s on s.skill_id = sl.skill_id
where c.cert_id in
		(select 
			sl.cert_id
		from 
			certificate.certificates c
			join certificate.skill_lines sl on sl.cert_id = c.cert_id
			join certificate.skills s on s.skill_id = sl.skill_id
		where s.skill_name ~ 'R'
		group by sl.cert_id)
group by c.cert_name;


-- Report on skills covered by each course that includes 'R' in its skills
select
	row_number() over (partition by c.cert_name order by c.cert_name),
	c.cert_name,
	s.skill_name
from 
	certificate.certificates c
	join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.skills s on s.skill_id = sl.skill_id
where c.cert_id in
		(select 
			sl.cert_id
		from 
			certificate.certificates c
			join certificate.skill_lines sl on sl.cert_id = c.cert_id
			join certificate.skills s on s.skill_id = sl.skill_id
		where s.skill_name ~ 'R'
		group by sl.cert_id)
group by c.cert_name, s.skill_name
order by c.cert_name;