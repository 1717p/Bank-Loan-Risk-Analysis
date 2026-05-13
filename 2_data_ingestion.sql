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

