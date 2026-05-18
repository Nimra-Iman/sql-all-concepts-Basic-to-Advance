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
-- dusra column saath selected na ho, yani SELECT k baad just vhi column/columns ho jis pr aggregate function 
-- apply kia h , e.g: select min(col1), max(col1) from table gives correct answer 

-- ***********************************   6-   ********************************************
-- limit used to get just specific number of rows, e.g: to get just 1st row

-- ******************************   7-   *********************************
-- window function never reduce number of rows, if you have 7 rows and you wanna counmt the the sopcific
-- occurance of sometihing from a column, and that thing appears 3 times, then count with window function will 
-- provide that row three times in the output, that's why use distinct if you wanty to show the specific
-- row single time, e.g: following code provide the following output:

select  trackname , count(position) over(partition by trackname ) as times_ranked from 
spotify_worldwide_daily_song_ranking where position  = 1 order by times_ranked desc ;
-- the output is: 
-- trackname	times_ranked
-- HUMBLE.	7
-- HUMBLE.	7
-- HUMBLE.	7
-- HUMBLE.	7
-- HUMBLE.	7
-- HUMBLE.	7
-- HUMBLE.	7
-- Bad and Boujee (feat. Lil Uzi Vert)	1
-- Look What You Made Me Do	1
-- ----------------BUT we want to show the output just one time, we will use distinct(trackname)
-- trackname	times_ranked
-- HUMBLE.	7
-- Bad and Boujee (feat. Lil Uzi Vert)	1
-- Look What You Made Me Do	1

--  ************************************ 8-  **************************************
-- Use parentheses when we have to use both and & or, as 'and' will is interpreted first.
select name from olympics_athletes_events where age>40 and (medal = 'Bronze' or medal = 'Silver');
-- Without parentheses they will provide results when (age is greater than 40 and the medal is bronze) or when
-- medal is silver. 

-- ***************************  9-  ******************************** 
select date(date_column) from table_name;
select year(date_column) from table_name;
select month(date_column) from table_name;
select datediff("2024-12-3","2025-4-1") from table_name; -- will give days differnce,
-- If the first rate is smaller and the second rate is larger, we will still get a positive value. 
 
 -- *************************  10-   ********************************
 -- If we have more than two conditions, don't use WHERE two times. Just write one
 -- WHERE then condition and then condition just. 
 
 select * from google_file_store
where contents like "%optimism%" and age>3;
 
 -- ************************ 11--  ******************************
 














