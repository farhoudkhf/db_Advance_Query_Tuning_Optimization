-------------------------------------------------------------------------------------------------------------
-- Part 4 ---------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- Rolling back a committed transaction
-- Select one command at a time and execute using F5
----- Session A

BEGIN;

UPDATE bank_accounts
SET balance = balance - 900
WHERE name = 'Jack';

SELECT * FROM bank_accounts;

UPDATE bank_accounts
SET balance = balance + 900
WHERE name = 'Dora';

SELECT * FROM bank_accounts;

COMMIT;

ROLLBACK;

SELECT * FROM bank_accounts;


-- The rollback command should give you a warning, no transaction in progress
-- The table will also have the updates made
-- ie, we cannot rollback a committed transaction
