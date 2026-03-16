Show total salary (SUM(salary)) for the whole company from hr.employees.

select SUM(salary) from hr.employees;

 Count employees per job_id.

 select  job_id,count (*) AS employee_id from  hr.employees GROUP BY job_id;

 Show average salary per department_id.

 select AVG(salary) as avg_salary from hr.employees GROUP BY department_id;

 List department_id and min(salary), max(salary) per department.


 SELECT department_id,MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary
FROM hr.employees
GROUP BY department_id;

Count employees per department_id.

select  COUNT(*)  AS department_id from hr.employees GROUP BY department_id;

Show job_id and total salary per job.

select job_id ,SUM(salary) AS total_salary from hr.employees GROUP BY job_id;

 List department_id and number of employees with non-null commission_pct (COUNT(commission_pct)).

 select department_id, COUNT(commission_pct) AS employees_with_commission from hr.employees GROUP BY department_id;

Show min(hire_date) and max(hire_date) per job_id.

select job_id,MIN(hire_date) AS min_hire_date,MAX(hire_date) AS max_hire_date from hr.employees GROUP BY job_id;

Count total employees (COUNT()) in hr.employees.

select count(*) from hr.employees;

Show department_id, avg(salary), and count(*) per department.

select department_id,
 AVG(salary) AS avg_salary,
  count(*) AS total_employees 
  from hr.employees GROUP BY department_id;

  List job_id and average salary per job; order by average salary desc.

select job_id,AVG(salary) AS avg_salary from hr.employees GROUP BY 
job_id ORDER BY avg_salary DESC;

Show department_id and sum(salary) for department_id in (50, 60, 80).

select department_id , SUM(salary) AS total_salary from hr.employees  where department_id IN (50,60,80) GROUP BY department_id;

 Count employees per manager_id (include only where manager_id is not null).

 select manager_id from hr.employees where manager_id IS NOT NULL GROUP BY manager_id;

Show job_id and min(salary) per job.

select job_id, MIN(salary) AS min_salary from hr.employees GROUP BY job_id;

List department_id and max(hire_date) per department.

select department_id,MAX(hire_date) AS max_hire_date from hr.employees  GROUP BY department_id;

Show total salary for department_id 90 only.

SELECT SUM(salary) FROM hr.employees WHERE department_id = 90;

Count distinct job_id values (COUNT(DISTINCT job_id)).

select COUNT(DISTINCT job_id) FROM hr.employees;

Show department_id, job_id, and count(*) per (department_id, job_id).

select department_id,job_id , count(*) AS employee_count from hr.employees GROUP BY department_id,job_id;

List department_id and avg(salary) rounded to 2 decimals per department.

select department_id,AVG(salary) AS total_salary ,ROUND(AVG(salary),2) from hr.employees GROUP BY department_id;

Show job_id and count of employees; only job_ids with at least 2 employees.

select job_id from hr.employees GROUP BY job_id HAVING COUNT(*)>=2;

Show department_id, department_name (join to hr.departments), and total salary per department.

select d.department_id,
       d.department_name,
       SUM(e.salary) AS total_salary
       FROM hr.employees e
      JOIN hr.departments d
      ON e.department_id = d.department_id
      GROUP BY d.department_id,d.department_name;

 List job_id and average salary for jobs that have more than 3 employees.

select job_id,AVG(salary) AS total_salary from hr.employees GROUP BY job_id HAVING COUNT(*) >3;

Show department_id and count of employees, and also count of employees hired after 2000 (use SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) > 2000 THEN 1 ELSE 0 END)).

SELECT department_id,
       COUNT(*) AS total_employees,
       SUM(CASE 
             WHEN EXTRACT(YEAR FROM hire_date) > 2000 
             THEN 1 
             ELSE 0 
           END) AS hired_after_2000
FROM hr.employees
GROUP BY department_id;

List department_id where total salary is greater than 100000.

select department_id,SUM(salary) AS total_salary from hr.employees GROUP BY department_id HAVING SUM(salary)>100000;

Show job_id and max(salary) and min(salary) per job; only jobs where max - min > 5000.

select job_id,MAX(salary) AS max_salary,MIN(salary) AS min_salary from hr.employees GROUP BY department_id HAVING MAX(salary)-MIN(salary) > 5000;

List department_name (join) and employee count per department; order by count desc.

select e.employee_id,
       d.department_id,
       d.department_name,
       FROM hr.employees e
       JOIN department d
       ON e.department_id = d.department_id
       GROUP BY d.department_id,d.department_name,ORDER BY COUNT(*) DESC;

Show department_id and average tenure in years (AVG(MONTHS_BETWEEN(SYSDATE, hire_date)/12)) per department.

select department_id ,AVG(MONTHS_BETWEEN(SYSDATE,hire_date)/12) AS avg_tenure_years from hr.employees GROUP BY department_id;


. List job_id and total salary for jobs with word 'MAN' in job_id.

select job_id, SUM(salary) AS total_salary from hr.employees WHERE jb_id LIKE %MAN% GROUP BY job_id;


Show department_id, count(*), and sum(salary) per department; only departments with avg(salary) > 7000.

select department_id,COUNT(*) as total_employees,
SUN(salary) AS total_salary FROM hr.employees GROUP BY department_id HAVING AVG(salary)>7000;

List department_name and min(salary), max(salary) per department (join).

SELECT d.department_name,
       MIN(e.salary) AS minimum_salary,
       MAX(e.salary) AS maximum_salary
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

Show manager_id and count of direct reports; only managers with more than 2 reports.

select manager_id from hr.employees where manager_id IS NOT NULL GROUP BY manager_id HAVING COUNT(*)>2;

List department_id and count of distinct job_id in that department.

select department_id ,COUNT(DISTINCT job_id) from hr.employees GROUP BY department_id;

Show job_id and average salary; only for departments 50, 80, 90.

select job_id , AVG(salary) AS total_salary from hr.employees where department_id in (50,80,90)  GROUP BY job_id ;

List department_id where the number of employees is greater than 5 and total salary > 200000.

select department_id ,sum(salary) as total_salary from hr.employees GROUP BY department_id HAVING COUNT (*)>5 AND SUM(salary)>200000;

 Show department_name and total salary per department; only departments with at least 1 employee with commission_pct not null.


SELECT d.department_name,
       SUM(e.salary) AS total_salary
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(e.commission_pct) >= 1;

List job_id and count of employees; order by count desc, then job_id.

select job_id from hr.employees GROUP BY job_id ORDER BY COUNT(*) DESC;

 Show department_id and sum(salary) and avg(salary) per department; round avg to 2 decimals.

 select department_id,SUM(salary) AS total_salary ,ROUND(AVG(salary),2) from hr.employees GROUP BY department_id;

 List department_id that has the maximum total salary (use subquery: WHERE SUM(salary) = (SELECT MAX(total) FROM (SELECT SUM(salary) total FROM hr.employees GROUP BY department_id))).

 SELECT department_id
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) = (
    SELECT MAX(total)
    FROM (
        SELECT SUM(salary) AS total
        FROM hr.employees
        GROUP BY department_id
    )
);

Show department_id, job_id, count(*), and sum(salary) per (department_id, job_id); use ROLLUP(department_id, job_id).


SELECT department_id,
       job_id,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary
FROM hr.employees
GROUP BY ROLLUP(department_id, job_id);

 List department_name and employee count; include departments with 0 employees (LEFT JOIN from departments to employees, then GROUP BY)

 SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;