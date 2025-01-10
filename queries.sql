--Data Analysis

 -- 1. List the employee number, last name, first name, sex, and salary of each employee.
 select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
 from employees
 join salaries on employees.emp_no = salaries.emp_no;

 -- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
 select employees.first_name, employees.last_name, employees.hire_date
 from employees
 where hire_date between '1986-01-01' and '1986-12-31';
 
 -- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
 select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
 from employees as e
 join dept_manager as dm on e.emp_no=dm.emp_no
 join departments as d on dm.dept_no=d.dept_no;
 
 -- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
 select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
 from employees as e
 join dept_emp as de on de.emp_no = e.emp_no
 join departments as d on d.dept_no = de.dept_no;
 
 
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
 select e.first_name, e.last_name, e.sex
 from employees as e
 where e.first_name = 'Hercules' and e.last_name like 'B%';

 -- 6. List each employee in the Sales department, including their employee number, last name, and first name.
 select e.emp_no, e.last_name, e.first_name
 from employees as e
 join dept_emp on dept_emp.emp_no = e.emp_no
 where dept_emp.dept_no = 'd007';

	--52245 employees in sales department
	 select count(emp_no)
	 from dept_emp
	 where dept_emp.dept_no = 'd007';

 
 -- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
 	-- total employees in sale and development: 137,952
 select e.emp_no, e.last_name, e.first_name
 from employees as e
 join dept_emp on dept_emp.emp_no = e.emp_no
 where dept_emp.dept_no = 'd007' or dept_emp.dept_no = 'd005';

	-- 85707 employees in development department
 	 select count(emp_no)
	 from dept_emp
	 where dept_emp.dept_no = 'd005';
 
 -- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;