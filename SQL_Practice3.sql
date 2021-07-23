-- THIS IS LAB 7

-- SECTION 1: MORE SQL

-- 1 (Natural Join)
SELECT item.Name, saleitem.Quantity, saleitem.SaleId, sale.SaleDate
FROM item NATURAL JOIN saleitem NATURAL JOIN sale
ORDER BY saleitem.SaleId;

-- 2 (Inner Join)
SELECT item.Name, saleitem.Quantity, saleitem.SaleId, sale.SaleDate
FROM item 
INNER JOIN saleitem ON item.itemId = saleitem.itemId
INNER JOIN sale ON Saleitem.saleId = sale.SaleID
ORDER BY saleitem.SaleId;

-- Task 1.1
SELECT employee.FirstName, employee.LastName, employee.Salary, department.Name
FROM employee NATURAL JOIN department
WHERE employeeID IN
(SELECT BossID
FROM employee
GROUP BY BossID
HAVING COUNT(*) > 2
);

-- Task 1.2
SELECT supplier.SupplierID, supplier.Name
FROM deliveryitem 
NATURAL JOIN delivery
NATURAL JOIN supplier
GROUP BY supplier.SupplierID
HAVING COUNT(DISTINCT(deliveryitem.itemId)) > 10;	-- MUST use DISTINCT

-- Task 1.3 (WRONG because questions asked sold in 'navigation' department, you are using join in delivery
SELECT *
FROM deliveryitem 
INNER JOIN delivery ON deliveryitem.DeliveryId = delivery.DeliveryID
INNER JOIN supplier ON delivery.SupplierID = supplier.SupplierID
INNER JOIN department ON deliveryitem.departmentID = department.departmentID
INNER JOIN item ON deliveryitem.itemId = item.itemID
WHERE supplier.Name = "Nepalese Corp." AND department.Name = "Navigation";

-- Task 1.3 (Correct version)
SELECT DISTINCT item.Name FROM item
WHERE ItemID IN
(SELECT ItemID
FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN supplier WHERE supplier.Name = 'Nepalese Corp.')
AND ItemID IN (SELECT ItemID
FROM saleitem NATURAL JOIN sale NATURAL JOIN department WHERE department.Name = 'Navigation');

-- Task 1.4
SELECT DISTINCT(itemId)
FROM saleitem NATURAL JOIN sale NATURAL JOIN department
WHERE department.floor = 2
ORDER BY itemId;

-- Task 1.5
SELECT supplier.SupplierId, supplier.Name
FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN item
INNER JOIN supplier ON delivery.SupplierID = supplier.SupplierId
WHERE supplier.SupplierId IN 
(SELECT DISTINCT(supplier.SupplierId)
FROM delivery NATURAL JOIN  supplier NATURAL JOIN deliveryitem
INNER JOIN item ON item.itemID = deliveryitem.itemId
WHERE item.Name like 'Compass%')
GROUP BY supplier.SupplierId
HAVING COUNT(DISTINCT(itemId))>=2;

-- Task 1.9
SELECT supplier.SupplierID, supplier.Name
FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN item
INNER JOIN supplier ON supplier.SupplierID = delivery.SupplierID
WHERE item.Type = 'N' or item.Type = 'C'
GROUP BY supplier.SupplierID
HAVING SUM(deliveryitem.quantity) >=40;

-- CASE

-- Task 1.14
-- Note when using case, must include commar after 'SELECT'
-- don't have to include 'case output' in select, it is included by automatically
SELECT employee.FirstName, employee.LastName,
	CASE WHEN department.Floor in (3, 4) OR department.Name = 'Recreation' THEN 'Yes'
		 WHEN department.Floor = 2 THEN 'Maybe'
		 ELSE 'No'
	END AS RenovationStatus
FROM employee NATURAL JOIN department
ORDER BY employee.LastName;


-- Relational Devides (Exists, Non Exists)

-- Tasks 3.2
SELECT supplierID, supplier.Name FROM supplier
WHERE NOT EXISTS
(SELECT *
FROM item
WHERE item.Type = 'N'
AND NOT EXISTS (SELECT *
FROM delivery NATURAL JOIN deliveryitem
WHERE delivery.supplierID = supplier.supplierID
AND deliveryitem.itemID = item.itemID)
);

-- Task 3.3
SELECT *
FROM sale NATURAL JOIN department NATURAL JOIN SALEITEM










