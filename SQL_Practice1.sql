SELECT firstname, lastname, salary
FROM employee
WHERE departmentID = 11
OR salary > 55000;

### FORMATTING OUTPUT (Format @ Round)
#	- Round (X, D) round argument X to D decimal places
#	- Format (X, D) format argument X to D decimal places, include commas as thousand seperators
SELECT AVG(Salary) AS AVG_SAL
FROM employee;

SELECT FORMAT(AVG(Salary), 2) AS AVG_SAL
FROM employee;

SELECT ROUND(AVG(Salary), 2) AS AVG_SAL
FROM employee;

### SUBQUERIES
SELECT FirstName, LastName, Salary
FROM employee
WHERE salary < (SELECT AVG(salary) FROM employee);

# Task 2.14
SELECT CONCAT(FirstName, " ", LastName)
FROM employee
WHERE departmentID = (SELECT departmentID FROM department WHERE Name = 'Marketing');

# use keyword IN as part of the WHERE clause (Inner Result more THAN 1 row)
# use '=' 
SELECT COUNT(*) AS fifth_floor_count
FROM employee
WHERE departmentID = (SELECT departmentID
FROM department
WHERE Floor = 5);

### NATURAL JOIN
SELECT department.name, employee.firstname, employee.lastname
FROM employee NATURAL JOIN department;

# without mentioning table name (each column name is unique in query)
SELECT name, firstname, lastname
FROM employee NATURAL JOIN department;

### INNER JOIN
# Task 2.15 ----- broken into two parts, part a
SELECT MAX(employee.salary)
FROM employee NATURAL JOIN department
WHERE (department.name = 'Marketing');
# Task 2.15 ----- broken into two parts, part b
SELECT FirstName, LastName, Salary
FROM employee NATURAL JOIN department
WHERE employee.salary > 
(SELECT MAX(employee.salary)
FROM employee NATURAL JOIN department
WHERE department.name = 'Marketing');

# Task 2.16 
# Part A
SELECT BossID
FROM employee
WHERE FirstName = 'Clare' AND LastName = 'Underwood';
# Part B (combine)
SELECT firstname, lastname, salary
FROM employee
WHERE employeeID = (
SELECT BossID
FROM employee
WHERE FirstName = 'Clare' AND LastName = 'Underwood');

# Task 2.17
# Part A
## Must Group if wanna use aggregrate function, if not using aggregrate function, don't use Group By
SELECT BossID
FROM employee
GROUP BY BossID
HAVING COUNT(BossID) > 2 AND COUNT(departmentID) >= 1;
# part b  (NOT COMPLETE, reference to sample ans)
SELECT employeeID, FirstName, LastName
FROM employee
WHERE employeeID in (
SELECT BossID
FROM employee
GROUP BY BossID
HAVING COUNT(BossID) > 2 AND COUNT(departmentID) >= 1);
# ***** SAMPLE ANS ********
SELECT boss.employeeid, boss.firstname, boss.lastname, COUNT(emp.employeeid) AS employee_count
FROM employee AS emp INNER JOIN employee AS boss 
ON emp.bossid = boss.employeeid
WHERE boss.employeeid IN (SELECT managerid FROM department)
GROUP BY boss.employeeid
HAVING COUNT(emp.employeeid) > 2;

# UNDERSTAND THIS by visualise the table
SELECT *
FROM employee AS emp INNER JOIN employee AS boss 
ON emp.bossid = boss.employeeid






