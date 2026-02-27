1. List employees in department_id 80 with salary greater than 8000.

Select * from employees where  deparment_id= 80  AND salary > 8000;

  2 . Find employees whose last_name ends with 'n'.

Select * from HR.EMPLOYEES  where last_name like '%n';

3 . . List employees hired after January 1, 2005.

select * from HR.EMPLOYEES WHERE  hire_date >= DATE '2005-01-01' ;

4 . Get employees whose job_id is either 'SA_REP' or 'SA_MAN'.

Select * from HR.EMPLOYEES where job_id  in('SA_REP' , 'SA_MAN');

5 . List employees with salary between 4000 and 7000 (inclusive).

Select * from HR.EMPLOYEES where salary between 4000 and 7000;

6 .  Find employees who have a manager (manager_id is not null).

Select * from HR.EMPLOYEES where MANAGER_ID IS NOT NULL;

7 . List departments with department_id 10, 20, or 30 from hr.departments
Select * from HR.EMPLOYEES where department_id IN (10,20,30);
8 . Get the top 3 employees by hire_date (oldest first).

Select * from  HR.EMPLOYEES ORDER BY hire_date ASC  FETCH FIRST 3 ROWS ONLY;
 9 .  List employees in department 50, ordered by last_name ascending.

Select * from HR.EMPLOYEES WHERE department_id  = 50  order by  last_name ASC;

10 . Find employees whose first_name starts with 'J'

Select * from HR.EMPLOYEES where first_name LIKE 'J%';

11 . List employees with salary not in the range 5000 to 10000.

Select * from HR.EMPLOYEES where salary not between 5000 and 10000;

12 . Get employees whose job_id contains 'CLERK'.

Select * from HR.EMPLOYEES where job_id LIKE '%CLERK%';

13 .  List employees with commission_pct greater than 0.2.

Select * from HR.EMPLOYEES where commission_pct  > 0.2  IS NOT NULL;

14 . Find the 10 most recently hired employees.
 Select * from HR.EMPLOYEES ORDER BY  hire_date  DESC FETCH FIRST 10 ROWS ONLY.

15 . List employees in departments 50 or 60, ordered by department_id then salary descending

Select * from HR.EMPLOYEES where department IN(50,60) ORDER BY department_id  salary dec;

16 . . Get employees whose last_name has exactly 5 characters.

Select * from HR.EMPLOYEES where last_name   LIKE '_____' ;

17 . List departments where manager_id is not null from hr.departments.

Select * from HR.DEPARTMENTS  WHERE manager_id IS NOT NULL ;

18 . Find employees with salary >= 10000, ordered by salary ascending.

Select * from HR.EMPLOYEES  where salary>=10000 order by salary asc;