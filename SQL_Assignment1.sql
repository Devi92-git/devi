1 . How many employees earn more than 8000 salary?

Select count(*) from  hr.employees  where  salary >8000;

2 . How many employees were hired before 2015?

Select count(*) from hr.employees  where hired_date < ’01-jan-2015’;

3 . How many employees belong to department 50?

Select count(*)  from  hr.employees  WHERE department_id = 50;

4 . How many employees have commission percentage assigned?

SELECT COUNT(*) FROM  hr.employees  WHERE commission _pct IS NOT NULL;

5 . How many employees do not have a manager?

SELECT COUNT(*) FROM employees  WHERE  MANAGER_ID  IS NULL;

 6 . How many employees’ first name starts with ‘J’?

SELECT COUNT(*) FROM  hr. employees WHERE  FIRST_NAME  LIKE  ‘ J% ’;

7 . How many employees’ last name ends with ‘S’?

Select  count(*) from hr.employees  where starts  LAST_NAME  LIKE  ‘%S’;

8 . How many employees have salary between 4000 and 9000?

Select count(*) from hr.employees  where  salary  between 4000<9000;

9 . How many employees earn the maximum salary?

Select max(salary) as max_salary, count(*) from  hr.employees;

10 . How many employees earn the minimum salary?

Select min(salary) as min_salary, count(*) from  hr.employees;

11 . How many employees have email containing letter ‘A’?

Select count (*)  FROM hr. employees  WHERE email LIKE '%A%';

12 . How many employees have job_id starting with ‘IT’?
 
Select  count(*) from  hr.employees  where  job_id  starting with ‘IT’;

13 . How many employees were hired in 2021?

Select  count(*) from hr.employees  where hired >= ’01-01-2021’   and  hired<=’31-12-2021’;

14 . How many employees have salary less than average salary?
 
Select count (*) from  hr.employees  WHERE salary < AVG(salary);

15 . How many employees have phone number available?

Select  count (*) from  hr.employees where phone_number IS NOT NULL;

16 . How many employees do not belong to any department?

Select count(*)  from  hr.employees   where department is NULL;

17 . How many employees have exactly 6 characters in first name?

Select  count(*)  from hr.employees  where  len(first_ name) = 6;
 
18 . How many employees have salary greater than 5000 and department 20?

Select count(*)  from hr.employees where salary >5000  and department =  20;

19 . How many employees have commission greater than 0.15?

Select count(*) from hr.employees where commission >0.15;

20 . How many employees have salary not between 3000 and 7000?

Select count(*) from hr.employees where  salary  not  between 3000 and 7000.