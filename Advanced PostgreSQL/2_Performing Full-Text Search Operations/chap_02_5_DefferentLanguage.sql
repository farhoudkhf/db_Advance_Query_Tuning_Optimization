-- ########
-- We can also have multilingual full search
-- Paste all the commands in one go
-- Select one command at a time and hit F5 to execute
SET default_text_search_config = 'pg_catalog.spanish';

SELECT to_tsvector('english', 'The cake is good');
SELECT to_tsvector('spanish', 'The cake is good');
SELECT to_tsvector('simple', 'The cake is good');

SELECT to_tsvector('english', 'el pastel es bueno');
SELECT to_tsvector('spanish', 'el pastel es bueno');
SELECT to_tsvector('simple', 'el pastel es bueno');


-- # Let's search 
-- # This is the para that we have written in spanish

--     # Welcome to the PostgreSQL tutorial.
--     # PostgreSQL is used to store data.
--     # have a good experience!
SET default_text_search_config = 'pg_catalog.spanish';


SELECT to_tsvector(
  'Bienvenido al tutorial de PostgreSQL.' ||
  'PostgreSQL se utiliza para almacenar datos.' ||
  'tener una buena experiencia!'
) @@ to_tsquery('buena');

-- # We see this is also true as buena is present
-- # Now let's look at another word
SELECT to_tsvector(
  'Bienvenido al tutorial de PostgreSQL.' ||
  'PostgreSQL se utiliza para almacenar datos.' ||
  'tener una buena experiencia!'
) @@ to_tsquery('buen');

-- # We see this also is true as buen and buena mean the same 
-- # Let's search a word that's not present
SELECT to_tsvector(
  'Bienvenido al tutorial de PostgreSQL.' ||
  'PostgreSQL se utiliza para almacenar datos.' ||
  'tener una buena experiencia!'
) @@ to_tsquery('mala');

-- # We see this shows false