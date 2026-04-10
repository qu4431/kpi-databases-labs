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
