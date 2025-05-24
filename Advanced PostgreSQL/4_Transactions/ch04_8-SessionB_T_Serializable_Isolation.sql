----- Session B
-- Paste all commands in and just hit the play button to run all

BEGIN;

UPDATE bank_accounts 
SET balance = 100000
WHERE name = 'Nancy';

SELECT * FROM bank_accounts;


-- We see the update statement is not completed
-- The query runs for a long time till we commit the transaction in Session A


-- Go back to Session A and commit

----- Session B

-- Now check the query in Session B we see the query has run successfully
-- This is because PostgreSQL places a lock to prevent another update until the first transaction is finished

-- Now commit the second session's transaction (add this command to the very bottom, select, and run)

COMMIT;

SELECT * FROM bank_accounts;

-- Now if we check Nancy's balance it is 10000 and not 0
-- So the first transaction’s change is lost, because the second one “overwrote” the row


---------------

-- To avoid this let's use serialization

----- Session B


BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE bank_accounts 
SET balance = 100000
WHERE name = 'Nancy';

SELECT * FROM bank_accounts;

