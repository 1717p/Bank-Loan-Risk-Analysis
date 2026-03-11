-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    income INT,
    employment_type VARCHAR(20),
    credit_score INT
);

-- Create Loans Table
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount INT,
    loan_type VARCHAR(20),
    interest_rate DECIMAL(4,2),
    loan_status VARCHAR(20),
    loan_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Repayments Table
CREATE TABLE repayments (
    repayment_id INT PRIMARY KEY,
    loan_id INT,
    due_date DATE,
    paid_date DATE,
    amount_paid INT,
    default_flag INT,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- Insert data into customers
INSERT INTO customers VALUES
(1, 28, 'Male', 45000, 'Salaried', 720),
(2, 35, 'Female', 60000, 'Self-Employed', 680),
(3, 42, 'Male', 30000, 'Salaried', 610),
(4, 30, 'Female', 80000, 'Business', 750),
(5, 50, 'Male', 25000, 'Retired', 580);

-- Insert data into loans
INSERT INTO loans VALUES
(101, 1, 200000, 'Personal', 12.5, 'Approved', '2023-01-10'),
(102, 2, 500000, 'Home', 8.5, 'Approved', '2023-02-15'),
(103, 3, 150000, 'Personal', 14.0, 'Rejected', '2023-03-05'),
(104, 4, 300000, 'Auto', 10.0, 'Approved', '2023-03-20'),
(105, 5, 100000, 'Personal', 15.0, 'Approved', '2023-04-01');

-- Insert data into repayments
INSERT INTO repayments VALUES
(1, 101, '2023-02-10', '2023-02-12', 20000, 0),
(2, 102, '2023-03-15', NULL, 0, 1),
(3, 104, '2023-04-20', '2023-04-19', 25000, 0),
(4, 105, '2023-05-01', NULL, 0, 1);

-- 1. Total loans issued by loan type
SELECT loan_type,
       COUNT(*) AS total_loans,
       SUM(loan_amount) AS total_amount
FROM loans
WHERE loan_status = 'Approved'
GROUP BY loan_type;

-- 2. Average income for approved vs rejected loans
SELECT l.loan_status,
       AVG(c.income) AS avg_income
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
GROUP BY l.loan_status;

-- 3. Default rate by loan type
SELECT l.loan_type,
       COUNT(*) AS total_loans,
       SUM(r.default_flag) AS defaults,
       ROUND(SUM(r.default_flag) * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loans l
JOIN repayments r ON l.loan_id = r.loan_id
GROUP BY l.loan_type;

-- 4. Customer risk segmentation
SELECT customer_id,
       credit_score,
       income,
       CASE
           WHEN credit_score < 600 THEN 'High Risk'
           WHEN credit_score BETWEEN 600 AND 700 THEN 'Medium Risk'
           ELSE 'Low Risk'
       END AS risk_category
FROM customers;

-- 5.Top risky customers by exposure
SELECT c.customer_id,
       SUM(l.loan_amount) AS total_exposure
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id
ORDER BY total_exposure DESC
LIMIT 10;

--6.Default rate by employment type

SELECT c.employment_type,
       COUNT(*) AS total_loans,
       SUM(r.default_flag) AS defaults,
       ROUND(SUM(r.default_flag)*100.0/COUNT(*),2) AS default_rate
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
JOIN repayments r ON l.loan_id = r.loan_id
GROUP BY c.employment_type;


--7.Overdue payments
SELECT loan_id,
       due_date,
       paid_date,
       JULIANDAY(paid_date) - JULIANDAY(due_date) AS days_overdue
FROM repayments
WHERE paid_date > due_date;

--8.Portfolio exposure by loan type
SELECT loan_type,
       SUM(loan_amount) AS total_exposure
FROM loans
GROUP BY loan_type
ORDER BY total_exposure DESC;
