create database zepto
use zepto
-- creation of table
CREATE TABLE zepto (
    sku_id INT identity PRIMARY KEY,
    category NVARCHAR(120),
    name NVARCHAR(150) NOT NULL,
    mrp DECIMAL(12,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(12,2),
    weightInGms INT,
    outOfStock BIT,
    quantity INT
);

select * from zepto
--count number of records
select count(*) from zepto
--Top 10 records
select top(10)* from zepto
--check null
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null

---different product categories 
select Distinct category
from zepto
order by category 

--how many products are in-stock and out-of-stock
select outOfStock,count(sku_id) as number_of_products
from zepto
group by outOfStock

--product names present multiple times
select * from zepto

select name,count(sku_id) AS "number of SKUs" 
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) DESC

--DATA CLEANING

--products with price =0
select * from zepto
where mrp=0 OR discountedSellingPrice=0

--delete the where price=0
delete from zepto
where mrp=0 OR discountedSellingPrice=0

--convert paise to rupees
update zepto
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0

select mrp,discountedSellingPrice from zepto

--1)find the top 10 best-value products based on the discount percentage
select distinct top(10) name,mrp,discountPercent 
from zepto
order by discountPercent desc
--2)what is the product name with high mrp but out of stck
select top(1) name,mrp
from zepto
where outOfStock=1
order by mrp desc
--3)Calculate Estimated Revenue fo each category
select * from zepto

select category, sum(discountedSellingPrice * availableQuantity) AS total_revenue
from zepto
group by category
order by total_revenue

--4)find all products where mrp is greater than 500 and discount is less than 10%
select distinct name,mrp, discountPercent 
from zepto
where mrp>500 and discountPercent<10
order by mrp desc
--5)Identify the top 5 categories offering the highest average discount percentage
select top(5) category,ROUND(AVG(discountPercent),2) AS avg_discount
from zepto
group by category
order by avg_discount desc
--6)find the price per gram for products above 100g and sort by best value
select distinct name, weightInGms, discountedSellingPrice,Round(discountedSellingPrice/weightInGms,2) AS price_per_Gram
from zepto
where weightInGms>100
order by price_per_Gram
--7)Group the Products into categories like low,medium, bulk
select distinct name,weightInGms,
CASE WHEN weightInGms<1000 THEN 'LOW'
	WHEN weightInGms<5000 THEN 'Medium'
	ELSE 'BULK'
	END AS weight_category
from zepto
--8)what is the total Inventary weight Per category
select category,sum(weightInGms * availableQuantity) AS total_weight
from zepto
group by category
order by total_weight



