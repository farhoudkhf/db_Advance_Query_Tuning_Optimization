-------------------------------------------------------------------------------------------------------------
-- Part 8 ---------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- SERIALIZABLE
-- Concurrent changes should be blocked and for that we can use serialization isolation level

-- Let's begin a transaction and update the balance for Nancy

----- Session A
-- Paste all commands in and just hit the play button to run all

BEGIN;

UPDATE bank_accounts 
SET balance = 0
WHERE name = 'Nancy';

SELECT * FROM bank_accounts;

-- We see the balance is updated Nancy should have 0 balance

----- Session B

----- Session A
-- Add this to the very bottom, select, and hit F5

COMMIT;


----- Session B

----- Session A
-- Paste all commands in and just hit the play button to run all

BEGIN;

UPDATE bank_accounts 
SET balance = 0
WHERE name = 'Nancy';

SELECT * FROM bank_accounts;


-- Here Nancy's balance should be 0

----- Session B


-- We see the query will not end

-- Go back to Session A and commit

----- Session A
-- Add this to the very bottom, select, and hit F5

COMMIT;


-- Now check Session B and we see the query is not executed
-- It throws error:
-- ERROR:  could not serialize access due to concurrent update


