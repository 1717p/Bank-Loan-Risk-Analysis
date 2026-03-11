# Bank-Loan-Risk-Analysis

Project Overview

This project analyses bank loan data using SQL to identify borrower risk patterns, loan portfolio exposure, and default trends. The goal is to simulate how financial institutions analyse loan datasets to support credit risk monitoring and data-driven lending decisions.

Business Problem

Banks face significant financial losses due to loan defaults. Effective analysis of borrower behaviour and loan performance helps financial institutions:

Identify high-risk customers

Detect default patterns across loan segments

Evaluate the impact of credit score and income

Monitor loan portfolio exposure

Support better lending and risk management decisions

Dataset Structure

The project uses three relational tables.

Customers Table
Column	Description
customer_id	Unique customer identifier
age	Customer age
gender	Customer gender
income	Monthly income
employment_type	Salaried / Business / Self-employed
credit_score	Credit score of customer
Loans Table
Column	Description
loan_id	Unique loan identifier
customer_id	Linked customer
loan_amount	Loan amount issued
loan_type	Personal / Home / Auto
interest_rate	Loan interest rate
loan_status	Approved / Rejected
loan_date	Loan issue date
Repayments Table
Column	Description
repayment_id	Repayment record identifier
loan_id	Linked loan
due_date	Payment due date
paid_date	Actual payment date
amount_paid	Amount repaid
default_flag	1 = Default, 0 = No Default
SQL Techniques Used

INNER JOIN

GROUP BY and Aggregations

CASE WHEN conditional logic

Window Functions

Date-based analysis

Risk segmentation

Portfolio exposure analysis

Key Analysis Performed
Loan Portfolio Analysis

Total loans issued and exposure by loan type

Portfolio exposure distribution across loan categories

Borrower Behaviour Analysis

Income patterns for approved vs rejected loans

Risk segmentation based on credit score

Credit Risk Analysis

Default rates by loan type

Default rates by employment category

Risk Exposure Monitoring

Identification of high exposure customers

Portfolio exposure by loan type

Payment Behaviour Analysis

Detection of overdue loan payments

Calculation of days overdue for delayed repayments

Key Insights

Personal loans show relatively higher default rates compared to other loan types.

Customers with lower credit scores tend to have higher default probability.

Certain employment categories demonstrate higher risk exposure.

A small group of customers contributes a large portion of total loan exposure.

Monitoring overdue payments helps identify early warning signals for loan defaults.

Business Impact

This analysis demonstrates how SQL-based analytics can help banks:

Identify high-risk borrowers

Monitor credit portfolio exposure

Improve lending strategies

Detect early signs of loan default risk

Such analysis supports risk analytics teams in making data-driven credit decisions and improving portfolio risk monitoring.

Tools Used

SQL (SQLite)

Relational Database Concepts

Data Analysis using SQL Queries




Apply machine learning models for default prediction

Expand analysis with larger financial datasets
