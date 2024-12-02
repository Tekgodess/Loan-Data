# Loan-Data
## Purpose
The analysis aims to explore loan data for insights into borrower characteristics, trends in loan performance, and the development of a predictive model to estimate the likelihood of loan default.
## Data Preparation
Data Cleaning: Missing and inconsistent data were addressed through imputation and normalization techniques. Fortunately, there is no missing values or duplicates. The data is clean.
Feature Engineering: Additional variables were derived to enhance model performance, including aggregations, ratio metrics, and transformations.
## Exploratory Data Analysis (EDA)
Key Findings:
Demographic insights were visualized, highlighting trends such as income distribution, loan amounts, and interest rates.
Correlation analysis identified relationships between loan defaults and factors like income-to-loan ratio and credit history.
## Loan Data Insights and Visualizations
### Correlation Heatmap
Description: The heatmap visualizes the correlation between key variables, helping identify relationships between demographic, financial, and loan attributes.
## Key Insights:
Strong correlation between age, employment experience, and credit history length.
Moderate correlation between loan interest rate and loan status.
Negligible correlation between income and loan status.
### Overall Loan Approval Rate
Visualization: A bar chart showing the percentage of approved and denied loans.
Observation:
Approximately 80% of loans were approved, while 20% were denied.
Indicates a relatively lenient approval process or a high number of qualified applicants.
### Loan Approvals by Age Group
Visualization: A bar chart breaking down loan approvals across different age brackets.
Observation:
Young borrowers under 25 received the most approvals, followed by those aged 25-35.
Borrowers above 50 had the fewest approvals, indicating stricter assessment criteria or fewer applications.
### Loan Approvals by Education Level
Visualization: A bar chart comparing loan approvals across educational qualifications.
Observation:
Applicants with intermediate education levels received the highest approvals.
Advanced education levels saw fewer approvals, possibly due to lower application rates.
### Loan Approvals by Loan Intent
Visualization: A bar chart analyzing the distribution of loan approvals based on purpose (e.g., medical, education).
Observation:
Loans for medical expenses and debt consolidation had the highest approval rates.
Loans for ventures and home improvement were less frequently approved.
### Loan Approvals by Credit Score
Visualization: A bar chart showcasing approvals by credit score categories (e.g., Fair, Good, Excellent).
Observation:
Applicants with a "Fair" credit score received the most approvals.
Borrowers with "Poor" or "Excellent" scores had the least approvals, highlighting either risk or application scarcity.
## Predictive Modeling
Objective: Develop a model to predict loan default risk.
Steps: Data split into training and testing sets for unbiased evaluation.
#### Models Applied:
Logistic Regression
Random Forest Classifier
Gradient Boosting Machines
Model performance was evaluated using metrics like accuracy, precision, recall, F1 score, and ROC-AUC.
### Feature Importance: The most influential predictors of loan default included:
Debt-to-income ratio.
Employment length.
Credit score.
### Results
Model Performance:
ROC-AUC scores indicated strong predictive capability across models, with Gradient Boosting performing the best.
#### Interpretation:
Clear identification of risk factors allows for targeted decision-making and improved loan approval processes.
Visualizations such as feature importance charts demonstrated transparency in model decisions.
### Model Performance: Confusion Matrix
Visualization: A confusion matrix showing the predictive model's classification accuracy.
Performance:
Model achieved 92.62% accuracy with strong recall for approved loans but slightly weaker for denied loans.
### Feature Importance
Visualization: A horizontal bar chart ranking the most influential features in predicting loan status.
### Key Features:
Top Predictors: Previous loan defaults, loan interest rate, and loan-to-income percentage.
Demographics like age and gender had relatively lower predictive power.
## Summary and Recommendations
The visualizations reveal critical trends in loan approval dynamics.
### Actionable Insights:
Target high-risk applicants based on credit score and income ratios.
Refine approval criteria for specific loan purposes (e.g., ventures).
Monitor top predictors such as loan-to-income ratios for risk management.
