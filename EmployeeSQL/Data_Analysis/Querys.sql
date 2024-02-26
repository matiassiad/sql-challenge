-- Employee number, last name, first name, sex, and salary of each employee:

SELECT 
employee.emp_no, 
employee.last_name,
employee.first_name,
employee.sex,
salary.salary
FROM employee
LEFT JOIN salary
ON employee.emp_no = salary.emp_no
ORDER BY emp_no
;

-- First name, last name, and hire date for the employees who were hired in 1986

SELECT * FROM employee
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

-- Manager of each department along with their department number, department name, employee number, last name, and first name

SELECT 
deptmanager.dept_no, 
department.dept_name,
deptmanager.emp_no,
employee.last_name, 
employee.first_name
FROM deptmanager
LEFT JOIN department
ON deptmanager.dept_no = department.dept_no
LEFT JOIN employee
ON deptmanager.emp_no = employee.emp_no
ORDER BY emp_no
;

-- Department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT
deptemployee.dept_no,
employee.emp_no,
employee.last_name,
employee.first_name,
department.dept_name
FROM employee 
INNER JOIN deptemployee ON employee.emp_no=deptemployee.emp_no
INNER JOIN department ON department.dept_no=deptemployee.dept_no
ORDER BY emp_no
;

-- First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT * FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%'
;

-- Each employee in the Sales department, including their employee number, last name, and first name

SELECT 
deptemployee.dept_no,
employee.emp_no, 
employee.last_name, 
employee.first_name
FROM employee 
LEFT JOIN deptemployee 
ON employee.emp_no=deptemployee.emp_no
INNER JOIN department
ON department.dept_no=deptemployee.dept_no
WHERE department.dept_no='d007'
;

-- Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT
employee.emp_no, 
employee.last_name, 
employee.first_name,
department.dept_name
FROM employee
LEFT JOIN deptemployee 
ON employee.emp_no=deptemployee.emp_no
INNER JOIN department
ON department.dept_no=deptemployee.dept_no
WHERE department.dept_name IN ('Sales', 'Development')
ORDER BY dept_name
;

--  The frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name, 
COUNT(*) AS frequency
FROM employee
GROUP BY last_name
ORDER BY frequency DESC
;