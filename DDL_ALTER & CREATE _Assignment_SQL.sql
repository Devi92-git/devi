1 . Create a table hr_dept_backup as a full copy of hr.departments
 
CREATE TABLE hr_dept_backup AS SELECT * FROM hr.departments;

2 . Add a column notes VARCHAR2(100) to hr_emp_backup.

ALTER TABLE hr_dept_backup ADD NOTES VARCHAR2(100);


3 . Create a table emp_50 from employees in department 50 only (all columns).

CREATE TABLE emp_50 AS SELECT * FROM hr.employees WHERE department_id=50;

4 . Add column updated_at DATE DEFAULT SYSDATE to your backup table.

 ALTER TABLE ... ADD updated_at DATE DEFAULT SYSDATE;

 5 . Create a table dept_names with only department_id and department_name from hr.departments.

 CREATE TABLE dept_names AS SELECT department_id, department_name FROM hr.departments;

 6 . Modify column notes in hr_emp_backup to VARCHAR2(500).

 ALTER TABLE hr_emp_backup MODIFY notes VARCHAR2(500);

 7 . Create an empty table emp_structure with the same structure as hr.employees (no rows).

CREATE TABLE emp_structure AS SELECT * FROM hr.employees WHERE 1=0;

8 . Rename table hr_emp_backup to hr_employees_archive.

RENAME hr_emp_backup TO hr_employees_archive;

9 . Add two columns to a backup table: created_by VARCHAR2(50) and created_date DATE.

Two ALTER TABLE ... ADD statements (or one ADD with two columns if your Oracle version allows);

10 .Create table high_earners from hr.employees where salary > 10000 (all columns).

CREATE TABLE high_earners AS SELECT * FROM hr.employees WHERE salary > 10000;

11. Drop the column notes from your backup table.

ALTER TABLE hr_employees_archieve DROP COLUMN notes;

12 . Create table emp_salary_dept with only employee_id, salary, department_id from hr.employees.

CREATE TABLE emp_salary_dept AS SELECT employee_id, salary, department_id FROM hr.employees;

13. Truncate the table emp_50 (or whatever copy table you created).

TRUNCATE TABLE emp_50;

14 . Rename column remarks to comments in your backup table.

ALTER TABLE hr_employees_archieve RENAME COLUMN remarks TO comments;

15. Create a table dept_emp_count with department_id and a literal 0 as column emp_count (one row per department).

 CREATE TABLE dept_emp_count AS SELECT department_id, 0 AS emp_count FROM hr.departments;

16. Add column status VARCHAR2(20) DEFAULT 'ACTIVE' to a backup table.

 ALTER TABLE DEPT_EMP_COUNT ADD status VARCHAR2(20) DEFAULT 'ACTIVE';

 17 . Create table emp_hire_2005 from hr.employees where EXTRACT(YEAR FROM hire_date) = 2005.

 CREATE TABLE emp_hire_2005 AS SELECT * FROM hr.EMPLOYEES WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2005;

18 . Modify column status to VARCHAR2(30).

 ALTER TABLE dept_emp_count MODIFY status VARCHAR2(30);

19. Create an empty table with the same structure as hr.departments. Name it dept_template.

 CREATE TABLE dept_template AS SELECT * FROM hr.DEPARTMENTS WHERE 1 = 0;

20. Add column audit_id NUMBER(10) to your backup table.

 ALTER TABLE hr_employees_archieve ADD audit_id NUMBER(10);

 HARD QUESTIONS;

  1 . Create a table emp_dept_summary that has one row per department with columns department_id, department_name (from hr.departments), and a computed column total_sal (use a subquery or join to get SUM(salary) per department).

CREATE TABLE emp_dept_summary AS SELECT d.department_id, d.department_name, (SELECT SUM(e.salary) FROM hr.employees e WHERE e.department_id = d.department_id) AS total_sal FROM hr.departments d;

2 . Create table emp_backup_80 from hr.employees for department 80, but only columns employee_id, first_name, last_name, salary, commission_pct.

 CREATE TABLE emp_backup_80 AS SELECT employee_id, first_name, last_name, salary, commission_pct FROM hr.employees WHERE department_id = 80;

 3 . Add a column full_name to a backup table and populate it with first_name || ' ' || last_name for all existing rows (requires UPDATE after ADD; then you could add a default for new rows).

 ALTER TABLE hr_employees_archive ADD full_name VARCHAR2(50);

UPDATE hr_employees_archive SET full_name = NVL(first_name, '') || ' ' || NVL(last_name, '');


4 . Create a table that has department_id, department_name, and a column manager_name (you would need to join hr.departments with hr.employees on manager_id to get manager name).

CREATE TABLE dept_with_mgr AS SELECT d.department_id, d.department_name, e.first_name || ' ' || e.last_name AS manager_name FROM hr.departments d LEFT JOIN hr.employees e ON d.manager_id = e.employee_id;

5 . Create table emp_job_salary with columns job_id, min_sal, max_sal, avg_sal (use GROUP BY job_id with MIN, MAX, AVG on salary from hr.employees).

CREATE TABLE emp_job_salary AS SELECT job_id, MIN(salary) AS min_sal, MAX(salary) AS max_sal, AVG(salary) AS avg_sal FROM hr.employees GROUP BY job_id;

6 . Add a column that has a DEFAULT expression using SYSDATE and rename an existing column in the same table (two statements).

 ALTER TABLE hr_employees_archive ADD created_date DATE DEFAULT SYSDATE;

 7 . Create a table emp_top_sal with the same structure as hr.employees but only rows where salary is in the top 10 (use subquery: WHERE salary IN (SELECT ... ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY)).

 CREATE TABLE emp_top_sal AS SELECT * FROM hr.employees WHERE salary IN (SELECT salary FROM hr.employees ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY);

8 . Create table dept_emp_list with department_id, department_name, and employee_count (count of employees per department).

CREATE TABLE dept_emp_list AS SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count FROM hr.departments d LEFT JOIN hr.employees e ON e.department_id = d.departmetn_id GROUP BY d.department_id, d.department_name;

9 . Drop two columns from your backup table in one statement (if Oracle supports: ALTER TABLE ... DROP (col1, col2)).

ALTER TABLE emp_backup_80 DROP (commission_pct, salary);

10 . Create a table that contains only employees whose manager_id is not null and department_id is not null (all columns).

CREATE TABLE emp_with_mgr_dept AS SELECT * FROM hr.employees WHERE manager_id IS NOT NULL AND department_id IS NOT NULL;

11 . Add a column salary_band VARCHAR2(10) and update it with CASE (Low/Medium/High) based on salary; then add DEFAULT 'Medium' for new rows.

ALTER TABLE hr_employees_archive ADD salary_band VARCHAR2(10);
UPDATE hr_employees_archive SET salary_band = CASE WHEN salary < 5000 THEN 'Low' WHEN salary BETWEEN 5000 AND 10000 THEN 'Medium' ELSE 'High' END;

12 .Create table emp_duplicate_check with employee_id, first_name, last_name, and a column dup_count showing how many employees share the same first_name and last_name (use analytic or self-join in CTAS).

CREATE TABLE emp_duplicate_check AS SELECT employee_id, first_name, last_name, COUNT(*) OVER (PARTITION BY first_name, last_name) AS dup_count FROM hr.employees;

13 . Create an empty table with the same structure as hr.employees and name it emp_import_staging.

CREATE TABLE emp_import_staging AS SELECT * FROM hr.employees WHERE 1 = 0;

14 .Modify the data type of a column from NUMBER to VARCHAR2 (e.g. store employee_id as string). Oracle may require add new column, update, drop old, rename.

ALTER TABLE hr_employees_archive ADD employee_id_str VARCHAR2(20);

UPDATE hr_employees_archive SET employee_id_str = TO_CHAR(employee_id);

ALTER TABLE hr_employees_archive DROP COLUMN employee_id;

ALTER TABLE hr_employees_archive RENAME COLUMN employee_id_str TO employee_id;

15 . Create table dept_location_1700 from hr.departments where location_id = 1700.

CREATE TABLE dept_location_1700 AS SELECT * FROM hr.departments WHERE location_id = 1700;

16 . Add column version NUMBER DEFAULT 1 and last_modified DATE DEFAULT SYSDATE to backup table.

ALTER TABLE emp_backup_80 ADD last_modified DATE DEFAULT SYSDATE;

17 . Create table emp_salary_range with columns from hr.employees but only for salary between 5000 and 15000.

CREATE TABLE emp_salary_range AS SELECT * FROM hr.employees WHERE salary BETWEEN 5000 AND 15000;

18 . Truncate a table and then add a new column. Verify the table has 0 rows

TRUNCATE TABLE emp_salary_range;

ALTER TABLE emp_salary_range ADD remarks VARCHAR2(100);

SELECT COUNT(*) FROM emp_salary_range;

19 . Create table job_list with distinct job_id from hr.employees and a literal column category with value 'HR'.

CREATE TABLE job_list AS SELECT DISTINCT job_id, 'HR' AS category FROM hr.employees;

20 . Drop table emp_structure if it exists (Oracle: use PL/SQL EXECUTE IMMEDIATE 'DROP TABLE emp_structure'; with exception when table does not exist, or check user_tables first).

BEGIN EXECUTE IMMEDIATE 'DROP TABLE emp_structure'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END; (942 = table does not exist);