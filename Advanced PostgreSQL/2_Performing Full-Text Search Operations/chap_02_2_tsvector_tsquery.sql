-- tsvector
-- The to_tsvector function parses an input text and converts it to the search type that represents a searchable document. For instance:
-- Run the following query
SELECT to_tsvector('Visualize, understand, and explore data using Python');

-- result: ('data':5 'explor':4 'python':7 'understand':2 'use':6 'visual':1)
-- the result is a list of lexemes ready to be searched
-- stop words ("in", "a", "the", etc) were removed
-- the numbers are the position of the lexemes in the document

-- tsquery
-- The to_tsquery function parses an input text and converts it to the search type that represents a query. 
-- For instance, the user wants to search "java in a nutshell":
SELECT to_tsquery('The & machine & learning');

-- result: ('machin' & 'learn')
-- the result is a list of tokens ready to be queried
-- stop words ("in", "a", "the", etc) were removed

SELECT websearch_to_tsquery('The machine learning');

-- result: ('machin' & 'learn')