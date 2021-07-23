SELECT cust_state_province, COUNT(*)
FROM clients
WHERE country_id = 'AU'
GROUP BY cust_state_province;

-- Task 3.1
-- Query 1
SELECT cust_id, cust_last_name, cust_year_of_birth, cust_state_province
FROM clients
WHERE cust_state_province IN ('Victoria', 'New South Wales');

-- Query 2
SELECT cust_city, cust_year_of_birth, COUNT(*) FROM clients
WHERE cust_state_province = 'IL'
GROUP BY cust_city, cust_year_of_birth;

-- Query 3
SELECT country_name, cust_state_province, COUNT(*) FROM countries NATURAL JOIN clients
WHERE country_name = 'United Kingdom'
GROUP BY country_name, cust_state_province
ORDER BY COUNT(*) DESC;

-- Query 4
SELECT country_id, cust_state_province, cust_city, COUNT(*) FROM clients
GROUP BY country_id, cust_state_province, cust_city
ORDER BY COUNT(*) DESC;

-- Section 4
SHOW INDEXES FROM clients;

SHOW INDEXES FROM countries;

SHOW INDEXES FROM saleitem;

-- Task 4.3
-- SHOW INDEXES FROM clients;
-- index = cust_id, country_id
SELECT cust_first_name, cust_last_name, cust_marital_status, cust_city, cust_income_level
FROM clients
WHERE cust_last_name = 'Parkburg'
AND cust_first_name = 'Peter' AND cust_city = 'Trafford';

-- Task 4.4
-- create index on cust_city
CREATE INDEX cust_city_idx ON clients (cust_city);

-- Task 4.5
SELECT cust_first_name, cust_last_name, cust_marital_status, cust_city, cust_income_level
FROM clients
WHERE cust_last_name = 'Parkburg'
AND cust_first_name = 'Peter' AND cust_city = 'Trafford';

-- Task 4.6
-- create index on cust_last_name and cust_city
CREATE INDEX cust_last_name_city_idx
ON clients (cust_last_name, cust_city);

-- Task 4.7
SELECT cust_first_name, cust_last_name, cust_marital_status, cust_city, cust_income_level
FROM clients
WHERE cust_last_name = 'Parkburg'
AND cust_first_name = 'Peter' AND cust_city = 'Trafford';

-- Task 4.8
DROP INDEX cust_city_idx ON clients;
DROP INDEX cust_last_name_city_idx ON clients;

-- Task 4.9
-- Query 1
CREATE INDEX cust_state_province_index
ON clients (cust_state_province);

DROP INDEX cust_state_province_index
ON clients;

SELECT cust_id, cust_last_name, cust_year_of_birth, cust_state_province
FROM clients
WHERE cust_state_province IN ('Victoria', 'New South Wales');

-- Query 2
CREATE INDEX cust_state_province_index
ON clients(cust_state_province);

SELECT cust_city, cust_year_of_birth, COUNT(*) FROM clients
WHERE cust_state_province = 'IL'
GROUP BY cust_city, cust_year_of_birth;

-- Task 4.10
-- Query 3
CREATE UNIQUE INDEX country_name_index
ON countries (country_name);

DROP INDEX country_name_index
ON countries;

SELECT country_name, cust_state_province, COUNT(*) FROM countries NATURAL JOIN clients
WHERE country_name = 'United Kingdom'
GROUP BY country_name, cust_state_province
ORDER BY COUNT(*) DESC;

-- Task 4.11
-- Query4
SHOW INDEXES FROM clients;

SELECT country_id, cust_state_province, cust_city, COUNT(*) 
FROM clients
GROUP BY country_id, cust_state_province, cust_city
ORDER BY COUNT(*) DESC;


