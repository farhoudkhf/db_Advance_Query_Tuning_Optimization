-------------------------------------------------------------------------------------------------------------
-- Part 6 ---------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- Transaction isolation levels READ COMMITTED by default

-- Here we will use both Session A and Session B


-- Paste both commands in - then select each command and run using F5

-- First only select BEGIN and the INSERT COMMAND and run

BEGIN;

INSERT INTO bank_accounts(name, balance)
VALUES('Nancy', 15000);


-- Run in the current session (you should be able to see the record for Nancy)

SELECT * FROM bank_accounts;


----- Session A

-- Commit the transaction

COMMIT;

