-------------------------------------------------------------------------------------------------------------
-- Part 3 ---------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- Rolling back a transaction
-- Paste both commands in at one go and execute both at one go

----- Session A
INSERT INTO bank_accounts(name, balance)
VALUES('Jack', 1000);

SELECT * FROM bank_accounts;

-- Should see 3 records in the database Charlie, Dora, and Jack

----- Session A

-- Rollback a transaction

-- Paste all the commands below so they can be seen in the same window

-- Select one command at a time and execute using F5

BEGIN;

UPDATE bank_accounts
SET balance = balance - 1500
WHERE name = 'Jack';

SELECT * FROM bank_accounts;

UPDATE bank_accounts
SET balance = balance + 1500
WHERE name = 'Dora';

SELECT * FROM bank_accounts;

ROLLBACK;

SELECT * FROM bank_accounts;

-- At the end should see 3 records
-- "Charlie" 9900
-- "Dora"  25100
-- "Jack"  1000

