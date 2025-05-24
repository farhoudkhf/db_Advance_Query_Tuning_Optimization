-------------------------------------------------------------------------------------------------------------
-- Part 7 ---------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- REPEATABLE READ


----- Session A
-- Paste both commands in and just hit the play button to run all

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT * FROM bank_accounts;

-- We see the data present

----- Session A
-- Execute the commands by selecting and running one at a time

SELECT * FROM bank_accounts;

COMMIT;

-- Multiple reads in the same transaction got different results 

--------

-- To avoid this we can use repeatable read isolation level

----- Session A
-- Paste both commands in and just hit the play button to run all

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM bank_accounts;

-- We see the balance is now 10000 for Jack


----- Session B



----- Session A

-- Add this command to the bottom, select it and hit F5
SELECT * FROM bank_accounts;

-- We see the balance did not change in Session A tt is still 10000 for Jack

-- Now let's commit and see in Session A

-- Paste both commands, select both, and run both


COMMIT;

SELECT * FROM bank_accounts;

-- We see now the balance is changed to 20000
