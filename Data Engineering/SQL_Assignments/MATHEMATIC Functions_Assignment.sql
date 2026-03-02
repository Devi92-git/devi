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

INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location)
VALUES
(1001, '2026-02-01', 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore'),

(1002, '2026-02-02', 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad'),

(1003, '2026-02-03', 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai'),

(1004, '2026-02-04', 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai'),

(1005, '2026-02-05', 'C005', 'Kiran Rao', 'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore'),

(1006, '2026-02-06', 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi'),

(1007, '2026-02-07', 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata'),

(1008, '2026-02-08', 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi'),

(1009, '2026-02-09', 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad'),

(1010, '2026-02-10', 'C010', 'Meena Iyer', 'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune');



1 . Find sine value of an angle.

SELECT SIN(75) FROM DUAL;

2 . Find cosine value of an angle.

SELECT COS(90)  value of an DUAL;

3 . Find tangent value.

SELECT TAN(60)  value of an DUAL;

4 . Convert degrees to radians.

SELECT degrees_column * (ACOS(-1) / 180) AS radians FROM DUAL;

5 .Convert radians to degrees.

SELECT radians_column * (180 / ACOS(-1)) AS degrees FROM DUAL;

6 . Find logarithm (base 10) of a number.

SELECT LOG(10,5) AS LOG10_VALUE FROM DUAL;

7 . Find natural log of a number.

SELECT LN(20) AS NATURAL_LOG FROM DUAL;

8 . Find square of a number.

SELECT SQRT(100) FROM DUAL;

9 . Find cube of a number.

SELECT POWER(2,3) FROM DUAL;

10 .Calculate factorial of a number.

WITH factorial (n, fact) AS (
    SELECT 1, 1 FROM DUAL
    UNION ALL
    SELECT n+1, fact*(n+1)
    FROM factorial
    WHERE n < 5
)
SELECT * FROM factorial
WHERE n = 5;

11 .Find greatest value among three numbers.

SELECT GREATEST VALUE(100,198,134) FROM DUAL;

12 .Find least value among three numbers.

SELECT LEAST VALUE(100,198,134) FROM DUAL;

13 . Calculate variance of sales.

SELECT VARIANCE(sales_amount) AS SALES_VARIANCE FROM DUAL;

14 . Calculate standard deviation of sales.

SELECT STDDEV(sales_amount) FROM DUAL;

15 . Find average deviation.

SELECT AVG(ABS(sales_amount - avg_sales)) AS avg_deviation
FROM (
    SELECT sales_amount,
           AVG(sales_amount) OVER () AS avg_sales
    FROM sales_data
);

16 . Calculate geometric mean.

SELECT EXP(AVG(LN(sales_amount))) AS geometric_mean
FROM sales_data
WHERE sales_amount > 0;

17 . Calculate harmonic mean.

SELECT COUNT(*) / SUM(1 / sales_amount) AS harmonic_mean
FROM sales_data
WHERE sales_amount > 0;

18 .Find sum of squares.

SELECT SUM(POWER(unit_price * quantity, 2)) AS sum_of_squares FROM orders;

19 .Calculate correlation between two columns.

SELECT CORR(unit_price, quantity) AS price_quantity_correlation FROM orders;

20 .Calculate regression slope.

SELECT REGR_SLOPE(quantity, unit_price) AS regression_slope FROM orders;