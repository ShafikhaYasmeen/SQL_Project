# 🛒 Zepto E-commerce SQL Portfolio Project
This is a comprehensive portfolio project based on a real-world e-commerce inventory dataset collected from [Zepto](https://www.zeptonow.com/) — one of India’s fastest-growing quick-commerce platforms. The project replicates typical data analyst workflows, from examining raw data to generating actionable business insights using SQL.

This project is perfect for:
- 🔍 Anyone wanting to explore real-world e-commerce datasets
- 📚  SQL beginners looking for hands-on practice
- 💼 Developers building portfolio projects for data roles
## 📌 What You’ll Learn

 > Create and structure SQL tables with proper data types

 > Import and clean messy datasets

 > Perform data exploration and business analysis using SQL

 > Write queries to answer business questions about pricing, stock, revenue, and discounts

## 📁 Dataset Overview

Source: Kaggle

Each row = a product SKU

Columns include: sku_id, name, category, mrp, discountPercent, discountedSellingPrice, availableQuantity, weightInGms, outOfStock, quantity

This dataset mimics real e-commerce inventory data, including duplicates, multiple package sizes, and pricing variations.

#🔧 SQL Project Steps

🧾 Columns:
- **sku_id:** Unique identifier for each product entry (Synthetic Primary Key)

- **name:** Product name as it appears on the app

- **category:** Product category like Fruits, Snacks, Beverages, etc.

- **mrp:** Maximum Retail Price (originally in paise, converted to ₹)

- **discountPercent:** Discount applied on MRP

- **discountedSellingPrice:** Final price after discount (also converted to ₹)

- **availableQuantity:** Units available in inventory

- **weightInGms:** Product weight in grams

- **outOfStock:** Boolean flag indicating stock availability

- **quantity:** Number of units per package (mixed with grams for loose produce)
- 
Here’s a step-by-step breakdown of what we do in this project:

### 1. Database & Table Creation
We start by creating a SQL table with appropriate data types:

```
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
```
### 2. Data Import
\copy zepto(category,name,mrp,discountPercent,availableQuantity,
           discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');

### 3. Explore Data

 > Count total records
  
 > Check for null values
  
 > Identify unique categories and stock levels

### 4. Clean Data

> Remove rows with zero prices

> Convert prices from paise → rupees

### 5. Analyze Data

> Find top discounted products

> Identify out-of-stock high-priced items

> Calculate potential revenue per category

> Rank categories by average discount

> Compare price per gram for value products
### 💡 Tips for SQL Learners

 > Focus on writing queries before running them to understand logic
  
 > Try modifying queries to answer your own questions from the dataset
  
 > Practice grouping, joining, and aggregating data — core skills for any SQL developer


## 🛠️ How to Use This Project

1. **Open zepto_SQL_data_analysis.sql**

    This file contains:

      - Table creation

      - Data exploration

      - Data cleaning

      - SQL Business analysis
  
2. **Load the dataset into pgAdmin or any other SQLServer client**

      - Create a database and run the SQL file

      - Import the dataset (convert to UTF-8 if necessary)




## 💡 Thanks for checking out the project! Your support means a lot — feel free to star ⭐ this repo or share it with someone learning SQL.🚀
