--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_id, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_id = s.emp_id
ORDER BY e.emp_id;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01'AND '1986-12-31'
ORDER BY hire_date;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_id, d.dept_name, e.emp_id, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_id = d.dept_id
INNER JOIN employees e
ON dm.emp_id = e.emp_id
ORDER BY d.dept_name;



--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_id, de.emp_id, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN departments d
ON de.dept_id = d.dept_id
INNER JOIN employees e
ON de.emp_id = e.emp_id
ORDER BY d.dept_name, e.last_name;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_id, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN departments d
ON de.dept_id = d.dept_id
INNER JOIN employees e
ON de.emp_id = e.emp_id
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name;


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_id, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN departments d
ON de.dept_id = d.dept_id
INNER JOIN employees e
ON de.emp_id = e.emp_id
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name, e.last_name;



--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS shared_last_name
FROM employees
GROUP BY last_name
ORDER BY shared_last_name DESC;



