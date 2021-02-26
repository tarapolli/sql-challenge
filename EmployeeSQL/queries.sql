-- DATA ANALYSIS

-- 1: details of each employee: employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 2: first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '12/31/1985' AND '1/1/1987';

-- 3: manager of each dept: dept number, dept name, the manager's employee no, last name, first name
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM departments AS d
INNER JOIN dept_manager AS dm ON dm.dept_no = d.dept_no
INNER JOIN employees AS e ON dm.emp_no = e.emp_no;

-- 4: dept of each employee identifying: employee number, last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM departments AS d
INNER JOIN dept_emp AS de ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no;

-- 5: first & last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6: employees in Sales dept, including their employee number, last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM departments AS d
INNER JOIN dept_emp AS de ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

-- 7: employees in Sales & Development depts, including employee number, last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM departments AS d
INNER JOIN dept_emp AS de ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

-- 8: In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;


