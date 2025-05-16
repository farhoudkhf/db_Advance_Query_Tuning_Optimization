-- The @@ operator
-- The @@ operator allows to match a query against a document and returns true or false.

-- You can have tsquery @@ tsvector or tsvector @@ tsquery

-- This will return "true"
SELECT 'machine & learning'::tsquery @@ 'Build and train simple machine learning models'::tsvector;

-- This will return "false"
SELECT 'deep & learning'::tsquery @@ 'Build and train simple machine learning models'::tsvector;


-- This will return "true"
SELECT 'Build and train simple machine learning models'::tsvector @@ 'models'::tsquery;

-- This will return "false"
SELECT 'Build and train simple machine learning models'::tsvector @@ 'deep'::tsquery;


-- You can use a tsquery to search against a tsvector or plain text

-- This will return "true"
SELECT to_tsquery('learning & model') @@ to_tsvector('Build and train simple machine learning models');

-- This will return "false"
SELECT to_tsquery('learning & model') @@ 'Build and train simple machine learning models';

