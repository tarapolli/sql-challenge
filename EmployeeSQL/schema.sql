-- DATA ENGINEERING: create tables

--DROP TABLE employees; -- if/when need to execute a table
--SELECT * FROM employees; -- if/when needto execute a table

CREATE TABLE employees (
	emp_no VARCHAR(6) NOT NULL,
	emp_title_id VARCHAR(6) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
   dept_no VARCHAR(6) NOT NULL,
   emp_no VARCHAR(6) NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
    title_id VARCHAR(6) NOT NULL,
    title VARCHAR(25) NOT NULL,
	PRIMARY KEY (title_id)
);
	
CREATE TABLE dept_emp (
    emp_no VARCHAR(6) NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no VARCHAR(6) NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
	