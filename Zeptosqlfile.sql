Create Database zepto_sql_Project

USE zepto_sql_Project; 
DROP TABLE IF EXISTS zepto;


create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARchar(50),
name varchar(150) Not NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
availableQuantity INTEGER,
discountSellingPrice NUMERIC(8, 2),
weightinGMS  INTEGER,
OutofStock BOOLEAN,
qunatity Integer
);
USE zepto_sql_project;
SHOW TABLES;
SELECT COUNT(*) FROM zepto_v2;

SELECT * FROM zepto_v2
LIMIT 18;

SELECT * FROM zepto_v2 
WHERE Category is NULL
OR name is NULL
OR mrp is NULL 
OR discountPercent is NULL 
OR availableQuantity is NULL OR
discountedSellingPrice is NULL
OR weightInGms is NULL 
OR outOFStock is NULL Or quantity is NULL;


select count(*) from zepto_v2;


SELECT distinct Category
FROM zepto_v2
ORDER BY Category;

DESCRIBE zepto_v2;
SHOW COLUMNS FROM zepto_v2;




SELECT outOfStock, COUNT(*) AS total_products
FROM zepto_v2
GROUP BY outOfStock;



SELECT name, COUNT(*) AS number_of_products
FROM zepto_v2
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT * FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;


SET SQL_SAFE_UPDATES = 0;


DELETE FROM zepto_v2
WHERE mrp = 0;

SET SQL_SAFE_UPDATES = 1;


SET SQL_SAFE_UPDATES = 0;

UPDATE zepto_v2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100;

SELECT mrp, discountedSellingPrice From zepto_v2 ;



SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;



SELECT DISTINCT name,mrp
FROM zepto_v2
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;


SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue;


SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;



SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY price_per_gram;



SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_v2;



SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight;






