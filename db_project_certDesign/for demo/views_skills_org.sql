-- create a view that displays the skills covered by each course, ordered by skills
create view certs_skills as
SELECT
	c.cert_name,
	s.skill_name,
	to_char(c.course_length, 'hh24:mi') as course_length
FROM
	certificate.certificates c 
  	join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.skills s on s.skill_id = sl.skill_id
order by s.skill_name;


-- create a view - displays the skills covered by each course, 
-- along with the issuing organization, ordered by the respective organizations
create view certs_skills_orgs as
SELECT
	c.cert_name,
	s.skill_name,
	to_char(c.course_length, 'hh24:mi') as course_length,
	o.org_name
FROM
	certificate.certificates c 
  	join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.skills s on s.skill_id = sl.skill_id
	join certificate.org_lines ol on ol.cert_id = c.cert_id
	join certificate.orgs o on o.org_id = ol.org_id
order by o.org_name;