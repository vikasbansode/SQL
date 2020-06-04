-- TRANSACTIONS

BEGIN Transaction
Update tblSalesAgent set SalesAmount = 200
WHERE SalesAgent = 'John' AND SalesCountry = 'US' AND SalesAmount = 180
Commit Tran --- To complete to transaction
Rollback Tran -- Undo Transaction

-- To see uncommitted data use below statement
SET Transaction Isolation Level READ Uncommitted