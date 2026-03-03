List employees in department 80 with salary > 7000 OR job_id = 'SA_MAN', ordered by salary DESC.

Select * from hr.employees where (department_id=80 AND salary>7000) OR job_id = 'SA_MAN'ORDER BY salary DESC;

Find employees hired between Jan 1, 2000 and Dec 31, 2005

select * from hr.employees WHERE hire_date BETWEEN DATE '2000-01-01' AND DATE '2005-12-31';

List employees whose last_name is 4 characters and starts with 'K'.

SELECT * FROM HR.EMPLOYEES WHERE last_name LIKE'K____';

Get top 5 highest-paid employees in department 50 only.

SELECT * FROM HR.EMPLOYEES WHERE department_id = 50 ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY;

List employees with no manager and salary > 5000.

SELECT * FROM HR.EMPLOYEES WHERE manager_id IS NULL AND SALARY > 5000;

Find employees whose first_name has an 'a' as the second character.

SELECT * FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE'_a%';

List departments (hr.departments) with department_id between 40 and 90.

SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID BETWEEN 40 AND 90;

Get employees with salary < 3000 or salary > 15000, ordered by salary

SELECT * FROM HR.EMPLOYEES WHERE salary < 3000 or salary >15000 ORDER BY salary;

List employees in department 60 with job_id 'IT_PROG', or in department 100 with job_id like 'FI%'

SELECT * FROM HR.EMPLOYEES WHERE (department_id = 60 AND job_id = 'IT_PROG') OR (department_id = 100 AND job_id LIKE 'FI%');

Find employees whose hire_date is in the year 2003.

SELECT * FROM HR.EMPLOYEES WHERE HIRE_DATE BETWEEN DATE '2003-01-01' AND DATE'2003-12-31';

List employees with commission_pct NULL and job_id starting with 'SA'.

SELECT * FROM HR.EMPLOYEES WHERE commission_pct IS NULL AND job_id LIKE'SA%';

Get the 3 oldest employees (earliest hire_date) in department 90

SELECT * FROM HR.EMPLOYEES WHERE department_id = 90  ORDER BY HIRE_DATE ASC FETCH FIRST 3 ROWS ONLY;

List employees whose last_name does not start with 'A', 'B', or 'C'.

SELECT * FROM HR.EMPLOYEES WHERE last_name  NOT LIKE '%A' AND last_name  NOT LIKE '%B' AND last_name NOT LIKE '%C';

Find employees with salary in (5000, 6000, 7000, 8000).

SELECT * FROM HR.EMPLOYEES  WHERE salary IN (5000, 6000, 7000, 8000);

List employees ordered by department_id ASC, then by hire_date DESC within each department.

SELECT * FROM HR.EMPLOYEES  ORDER BY department_id, hire_date DESC;

Get employees whose first_name and last_name both start with the same letter (simplified: same first letter).

SELECT * FROM HR.EMPLOYEES WHERE SUBSTR(first_name,1,1) = SUBSTR(last_name,1,1);

List employees with manager_id not null and department_id in (50, 80, 100).

SELECT * FROM HR.EMPLOYEES  WHERE manager_id IS NOT NULL AND department_id IN (50, 80, 100);

Find employees with salary between 3000 and 5000 and job_id containing 'REP'.

SELECT * FROM HR.EMPLOYEES WHERE salary BETWEEN 3000 AND 5000 AND job_id LIKE '%REP%';

List departments (hr.departments) ordered by department_name descending.

SELECT * FROM hr.departments ORDER BY department_name DESC;

 Get employees with hire_date not in 2004 (all years except 2004).

SELECT * FROM HR.EMPLOYEES WHERE EXTRACT(YEAR FROM hire_date) <> 2004 or hire_date < DATE '2004-01-01' OR hire_date > DATE '2004-12-31';