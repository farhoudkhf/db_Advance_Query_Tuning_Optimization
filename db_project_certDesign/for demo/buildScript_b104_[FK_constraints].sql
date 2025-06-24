-- buildScript_b104 with foreign keys' constraints
BEGIN;


CREATE TABLE IF NOT EXISTS certificate.certificates
(
    cert_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cert_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    completed_date date,
    course_length time without time zone,
    study_time time without time zone,
    platform_id integer,
    showcase boolean,
    cert_code character varying(255) COLLATE pg_catalog."default",
    cloud_path character varying(255) COLLATE pg_catalog."default",
    exam_score integer,
    hands_on boolean,
    repo character varying(255) COLLATE pg_catalog."default",
    posted_linkedin timestamp without time zone,
    note character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT certificates_pkey PRIMARY KEY (cert_id)
);

ALTER TABLE certificate.certificates
ALTER COLUMN exam_score TYPE decimal;

CREATE TABLE IF NOT EXISTS certificate.org_lines
(
    org_line_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cert_id integer,
    org_id integer,
    CONSTRAINT org_lines_pkey PRIMARY KEY (org_line_id)
);

CREATE TABLE IF NOT EXISTS certificate.orgs
(
    org_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    org_name character varying(255) COLLATE pg_catalog."default",
    org_description text COLLATE pg_catalog."default",
    CONSTRAINT orgs_pkey PRIMARY KEY (org_id)
);

CREATE TABLE IF NOT EXISTS certificate.platforms
(
    platform_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    platform_name character varying(255) COLLATE pg_catalog."default",
    platform_note character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT platforms_pkey PRIMARY KEY (platform_id)
);

CREATE TABLE IF NOT EXISTS certificate.skill_lines
(
    skill_line_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cert_id integer,
    skill_id integer,
    CONSTRAINT skill_lines_pkey PRIMARY KEY (skill_line_id)
);

CREATE TABLE IF NOT EXISTS certificate.skills
(
    skill_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    skill_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    skill_description character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT skills_pkey PRIMARY KEY (skill_id)
);

CREATE TABLE IF NOT EXISTS certificate.tutor_lines
(
    tutor_line_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cert_id integer,
    tutor_id integer,
    CONSTRAINT tutor_lines_pkey PRIMARY KEY (tutor_line_id)
);

CREATE TABLE IF NOT EXISTS certificate.tutors
(
    tutor_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    tutor_name character varying(255) COLLATE pg_catalog."default",
    tutor_note character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT tutors_pkey PRIMARY KEY (tutor_id)
);

CREATE TABLE IF NOT EXISTS employee.emp_cert_lines
(
    emp_cert_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    emp_id integer,
    cert_id integer,
    CONSTRAINT emp_cert_line_pkey PRIMARY KEY (emp_cert_id)
);

CREATE TABLE IF NOT EXISTS employee.employees
(
    emp_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 9000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    firstname character varying(255) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(255) COLLATE pg_catalog."default" NOT NULL,
    start_date date,
    department_id integer,
    emp_note text COLLATE pg_catalog."default",
    CONSTRAINT employees_pkey PRIMARY KEY (emp_id)
);

ALTER TABLE IF EXISTS certificate.certificates
    ADD CONSTRAINT certificates_platform_id_fkey FOREIGN KEY (platform_id)
    REFERENCES certificate.platforms (platform_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.org_lines
    ADD CONSTRAINT org_lines_cert_id_fkey FOREIGN KEY (cert_id)
    REFERENCES certificate.certificates (cert_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.org_lines
    ADD CONSTRAINT org_lines_org_id_fkey FOREIGN KEY (org_id)
    REFERENCES certificate.orgs (org_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.skill_lines
    ADD CONSTRAINT skill_lines_cert_id_fkey FOREIGN KEY (cert_id)
    REFERENCES certificate.certificates (cert_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.skill_lines
    ADD CONSTRAINT skill_lines_cert_id_fkey1 FOREIGN KEY (cert_id)
    REFERENCES certificate.certificates (cert_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.skill_lines
    ADD CONSTRAINT skill_lines_skill_id_fkey FOREIGN KEY (skill_id)
    REFERENCES certificate.skills (skill_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.skill_lines
    ADD CONSTRAINT skill_lines_skill_id_fkey1 FOREIGN KEY (skill_id)
    REFERENCES certificate.skills (skill_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.tutor_lines
    ADD CONSTRAINT tutor_lines_cert_id_fkey1 FOREIGN KEY (cert_id)
    REFERENCES certificate.certificates (cert_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS certificate.tutor_lines
    ADD CONSTRAINT tutor_lines_tutor_id_fkey1 FOREIGN KEY (tutor_id)
    REFERENCES certificate.tutors (tutor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS employee.emp_cert_lines
    ADD CONSTRAINT emp_cert_lines_cert_id_fkey FOREIGN KEY (cert_id)
    REFERENCES certificate.certificates (cert_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS employee.emp_cert_lines
    ADD CONSTRAINT emp_cert_lines_emp_id_fkey FOREIGN KEY (emp_id)
    REFERENCES employee.employees (emp_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;