/*
-- Regular Expression Usage
'input string' [match operator] [character sequence]

-- Regular Expression Match Operators
~       matches string case sensitive
~*      matches string case insensitive
!~      excludes string case sensitive
!~*     excludes string case insensitive

-- Regular Expression Character Sequences
~ 'abc'       matches to the string 'abc' only: 'abcd', 'xabcy'
~ 'c.t'       . matches any single character: 'cat', 'cot', but not 'coat'
~ '(at|an)'     | inside ( ) indicates OR: will match 'boat', 'plane', but not 'train'
~ '[abc]'     [ ] defines a character set: 'cat', 'boy', but not 'dog'
~ '^a'        ^ anchors the pattern to the start: 'apple', but not 'banana'
~ 'a$'        $ anchors the pattern to the end: 'banana', but not 'apple'

*/

-- Experiment with Regular Expressions
SELECT 'abracadabra' ~ 'ca';
SELECT 'abracadabra' ~ 'abc';
SELECT 'abracadabra' ~ 'ab..c';
SELECT 'abracadabra' ~ 'ax|ay|ac';
SELECT 'abracadabra' ~ '[xyz]';
SELECT 'abracadabra' ~ '^c';
SELECT 'abracadabra' ~ 'a$';



-- Use Regular Expressions in queries

SELECT product_name
FROM inventory.products;


-- Match string anywhere
SELECT product_name
FROM inventory.products
WHERE product_name ~ 'f';

-- Match case insenstively
SELECT product_name
FROM inventory.products
WHERE product_name ~* 'f';

-- Match string anchored to beginning
SELECT product_name
FROM inventory.products
WHERE product_name ~* '^f';

-- Exclude string anchored to beginning
SELECT product_name
FROM inventory.products
WHERE product_name !~* '^f';

-- Count products that meet a criteria
SELECT count(product_name)
FROM inventory.products
WHERE product_name ~* 'infused';

-- Do the same with a case insensitive LIKE operator
SELECT count(product_name)
FROM inventory.products
WHERE product_name ILIKE '%infused%';
