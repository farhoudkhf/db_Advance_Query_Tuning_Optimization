-- sandbox II, build004 - sandbox2_bld004.sql
select *
from pg_catalog.pg_tables
where 	schemaname != 'pg_catalog' 
		and
		schemaname != 'information_schema'
order by schemaname, tablename
;

select * from certificate.orgs order by org_id;
insert into certificate.orgs(org_name)
values ('Udemy');

delete from certificate.orgs
where org_name ~* 'udemy';

select * from certificate.platforms;
-- Udemy, Inc.
insert into certificate.platforms(platform_name)
values ('Udemy, Inc.');

delete from certificate.platforms
where platform_name ~* 'udemy';

select * from certificate.certificates order by cert_id;

-- find any duplicate name
select cert_name, count(*)
from certificate.certificates
group by cert_name
having count(*) > 1;








