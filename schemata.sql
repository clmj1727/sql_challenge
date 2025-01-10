
--Data Engineering

/*
	drop table if exists titles CASCADE;
	drop table if exists employees CASCADE;
	drop table if exists departments CASCADE;
	drop table if exists dept_manager CASCADE;
	drop table if exists dept_emp CASCADE;
	drop table if exists salaries CASCADE;
*/	

create table titles(
	title_id VARCHAR primary key,
	title VARCHAR
);

select * from titles;

create table employees(
	emp_no INT primary key,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	foreign key (emp_title_id) references titles(title_id)
);

select * from employees;

create table departments(
	dept_no VARCHAR primary key,
	dept_name VARCHAR
);

select * from departments;

create table dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no) --composite of dept_no and emp_no = primary key
);

select * from dept_manager;

create table dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no) --composite of dept_no and emp_no = primary key
);

select * from dept_emp;

create table salaries(
	emp_no INT primary key,
	salary INT,
	foreign key (emp_no) references employees(emp_no)
);

select * from salaries;