1 . Replace NULL price with 0.

select NVL(UNIT_PRICE,0) FROM ORDERS;

2 .Replace NULL Customer_Name with 'Unknown'.

SELECT NVL(Customer_Name,'Unknown')  FROM ORDERS;

3 . Count NULL values in Product_Name.

SELECT COUNT(*)-COUNT(PRODUCT_NAME) AS NULL_PRODUCT_NAME FROM ORDERS;

4 . Find rows where Order_Date is NULL.

select * from Orders where Order_Date IS NULL;

5 . Use COALESCE to return first non-null value.

SELECT COALESCE(NULL,NULL,1000,2000) FROM DUAL;

6 . Use NVL to replace NULL values.

SELECT NVL(UNIT_PRICE,0) AS PRODUCT_NAME FROM ORDERS;

7 .Use IFNULL function.

SELECT NULLIF(100,100) FROM DUAL;

8 .Check if column is NULL.

SELECT * FROM ORDERS WHERE PRODUCT_NAME IS NULL;

9 . Check if column is NOT NULL.

SELECT * FROM ORDERS WHERE PRODUCT_NAME IS NOT NULL;

10 .Use NULLIF between two columns.

SELECT NULLIF(CUSTOMER_NAME,PRODUCT_CATEGORY) FROM ORDERS;

11 .Replace blank values with NULL.

SELECT NVL('',NULL) FROM DUAL;

12 .Count non-null values.

SELECT COUNT(PRODUCT_NAME) AS NON_NULL_COUNT FROM ORDERS;

13 .Filter records where price is NULL or 0.

SELECT * FROM ORDERS WHERE UNIT_PRICE IS NULL OR UNIT_PRICE=0;

14 .Use CASE to handle NULL values.

SELECT 
    CASE
        WHEN PRODUCT_NAME IS NULL THEN 'UNKNOWN'
        ELSE PRODUCT_NAME
    END AS FIXED_NAME FROM ORDERS;

15 .Compare NULL values properly.

SELECT * FROM ORDERS WHERE ORDER_ID=NULL;

16 .Handle NULL in aggregation.

SELECT AVG(NVL(UNIT_PRICE,0)) AS AVG_SALES FROM ORDERS;

17 .Find average excluding NULL values.

SELECT AVG(UNIT_PRICE) AS AVERAGE_SALES FROM ORDERS;

18 .Find sum ignoring NULL values.

SELECT SUM(UNIT_PRICE) FROM ORDERS;

19 .Identify columns containing NULL using metadata.

SELECT PRODUCT_NAME, NULLABLE FROM ORDERS WHERE ='ORDERS' AND NULL='Y';

20 .Convert NULL to default system date.

SELECT NVL(ORDER_ID, SYSDATE) FROM ORDERS;