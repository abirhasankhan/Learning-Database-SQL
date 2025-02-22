-- Lab Task # 01 (Schema Definition):

-- i) account
CREATE TABLE account(
account_no CHAR(5),
balance NUMBER NOT NULL,
CONSTRAINT balance_ckeck CHECK (balance >= 0),
PRIMARY KEY (account_no)
);

-- ii) customer
CREATE TABLE customer(
customer_no CHAR(5),
customer_name VARCHAR2(20) NOT NULL,
customer_city VARCHAR(10),
PRIMARY KEY (customer_no)
);

-- iii) depositor
CREATE TABLE depositor(
account_no CHAR(5),
customer_no CHAR(5),
PRIMARY KEY (account_no, customer_no)
);


-- Lab Task # 02 (Schema Modification):

-- i. Write SQL statement to add a new attribute ‘date_of_birth’ (date type) in customer table.
ALTER TABLE customer
ADD date_of_birth DATE;

-- ii. Write SQL statement to drop the attribute ‘date_of_birth’ from customer table.
ALTER TABLE customer 
DROP COLUMN date_of_birth;

-- iii. Write SQL statement to rename the attribute account_no, customer_no from depositor table to a_no and c_no, respectively.
ALTER TABLE depositor 
RENAME COLUMN account_no TO a_no;

ALTER TABLE depositor 
RENAME COLUMN customer_no TO c_no;

-- iv. Write SQL statements to add two foreign key constraints ‘depositor_fk1’ and ‘depositor_fk2’ which identifies a_no and c_no as a foreign key.
ALTER TABLE depositor
ADD CONSTRAINT depositor_fk1 
FOREIGN KEY (a_no) REFERENCES account (account_no);

ALTER TABLE depositor
ADD CONSTRAINT depositor_fk2 
FOREIGN KEY (c_no) REFERENCES customer (customer_no);


-- Lab Task # 03 (Inserting Records into Tables):

-- Account
insert into account values('A-101', 12000);
insert into account values('A-102', 6000);
insert into account values('A-103', 2500);

-- Customer
insert into customer values('C-101', 'Alice', 'Dhaka');
insert into customer values('C-102', 'Annie', 'Dhaka');
insert into customer values('C-103', 'Bob', 'Chittagong');
insert into customer values('C-104', 'Charlie', 'Khulna');

-- Depositor
insert into depositor values('A-101', 'C-101');
insert into depositor values('A-103', 'C-102');
insert into depositor values('A-103', 'C-104');
insert into depositor values('A-102', 'C-103');


-- Lab Task # 04 (Queries):

-- 1.
SELECT customer_name, customer_city
FROM customer;

-- 2.
SELECT DISTINCT customer_city
FROM customer;

-- 3.
SELECT account_no
FROM account
WHERE (balance > 7000);

-- 4.
SELECT customer_no, customer_name
FROM customer
WHERE (customer_city = 'Khulna');

-- 5.
SELECT customer_no, customer_name
FROM customer
WHERE (customer_city != 'Dhaka');

-- 6.
SELECT C.customer_name, C.customer_city
FROM customer C, depositor D, account A
WHERE (C.customer_no = D.c_no AND A.account_no = D.a_no) AND (A.balance > 7000);

-- 7. 
SELECT C.customer_name, C.customer_city
FROM customer C, depositor D, account A
WHERE (C.customer_no = D.c_no AND A.account_no = D.a_no) AND (A.balance > 7000 AND C.customer_city != 'Khulna');

-- 8.
SELECT account_no, balance
FROM customer C, depositor D, account A
WHERE (C.customer_no = D.c_no AND A.account_no = D.a_no) AND (C.customer_no = 'C-102');

-- 9.
SELECT A.account_no, A.balance
FROM customer C, depositor D, account A
WHERE (C.customer_no = D.c_no AND A.account_no = D.a_no) AND (C.customer_city = 'Dhaka' OR C.customer_city = 'Khulna');

-- 10.
SELECT C.customer_no, C.customer_name
FROM customer C, depositor D, account A
WHERE (C.customer_no = D.c_no AND A.account_no = D.a_no) AND ( C.customer_no = D.c_no AND A.account_no = NULL AND A.balance = NULL);


