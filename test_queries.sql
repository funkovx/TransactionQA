-- 1. Successful transfer history for a user
SELECT u.username, a.account_number, t.amount, t.transaction_date
FROM users u
         JOIN accounts a ON u.id = a.user_id
         JOIN transactions t ON a.id = t.account_id
WHERE t.status = 'SUCCESS' AND u.username = 'john';

-- 2. Total debits per account
SELECT a.account_number, SUM(t.amount) as total_spent
FROM accounts a
         JOIN transactions t ON a.id = t.account_id
WHERE t.type = 'DEBIT'
GROUP BY a.account_number
HAVING SUM(t.amount) > 10000;

-- 3. Customers without a single transaction
SELECT u.username
FROM users u
         LEFT JOIN accounts a ON u.id = a.user_id
         LEFT JOIN transactions t ON a.id = t.account_id
WHERE t.id IS NULL;