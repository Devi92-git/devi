CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(150),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Payment_Mode VARCHAR(50),
    Store_Location VARCHAR(100)
);


INSERT ALL
    INTO Orders VALUES (1001, TO_DATE('2026-02-01','YYYY-MM-DD'), 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore')
    INTO Orders VALUES (1002, TO_DATE('2026-02-02','YYYY-MM-DD'), 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad')
    INTO Orders VALUES (1003, TO_DATE('2026-02-03','YYYY-MM-DD'), 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai')
    INTO Orders VALUES (1004, TO_DATE('2026-02-04','YYYY-MM-DD'), 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai')
    INTO Orders VALUES (1005, TO_DATE('2026-02-05','YYYY-MM-DD'), 'C005', 'Kiran Rao', 'Home Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore')
    INTO Orders VALUES (1006, TO_DATE('2026-02-06','YYYY-MM-DD'), 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi')
    INTO Orders VALUES (1007, TO_DATE('2026-02-07','YYYY-MM-DD'), 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata')
    INTO Orders VALUES (1008, TO_DATE('2026-02-08','YYYY-MM-DD'), 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi')
    INTO Orders VALUES (1009, TO_DATE('2026-02-09','YYYY-MM-DD'), 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad')
    INTO Orders VALUES (1010, TO_DATE('2026-02-10','YYYY-MM-DD'), 'C010', 'Meena Iyer', 'Home  Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune')
SELECT * FROM DUAL;

COMMIT;

1. Round Unit_Price to 2 decimal places.
SELECT round(unit_price,2) as round_unit_price FROM ORDERS;

 2. Find total sales per order.
SELECT PRODUCT_NAME,SUM(Unit_Price * Quantity) AS total_sales FROM orders GROUP BY PRODUCT_NAME;

 3. Calculate average order value.
SELECT AVG(Unit_Price * Quantity)  AS avg_order FROM orders;

4. Find highest product price.
SELECT Max(Unit_price) as Highest_product_price from orders;

5. Find lowest product price.
SELECT min(Unit_price) As Min_price from orders;

 6. Calculate percentage discount applied.

select * from orders;
SELECT order_id,unit_price,discounted_price,
((unit_price - discounted_price) / unit_price) * 100 AS discount_percentage
from orders;

 7. Find modulus of Quantity divided by 2.
select mod(quantity,2) from orders;

8. Convert negative values to positive.
SELECT order_id,Quantity, ABS(Quantity) AS converted_value  FROM orders;

9 . Truncate price without rounding.
select trunc(unit_price,0) from orders;

10 . Find square root of total sales.
select sqrt(quantity * unit_price) from orders;
11	. Calculate exponential value of a number.

12	. Calculate power of 2^5.
select power(2,5) as result from dual;

13	. Find absolute difference between two prices.
select abs(max(unit_price) - min(unit_price)) AS Price_Difference from orders;
14	. Calculate sales growth percentage.

 15 . Find random number between 1 and 100.
select round(dbms_random.value(1,100)) as Random_Number from dual;

16.  Divide total sales by number of orders.
select sum(quantity * unit_price) / count(*) as Avg_Sales_Per_Order from Orders;
   17.Find ceiling value of price.
select ceil(unit_price) from orders;

18	.Find floor value of price.
select floor(unit_price) from orders;
19	.Convert decimal to integer.
select round(unit_price) AS Integer_value from orders;
20	.Calculate compound interest.
select 10000 * power((1+(0.08/1)), (1*2)) as compound_amount from dual;