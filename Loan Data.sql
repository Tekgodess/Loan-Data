Select * From loan_data

-- Data Cleaning
-- Check for missing values in each column
SELECT 
    SUM(CASE WHEN person_age IS NULL THEN 1 ELSE 0 END) AS missing_person_age,
    SUM(CASE WHEN person_gender IS NULL THEN 1 ELSE 0 END) AS missing_person_gender,
    SUM(CASE WHEN person_education IS NULL THEN 1 ELSE 0 END) AS missing_person_education,
    SUM(CASE WHEN person_income IS NULL THEN 1 ELSE 0 END) AS missing_person_income,
    SUM(CASE WHEN loan_amnt IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount,
    SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END) AS missing_loan_status
FROM 
    loan_data;

-- Overview of total loans, approved loans, and average loan statistics
SELECT 
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    SUM(CASE WHEN loan_status = 0 THEN 1 ELSE 0 END) AS rejected_loans,
    AVG(loan_amnt) AS avg_loan_amount,
    AVG(loan_int_rate) AS avg_interest_rate
FROM 
    loan_data;
    
-- Analyze loan approval rates across different age groups
SELECT 
    CASE 
        WHEN person_age < 25 THEN 'Under 25'
        WHEN person_age BETWEEN 25 AND 35 THEN '25-35'
        WHEN person_age BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'Above 50' 
    END AS age_group,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    age_group;

-- Examine loan trends across education levels
SELECT 
    person_education,
    COUNT(*) AS total_loans,
    AVG(loan_amnt) AS avg_loan_amount,
    AVG(loan_int_rate) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    person_education
ORDER BY 
    total_loans DESC;

-- Understand loan distribution and performance based on loan intent
SELECT 
    loan_intent,
    COUNT(*) AS total_loans,
    AVG(loan_amnt) AS avg_loan_amount,
    AVG(loan_int_rate) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    loan_intent
ORDER BY 
    total_loans DESC;

-- Examine credit score ranges and their impact on loan approval rates
SELECT 
    CASE 
        WHEN credit_score < 500 THEN 'Poor (<500)'
        WHEN credit_score BETWEEN 500 AND 650 THEN 'Fair (500-650)'
        WHEN credit_score BETWEEN 651 AND 750 THEN 'Good (651-750)'
        ELSE 'Excellent (>750)'
    END AS credit_score_category,
    COUNT(*) AS total_loans,
    AVG(loan_amnt) AS avg_loan_amount,
    AVG(loan_int_rate) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    credit_score_category
ORDER BY 
    credit_score_category;

-- Analyze loan performance based on home ownership status
SELECT 
    person_home_ownership,
    COUNT(*) AS total_loans,
    AVG(loan_amnt) AS avg_loan_amount,
    AVG(loan_int_rate) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    person_home_ownership;

-- Examine how employment experience impacts default rates
SELECT 
    person_emp_exp,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN previous_loan_defaults_on_file = 'Yes' THEN 1 ELSE 0 END) AS defaults,
    ROUND(SUM(CASE WHEN previous_loan_defaults_on_file = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS default_rate
FROM 
    loan_data
GROUP BY 
    person_emp_exp
ORDER BY 
    person_emp_exp;

-- Analyze loan-to-income ratio and its impact on approvals
SELECT 
    CASE 
        WHEN loan_percent_income < 0.2 THEN 'Low (<20%)'
        WHEN loan_percent_income BETWEEN 0.2 AND 0.4 THEN 'Moderate (20-40%)'
        WHEN loan_percent_income BETWEEN 0.41 AND 0.6 THEN 'High (41-60%)'
        ELSE 'Very High (>60%)'
    END AS income_ratio_category,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    income_ratio_category;

-- Impact of credit history length on loan approvals
SELECT 
    cb_person_cred_hist_length,
    COUNT(*) AS total_loans,
    AVG(loan_amnt) AS avg_loan_amount,
    SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS approved_loans,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    cb_person_cred_hist_length
ORDER BY 
    cb_person_cred_hist_length;

-- Combine factors to assess overall risk
SELECT 
    person_education,
    loan_intent,
    person_home_ownership,
    AVG(loan_amnt) AS avg_loan_amount,
    AVG(loan_int_rate) AS avg_interest_rate,
    ROUND(SUM(CASE WHEN previous_loan_defaults_on_file = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS default_rate,
    ROUND(SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS approval_rate
FROM 
    loan_data
GROUP BY 
    person_education, loan_intent, person_home_ownership
ORDER BY 
    default_rate DESC, approval_rate ASC;

