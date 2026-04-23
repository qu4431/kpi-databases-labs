SELECT login, "password" FROM Users WHERE reg_date > '2026-1-1';

SELECT code_name FROM Currencies WHERE LENGTH(currency_name) > 7;

SELECT category_name FROM Categories WHERE category_type = 'Spending';

SELECT subcategory_name FROM Subcategories WHERE category_id = 1;

SELECT user_id, email, username FROM Profiles WHERE phone_number % 3 = 0 AND phone_number % 5 = 0 AND main_currency_id != 4;

SELECT account_id, account_name FROM Accounts WHERE balance >= 2000;

SELECT amount, transfer_date FROM Transfers WHERE fee > 0;

SELECT amount FROM RecurringPayments WHERE "interval" < '1 month';

SELECT "date" FROM Transactions WHERE description != '';
