CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(50),
	birth_date DATE NOT NULL,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    sex CHAR(1),
    hire_date DATE NOT NULL
);

CREATE TABLE Department (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(200)
);


CREATE TABLE DeptEmployee (
    emp_no INT,
    dept_no CHAR(4),
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);


CREATE TABLE DeptManager (
    dept_no CHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Salary (
    emp_no INT,
    salary MONEY,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

CREATE TABLE Titles (
    title_id VARCHAR(50),
    title VARCHAR(200)
);

