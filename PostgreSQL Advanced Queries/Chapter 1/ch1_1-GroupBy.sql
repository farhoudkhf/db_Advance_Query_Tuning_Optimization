SELECT * 
FROM inventory.products
WHERE price > 20;

SELECT size AS "Product Size", count(*) AS "Number of products"
FROM inventory.products
GROUP BY size
HAVING count(*) > 10
ORDER BY size DESC;
