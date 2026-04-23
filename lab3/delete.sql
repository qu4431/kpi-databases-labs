DELETE FROM Users
WHERE user_id = 6;

SELECT * FROM Users;


DELETE FROM Currencies
WHERE currency_id = 6;

SELECT * FROM Currencies;


DELETE FROM Categories
WHERE category_id = 4;

SELECT * FROM Categories;


DELETE FROM Subcategories
WHERE subcategory_id != 4 AND subcategory_id != 3 AND subcategory_name = 'updateexample';

SELECT * FROM Subcategories;


DELETE FROM Profiles
WHERE username = 'usernameforexample';

SELECT * FROM Profiles;


DELETE FROM Accounts
WHERE account_id = 7;

SELECT * FROM Accounts;


DELETE FROM Transfers
WHERE fee = 123;

SELECT * FROM Transfers;


DELETE FROM RecurringPayments
WHERE "interval" = '10 year';

SELECT * FROM RecurringPayments;


DELETE FROM Transactions
WHERE transaction_id = 4;

SELECT * FROM Transactions;
