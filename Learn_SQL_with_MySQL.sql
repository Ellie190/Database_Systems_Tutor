use employees;

-- Counts 
select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from employees;
select count(*) from salaries;
select count(*) from titles; -- click broom to do formatting -- 

-- Check documentation homw, MYSQL 8.0 reference manual, data manipulation statements, select syntax --
-- Query demo 
select emp_no, count(*) as emp_count
from employees
where emp_no > 1 -- conditions to select data
group by emp_no -- how to group data
having emp_count > 0 -- conditions for aggregate functions 
order by emp_no -- how to order data
limit 5, 10; -- limit result set return 

-- Multiple selects 
select * from employees;
select first_name, last_name from employees; -- use brush to format syntax 

select * from salaries; 
select emp_no, salary from salaries;


-- Using Aliases 

select first_name as 'First Name', 'Last Name' as lastN from employees; -- Use proper names when you will be writing reports

-- Arithmetic Operators 
-- You can check info of a table on mySQL workbench by schemas

select * from salaries;
select salary from salaries;

select salary * .01 as weekly from salaries; -- weekly salary 
select salary, salary * .01 as weekly, salary * .01 * 4 as monthly, salary * .01 * 52 as yearly, 
salary + 200 * 0.1 as multiply_first,
(salary + 200) * 0.1 as add_first, -- need to understand the precedence of operators (like bodmas)
salary * 0.1 / 7 as daily,
salary DIV 3 as div_op,
salary % 3 as mod_op -- This is used to manipulate data, basic math is essential for generating weekly reports 
from salaries;
 
-- Using The left and Right MYSQL function 
-- examples 
-- MID(string, start, length)
select right('abcd',1);
select left('abcd', 2);
select mid('abcd', 2 ,2);

select * from employees;

select first_name, last_name, left(first_name, 1), left(last_name, 1) from employees; -- For example selecting a persons initials 

select first_name, last_name,
concat(left(first_name, 1), left(last_name, 1)) as Initials from employees; -- Having an initials column 

-- Introduction to SQL where clause 
select * from employees where first_name = 'Elvis';
select * from employees where first_name = 'Elvis' and last_name = 'Rossi';
select * from employees where first_name = 'Elvis' or last_name = 'Rossi';
-- The in keyword allows you to specify a list of values to match on 
-- Can be used to reduce the number of OR clauses 
select * from employees where first_name in ('Elvis', 'Mary', 'Uri', 'Moss');
select * from employees where first_name not in ('Elvis', 'Mary', 'Uri', 'Moss'); -- a space is not null 

-- Equal and Not Equal with SQL where clause

select * from employees where first_name = 'Elvis';
select * from employees where last_name = 'Elvis';
select * from employees where first_name <> 'Elvis'; -- not equal
select * from employees where first_name != 'Elvis'; -- not equal 
select count(*) from employees where first_name = 'Elvis';

-- AND and OR with SQL where clause 

select * from employees where first_name = 'Elvis';
select count(*) from employees where first_name = 'Elvis';
select * from employees where first_name = 'Elvis' and gender = 'M';
select count(*) from employees where first_name = 'Elvis' and gender = 'M';
select * from employees where first_name = 'Elvis' and last_name = 'Velasco';
select * from employees where first_name = 'Elvis' or last_name = 'Velasco';
select * from employees where first_name = 'Elvis' and last_name = 'Velasco'
or first_name = 'Chenye' and last_name = 'velasco';

-- Greater Than and less than in SQL where clause 

select * from salaries;
select count(*) from salaries;
select * from salaries where salary > 66961; -- less than or greater than for numeric or date values 
select count(*) from salaries where salary > 66961;
select count(*) from salaries where salary < 66961;
select count(*) from salaries where salary > 66961 and from_date > '1989-06-25';
select * from employees;
select * from employees where first_name > 'sam' ;-- perhaps for strings that have more characters 
select * from employees where first_name < 'sam';

-- Like and not like with SQL where clause
-- useful with textual data 
select * from employees;
select * from employees where first_name like 'E%'; -- picking all first names that start with E
select * from employees where first_name like 'E%' and last_name like '_e%'; -- select first_name begin with E last name with a second character as e
select * from employees where first_name like 'Elv%' and last_name like '_e%'; -- making use of a wildcard
select * from employees where first_name like 'Elv%' and last_name like '_e%' -- "_" underscore allows any character
and last_name not like '%n'; -- not end with with an n

-- Using Between and Not between with SQL where clause 

select * from salaries;
select * from salaries where salary > 66074 and salary <71046;
select count(*) from salaries where salary >= 66074 and salary <=71046;
select count(*) from salaries where salary between 66074 and 71046; -- works like great than or equal to or vice-versa
select * from employees;

select * from employed where birth_date between '1954-05-01' and '1956-04-20';
select count(*) from employed where birth_date between '1954-05-01' and '1956-04-20';
select * from employed where birth_date not between '1954-05-01' and '1956-04-20';
select count(*) from employed where birth_date not between '1954-05-01' and '1956-04-20';

-- Using SQL Order By 

select * from salaries;

select * from salaries order by salary asc;
select * from salaries order by salary desc;
select * from salaries order by from_date, salary desc;
select * from employees;
select * from employees order by first_name;
select * from employees where first_name = 'Elvis' order by birth_date;
select * from employees where first_name = 'Elvis' order by gender desc, birth_date desc, last_name;

-- Using the SQL limit clause 

select count(*) from employees;
select * from employees LIMIT 20;
select * from employees LIMIT 0, 20; -- allows you to page through the database, taking chunks of data out of the database 
select * from employees LIMIT 19, 20;
select * from employees order by emp_no LIMIT 0, 20; -- test with different limits and observe performance 
select * from employees order by emp_no LIMIT 19, 20; -- you can use the limit clause from the workbench environment 
select * from employees limit 300000; -- It will take long (machine dependent)


-- Using SQL Select Distinct 

select distinct first_name from employees; -- can be used on numbers and dates 
select count(distinct first_name) from employees; 
select distinct birth_date from employees;
select count(distinct birth_date) from employees;

-- Uisng Sub-Selects with SQL IN clause 

select distinct first_name from employees where first_name like 'E%'; -- runs the sub select first 
select * from employees where first_name in (select distinct first_name from employees where first_name like 'E%'); -- sub select