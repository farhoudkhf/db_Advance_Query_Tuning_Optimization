-- # Rank
SELECT document_text, ts_rank(to_tsvector(document_text), to_tsquery('life|fear')) AS rank
FROM documents
ORDER BY rank DESC
LIMIT 10;


SELECT document_text, ts_rank(to_tsvector(document_text), to_tsquery('never')) AS rank
FROM documents
ORDER BY rank DESC
LIMIT 10;




-- ########################## demo-07-FullTextSearchInDictionories ##########################

-- # Stop Words

-- # Stop words are words that are very common, appear in almost every document, 
-- # and have no discrimination value. 
-- # Therefore, they can be ignored in the context of full text searching.

SELECT to_tsvector('english', 'welcome to the postgres tutorial');

-- output 
--        to_tsvector
----------------------------
-- 'postgr':4 'tutori':5 'welcom':1

-- # The missing positions 2,3 are because of stop words.

-- # Ranks calculated for documents with and without stop words are quite different

SELECT ts_rank_cd (to_tsvector('english', 'welcome to the postgres tutorial'), to_tsquery('welcome & tutorial'));

-- # Following is the output
-- ts_rank_cd
--------------
--       0.025


SELECT ts_rank_cd (to_tsvector('english', 'welcome postgres tutorial'), to_tsquery('welcome & tutorial'));

-- ts_rank_cd
--------------
--        0.05