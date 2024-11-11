SELECT *
FROM Bank_Loan_Data

/*Problem Statement-Finding KPIs*/

/*Total Loan Applications*/

SELECT Count(id) AS Total_Loan_Applications
FROM Bank_Loan_Data

SELECT Count(id) AS MTD_Total_Loan_Applications
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT Count(id) AS PMTD_Total_Loan_Applications
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

/*Total Funded Amount*/


SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM Bank_Loan_Data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


/*Total Amount received,i.e., total amount paid back by customers in terms of installments*/

SELECT SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data

SELECT SUM(total_payment) AS MTD_Total_Amount_Received
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


/*Average interest rates charged to customers*/

SELECT Round(AVG(int_rate),4)*100 AS Avg_Int_Rate
FROM Bank_Loan_Data

SELECT Round(AVG(int_rate),4)*100 AS MTD_Avg_Int_Rate
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT Round(AVG(int_rate),4)*100 AS PMTD_Avg_Int_Rate
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


/* Debt-Income ratio to check financial health of the customer*/


SELECT Round(AVG(dti),4)*100 AS Avg_DTI
FROM Bank_Loan_Data

SELECT Round(AVG(dti),4)*100 AS MTD_Avg_DTI
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT Round(AVG(dti),4)*100 AS PMTD_Avg_DTI
FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


/*Good Loan Bad Loan*/
/*Good Loan Percentage*/

SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
/
COUNT(id) AS Good_Loan_Percentage
FROM Bank_Loan_Data


/*Good Loan Applications*/

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

/*Good Loan Funded Amount*/

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


/*Good Loan Amount Received*/

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

/*Bad Loan Percentage*/
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data


/*Bad Loan Applications*/
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'


/*Bad Loan Funded Amount*/
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'


/*Bad Loan Amount Received*/
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'

/*LOAN STATUS*/
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

/*LOAN STATUS MTD*/

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

/*B.	BANK LOAN REPORT | OVERVIEW*/

/*MONTH OF LOAN ISSUE*/

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)



/*ADDRESS STATE IN USA*/

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state



/*TERM: SHOWS THE DURATION OF LOAN DISBURSED*/
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term




/*EMPLOYEE LENGTH: NUMBER OF YEARS THE BORROWER HAS BEEN EMPLOYED*/

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length


/*PURPOSE OF TAKING LOAN*/
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose


/*HOME OWNERSHIP*/

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership


























