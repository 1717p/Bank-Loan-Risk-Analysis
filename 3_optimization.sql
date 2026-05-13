-- 1. Create indexes to speed up heavy analytical aggregation and JOIN operations
CREATE INDEX idx_loans_customer ON loans(customer_id);
CREATE INDEX idx_repayments_loan ON repayments(loan_id);
CREATE INDEX idx_loans_type_status ON loans(loan_type, loan_status);

-- 2. Build an Executive Reporting View to encapsulate complex cross-table joins
CREATE VIEW Vw_Risk_Portfolio_Summary AS
SELECT c.customer_id, c.credit_score, l.loan_id, l.loan_type, l.loan_amount, r.default_flag
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
LEFT JOIN repayments r ON l.loan_id = r.loan_id;
