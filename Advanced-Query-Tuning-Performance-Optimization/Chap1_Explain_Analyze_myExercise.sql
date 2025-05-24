SELECT id, desc, category_code
FROM products
WHERE category_code IN 
  ('p17', 'p81', 'u76')
;

SELECT * FROM products LIMIT 15;

Explain Analyze SELECT * FROM staff;
