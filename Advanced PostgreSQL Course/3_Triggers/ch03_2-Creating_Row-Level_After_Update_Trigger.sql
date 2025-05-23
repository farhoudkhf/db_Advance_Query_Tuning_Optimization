-- Now let's create a trigger when a value in a table is updated
-- Create another table for auditing salary increment

CREATE TABLE employee_salary_logs (
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   old_salary INT NOT NULL,
   incremented_salary INT NOT NULL,
   incremented_on DATE NOT NULL
);

-- Now let's create a function
-- If the salary is incremented, then let's aduit the last name and the time we incremented the salary and what the old salary and new salary is

CREATE OR REPLACE FUNCTION employee_salary_update_func()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
  IF NEW.salary <> OLD.salary THEN
     INSERT INTO employee_salary_logs(first_name, last_name, old_salary, incremented_salary, incremented_on)
     VALUES(OLD.first_name, OLD.last_name, OLD.salary, NEW.salary, now());
  END IF;

  RETURN NEW;
END;
$$


-- Let's create the trigger

CREATE TRIGGER employee_salary_update_trigger
  AFTER UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE employee_salary_update_func();


-- Now let's view the employees table entires

SELECT * FROM employees;

-- Let's update the salary of an employee

UPDATE employees
SET salary = 75000
WHERE last_name = 'Watson'; 


SELECT * FROM employees;

-- We see the value is changed
-- Now let's observe the audits table

SELECT * FROM employee_salary_logs;

-- We see the old salary, new salary and the time on which we changed the salary


-- One more update, increment all salaries by 10%

UPDATE employees
SET salary = 1.1 * salary

-- Again check (there should be a total of 4 entries, 2 for Watson)

SELECT * FROM employee_salary_logs;