-- logical oprator
-- Let's perform the basic full-text search
SELECT *
FROM online_courses
WHERE to_tsquery('learn') @@ to_tsvector(title);

-- # Search using or
SELECT * 
FROM online_courses
WHERE to_tsquery('machine | deep') @@ to_tsvector(title || description);

-- # Search using not
SELECT * 
FROM 
    online_courses, 
    to_tsvector(title || description) document
WHERE to_tsquery('programming & !days') @@ document;
