----- Session B
-- Paste in all commands and just hit the play button to execute all


BEGIN;

UPDATE bank_accounts 
SET balance = 10000
WHERE name = 'Jack';

COMMIT;

SELECT * FROM bank_accounts;


-- The balance for Jack should be 10000


----- Session B
-- Paste all commands in and just hit the play button to run all

BEGIN;

UPDATE bank_accounts 
SET balance = 20000
WHERE name = 'Jack';

COMMIT;

SELECT * FROM bank_accounts;

-- We see the balance is now 20000 for Jack

