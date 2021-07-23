-- THIS IS LAB 6

-- Taks 1.1
SELECT 
CONCAT(emp.FirstName, " ",  emp.LastName) as employee_Name,
emp.departmentID,
CONCAT(boss.FirstName, " ", boss.LastName) as boss_Name
FROM employee AS emp INNER JOIN employee AS boss 
ON emp.BossID = boss.employeeID
WHERE emp.departmentID = boss.departmentID;

-- Tasks 1.3
SELECT 
CONCAT(emp.FirstName, " ", emp.LastName) AS EmployeeName,
emp.Salary,
CONCAT(boss.FirstName, " ", boss.LastName) AS Managerh
FROM employee AS emp INNER JOIN employee AS boss
ON emp.BossID = boss.employeeID
WHERE emp.departmentID=11 and emp.salary > 55000;

SELECT * FROM employee;

-- Tasks 1.5
SELECT DISTINCT(item.Name)
FROM deliveryitem INNER JOIN item
ON deliveryitem.itemID=item.itemID
GROUP BY item.Name
HAVING COUNT(DISTINCT deliveryitem.departmentID) >= 2;

-- Tasks 2.1
SELECT count(deliverydate)
FROM delivery
WHERE MONTH(DeliveryDate) = 7;

-- Task 2.2
SELECT DISTINCT(Name)tt
FROM saleitem NATURAL JOIN item
WHERE Name LIKE "Tent%";

-- Task 2.3 
SELECT *
FROM (SELECT MONTH(SaleDate) AS Month, COUNT(SaleID) AS NumSales
FROM sale AS InnerSale
GROUP BY MONTH(SaleDate)
HAVING COUNT(SaleID)) as InnerSale
ORDER BY InnerSale.NumSales DESC
Limit 1;

-- Task 2.4
SELECT departmentID, SUM(Salary), COUNT(*)
FROM employee NATURAL JOIN department
GROUP BY department.departmentID
ORDER BY SUM(employee.Salary) ASC;

-- Task 2.5
SELECT COUNT(saleidt)
FROM sale
WHERE DAYNAME(SaleDate) = "Sunday";

-- REFERENCE (IMPORTANT)
-- Task 2.6
SELECT SupplierID, DATEDIFF(MAX(DeliveryDate), MIN(DeliveryDate)) AS datediff
FROM delivery 
GROUP BY SupplierID;

-- Task 2.7
SELECT CONCAT("The ", Name, " department is on floor number ", Floor) AS "Where is each department?"
FROM department
Order By Name;

-- Task 2.8
SELECT departmentID, MIN(Salary) AS MIN, MAX(Salary) AS MAX, STDDEV(Salary) AS STDDEV
FROM employee
GROUP BY departmentID;

-- Task 2.9
SELECT itemID as ItemID, Name
FROM item
WHERE Colour = 'green' AND Type = 'C';

