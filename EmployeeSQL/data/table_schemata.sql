CREATE TABLE titles(
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

SELECT * FROM titles

CREATE TABLE departments(
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

SELECT * FROM departments

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title CHAR(5) NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title)
		REFERENCES titles(title_id)
);

SELECT * FROM employees

ALTER TABLE employees ALTER COLUMN birth_date TYPE date USING to_date(birth_date, 'MM/DD/YYYY');
ALTER TABLE employees ALTER COLUMN hire_date TYPE date USING to_date(hire_date, 'MM/DD/YYYY');

CREATE TABLE department_employees(
	emp_no INT NOT NULL,
	dept_no CHAR(4) NOT NULL,
	PRIMARY KEY ( emp_no, dept_no),
	FOREIGN KEY ( emp_no)
		REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no)
		REFERENCES	departments(dept_no)
);

SELECT * FROM department_employees


CREATE TABLE department_manager(
	dept_no CHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY ( dept_no, emp_no),
	FOREIGN KEY ( emp_no)
		REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no)
		REFERENCES	departments(dept_no)
);

SELECT * FROM department_manager


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no)
		REFERENCES employees(emp_no)
);

SELECT * FROM salaries
