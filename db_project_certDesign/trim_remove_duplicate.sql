-- fine, trim, remove duplicate

select * from certificate.skills;

select skill_id, skill_name from certificate.skills where skill_name ~* '^ ';
-- example
select skill_name, trim(from skill_name) from certificate.skills where skill_name ~* 'sql'

select * from certificate.skills where skill_name ~* 'sql';


-- trim() - remove spaces from start and end of the data 
update certificate.skills
set skill_name = trim(skill_name)
where skill_name = ' SQL'
;

-- count the duplicate names
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


-- trim all
update certificate.skills
set skill_name = trim(skill_name)
;


