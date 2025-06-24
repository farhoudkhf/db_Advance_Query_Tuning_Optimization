insert into certificate.certificates (cert_name)
values ('cert_Sample_01'), ('cert_Sample_02');

select * from certificate.certificates order by cert_id;

select * from certificate.skills;

select * from certificate.skill_lines;

select * from certificate.platforms;

insert into certificate.skills 
;

insert into certificate.certificates (cert_name)
values ('cert_Sample_03'), ('cert_Sample_04'), ('cert_Sample_05'), ('cert_Sample_06')
;

insert into certificate.skill_lines (cert_id, skill_id)
values (
			(select cert_id from certificate.certificates where cert_name ~* '_01'),
			(select skill_id from certificate.skills where skill_name ~* 'python')
)
;

insert into certificate.skill_lines (cert_id, skill_id)
values (
			(select cert_id from certificate.certificates where cert_name ~* '_01'),
			(select skill_id from certificate.skills where skill_name ~* 'Data Analytics')
)
;

select skill_id, skill_name from certificate.skills where skill_name ~* 'Data Analytics';
select skill_id, skill_name from certificate.skills where skill_name ~* '^ ';
select skill_name, trim(from skill_name) from certificate.skills where skill_name ~* 'sql'

select * from certificate.skills where skill_name ~* 'sql';


-- trim() - remove spaces from start and end of the data 
update certificate.skills
set skill_name = trim(skill_name)
where skill_name = ' SQL'
;



select skill_name, count(skill_name)
from certificate.skills
group by skill_name
order by count(skill_name) desc
;

--delete duplicate
DELETE FROM
    certificate.skills a
        USING certificate.skills b
WHERE
    a.skill_id < b.skill_id
    AND a.skill_name = b.skill_name;



SELECT trim(from '   w3resource   ');


delete from certificate.skills where skill_name = ' Data Analytics';



insert into certificate.certificates (cert_name, skill_id)
values ('cert_Sample_03', (
			selelect
			
		)
;


select c.cert_id, c.cert_name, sl.skill_id, s.skill_name
from certificate.certificates c
	join certificate.skill_lines sl on sl.cert_id = c.cert_id 
	join certificate.skills s on s.skill_id = sl.skill_id
;

select cert_id, count(*)
from certificate.skill_lines
group by cert_id;

select * from certificate.platforms;

insert into certificate.platforms (platform_name)
values ('LinkedIn Learn'), ('Microsoft Learn'), ('Cloud Academi'), ('Google'), ('Amazon');

update certificate.certificates
set platform_id = (select platform_id from certificate.platforms where platform_name ~* 'linkedin') 
where cert_name ~* '_02'
;

update certificate.certificates
set platform_id = (select platform_id from certificate.platforms where platform_name ~* 'linkedin') 
where cert_name ~* '_04' or cert_name ~* '_06'
;

update certificate.certificates
set platform_id = (select platform_id from certificate.platforms where platform_name ~* 'Cloud') 
where cert_name ~* '_01'
;

update certificate.certificates
set platform_id = (select platform_id from certificate.platforms where platform_name ~* 'Microsoft') 
where cert_name ~* '_03' or cert_name ~* '_05'
;

update certificate.certificates
set completed_date = '01/02/2024' 
where cert_name ~* '_02'
;

update certificate.certificates
set completed_date = '2025-06-01' 
where cert_name ~* '_03'
;

ALTER TABLE certificate.certificates
DROP COLUMN IF EXISTS skill_id;

select 
	c.cert_name, 
	--sl.skill_id, 
	p.platform_name
from certificate.certificates c
	--join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.platforms p on p.platform_id = c.platform_id
order by c.cert_id;

-- INSERT
insert into certificate.orgs (org_name) values ('cloud academy');
insert into certificate.orgs (org_name) values ('LinkedIn');
insert into certificate.orgs (org_name) values ('Microsoft');
insert into certificate.orgs (org_name) values ('CPE');
insert into certificate.orgs (org_name) values ('PMI');
insert into certificate.orgs (org_name) values ('IIBA');
insert into certificate.orgs (org_name) values ('Atlassian');

select * from certificate.orgs;

select * from certificate.org_lines order by cert_id;


insert into certificate.org_lines (cert_id, org_id) 
values (
		(select cert_id 
			from certificate.certificates 
			where cert_code = 'Certifcate: 21285787'), 1);

insert into certificate.skill_lines (cert_id, skill_id) 
values (
		(select cert_id 
			from certificate.certificates 
			where cert_code = 'Certifcate: 21285787'), 1);


delete from certificate.certificates 
where cert_name ~* '_02' or cert_name ~* '_04';

delete from certificate.certificates 
where cert_name ~* '_01';

select * from certificate.skill_lines
where cert_id = (select cert_id from certificate.certificates 
					where cert_name ~* '_01');

begin;
delete from certificate.skill_lines 
where cert_id = (select cert_id from certificate.certificates 
					where cert_name ~* '_01');
commit;


select c.cert_name, c.course_length 
from certificate.certificates c
order by c.course_length;

-- stats on length of the courses
select 
	count(c.course_length) as "#courses",
	--sum(c.course_length) as total_course_hours,
	to_char(sum(c.course_length), 'hh24') as sum_courseHours,
	to_char(avg(c.course_length), 'hh:mi') as avg_length,
	--avg(c.course_length),	
	to_char(percentile_cont(0.25) 
		within group (order by c.course_length), 'hh:mi') 
			as "first_quartile",
	to_char(percentile_cont(0.5) 
		within group (order by c.course_length), 'hh:mi') 
			as "secont_quartile",
	to_char(percentile_cont(0.75) 
		within group (order by c.course_length), 'hh:mi') 
			as "third_quartile"
from certificate.certificates c
;

-- number of skills cover by each course
select 
	c.cert_name,
	count(sl.skill_line_id)
from 
	certificate.certificates c
	join certificate.skill_lines sl on sl.cert_id = c.cert_id
group by c.cert_id
order by count(sl.skill_line_id) desc
;

-- number of courses that has 
select 
	c.cert_name
from 
	certificate.certificates c
	join certificate.skill_lines sl on sl.cert_id = c.cert_id
	join certificate.skills s on s.skill_id = sl.skill_id
where 
	s.skill_name ~* 'python';



select cert_name, completed_date 
from certificate.certificates 
order by completed_date desc;







