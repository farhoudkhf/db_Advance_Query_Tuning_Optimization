-- chap_02
-- create table 
CREATE TABLE online_courses
(
  id SERIAL PRIMARY KEY, 
  title TEXT NOT NULL, 
  description TEXT NOT NULL
);

-- insert test data
INSERT INTO online_courses (title, description) VALUES
  ('Learning Java', 'A complete course that will help you learn Java in simple steps'),
  ('Advanced Java', 'Master advanced topics in Java, with hands-on examples'),
  ('Introduction to Machine Learning', 'Build and train simple machine learning models'),
  ('Learning Springboot', 'Build web applications in Java using SpringBoot'),
  ('Learning TensorFlow', 'Build and train deep learning models using TensorFlow 2.0'),
  ('Learning PyTorch', 'Build and train deep learning models using PyTorch'),
  ('Introduction to Self-supervised Machine Learning', 'Learn more from your unlabelled data'),
  ('Data Analytics and Visualization', 'Visualize, understand, and explore data using Python'),
  ('Learning SQL', 'Learn SQL programming in 21 days'),
  ('Learning C++', 'Take your first steps in C++ programming'),
  ('Learning Python', 'Take your first steps in Python programming'),
  ('Learning PostgreSQL', 'SQL programming using the PostgreSQL object-relational database'),
  ('Advanced PostgreSQL', 'Master advanced features in PostgreSQL');

-- view example LIKE
SELECT 
    id,
    title,
    description
FROM 
    online_courses
WHERE  
    title LIKE '%java%' OR description LIKE '%java%';

-- view example
SELECT 
    id,
    title,
    description
FROM 
    online_courses
WHERE  
    title LIKE '%Java%' OR description LIKE '%Java%';

-- view example ILIKE
SELECT 
    id,
    title,
    description
FROM 
    online_courses
WHERE  
    title ILIKE '%java%' OR description ILIKE '%java%';