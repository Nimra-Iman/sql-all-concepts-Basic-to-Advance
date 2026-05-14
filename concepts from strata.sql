-- 1- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- If a PK table has one ID and the FK table has multiple rows for that ID, 
-- then JOIN will return all matching rows. But if we only want one row per
-- ID (from the PK table), we use DISTINCT or a better method to avoid 
-- duplicates. e.g: Find all posts which were reacted to with a heart. 
-- For such posts output all columns from facebook_posts table. (ab post_table
-- k andr hr post ID ek bar mention h and reaction table m bhht bar h, hmy bs 
-- us post_id ko ek hi bar dekhna h, is liye distinct use kryn gy, otherwise, 
-- jitni bar heart react kia gya us post pr utni rows output m show hon gi


-- 2- ********************* "HOW TO CHECK DUPLICATES FROM DATA"  **********************************
select * from test_data;
CREATE TABLE duplicated_rows (
    id INT,
    name VARCHAR(50),
    age INT
);
INSERT INTO duplicated_rows (id, name, age) VALUES
(1, 'Ali', 20),
(2, 'Sara', 22),
(3, 'Ahmed', 21),
(2, 'Sara', 22),   -- duplicate row
(3, 'Ahmed', 21),  -- duplicate row
(4, 'Zain', 23);

-- check duplicted rows (When rows having the same ID, name, and age come in one group 
-- Then count (*) will count how many rows present in one group, yani agr (1, ali, 20) 
-- ka ek group bna to count y count kry ga k is group m kitni rows ai, is group m 
-- sirf 1 hi row ay gi agr y rows duplicated na hui to, agr y duplicated hui to is group
-- m (1, ali, 20) vali saari rows jayn gi :
select id, name, age, count(*) from duplicated_rows group by id, name, age having count(*)>1;

--  **********************************   3- **************************************
-- WHERE CANNOT USE AGGREGATE FUNCTIONS:
-- SELECT * FROM TABLE_NAME WHERE MAX(ID);   --ERROR 

-- **********************************  4-  *********************************************
-- agr y dekhn ah k jab ek specific column ki y y values hin gi to koi chees calculate kro
-- is k liye where k saath IN lgana h, 
select sum(sales_revenue) from sales_performance where salesperson in ( "Samantha",  "Lisa");  

-- ***************************************** 5- *********************************
-- We can use some aggregate functions such as `sum`, `max`, `min`, etc. without `GROUP BY`, but koi bhi 
-- dusra column saath selected na ho, yani SELECT k baad just vhi column ho jis pr aggregate function 
-- apply kia h  

-- ***********************************   6-   ********************************************
-- limit used to get just specific number of rows, e.g: to get just 1st row

-- ******************************   7-   *********************************







