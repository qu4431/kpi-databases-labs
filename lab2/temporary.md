## Creating tables
```sql
CREATE TABLE Users (
	user_id SERIAL PRIMARY KEY,
	login VARCHAR(64) NOT NULL CHECK (login ~ '^[a-zA-Z0-9]+$'),
	"password" VARCHAR(64) NOT NULL,
	reg_date TIMESTAMP NOT NULL
);

CREATE TABLE Currencies (
	currency_id SERIAL PRIMARY KEY,
	code_name VARCHAR(8) NOT NULL,
	currency_name VARCHAR(32) NOT NULL
);

CREATE TABLE Categories (
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(64) NOT NULL,
	category_type VARCHAR(8) NOT NULL
);

CREATE TABLE Subcategories (
	subcategory_id SERIAL PRIMARY KEY,
	category_id INTEGER REFERENCES Categories(category_id),
	subcategory_name VARCHAR(64) NOT NULL
);

CREATE TABLE Profiles (
	profile_id SERIAL PRIMARY KEY,
	phone_number INTEGER,
	email VARCHAR(100),
	user_id INTEGER REFERENCES Users(user_id),
	username VARCHAR(32) NOT NULL,
	main_currency_id INTEGER REFERENCES Currencies(currency_id)
);

CREATE TABLE Accounts (
	account_id SERIAL PRIMARY KEY,
	account_name VARCHAR(32) NOT NULL,
	currency_id INTEGER REFERENCES Currencies(currency_id),
	profile_id INTEGER REFERENCES Profiles(profile_id),
	balance NUMERIC(9,2) CHECK(balance >=0)
);

CREATE TABLE Transfers (
	transfer_id SERIAL PRIMARY KEY,
	sender_account_id INTEGER REFERENCES Accounts(account_id),
	payee_account_id INTEGER REFERENCES Accounts(account_id),
	amount NUMERIC(9,2) NOT NULL CHECK(amount>0),
	fee NUMERIC(8,2),
	transfer_date TIMESTAMP NOT NULL,
	transfer_comment TEXT
);

CREATE TABLE RecurringPayments (
	payment_id SERIAL PRIMARY KEY,
	amount NUMERIC(9,2) NOT NULL CHECK(amount>0),
	account_id INTEGER REFERENCES Accounts(account_id),
	subcategory_id INTEGER REFERENCES Subcategories(subcategory_id),
	"interval" INTERVAL NOT NULL CHECK("interval">INTERVAL '1 second'),
	next_payment_date TIMESTAMP NOT NULL
);

CREATE TABLE Transactions (
	transaction_id SERIAL PRIMARY KEY,
	account_id INTEGER REFERENCES Accounts(account_id),
	subcategory_id INTEGER REFERENCES Subcategories(subcategory_id),
	amount NUMERIC(9,2) NOT NULL CHECK(amount>0),
	"date" TIMESTAMP NOT NULL,
	description TEXT
);
```
***
## Insertions to tables
```sql
INSERT INTO Users (user_id, login, "password", reg_date) VALUES
	(1,'login123','password123','2023-10-23 13:51'),
	(2,'login234','password234','2026-3-15 04:32'),
	(3,'login334','passwordasdSD','2025-3-15 05:52'),
	(4,'login2774','password2222','2026-1-15 05:55'),
	(5,'logINNN','password234','2021-1-1 00:01');

INSERT INTO Currencies (currency_id, code_name, currency_name) VALUES
	(1,'UAH','Hryvnia'),
	(2,'USD','US Dollar'),
	(3,'EUR','Euro'),
	(4,'GBP','British Pound'),
	(5,'CHF','Swiss Franc');

INSERT INTO Categories (category_id, category_name, category_type) VALUES
	(1,'Shops','Spending'),
	(2,'Food','Spending'),
	(3,'Salary','Income');

INSERT INTO Subcategories (subcategory_id, category_id, subcategory_name) VALUES
	(1,1,'Supermarket'),
	(2,1,'Grocery'),
	(3,2,'Cafe'),
	(4,2,'Restaurant'),
	(5,3,'Salary'),
	(6,3,'Scholarship'),
	(7,1,'Subscription');

INSERT INTO Profiles (profile_id, phone_number, email, user_id, username, main_currency_id) VALUES
	(1,182746,'email1@example.com',1,'usernameeeee',1),
	(2,234345,'gsahjf@example.com',2,'aaaaaa',2),
	(3,043853,'mzmncn@example.com',3,'bbbbbb',3),
	(4,274785,'qoqoqo@example.com',4,'cccccc',4),
	(5,599390,'asasas@example.com',5,'5u1',1),
	(6,738853,'xccccc@example.com',5,'5u2',5);

INSERT INTO Accounts (account_id, account_name, currency_id, profile_id, balance) VALUES
	(1,'Debit 1 UAH',1,1,6374.23),
	(2,'Credit 1 USD',2,2,112.03),
	(3,'Debit 1 USD',2,3,333.23),
	(4,'Debit 2 EUR',3,3,2000.00),
	(5,'Cash 1 UAH',1,3,100000.00),
	(6,'Credit 1 CHF',5,6,6277.22);

INSERT INTO Transfers (transfer_id, sender_account_id, payee_account_id, amount, fee, transfer_date, transfer_comment) VALUES
	(1,1,2,100.00,10.00,'2024-10-10 11:21','comment to transfer 1'),
	(2,2,1,222.23,0.00,'2026-4-4 00:22',''),
	(3,5,1,1.00,0.99,'2024-2-1 01:11','');

INSERT INTO RecurringPayments (payment_id, amount, account_id, subcategory_id, "interval", next_payment_date) VALUES
	(1,200.00,5,7,'1 month','2026-4-29'),
	(2,10.00,1,1,'1 week','2026-4-16'),
	(3,9.99,4,3,'2 week','2026-4-23');

INSERT INTO Transactions (transaction_id, account_id, subcategory_id, amount, "date", description) VALUES
	(1,3,2,400.00,'2026-4-13','description to transaction 1'),
	(2,3,5,10000.01,'2026-4-15','salary transaction description'),
	(3,5,1,10.58,'2026-4-11','');
```
