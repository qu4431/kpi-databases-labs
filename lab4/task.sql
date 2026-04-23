SELECT profile_id, COUNT(account_id) AS total_accounts
FROM accounts GROUP BY profile_id;

SELECT currency_id, SUM(balance) AS total_balance
FROM accounts GROUP BY currency_id;

SELECT MIN(amount) AS min_transfer, 
MAX(amount) AS max_transfer, 
ROUND(AVG(amount), 2) AS avg_transfer
FROM transfers;

SELECT subcategory_id, SUM(amount) AS total_spent
FROM transactions GROUP BY subcategory_id
HAVING SUM(amount) > 100;

SELECT p.username, a.account_name, c.code_name
FROM profiles p
INNER JOIN accounts a ON p.profile_id = a.profile_id
INNER JOIN currencies c ON a.currency_id = c.currency_id;

SELECT c.category_name, c.category_type,s.subcategory_name
FROM categories c
LEFT JOIN subcategories s ON c.category_id = s.category_id;

SELECT c.currency_name, c.code_name, a.account_name
FROM accounts a
RIGHT JOIN currencies c ON a.currency_id = c.currency_id;

SELECT account_name, balance
FROM accounts
WHERE balance > (SELECT AVG(balance) FROM accounts);

SELECT p.username, p.email, (SELECT COUNT(*) FROM recurringpayments pay
INNER JOIN accounts a ON pay.account_id = a.account_id
WHERE a.profile_id = p.profile_id) AS scheduled_payments_count
FROM profiles p;

SELECT subcategory_id, ROUND(AVG(amount), 2) AS avg_transaction_amount
FROM transactions
GROUP BY subcategory_id
HAVING AVG(amount) > (SELECT AVG(amount) FROM transactions);
