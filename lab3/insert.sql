INSERT INTO Users (user_id, login, "password", reg_date)
VALUES (6, 'newLoginLab3', 'passwordnewinsertion', NOW());

SELECT * FROM Users;


INSERT INTO Currencies (currency_id, code_name, currency_name)
VALUES (6, 'BTC', 'Bitcoin');

SELECT * FROM Currencies;


INSERT INTO Categories (category_id, category_name, category_type)
VALUES (4, 'example category', 'Income');

SELECT * FROM Categories;


INSERT INTO Subcategories (subcategory_id, category_id, subcategory_name)
VALUES (8,2,'example subcategory');

SELECT * FROM Subcategories;


INSERT INTO Profiles (profile_id, phone_number, email, user_id, username, main_currency_id)
VALUES (7,435454446,'example@exampleexample.com',1,'usernameforexample',1);

SELECT * FROM Profiles;


INSERT INTO Accounts (account_id, account_name, currency_id, profile_id, balance)
VALUES (7,'example account', 1, 1, 9999.97);

SELECT * FROM Accounts;


INSERT INTO Transfers (transfer_id, sender_account_id, payee_account_id, amount, fee, transfer_date, transfer_comment)
VALUES (4,1,2,123123.12,123,NOW(),'example');

SELECT * FROM Transfers;


INSERT INTO RecurringPayments (payment_id, amount, account_id, subcategory_id, "interval", next_payment_date)
VALUES (4, 9992.11, 2, 1, '1 year', '2026-6-6');

SELECT * FROM RecurringPayments;


INSERT INTO Transactions (transaction_id, account_id, subcategory_id, amount, "date", description)
VALUES (4,1,2,2093,NOW(),'example');

SELECT * FROM Transactions;
