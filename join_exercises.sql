use employees;
SHOW TABLES;
SELECT *
FROM employees;

# SELECT CURRENT MANAGER OF EVERY DEPARTMENT
SELECT d.dept_name as Department, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees as e
         JOIN dept_emp as de ON de.emp_no = e.emp_no
         JOIN dept_manager as dm ON de.emp_no = dm.emp_no AND dm.to_date > current_date()
         JOIN departments as d ON dm.dept_no = d.dept_no
ORDER BY d.dept_name;

# SELECT ALL DEPARTMENTS MANAGED BY FEMALES
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN dept_manager as dm on de.emp_no = dm.emp_no
WHERE dm.to_date < current_date()
  AND e.gender = 'F'
ORDER BY d.dept_name;

# SELECT TITLES AND COUNT FROM CUSTOMER SERVICE
SELECT t.title as Title, COUNT(*) AS Count
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN titles as t on de.emp_no = t.emp_no
WHERE t.to_date > current_date()
  AND d.dept_name = 'Customer Service'
GROUP BY t.title;

# SELECT SALARY OF CURRENT MANAGERS
SELECT d.dept_name as Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Name, s.salary as Salary
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN dept_manager as dm on de.emp_no = dm.emp_no
         JOIN salaries as s on dm.emp_no = s.emp_no
WHERE dm.to_date > current_date()
  AND s.to_date > current_date()
ORDER BY d.dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employee_Name,
       d.dept_name                            as Department_Name,
       CONCAT(f.first_name, ' ', f.last_name) AS Manager_Name
FROM employees as e
         JOIN dept_emp as de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
         JOIN dept_manager dm ON de.dept_no = dm.dept_no
         JOIN employees f ON dm.emp_no = f.emp_no
WHERE dm.to_date > current_date()
  AND de.to_date > current_date()
ORDER BY d.dept_name;

