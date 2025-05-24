-------------------------------------------------------------------------------------------------------------
-- Part 5 ---------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- Savepoints
-- Paste all the commands below so they can be seen in the same window
-- Select one command at a time and execute using F5

----- Session A

BEGIN;

INSERT INTO bank_accounts(name, balance)
VALUES('Julia', 100000);

SAVEPOINT inserted_julia;

SELECT * FROM bank_accounts;

UPDATE bank_accounts
SET balance = balance - 2000
WHERE name = 'Julia';

UPDATE bank_accounts
SET balance = balance + 2000
WHERE name = 'Jack';

SELECT * FROM bank_accounts;

ROLLBACK TO SAVEPOINT inserted_julia;

SELECT * FROM bank_accounts;

ROLLBACK;

SELECT * FROM bank_accounts;

-- After rolling back to the savepoint you should be able to see Julia in the bank_accounts

-- After rolling back completely you should see only the original 3 records Charlie, Dora, Jack
