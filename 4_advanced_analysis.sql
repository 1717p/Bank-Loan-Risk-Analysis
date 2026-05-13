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
