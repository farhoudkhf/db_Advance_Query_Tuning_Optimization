-- truncate
truncate certificate.tutors cascade;

-- truncate and restart id
truncate certificate.tutors restart identity cascade;

-- insert into tutors, method_1
begin;

insert into certificate.tutors (tutor_name)
select 'Annyce Davis' 
where not exists
	(select 1 from certificate.tutors where tutor_name = 'Annyce Davis');

insert into certificate.tutors (tutor_name)
select 'Noah Gift' 
where not exists
	(select 1 from certificate.tutors where tutor_name = 'Noah Gift');


-- rollback;

commit;

-- select 1 from certificate.tutors where tutor_name = 'Annyce Davis';

-- insert into tutors, method_2
begin;

if not exists (
	select tutor_name from certificate.tutors where tutor_name = 'Annyce Davis'
	)
	begin 
		insert into certificate.tutors (tutor_name)
		values ('Annyce Davis')
	end;


rollback;

-- commit;

-- not working
-- insert if not exists into certificate.tutors (tutor_name)
-- 		values ('Annyce Davis')

-- not working
insert into certificate.tutors (tutor_id, tutor_name)
values (default, 'Annyce Davis')
on conflict (tutor_name) do nothing;





