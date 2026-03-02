1 . List hr.employees in department 80 with salary > 7000 OR job_id = 'SA_MAN', ordered by salary DESC.

 select * from hr.employees WHERE (department_id = 80 AND salary > 7000) OR job_id = 'SA_MAN' ORDER BY salary DESC;

 2. Find employees hired between Jan 1, 2000 and Dec 31, 2005.

select * from hr.employees WHERE BETWEEN HIRE_DATE '2000-01-01' AND HIRE_DATE '2005-12-31';

3.  List employees whose last_name is 4 characters and starts with 'K'.

select * from hr.employees where last_name LIKE  'K___';

4 . Get top 5 highest-paid employees in department 50 only.

select * from hr.employees where DEPARTMENT_ID = 50 ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY;

5 . List employees with no manager and salary > 5000.

select * from hr.employees where MANAGER_ID is NULL and salary > 5000;

6 . Find employees whose first_name has an 'a' as the second character.

select * from hr.employees where first_name LIKE '_a%';

7 .  List departments (hr.departments) with department_id between 40 and 90.

select * from hr.employees where DEPARTMENT_ID BETWEEN 40 and 90;

8 .  Get employees with salary < 3000 or salary > 15000, ordered by salary.

select * from  hr.employees where salary < 3000 OR salary > 15000 ORDER BY salary;

9 . List employees in department 60 with job_id 'IT_PROG', or in department 100 with job_id like 'FI%'.

select * from hr.employees where (DEPARTMENT_ID = 60 AND job_id = 'IT_PROG') OR (department_id = 100 AND job_id LIKE 'FI%');

10 .  Find employees whose hire_date is in the year 2003

select  * from  hr.employees where hire_date between DATE '2003-01-01' AND DATE '2003-12-31';


11 .  List employees with commission_pct NULL and job_id starting with 'SA'

select * from hr.employees  WHERE commission_pct IS NULL AND job_id LIKE 'SA%';

12 . Get the 3 oldest employees (earliest hire_date) in department 90.

select * from hr.employees WHERE department_id = 90 ORDER BY hire_date ASC FETCH FIRST 3 ROWS ONLY;

13 .  List employees whose last_name does not start with 'A', 'B', or 'C'.

select * from hr.employees WHERE last_name NOT LIKE 'A%' AND last_name NOT LIKE 'B%' AND last_name NOT LIKE 'C%'; or use NOT IN with SUBSTR;

14 . Find employees with salary in (5000, 6000, 7000, 8000).

select * from hr.employees where salary in (5000,6000,7000,8000);

15 .  List employees ordered by department_id ASC, then by hire_date DESC within each department.

select * from hr.employees  ORDER BY department_id, hire_date DESC;

16 . . Get employees whose first_name and last_name both start with the same letter (simplified: same first letter).

select * from hr.employees where SUBSTR(first_name,1,1) = SUBSTR (last_name,1,1);

17 . List employees with manager_id not null and department_id in (50, 80, 100).

select * from hr.employees where manager_id IS NOT NULL and department_id in (50,80,100);

18. Find employees with salary between 3000 and 5000 and job_id containing 'REP'.

select * from hr.employees where salary BETWEEN 3000 and 5000 and job_id LIKE '%REP%';

19 .  List departments (hr.departments) ordered by department_name descending.

 SELECT * FROM hr.departments ORDER BY department_name DESC;

 20 .Get employees with hire_date not in 2004 (all years except 2004).

 select * from hr.employees where hire_date > DATE '2004-12-31';