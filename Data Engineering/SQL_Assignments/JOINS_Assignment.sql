--List employee_id, first_name, last_name, and department_name (join employees and departments).

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
from hr.employees e left join hr.departments d on e. department_id = d. department_id ; 

--Show employees in department 'IT' (filter by d.department_name = 'IT' after join).

SELECT e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

--Count employees per department and show department_name.

select d.department_id,
       d.department_name,
       count(e.employee_id) as employee_count
from hr.departments d left join hr.employees e  
on d.department_id=e.DEPARTMENT_ID
group by d.DEPARTMENT_ID,d.department_name; 

-- List first_name, last_name, department_id, department_name for department_id 50.

SELECT e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id = 50;

 --Show employee_id, salary, and department_name.

 select e.employee_id,
        e.salary,
        d.department_id
        FROM hr.employees e left join hr.departments d
        on e.department_id=d.department_id;

-- List departments (department_id, department_name) that have at least one employee (use JOIN and DISTINCT or GROUP BY).
 SELECT 
 DISTINCT d.department_id,
          d.department_name
  FROM hr.departments d 
  INNER JOIN hr.employees e 
  ON d.department_id = e.department_id;

--Show first_name, last_name, department_name for employees with salary > 8000

 SELECT e.first_name,
       e.last_name,
       d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.salary > 8000

-- List employee_id, job_id, department_name.

select e. employee_id, 
       e. job_id,
       d.department_name
       FROM hr.employees e
       left join hr.departments d
       on e.department_id = d.department_id.

-- Count employees per department_name (one row per department).

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

--Show employees (name, salary) in department 'Sales'.

        SELECT e.first_name,
       e.last_name,
       e.salary
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';

--List department_id, department_name, and total salary (SUM(e.salary)) for that department

       SELECT d.department_id,
       d.department_name,
       SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


--Show employee_id, hire_date, department_name.

       SELECT e.employee_id,
       e.hire_date,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id;

-- List employees (first_name, last_name) and their department_name, ordered by department_name then last_name.

select e.first_name,
       e. last_name,
       d.department_name
       from hr.employees e
       join hr.departments d
       on e.department_id = d. department_id
       ORDER BY d.department_name,e.last_name;

--Show department_name and average salary (AVG(e.salary)) for that department..

SELECT d.department_name,
       AVG(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- List employee_id, first_name, department_id, department_name for job_id 'SA_REP'.

select e.employee_id,
       e.first_name,
       e.job_id,
       d.department_id,
       d.department_name
       from hr.departments d
       join hr.employees e
       on d.department_id = e.employee_id
       where e.job_id = 'SA_REP';


--Show departments (department_name) and min salary in that department.
 

        SELECT d.department_name,
       MIN(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- List first_name, last_name, department_name where department_id is 80 or 90.

select e.first_name,
       e.last_name,
       d.department_name
    FROM hr.departments d
       LEFT join hr.employees e
       on d.department_id = e.department_id
       WHERE d.department_id IN (80,90);

--Show employee_id, salary, department_name for the 5 highest-paid employees (join then ORDER BY salary DESC FETCH FIRST 5).

select e.employee_id,
       e. salary,
       d.department_name
       from hr.department d
     join hr.employees e
     on d.department_id = e. employees_id
     ORDER BY e.salary DESC, FETCH FIRST 5 ROWS ONLY;

-- List department_name and number of employees (COUNT) for departments with more than 5 employees.

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 5;


-- Show first_name, last_name, department_name, hire_date.

select e.first_name,
       e.last_name,
       e.hire_date,
       d.department_name
       from hr.departments d
      inner  join     hr.employees e
      on d.department_id = e.employee_id;

-- List employee_id, first_name, last_name, department_name, and manager's first_name and last_name (self-join employees to manager, and join to departments).
Hint: e JOIN d ON e.department_id = d.department_id LEFT JOIN employees m ON e.manager_id = m.employee_id; select e.*, d.department_name, m.first_name, m.last_name.


       SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       d.manager_id
FROM hr.employees e
JOIN hr.departments d
       ON e.department_id = d.department_id
ORDER BY e.employee_id;

-- Show department_name and total salary for departments where total salary > 100000.
     
SELECT d.department_name,
       SUM(e.salary) AS total_salary
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 100000
ORDER BY total_salary DESC;

--List employees (name, salary, department_name) who earn more than the average salary of their department.

 SELECT e.first_name,
       e.last_name,
       e.salary,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
WHERE e.salary > (
        SELECT AVG(e2.salary)
        FROM hr.employees e2
        WHERE e2.department_id = e.department_id
      )
ORDER BY d.department_name, e.salary DESC;



--Show each department_name and the name of the employee with the highest salary in that department (use ROW_NUMBER or MAX(salary) join).

SELECT department_name,
       first_name,
       last_name,
       salary
FROM (
    SELECT d.department_name,
           e.first_name,
           e.last_name,
           e.salary,
           ROW_NUMBER() OVER (
               PARTITION BY e.department_id
               ORDER BY e.salary DESC
           ) AS rn
    FROM hr.employees e
    JOIN hr.departments d
      ON e.department_id = d.department_id
)
WHERE rn = 1
ORDER BY department_name;

--List department_id, department_name, and count of employees, only for departments in (10, 20, 30, 40).

SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
  ON d.department_id = e.department_id
WHERE d.department_id IN (10, 20, 30, 40)
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id;

--Show employee first_name, last_name, department_name, and manager's department_name (employee's dept and manager's dept).
Hint: e JOIN d ON e.department_id = d.department_id LEFT JOIN employees m ON e.manager_id = m.employee_id LEFT JOIN departments dm ON m.department_id = dm.department_id; select e.first_name, e.last_name, d.department_name, dm.department_name.

SELECT e.first_name,
       e.last_name,
       d.department_name 
       dm.department_name
FROM hr.departments d
JOIN hr.employees e 
ON e.department_id = d.department_id
 LEFT JOIN employees m ON d.manager_id = e.employee_id
 LEFT JOIN departments dm ON d.department_id = e.department_id;

-- List department_name and average salary, ordered by average salary descending.

     SELECT d.department_name,
       AVG(e.salary) AS avg_salary
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;


--Show employees (name, salary, department_name) whose salary is above the company average.

      SELECT e.first_name,
       e.last_name,
       e.salary,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
WHERE e.salary > (
        SELECT AVG(salary)
        FROM hr.employees
      )
ORDER BY e.salary DESC;

--List departments (department_name) that have at least one employee with commission_pct not null.

SELECT DISTINCT d.department_name
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
WHERE e.commission_pct IS NOT NULL
ORDER BY d.department_name;

--Show employee_id, first_name, last_name, department_name, and department's manager_id (from departments).
Hint: Join e and d; select e.employee_id, e.first_name, e.last_name, d.department_name, d.manager_id.

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       d.manager_id AS department_manager_id
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
ORDER BY e.employee_id;

--List department_name and max salary in that department, only for departments with max salary > 12000.
Hint: Join, GROUP BY d.department_id, d.department_name, HAVING MAX(e.salary) > 12000.

SELECT d.department_name,
       MAX(e.salary) AS max_salary
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING MAX(e.salary) > 12000
ORDER BY max_salary DESC;


-- Show first_name, last_name, department_name for employees hired after 2005.
Hint: Join and WHERE e.hire_date > DATE '2005-12-31'.

SELECT e.first_name,
       e.last_name,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
WHERE e.hire_date > TO_DATE('31-DEC-2005', 'DD-MON-YYYY')
ORDER BY e.hire_date;

--List departments (department_name) and count of employees with job_id 'SA_REP' in that department.
Hint: Join, WHERE e.job_id = 'SA_REP', GROUP BY d.department_id, d.department_name, COUNT(e.employee_id).

SELECT d.department_name,
       COUNT(e.employee_id) AS sa_rep_count
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
WHERE e.job_id = 'SA_REP'
GROUP BY d.department_name;

--Show employee name, department_name, and salary rank within that department (RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)).
Hint: Join; in SELECT add RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS rank_in_dept.

SELECT e.first_name,
       e.last_name,
       d.department_name,
       e.salary,
       RANK() OVER (
           PARTITION BY e.department_id
           ORDER BY e.salary DESC
       ) AS salary_rank
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
ORDER BY d.department_name, salary_rank;

-- List department_name and total number of employees, including departments with 0 employees (use LEFT JOIN from departments to employees).
Hint: FROM hr.departments d LEFT JOIN hr.employees e ON d.department_id = e.department_id GROUP BY d.department_id, d.department_name; COUNT(e.employee_id).

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_name;

--Show employees (name, salary, department_name) in departments 50, 60, 70, ordered by department_name then salary desc.
Hint: Join, WHERE e.department_id IN (50,60,70), ORDER BY d.department_name, e.salary DESC.

SELECT e.first_name,
       e.last_name,
       e.salary,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
WHERE e.department_id IN (50, 60, 70)
ORDER BY d.department_name,
         e.salary DESC;

-- List department_name and average tenure (years) of employees in that department (MONTHS_BETWEEN/12).
Hint: Join; in SELECT AVG(MONTHS_BETWEEN(SYSDATE, e.hire_date)/12); GROUP BY d.department_id, d.department_name.

SELECT d.department_name,
       ROUND(AVG(MONTHS_BETWEEN(SYSDATE, e.hire_date) / 12), 2) 
       AS avg_tenure_years
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_tenure_years DESC;

--Show employee_id, first_name, last_name, department_name, and number of employees in that department (same count repeated per employee in dept).
Hint: Join and join to (SELECT department_id, COUNT() cnt FROM hr.employees GROUP BY department_id) sub ON e.department_id = sub.department_id; select e., d.department_name, sub.cnt.

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       COUNT(*) OVER (PARTITION BY e.department_id) 
           AS department_employee_count
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
ORDER BY d.department_name, e.employee_id;

--List departments (department_name) that have more than 2 employees with salary > 5000.
Hint: Join, WHERE e.salary > 5000, GROUP BY d.department_id, d.department_name, HAVING COUNT(*) > 2.

SELECT d.department_name,
       COUNT(e.employee_id) AS high_salary_emp_count
FROM hr.departments d
JOIN hr.employees e
  ON d.department_id = e.department_id
WHERE e.salary > 5000
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 2
ORDER BY d.department_name;

--Show first_name, last_name, department_name, and salary as percentage of department total (salary * 100.0 / SUM(salary) OVER (PARTITION BY e.department_id)).
Hint: Join; add salary * 100.0 / SUM(e.salary) OVER (PARTITION BY e.department_id) AS pct_of_dept_sal.

SELECT e.first_name,
       e.last_name,
       d.department_name,
       e.salary,
       ROUND(
           e.salary * 100.0 /
           SUM(e.salary) OVER (PARTITION BY e.department_id),
           2
       ) AS salary_percentage
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id
ORDER BY d.department_name, e.salary DESC;