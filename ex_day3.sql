

SELECT COUNT(departments.dept_no) 
FROM departments;

ans 9


 1. Report:

 How many rows do we have in each table in the employees database?


SELECT table_name, table_rows 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'employees'


Rusult:
table_name  table_rows
departments  9
dept_emp     331521
dept_manager 24
employees    299290
salaries     2838296
titles       442010

2. Report:

How many employees with the first name "Mark" do we have in our company?

SELECT COUNT(*) AS number_of_Mark
FROM employees
WHERE first_name="Mark";


Rusult:
number_of_Mark
230


3. Report:

How many employees with the first name "Eric" and the last name beginning with "A" do we have in our company?

SELECT COUNT(*) AS number_of_Eric_A 
FROM employees 
WHERE first_name="Eric"AND last_name LIKE "A%"


Rusult:
number_of_Eric_A
13


4. Report:

 How many employees do we have that are working for us since 1985 and who are they?

 SELECT first_name,last_name,hire_date FROM employees WHERE hire_date>=1985

 SELECT COUNT(*) number_of_emp_1985 FROM employees WHERE hire_date>=1985

Rusult:
number_of_emp_1985
300024


 5. Report:

 How many employees got hired from 1990 until 1997 and who are they?

SELECT COUNT(*) AS number_of_emp_1990_1997 
FROM employees 
WHERE hire_date BETWEEN CAST("1990-01-01" AS DATE) AND CAST("1997-12-31" AS DATE);


Rusult:
number_of_emp_1990_1997
129545

SELECT first_name,last_name,hire_date 
FROM employees 
WHERE hire_date BETWEEN CAST("1990-01-01" AS DATE) AND CAST("1997-12-31" AS DATE);

Rusult:

6. Report:

 How many employees have salaries higher than EUR 70 000,00 and who are they? 

SELECT COUNT(employees.emp_no)
FROM employees
WHERE employees.emp_no IN
(SELECT salaries.emp_no
FROM salaries WHERE salaries.salary>=70000);

Rusult:

COUNT(employees.emp_no)
135637

SELECT employees.first_name,employees.last_name,employees.emp_no
FROM employees
WHERE employees.emp_no IN
(SELECT salaries.emp_no
FROM salaries WHERE salaries.salary>=70000)
GROUP BY employees.emp_no;

Result: list of first_name last_name emp_no

7. Report:

 How many employees do we have in the Research Department, who are working for us since 1992 and who are they?