-- We can create triggers for any DML statements
-- Eg, we can create a trigger when a new entry is inserted
-- Or we can create a trigger when a field is updated etc

-- Create an employee table

-- Paste all 3 queries below in and then use select and F5 to run each query
CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   department TEXT NOT NULL,  
   salary INT NOT NULL,
   PRIMARY KEY(id)
);

INSERT INTO employees (first_name, last_name, department, salary)
VALUES 
('Alice', 'Smith', 'Engineering', 125000),
('Bob', 'Baker', 'Sales', 85000);

SELECT * FROM employees;


-- Now let's create a entry table where we audit new employees
CREATE TABLE new_employee_logs (
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  joining_date date NOT NULL
);

-- View all the entries


SELECT * FROM new_employee_logs;

-- We see the table is empty

-- Create a function
CREATE OR REPLACE FUNCTION new_employee_joining_func() RETURNS TRIGGER AS $new_employee_trigger$
   BEGIN
      INSERT INTO new_employee_logs(first_name, last_name, joining_date)
      VALUES (new.first_name, new.last_name, current_timestamp);
      RETURN NEW;
   END;
$new_employee_trigger$ LANGUAGE plpgsql;


-- Now create a trigger for this function (note that this is an AFTER INSERT and a row-level trigger)
CREATE TRIGGER new_employee_trigger 
AFTER INSERT ON employees
FOR EACH ROW 
EXECUTE PROCEDURE new_employee_joining_func();


-- Now let's insert some values within employees table and notice how trigger works
INSERT INTO employees (first_name, last_name, department, salary)
VALUES ('John', 'Watson', 'Sales', 65000);


SELECT * FROM employees;

-- We see the new entry is added

-- Now check the emp_joining_logs table and we see the
-- The name and time on which the new value was added

SELECT * from new_employee_logs;

