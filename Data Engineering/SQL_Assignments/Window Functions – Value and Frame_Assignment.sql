M1. LAG(salary) OVER (PARTITION BY department_id ORDER BY employee_id). Hint: Previous row is salary in dept.

select employee_id,department_id,salary, 
LAG(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS prev_salary_in_depy
FROM HR.EMPLOYEES;

M2. LEAD(salary) OVER (PARTITION BY department_id ORDER BY employee_id). Hint: Next row is salary in dept.

select employee_id,department_id,salary,
LEAD(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS next_salary_in_depy
FROM HR.EMPLOYEES;

M3. SUM(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total.
 Hint: Running total by hire_date.

SELECT employee_id, hire_date, salary,
SUM(salary) OVER (ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_salary
FROM hr.employees;

M4. AVG(salary) OVER (PARTITION BY department_id). Hint: Dept average per row.

select employee_id,department_id,salary,
AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
FROM HR.EMPLOYEES;

M5. LAG(hire_date) OVER (PARTITION BY department_id ORDER BY hire_date). Hint: Previous hire date in dept.

select employee_id,department_id,hire_date,
LAG(hire_date) OVER(PARTITION BY department_id ORDER BY hire_date) previous_hire_date
FROM HR.EMPLOYEES;

M6. SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date ROWS UNBOUNDED PRECEDING AND CURRENT ROW). Hint: Running total per dept by hire_date.

select department_id,hire_date,salary,
SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date ROWS UNBOUNDED  PRECEDING AND CURRENT ROW) AS running total per dept by hire_date
FROM HR.EMPLOYEES;

M7. LEAD(hire_date) OVER (PARTITION BY department_id ORDER BY hire_date). Hint: Next hire date in dept.

select employee_id,department_id,hire_date,
LEAD(hire_date) OVER(PARTITION BY department_id ORDER BY hire_date) next_hire_date
FROM HR.EMPLOYEES;

M8. AVG(salary) OVER (PARTITION BY department_id ORDER BY employee_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW). Hint: Moving 3-row average per dept.

select employee_id,department_id,salary,
AVG(salary) OVER (PARTITION BY department_id ORDER BY employee_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)AS moving_avg_3
FROM HR.EMPLOYEES;

M9. FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary). Hint: Min salary in dept.

select employee_id,department_id,salary,
FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary) min_salary_dept
FROM HR.EMPLOYEES;

M10. LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING). Hint: Max salary in dept.

select employee_id,department_id,salary,
LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) max_salary_dept
FROM HR.EMPLOYEES;

M11. LAG(salary, 2, 0) OVER (ORDER BY employee_id). Hint: Salary from 2 rows back; default 0.

select employee_id,salary,
LAG(salary) OVER(ORDER BY employee_id) AS prev_2_salary
FROM HR.EMPLOYEES;

M12. SUM(salary) OVER (PARTITION BY job_id ORDER BY hire_date). Hint: Running total per job.

select job_id,hire_date,salary,
SUM(salary) OVER(PARTITION BY job_id ORDER BY hire_date) AS running_total_salary
FROM HR.EMPLOYEES;

M13. LEAD(commission_pct) OVER (PARTITION BY department_id ORDER BY employee_id). Hint: Next row is commission_pct in dept.

select employee_id,department_id,salary,commission_pct,
LEAD(commission_pct) OVER (PARTITION BY department_id ORDER BY employee_id) AS next_commission_pct
FROM HR.EMPLOYEES;

M14. AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW). Hint: Moving 5-row average.

select employee_id,salary,hire_date,
AVG(salary) OVER(ORDER BY hire_date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS moving_avg_5
FROM HR.EMPLOYEES;

M15. LAG(first_name) OVER (PARTITION BY department_id ORDER BY employee_id). Hint: Previous employee is first name in dept.

select  employee_id,first_name,department_id,
LAG(first_name) OVER (PARTITION BY department_id ORDER BY employee_id) prev_emp_first_name
FROM HR.EMPLOYEES;

M16. SUM(salary) OVER () AS total_company_salary (same value per row). Hint: No PARTITION/ORDER or ORDER BY with full window.

SELECT  employee_id, salary,
SUM(salary) OVER () AS total_company_salary
FROM hr.employees;

M17. FIRST_VALUE(hire_date) OVER (PARTITION BY department_id ORDER BY hire_date). Hint: Earliest hire in dept.

select employee_id,department_id,hire_date,
FIRST_VALUE(hire_date) OVER (PARTITION BY department_id ORDER BY hire_date) earliest_hire_date
from hr.employees;

M18. LAST_VALUE(hire_date) OVER (PARTITION BY department_id ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING). Hint: Latest hire in dept.

select employee_id,department_id,hire_date,
LAST_VALUE(hire_date) OVER (PARTITION BY department_id ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS latest_hire_date
from hr.employees;

M19. LAG(salary) OVER (ORDER BY salary DESC). Hint: Next lower salary (order by salary desc so "previous" in that order).

select employee_id,salary,
LAG(salary) OVER(ORDER BY salary DESC) next_lower_salary 
FROM hr.employees;

M20. COUNT(*) OVER (PARTITION BY department_id). Hint: Count of employees in dept per row.

select employee_id,department_id,
COUNT(*) OVER (PARTITION BY department_id) count_emp
from hr.employees;

H1. Running total of salary by hire_date for whole company; also show running count (COUNT(*) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING AND CURRENT ROW)). Hint: SUM and COUNT with same frame.

SELECT 
    employee_id,
    hire_date,
    salary,
    SUM(salary) OVER (
        ORDER BY hire_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_salary,
    
    COUNT(*) OVER (
        ORDER BY hire_date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_count
FROM hr.employees;

H2. For each employee show salary, LAG(salary), and salary - LAG(salary) AS diff_from_prev (difference from previous row salary in partition). Hint: LAG in SELECT; then expression; partition by dept order by employee_id.

SELECT 
    employee_id,
    department_id,
    salary,
    
    LAG(salary) OVER (
        PARTITION BY department_id 
        ORDER BY employee_id
    ) AS prev_salary,
    
    salary - LAG(salary) OVER (
        PARTITION BY department_id 
        ORDER BY employee_id
    ) AS diff_from_prev

FROM hr.employees;

H3. Moving average of salary (5 rows: 2 preceding, current, 2 following) per department. Hint: ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING.

SELECT 
    employee_id,
    department_id,
    salary,
    
    AVG(salary) OVER (
        PARTITION BY department_id
        ORDER BY employee_id
        ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
    ) AS moving_avg_salary

FROM hr.employees;

4. FIRST_VALUE(salary) and LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary) with correct frame for LAST_VALUE. Hint: LAST_VALUE needs RANGE UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING.

select employee_id,department_id,salary,
FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary ) AS lowest_salary_in_dept,

    LAST_VALUE(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS highest_salary_in_dept

FROM hr.employees;

H5. Lead of hire_date (next hire in dept) and DATEDIFF or (LEAD(hire_date) - hire_date) for days between hires. Hint: LEAD(hire_date) - hire_date; Oracle date arithmetic gives days.

SELECT 
    employee_id,
    department_id,
    hire_date,

    LEAD(hire_date) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) AS next_hire_date,

    LEAD(hire_date) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) - hire_date AS days_between_hires

FROM hr.employees;

H6. Running sum of salary partitioned by department_id, ordered by hire_date; also show row number within department by hire_date. Hint: SUM(...) OVER (PARTITION BY department_id ORDER BY hire_date); ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date).

SELECT 
    employee_id,
    department_id,
    hire_date,
    salary,

    SUM(salary) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary,

    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) AS row_num_in_dept

FROM hr.employees;

H7. LAG(salary, 1, salary) OVER (PARTITION BY department_id ORDER BY employee_id) (previous salary or self if first). Hint: Default third arg = salary for first row.

SELECT 
    employee_id,
    department_id,
    salary,

    LAG(salary, 1, salary) OVER (
        PARTITION BY department_id
        ORDER BY employee_id
    ) AS prev_salary_or_self

FROM hr.employees;

H8. Percent of department total: salary * 100.0 / SUM(salary) OVER (PARTITION BY department_id). Hint: Ratio to sum; no ORDER BY in SUM for full partition.

SELECT 
    employee_id,
    department_id,
    salary,

    ROUND(
        salary * 100.0 / SUM(salary) OVER (PARTITION BY department_id),
        2
    ) AS pct_of_dept_total

FROM hr.employees;

H9. Running total of salary by department and hire_date; show also cumulative percentage of department total (running_sum / SUM(salary) OVER (PARTITION BY department_id) * 100). Hint: Running sum and fixed sum per dept.

SELECT 
    employee_id,
    department_id,
    hire_date,
    salary,

    -- Running total within department ordered by hire_date
    SUM(salary) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary,

    -- Fixed total per department for cumulative percentage
    ROUND(
        SUM(salary) OVER (
            PARTITION BY department_id
            ORDER BY hire_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) * 100.0 / 
        SUM(salary) OVER (PARTITION BY department_id),
        2
    ) AS cumulative_pct_of_dept

FROM hr.employees;

H10. LEAD(salary, 2) OVER (PARTITION BY job_id ORDER BY salary DESC) (salary of person 2 ranks below in job). Hint: LEAD with offset 2.

SELECT 
    employee_id,
    job_id,
    salary,

    LEAD(salary, 2) OVER (
        PARTITION BY job_id
        ORDER BY salary DESC
    ) AS salary_2_below

FROM hr.employees;

H11. FIRST_VALUE(first_name) OVER (PARTITION BY department_id ORDER BY salary DESC) (name of highest-paid in dept). Hint: ORDER BY salary DESC; first value is top earner.

select first_name,department_id,salary,
FIRST_VALUE(first_name) OVER (PARTITION BY department_id ORDER BY salary DESC) AS higest_paid_dept
from hr.employees;

H12. Moving 3-row median or middle value: use NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) if available, or average of 3. Hint: Oracle: NTH_VALUE or (LAG(salary)+salary+LEAD(salary))/3 for 3-row window.


SELECT  employee_id,department_id,salary,
 NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS moving_median_salary
FROM hr.employees;

H13. Running sum of salary per department; reset at each new department. Hint: SUM(salary) OVER (PARTITION BY department_id ORDER BY employee_id ROWS UNBOUNDED PRECEDING AND CURRENT ROW)

SELECT employee_id,department_id,salary,
 SUM(salary) OVER ( PARTITION BY department_id ORDER BY employee_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
 ) AS running_salary_in_dept
FROM hr.employees;

H14. LAG(salary) and LEAD(salary) in same SELECT; show salary, prev, next. Hint: Both LAG and LEAD with same PARTITION/ORDER.

SELECT employee_id,department_id,salary,
 LAG(salary) OVER ( PARTITION BY department_id ORDER BY employee_id
    ) AS prev_salary,
LEAD(salary) OVER (
        PARTITION BY department_id
        ORDER BY employee_id
    ) AS next_salary
FROM hr.employees;

H15. LAST_VALUE(employee_id) OVER (PARTITION BY department_id ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) (employee_id of last hired in dept). Hint: LAST_VALUE with full frame.

SELECT employee_id,department_id,hire_date,
 LAST_VALUE(employee_id) OVER (PARTITION BY department_id ORDER BY hire_date
     RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_hired_employee_id
FROM hr.employees;

H16. Running average (not sum) of salary over hire_date: AVG(salary) OVER (ORDER BY hire_date ROWS UNBOUNDED PRECEDING AND CURRENT ROW). Hint: AVG with same frame as running sum.

SELECT  employee_id, hire_date, salary,
 AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_avg_salary
FROM hr.employees;

H17. Difference from department average: salary - AVG(salary) OVER (PARTITION BY department_id). Hint: No ORDER BY in AVG for partition average.

SELECT  employee_id,department_id,salary,
AVG(salary) OVER ( PARTITION BY department_id ) AS dept_avg_salary,
 salary - AVG(salary) OVER ( PARTITION BY department_id ) AS diff_from_dept_avg
FROM hr.employees;

H18. LAG(salary) OVER (PARTITION BY department_id ORDER BY hire_date) and compare to current (salary - LAG(salary)). Hint: LAG by hire_date; then diff.

SELECT 
    employee_id,
    department_id,
    hire_date,
    salary,

    LAG(salary) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) AS prev_salary,

    salary - LAG(salary) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
    ) AS diff_from_prev

FROM hr.employees;

H19. COUNT(*) OVER (PARTITION BY department_id ORDER BY hire_date ROWS UNBOUNDED PRECEDING AND CURRENT ROW) (running count of employees in dept by hire order). Hint: Running count with same frame

SELECT 
    employee_id,
    department_id,
    hire_date,

    COUNT(*) OVER (
        PARTITION BY department_id
        ORDER BY hire_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_count_in_dept

FROM hr.employees;

H20. FIRST_VALUE and LAST_VALUE of salary OVER (PARTITION BY job_id ORDER BY salary); show job_id, salary, min_sal, max_sal. Hint: FIRST_VALUE and LAST_VALUE with full frame for LAST_VALUE.

SELECT 
    employee_id,
    job_id,
    salary,

    FIRST_VALUE(salary) OVER (
        PARTITION BY job_id
        ORDER BY salary
    ) AS min_sal,

    LAST_VALUE(salary) OVER (
        PARTITION BY job_id
        ORDER BY salary
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS max_sal

FROM hr.employees;