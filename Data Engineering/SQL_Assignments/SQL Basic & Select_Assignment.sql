--Display employee_id, first_name, last_name, and a new column full_name that is first_name and last_name concatenated with a comma between them (e.g., "John, Doe").


 SELECT employee_id, first_name, last_name, first_name || ', ' || last_name AS full_name FROM HR.EMPLOYEES;

 --List employee_id, salary, and a column bonus_10_pct showing 10% of salary (salary * 0.10).

 SELECT employee_id, salary, salary * 0.10 AS bonus_10_pct FROM HR.EMPLOYEES;

 --Show employee_id, hire_date, and a literal column record_type with value 'Employee' for every row.

SELECT employee_id, hire_date, 'Employee' AS record_type FROM  HR.EMPLOYEES;

--For each employee, display email and a column email_domain set to the literal '@company.com'.

SELECT  email, '@company.com' AS email_domain FROM  HR.EMPLOYEES;

-- List employee_id, salary, commission_pct, and effective_commission where effective_commission is NVL(commission_pct, 0).

SELECT  employee_id, salary, commission_pct, NVL(commission_pct, 0) AS effective_commission FROM HR.EMPLOYEES;

--Display first_name, last_name, and a column initials formed by the first character of first_name and the first character of last_name (e.g., "JD").

select first_name,last_name where SUBSTR(first_name, 1, 1) and SUBSTR(last_name, 1, 1)   HR.EMPLOYEES;

--Show employee_id, salary, and annual_salary as salary * 12, and also annual_plus_bonus as salary * 12 * 1.1 (10% bonus).

SELECT EMPLOYEE_ID, SALARY, SALARY*12 AS ANNUAL_SALARY, SALARY*12*1.1 AS ANNUAL_PLUS_BONUS FROM HR.employees; 

--List all columns from hr.departments using explicit column names (department_id, department_name, manager_id, location_id).

SELECT DEPARTMENT_ID,DEPARTMENT_NAME ,MANAGER_ID ,LOCATION_ID FROM HR.DEPARTMENTS;

--From hr.employees, select employee_id and a column description that is the literal 'Emp#' concatenated with employee_id (cast to string if needed: use TO_CHAR(employee_id)).

SELECT EMPLOYEE_ID, 'EMP#' || TO_cHAR(EMPLOYEE_ID) AS DESCRIPTION FROM HR.EMPLOYEES;  

--Display job_id, salary, and a column salary_band that is the literal 'Standard' for every row.

select job_id,salary, 'Standard' AS salary_band FROM HR.EMPLOYEES;

--List employee_id, first_name, last_name, and a column display_name as "Last, First" (last_name, comma space, first_name).

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME ,LAST_NAME||','||FIRST_NAME AS DISPLAY_NAME FROM HR.EMPLOYEES;


--Show department_id from hr.departments and a literal 1 as column sort_order.

SELECT department_id, 1 AS sort_order FROM hr.departments;

--From hr.employees, display salary and monthly_net as salary * 0.85 (assuming 15% tax).

SELECT SALARY,SALARY*0.85 AS MONTHLY_NET FROM HR.EMPLOYEES;

--List employee_id, commission_pct, and commission_display where NULL commission_pct is shown as 0 using NVL.

select EMPLOYEE_ID,COMMISSION_PCT,NVL(COMMISSION_PCT,0) AS COMMISSION_DISPLAY FROM HR.EMPLOYEES;

-- Display first_name, last_name, salary, and a column compensation that is salary * (1 + NVL(commission_pct, 0)).

SELECT FIRST_NAME,LAST_NAME,SALARY,SALARY*(1+NVL(COMMISSION_PCT,0)) AS COMPENSION FROM HR.EMPLOYEES;

--From hr.departments, list department_name and a literal column region with value 'HQ'.

SELECT department_name, 'HQ' AS region FROM hr.departments;

--Show employee_id, hire_date, and a column years_label with literal 'Years of service'.

SELECT EMPLOYEE_ID,HIRE_DATE,'YEARS OF SERVICE' AS YEARS_LABEL FROM HR.employees; 

--List employee_id, salary, and double_salary as salary * 2.

SELECT EMPLOYEE_ID,SALARY,SALARY*2 AS DOUBLE_SALARY FROM HR.EMPLOYEES;

--From hr.employees, display manager_id and a column has_manager that is the literal 'Yes' when manager_id is not null and 'No' when manager_id is null (use NVL2: NVL2(manager_id, 'Yes', 'No')).

SELECT MANAGER_ID,NVL2(MANAGER_ID, 'yes', 'no') as has_manager from hr.employees;

--Show department_id, department_name from hr.departments, and a calculated column dept_code as the first 3 characters of department_name (use SUBSTR)

SELECT DEPARTMENT_ID, DEPARTMENT_NAME,SUBSTR(DEPARTMENT_NAME,1,3) AS DEPT_CODE FROM HR.DEPARTMENTS;

--Display employee_id, first_name, last_name, salary, and a column salary_rank_label that is 'High' if salary >= 10000, 'Medium' if salary >= 5000 and < 10000, else 'Low'. Use CASE.

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,CASE WHEN SALARY>=1000 THEN 'HIGH' WHEN SALARY>=5000 THEN 'MEDIUM' ELSE 'LOW'
        END AS SALARY_RANK_LABEL FROM HR.EMPLOYEES;  

-- List employee_id, salary, commission_pct, and total_comp as salary + (salary * NVL(commission_pct, 0)), formatted to 2 decimal places using ROUND(..., 2).

SELECT EMPLOYEE_ID,SALARY,COMMISSION_PCT,SALARY+ROUND(SALARY*(1+NVL(COMMISSION_PCT,0)),2) AS TOTAL_COMP FROM HR.EMPLOYEES;

--From hr.employees, show employee_id, email, and email_upper as UPPER(email). Also show email_length as LENGTH(email).

SELECT EMPLOYEE_ID,EMAIL,UPPER(EMAIL) AS EMAIL_UPPER, LENGTH(EMAIL) AS EMAIL_LENGTH FROM HR.EMPLOYEES;

-- Display department_id from hr.departments, department_name, and a column name_length (number of characters in department_name).

SELECT DEPARTMENT_ID,DEPARTMENT_NAME,LENGTH(DEPARTMENT_NAME) AS NAME_LENGTH FROM HR.departments;

--List employee_id, first_name, last_name, and a column reverse_name as last_name concatenated with first_name (no comma).

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,LAST_NAME||' '||FIRST_NAME AS REVERSE_NAME FROM HR.EMPLOYEES;

 --Show employee_id, hire_date, and a literal column data_source with value 'HR.EMPLOYEES'.

select employee_id, hire_date, 'HR.EMPLOYEES' AS data_source FROM HR.EMPLOYEES;

--From hr.employees, display job_id, salary, and salary_percentage as (salary / (SELECT SUM(salary) FROM hr.employees)) * 100, rounded to 2 decimals.

SELECT JOB_ID,SALARY,ROUND(SALARY/(SELECT SUM(SALARY) FROM HR.EMPLOYEES)*100,2) FROM HR.EMPLOYEES;

-- List employee_id, first_name, last_name, and a column formal_name as "Mr. " or "Ms. " (your choice) concatenated with first_name and last_name.

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,'MR.'||FIRST_NAME||''||LAST_NAME AS FORMAL_NAME FROM HR.EMPLOYEES;

-- Display employee_id, salary, and annual_with_raise as (salary * 12) * 1.05 (5% annual raise).

SELECT employee_id, salary,(salary * 12) * 1.05 AS annual_with_raise from HR.EMPLOYEES;

--From hr.departments, show department_id, department_name, and a column id_name that concatenates department_id and department_name with a hyphen (e.g., "10-Administration"). Use TO_CHAR(department_id) for the number.

SELECT DEPARTMENT_ID,DEPARTMENT_NAME,DEPARTMENT_ID||'-'||DEPARTMENT_NAME AS ID_NAME FROM HR.DEPARTMENTS;

--List employee_id, commission_pct, and commission_category: 'Commissioned' if commission_pct is not null, 'Non-commissioned' if null. Use NVL2 or CASE.

SELECT EMPLOYEE_ID, COMMISSION_PCT,CASE WHEN COMMISSION_PCT IS NULL THEN 'NON-COMMISSIONED' ELSE 'COMMISSIONED'
 END AS COMMISSION_CATEGORY    FROM HR.EMPLOYEES;

--Show employee_id, first_name, last_name, salary, and a column salary_expression that is the literal string 'salary * 12' (not the result of the calculation).

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,SALARY*12 AS SALARY_EXPRESSION FROM HR.EMPLOYEES;

--From hr.employees, display employee_id, job_id, and a column job_salary_label as job_id concatenated with ':' and salary (e.g., "SA_REP:9000"). Use TO_CHAR(salary).
 
SELECT EMPLOYEE_ID,JOB_ID,JOB_ID||':'||SALARY AS JOB_SALARY_LABEL FROM HR.EMPLOYEES;

--List employee_id, salary, and tax_bracket as '20%' if salary >= 10000, '15%' if salary >= 5000, else '10%'. Use CASE.
select  employee_id, salary, CASE WHEN salary >= 10000 THEN '20%' WHEN salary >= 5000 THEN '15%' ELSE '10%' END AS TAX_BRACKET from HR.EMPLOYEES;

--Display department_id, department_name from hr.departments, and a column dept_info that is "Department " followed by department_id and " - " and department_

SELECT DEPARTMENT_ID,DEPARTMENT_NAME,'DEPARTMENT'||DEPARTMENT_ID||'-'||DEPARTMENT_NAME AS DEPT_INFO FROM HR.DEPARTMENTS;

 --From hr.employees, show employee_id, first_name, last_name, and full_name_reversed as last_name, space, first_name (e.g., "Doe John").

select employee_id, first_name, last_name,last_name || ' ' || first_name AS full_name_reversed from HR.EMPLOYEES;

-- List employee_id, salary, commission_pct, and effective_salary as salary when commission_pct is null, otherwise salary * (1 + commission_pct). Use NVL2 or CASE.

select  employee_id, salary, commission_pct, NVL2(commission_pct, salary * (1 + commission_pct), salary) AS effective_salary from HR.EMPLOYEES;

--Show employee_id, hire_date, and a column hire_year that is the year from hire_date (use EXTRACT(YEAR FROM hire_date) in Oracle).

SELECT EMPLOYEE_ID,HIREDATE,TO_CHAR(HIREDATE,'YYYY') AS HIREDATE FROM HR.EMPLOYEES;

--From hr.departments, display department_name and a column word_count as the number of words (simplified: 1 + number of spaces, or use a formula based on LENGTH and REPLACE of spaces). For simplicity, use LENGTH(department_name) - LENGTH(REPLACE(department_name, ' ', '')) + 1 if names have spaces.

SELECT DEPARTMENT_NAME,LENGTH(DEPARTMENT_NAME)-LENGTH(REPLACE(DEPARTMENT_NAME.' ',''))+1 AS WORD_COUNT FROM HR.DEPARTMENTS;

-- List employee_id, first_name, last_name, and a column name_with_id as "[" || employee_id || "] " || first_name || " " || last_name (e.g., "[100] Steven King").

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,'['||EMPLOYEE_ID||']'||FIRST_NAME||' '|| LAST_NAME AS NAME_WITH_ID FROM HR.EMPLOYEES;