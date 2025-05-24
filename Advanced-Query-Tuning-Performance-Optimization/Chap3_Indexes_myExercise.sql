-- Index
Explain SELECT count(*) FROM staff;

explain SELECT * 
FROM staff
WHERE email LIKE 'bphillips5%';

CREATE INDEX idx_staff_email
  ON staff(email);

DROP INDEX idx_staff_email;

-- Bitmap
explain SELECT * FROM staff
WHERE job_title = 'operator';

CREATE INDEX idx_staff_job_title
  ON staff(job_title);


-- Hash Index 
CREATE INDEX idx_staff_email
  on staff USING HASH (email);

explain SELECT * 
FROM staff
WHERE email = 'bphillips5@time.com';

DROP INDEX idx_staff_email;

-- Bloom filter index 

