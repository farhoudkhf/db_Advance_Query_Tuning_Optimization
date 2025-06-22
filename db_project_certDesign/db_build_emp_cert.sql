SELECT *
FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND
    schemaname != 'information_schema';

--keep certification for test, this table and schema will be removed
select * from certification.certificate;

-- cleare tables and schema
DROP TABLE IF EXISTS certificate.skill_lines;
DROP TABLE IF EXISTS certificate.skills;
DROP TABLE IF EXISTS certificate.tutor_lines;
DROP TABLE IF EXISTS certificate.tutors;
DROP TABLE IF EXISTS certificate.platforms;
DROP TABLE IF EXISTS certificate.org_lines;
DROP TABLE IF EXISTS certificate.orgs;
DROP TABLE IF EXISTS certificate.certificates;
DROP SCHEMA IF EXISTS certificate;
DROP TABLE IF EXISTS employee.employees;
DROP SCHEMA IF EXISTS employee;


-- Create the database schemas
CREATE SCHEMA employee;
CREATE SCHEMA certificate;


-- Create a table for the db_portfolio - certificates [tbl#1]
CREATE TABLE certificate.certificates (
    cert_id         INT GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    cert_name       VARCHAR(255) NOT NULL,
    completed_date  DATE,
    course_length   TIME,
    study_time      TIME,
    skill_id        INT,
    platform_id     INT,
    issuing_org_id  INT, 
    showcase        BOOLEAN,
    cert_code       VARCHAR(255),
    cloud_path      VARCHAR(255),
    exam_score      INT,
    hands_on        BOOLEAN,
    repo            VARCHAR(255),
    posted_linkedin TIMESTAMP,
    tutor_id        INT,
    note            VARCHAR(50)
);

ALTER TABLE certificate.certificates
DROP COLUMN IF EXISTS skill_id;

ALTER TABLE certificate.certificates
DROP COLUMN IF EXISTS tutor_id;


-- Create a table for the db_portfolio -  skills [tbl#2]
CREATE TABLE certificate.skills (
    skill_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    skill_name  VARCHAR(50) NOT NULL,
    skill_description VARCHAR(50)
);

-- Create a table for the db_portfolio - skill_lines [tbl#3]
CREATE TABLE certificate.skill_lines (
    skill_line_id   INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    cert_id         INT,
    skill_id        INT
);

select * from certificate.skills where skill_name ~* 'python';
delete from certificate.skills where skill_name ~* ' python';
delete from certificate.skills where skill_name = 'Python (Programming Language';
select * from certificate.skills;


-- Create a table for the db_portfolio - platforms [tbl#4]
CREATE TABLE certificate.platforms (
    platform_id     INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    platform_name   VARCHAR(255),
    platform_note   VARCHAR(255)
);

-- Create a table for the db_portfolio - tutors [tbl#5]
CREATE TABLE certificate.tutors (
    tutor_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    tutor_name  VARCHAR(255),
    tutor_note VARCHAR(255)
);

-- Create a table for the db_portfolio - tutor_lines [tbl#6]
CREATE TABLE certificate.tutor_lines (
    tutor_line_id    INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    cert_id         INT,
    tutor_id        INT
);








