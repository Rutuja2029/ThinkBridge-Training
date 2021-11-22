CREATE TRIGGER UPDATE_BALANCE ON TRANSACTIONS
AFTER INSERT
AS
UPDATE BANK_ACCOUNT SET
Balance= (SELECT TransactionAmt FROM inserted)
WHERE BANK_ACCOUNT.CustomerId = (SELECT CustomerID FROM inserted);
-----------

UPDATE BANK_ACCOUNT SET
Debit= (SELECT TransactionAmt FROM inserted)
WHERE BANK_ACCOUNT.CustomerId = (SELECT CustomerID FROM inserted);      