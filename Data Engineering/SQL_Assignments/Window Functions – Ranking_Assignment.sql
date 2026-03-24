M1. ROW_NUMBER() OVER (ORDER BY salary DESC) for each employee. Hint: Add ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn.

SELECT 
    employee_id,
    first_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
FROM hr.employees;

M2. RANK() OVER (PARTITION BY department_id ORDER BY salary DESC). Hint: Rank by salary within department.


SELECT 
    employee_id,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
FROM hr.employees;

M3. DENSE_RANK() OVER (ORDER BY hire_date) for tenure order. Hint: DENSE_RANK() OVER (ORDER BY hire_date).

select employee_id,hire_date,
DENSE_RANK() OVER(ORDER BY hire_date) from hr.employees;

M4. NTILE(4) OVER (ORDER BY salary) for salary quartiles. Hint: NTILE(4) OVER (ORDER BY salary) AS quartile.


SELECT 
    employee_id,
    first_name,
    salary,
    NTILE(4) OVER (ORDER BY salary) AS quartile
FROM hr.employees;

M5. Top 1 per department by salary: use ROW_NUMBER() in subquery, then WHERE rn = 1. Hint: Subquery with ROW_NUMBER() PARTITION BY department_id ORDER BY salary DESC; outer WHERE rn = 1.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        department_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS rn
    FROM hr.employees
) t
WHERE rn = 1;

M6. RANK() OVER (ORDER BY salary DESC NULLS LAST). Hint: NULLS LAST in ORDER BY.

select employee_id,first_name,salary ,
RANK() OVER (ORDER BY salary DESC NULLS LAST) AS rnk
FROM hr.employees;

M7. ROW_NUMBER() OVER (PARTITION BY job_id ORDER BY hire_date). Hint: Row number by hire date within job

select job_id,employee_id,hire_date ,
ROW_NUMBER() OVER (PARTITION BY job_id ORDER BY hire_date)
FROM hr.employees;

M8. DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary). Hint: Dense rank by salary within dept.

select department_id,salary,
DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary)
 FROM hr.employees;

 M9. NTILE(5) OVER (ORDER BY salary) for quintiles. Hint: NTILE(5).

 select employee_id,salary,
 NTILE(5) OVER(ORDER  BY salary)
 FROM hr.employees;

M10. RANK() OVER (PARTITION BY department_id ORDER BY hire_date DESC) (newest first = 1). Hint: Rank by hire_date DESC per dept.

select department_id,first_name,hire_date ,
RANK() OVER(PARTITION BY department_id ORDER BY hire_date DESC)
FROM hr.employees;

M11. Show employee_id, salary, and ROW_NUMBER() OVER (ORDER BY employee_id). Hint: Simple row number by employee_id.

select employee_id,salary,
ROW_NUMBER() OVER(ORDER BY employee_id)
FROM hr.employees;

M12. DENSE_RANK() OVER (ORDER BY commission_pct DESC NULLS LAST). Hint: Rank commission; NULLS LAST.

select employee_id,commission_pct,
DENSE_RANK() OVER(ORDER BY commission_pct DESC NULLS LAST)
FROM hr.employees;

M13. ROW_NUMBER() OVER (PARTITION BY department_id, job_id ORDER BY salary DESC). Hint: Partition by dept and job.

select department_id,job_id,salary,
ROW_NUMBER() OVER(PARTITION BY department_id,job_id ORDER BY salary DESC)
FROM hr.employees;

M14. NTILE(10) OVER (ORDER BY salary) for deciles. Hint: NTILE(10).

select employee_id,salary,
NTILE(10) OVER(ORDER BY salary)
FROM HR.EMPLOYEES;

M15. RANK() OVER (ORDER BY salary) for ascending rank (lowest salary = 1). Hint: ORDER BY salary ASC.

select employee_id,salary,
RANK() OVER (ORDER BY salary ASC) 
FROM  HR.EMPLOYEES;

M16. Top 3 per job_id by salary: ROW_NUMBER() PARTITION BY job_id ORDER BY salary DESC, then filter rn <= 3. Hint: Subquery with rn; WHERE rn <= 3.


SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        job_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY job_id 
            ORDER BY salary DESC
        ) AS rn
    FROM hr.employees
) t
WHERE rn <= 3;

M17. DENSE_RANK() OVER (PARTITION BY job_id ORDER BY hire_date). Hint: Dense rank by hire date per job.

select job_id,hire_date,
DENSE_RANK() OVER(PARTITION BY job_id ORDER BY hire_date) 
FROM HR.EMPLOYEES;

M18. RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) and filter rank = 1 (highest per dept). Hint: In subquery; WHERE rank = 1.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        department_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS rnk
    FROM hr.employees
) t
WHERE rnk = 1;

M19. NTILE(3) OVER (PARTITION BY department_id ORDER BY salary). Hint: Tertiles within each department.

select department_id,salary,
NTILE(3) OVER(PARTITION BY department_id ORDER BY salary) AS tertiles
FROM HR.EMPLOYEES;

M20. ROW_NUMBER() OVER (PARTITION BY manager_id ORDER BY salary DESC) (rank among direct reports). Hint: Partition by manager_id.

select manager_id,salary,
ROW_NUMBER() OVER (PARTITION BY manager_id ORDER BY salary DESC)
FROM HR.EMPLOYEES;

H1. Top 2 earners per department: ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC), filter rn <= 2. Hint: Subquery, WHERE rn <= 2.

SELECT * FROM ( 
    SELECT department_id,salary,
    ROW_NUMBER() OVER ( PARTITION BY department_id ORDER BY salary DESC) AS rn 
    FROM HR.EMPLOYEES
)t
where  rn<=2;

H2. Rank employees by salary within department; show only those with rank <= 3 (top 3 per dept). Hint: RANK() or ROW_NUMBER(); filter rank/rn <= 3.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        department_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS rnk
    FROM hr.employees
) t
WHERE rnk <= 3;

H3. DENSE_RANK() OVER (PARTITION BY job_id ORDER BY salary DESC) and also show job_id and count of people in that job (use COUNT() OVER (PARTITION BY job_id)). 
Hint: Two window functions: DENSE_RANK and COUNT() OVER (PARTITION BY job_id).


SELECT 
    employee_id,
    first_name,
    job_id,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY job_id 
        ORDER BY salary DESC
    ) AS drnk,
    COUNT(*) OVER (
        PARTITION BY job_id
    ) AS job_count
FROM hr.employees;

H4. NTILE(4) OVER (ORDER BY salary) and then group by quartile to show min(salary), max(salary) per quartile. Hint: Subquery with NTILE; outer query GROUP BY quartile.

 
 SELECT 
    quartile,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM (
    SELECT 
        salary,
        NTILE(4) OVER (ORDER BY salary) AS quartile
    FROM hr.employees
) t
GROUP BY quartile
ORDER BY quartile;

H5. ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date) to get "first hired" per department (rn=1). Hint: ORDER BY hire_date; WHERE rn = 1.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        department_id,
        hire_date,
        ROW_NUMBER() OVER (
            PARTITION BY department_id 
            ORDER BY hire_date
        ) AS rn
    FROM hr.employees
) t
WHERE rn = 1;

H6. Rank by salary within department; show only employees with rank 1 or 2 (two highest per dept). Hint: RANK() or DENSE_RANK(); WHERE rank IN (1,2).

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        department_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS rnk
    FROM hr.employees
) t
WHERE rnk IN (1, 2);

H7. RANK() OVER (PARTITION BY job_id ORDER BY salary DESC) and RANK() OVER (PARTITION BY job_id ORDER BY hire_date). Hint: Two different RANK() in same SELECT.

SELECT 
    employee_id,
    job_id,
    salary,
    hire_date,
    
    RANK() OVER (
        PARTITION BY job_id 
        ORDER BY salary DESC
    ) AS salary_rank,
    
    RANK() OVER (
        PARTITION BY job_id 
        ORDER BY hire_date
    ) AS hire_rank

FROM hr.employees;

H8. NTILE(4) OVER (PARTITION BY department_id ORDER BY salary) (quartiles within dept). Hint: NTILE(4) with PARTITION BY department_id.

SELECT 
    department_id,
    salary,
    NTILE(4) OVER (
        PARTITION BY department_id 
        ORDER BY salary
    ) AS quartile
FROM hr.employees;

H9. DENSE_RANK() OVER (ORDER BY salary DESC) and filter where dense_rank = 5 (5th highest salary). Hint: Subquery; WHERE dense_rank = 5.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS drnk
    FROM hr.employees
) t
WHERE drnk = 5;

H10. ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC, employee_id) to break ties. Hint: Add employee_id to ORDER BY for deterministic order.

SELECT employee_id,
    department_id,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC, employee_id
    ) AS rn
FROM hr.employees;

H11. Top 1 employee per department by tenure (earliest hire): ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date), rn=1. Hint: ORDER BY hire_date ASC; rn=1.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        department_id,
        hire_date,
        ROW_NUMBER() OVER (
            PARTITION BY department_id 
            ORDER BY hire_date ASC
        ) AS rn
    FROM hr.employees
) t
WHERE rn = 1;

H12. RANK() OVER (PARTITION BY job_id ORDER BY salary) and show only rank 1 (lowest salary per job). Hint: Subquery; WHERE rank = 1.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        job_id,
        salary,
        RANK() OVER (
            PARTITION BY job_id 
            ORDER BY salary
        ) AS rnk
    FROM hr.employees
) t
WHERE rnk = 1;

H13. NTILE(2) OVER (PARTITION BY department_id ORDER BY salary) (median split per dept). Hint: NTILE(2) per department_id.

SELECT 
    employee_id,
    department_id,
    salary,
    NTILE(2) OVER (
        PARTITION BY department_id 
        ORDER BY salary
    ) AS half
FROM hr.employees;


H14. DENSE_RANK() OVER (PARTITION BY department_id ORDER BY hire_date DESC) and filter rank = 1 (most recently hired per dept). Hint: ORDER BY hire_date DESC; rank=1.

SELECT *
FROM (
    SELECT 
        employee_id,
        department_id,
        hire_date,
        DENSE_RANK() OVER (
            PARTITION BY department_id 
            ORDER BY hire_date DESC
        ) AS drnk
    FROM hr.employees
) t
WHERE drnk = 1;

H15. ROW_NUMBER() OVER (ORDER BY salary DESC) and filter row number between 5 and 10 (5th to 10th highest salary). Hint: WHERE rn BETWEEN 5 AND 10.

SELECT *
FROM (
    SELECT 
        employee_id,
        first_name,
        salary,
        ROW_NUMBER() OVER (
            ORDER BY salary DESC
        ) AS rn
    FROM hr.employees
) t
WHERE rn BETWEEN 5 AND 10;

H16. Rank employees by salary within department; show department_id, employee_id, salary, rank; include only departments with at least 3 employees. Hint: Use subquery with RANK(); outer WHERE department_id IN (SELECT department_id FROM hr.employees GROUP BY department_id HAVING COUNT() >= 3) or use COUNT() OVER.

SELECT 
    department_id,
    employee_id,
    salary,
    rnk
FROM (
    SELECT 
        department_id,
        employee_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS rnk,
        COUNT(*) OVER (
            PARTITION BY department_id
        ) AS dept_count
    FROM hr.employees
) t
WHERE dept_count >= 3;

H17. NTILE(4) OVER (ORDER BY salary) and ROUND(AVG(salary) OVER (), 2) in same SELECT. Hint: NTILE + AVG(salary) OVER () for company avg.

SELECT 
    employee_id,
    first_name,
    salary,
    
    NTILE(4) OVER (ORDER BY salary) AS quartile,
    
    ROUND(AVG(salary) OVER (), 2) AS company_avg_salary

FROM hr.employees;

H18. RANK() OVER (PARTITION BY manager_id ORDER BY salary DESC) (rank among direct reports per manager). Hint: Partition by manager_id.

SELECT 
    employee_id,
    first_name,
    manager_id,
    salary,
    RANK() OVER (
        PARTITION BY manager_id 
        ORDER BY salary DESC
    ) AS rnk
FROM hr.employees;

H19. Top 3 jobs by total salary: from (SELECT job_id, SUM(salary) s FROM hr.employees GROUP BY job_id ORDER BY s DESC FETCH FIRST 3 ROWS ONLY) or use RANK() over grouped data. Hint: Subquery with GROUP BY and RANK() OVER (ORDER BY SUM(salary) DESC) or FETCH.

SELECT 
    job_id,
    SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id
ORDER BY total_salary DESC
FETCH FIRST 3 ROWS ONLY;

H20. DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) and also show (SELECT department_name FROM hr.departments d WHERE d.department_id = e.department_id). Hint: Join departments or scalar subquery for name; DENSE_RANK in SELECT.

SELECT 
    e.employee_id,
    e.first_name,
    e.department_id,
    e.salary,
    
    DENSE_RANK() OVER (
        PARTITION BY e.department_id 
        ORDER BY e.salary DESC
    ) AS drnk,
    
    (SELECT d.department_name
     FROM hr.departments d
     WHERE d.department_id = e.department_id) AS department_name

FROM hr.employees e;