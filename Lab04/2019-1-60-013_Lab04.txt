-- 1
SELECT branch_name, branch_city
FROM branch
WHERE assets > 1000000;

-- 2
SELECT account_number, balance 	
FROM account
WHERE branch_name = 'Downtown' OR balance BETWEEN 600 AND 750;

-- 3
SELECT A.account_number
FROM  account A, branch B
WHERE (A.branch_name = B.branch_name) AND branch_city = 'Rye';

-- 4
SELECT L.loan_number
FROM loan L, customer C, borrower B
WHERE (L.loan_number = B.loan_number AND B.customer_name = C.customer_name) AND amount >= 1000 AND customer_city = 'Harrison';

-- 5
SELECT *
FROM account
ORDER BY balance desc;

-- 6
SELECT *
FROM customer
ORDER BY customer_city;

-- 7
SELECT C.customer_name
FROM customer C, account A, depositor D
WHERE (C.customer_name = D.customer_name AND D.account_number = A.account_number)
intersect 
SELECT C.customer_name
FROM customer C, loan L, borrower B
WHERE (L.loan_number = B.loan_number AND B.customer_name = C.customer_name);

-- 8
SELECT C.customer_name
FROM customer C, account A, depositor D
WHERE (C.customer_name = D.customer_name AND D.account_number = A.account_number)
union
SELECT C.customer_name
FROM customer C, loan L, borrower B
WHERE (L.loan_number = B.loan_number AND B.customer_name = C.customer_name);

-- 9
SELECT C.customer_name, customer_city 
FROM customer C, loan L, borrower B
WHERE (L.loan_number = B.loan_number AND B.customer_name = C.customer_name)
minus
SELECT C.customer_name, customer_city
FROM customer C, account A, depositor D
WHERE (C.customer_name = D.customer_name AND D.account_number = A.account_number);

-- 10
SELECT sum(assets) AS tot_assets
FROM branch;

-- 11
SELECT avg(balance) AS AVG_balance, branch_name
FROM  account
GROUP BY branch_name;

-- 12
SELECT avg(A.balance) AS AVG_balance, B.branch_city
FROM  account A, branch B
WHERE (A.branch_name = B.branch_name)
GROUP BY branch_city;

-- 13
SELECT min(amount)
FROM loan;

-- 14
SELECT count(loan_number), branch_name
FROM loan
GROUP BY branch_name;

-- 15
SELECT C.customer_name, A.account_number
FROM customer C, account A, depositor D
WHERE (C.customer_name = D.customer_name AND D.account_number = A.account_number) AND balance = (SELECT max(balance) from account);





