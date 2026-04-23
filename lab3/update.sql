UPDATE Users
SET "password" = 'abc123'
WHERE user_id = 2;

SELECT * FROM Users;


UPDATE Currencies
SET code_name = 'example'
WHERE currency_id = 6;

SELECT * FROM Currencies;


UPDATE Categories
SET category_type = 'Spending'
WHERE category_id = 4;

SELECT * FROM Categories;


UPDATE Subcategories
SET subcategory_name = 'updateexample'
WHERE category_id = 2;

SELECT * FROM Subcategories;


UPDATE Profiles
SET email = 'updateexample@email.aaaa'
WHERE profile_id = 4;

SELECT * FROM Profiles;


UPDATE Accounts
SET balance = 0
WHERE account_id = 5;

SELECT * FROM Accounts;


UPDATE Transfers
SET transfer_comment = 'example1'
WHERE transfer_id = 2;

SELECT * FROM Transfers;


UPDATE RecurringPayments
SET "interval" = '10 years'
WHERE payment_id = 2;

SELECT * FROM RecurringPayments;


UPDATE Transactions
SET description = 'update example description'
WHERE transaction_id = 1;

SELECT * FROM Transactions;
