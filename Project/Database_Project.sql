use employees;

-- Viewing the tables 
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- Overall Counts 
select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from employees;
select count(*) from salaries;
select count(*) from titles;

-- Obtaining counts 
select count(distinct dept_name) as 'Department Count' from departments;
select count(emp_no) as 'Employees Count in department' from dept_emp;
select count(distinct emp_no) as 'Department Manager Count' from dept_manager;
select count(distinct emp_no) as 'Employees Count' from employees;
select count(emp_no) as 'Number of Paid salary' from salaries;
select count(distinct title) as 'Title Count' from titles; 



-- Join tables 

-- Employees and title inner join (Employee Titles)
select * from employees inner join titles on employees.emp_no = titles.emp_no; -- first try

select employees.emp_no, employees.gender as 'Gender', (year(employees.hire_date) - year(employees.birth_date)) as 'Hire Age',
dayname(employees.hire_date) as 'Hire Weekday', day(employees.hire_date) as 'Hire Day',
monthname(employees.hire_date) as 'Hire Month', year(employees.hire_date) as 'Hire Year',
titles.title as 'Title' from employees inner join titles on employees.emp_no = titles.emp_no;

-- Titles and salary inner join (Title Salary)
select * from titles inner join salaries on titles.emp_no = salaries.emp_no; -- first try

select titles.emp_no, titles.title as 'Title', salaries.salary as 'Annual Salary', 
round((salaries.salary / 365), 0) as 'Daily Salary', round((salaries.salary / 52), 0) as 'Weekly', 
round((salaries.salary / 12), 0) as 'Monthly salary' from titles inner join salaries on titles.emp_no = salaries.emp_no;

-- Departments, deptmartment manager and salaries inner join (Department Manager Salary)
select * from ((dept_manager 
inner join departments on dept_manager.dept_no = departments.dept_no)
inner join salaries on dept_manager.emp_no = salaries.emp_no); -- first try

-- (year(dept_manager.to_date) - year(dept_manager.from_date)) as 'Manager Year(s)' include with a where clause (Remove large years)
-- Apply group by in R or Python
select dept_manager.emp_no, dept_manager.dept_no,
departments.dept_name as 'Department Name', salaries.salary as 'Annual Salary',
round((salaries.salary / 12), 0) as 'Monthly Salary' from ((dept_manager 
inner join departments on dept_manager.dept_no = departments.dept_no)
inner join salaries on dept_manager.emp_no = salaries.emp_no); 

-- Employees and Salary inner join (Employee Salary)
select count(*) from employees inner join salaries on employees.emp_no = salaries.emp_no; -- first try

select employees.emp_no, employees.birth_date, employees.first_name as 'First Name', employees.last_name as 'Last Name',
employees.gender as 'Gender', employees.hire_date, (2020 - year(employees.birth_date)) as 'Current Age',
(year(employees.hire_date) - year(employees.birth_date)) as 'Hire Age',
salaries.salary as 'Annual Salary', round((salaries.salary / 365), 0) as 'Daily Salary', round((salaries.salary / 52), 0) as 'Weekly', 
round((salaries.salary / 12), 0) as 'Monthly salary' from employees inner join salaries on employees.emp_no = salaries.emp_no;

-- Hire Age 
select first_name as 'First Name', last_name as 'Last Name', left(birth_date, 4) as 'Birth Year', 
left(hire_date, 4) as 'Hire Year', gender as 'Gender', left(hire_date, 4) - left(birth_date, 4) as 'Hired Age' from employees;

-- Daily, Weekly, Monthly and Yearly salary of employees
select * from salaries;
select salary as 'Annual Salary', (salary / 365) as 'Daily Salary', (salary / 52) as 'Weekly', 
(salary / 12) as 'Monthly salary' from salaries;

-- Hire Day and Month 
select emp_no, hire_date as 'Hire Date', dayname(hire_date) as 'Hire Weekday', day(hire_date) as 'Hire Day',
monthname(hire_date) as 'Hire Month', year(hire_date) as 'Hire Year' from employees; 

-- Current Age of Employees and Hire age 
select * from employees;
select emp_no, (2020 - year(birth_date)) as 'Current Age',
(year(hire_date) - year(birth_date)) as 'Hire Age', gender as 'Gender' from  employees;