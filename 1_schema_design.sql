-- Create Customers Table (Dimension Table)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    income INT,
    employment_type VARCHAR(20),
    credit_score INT
);

-- Create Loans Table (Dimension/Fact Link Table)
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

-- Create Repayments Table (Fact Table)
CREATE TABLE repayments (
    repayment_id INT PRIMARY KEY,
    loan_id INT,
    due_date DATE,
    paid_date DATE,
    amount_paid INT,
    default_flag INT,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
