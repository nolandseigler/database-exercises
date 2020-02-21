use employees;
SELECT *
FROM titles;

SELECT DISTINCT title
FROM titles;

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name;

SELECT DISTINCT t1.last_name, COUNT(*)
FROM (SELECT * FROM employees WHERE last_name LIKE '%q%') AS t1
WHERE last_name NOT LIKE '%qu%'
GROUP BY t1.last_name
ORDER BY COUNT(*);

SELECT COUNT(*), gender
FROM employees
WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
GROUP BY gender;