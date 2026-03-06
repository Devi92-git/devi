CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    PHONE_NUMBER VARCHAR2(20),
    LOYALTY_POINTS NUMBER
);

INSERT INTO CUSTOMERS VALUES (101, 'John', 'Doe', 'New York', '555-0100', 500);
INSERT INTO CUSTOMERS VALUES (102, 'Jane', 'Smith', NULL, '555-0101', 120);
INSERT INTO CUSTOMERS VALUES (103, 'Robert', 'Brown', 'Chicago', NULL, 0);
INSERT INTO CUSTOMERS VALUES (104, 'Emily', 'Davis', NULL, NULL, NULL); -- Lots of NULLs
INSERT INTO CUSTOMERS VALUES (105, 'Michael', 'Wilson', 'Miami', '555-0105', NULL);

--SELECT * FROM CUSTOMERS;

CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER,
    ORDER_DATE DATE,
    TOTAL_AMOUNT NUMBER(10, 2),
    DISCOUNT_AMT NUMBER(10, 2), -- Can be NULL if no discount
    SHIPPING_DATE DATE          -- Can be NULL if not shipped yet
);

INSERT INTO ORDERS VALUES (5001, 101, DATE '2023-10-01', 150.00, 10.00, DATE '2023-10-03');
INSERT INTO ORDERS VALUES (5002, 102, DATE '2023-10-02', 200.50, NULL, DATE '2023-10-05'); -- No discount
INSERT INTO ORDERS VALUES (5003, 101, DATE '2023-10-05', 75.00, 5.00, NULL); -- Not shipped
INSERT INTO ORDERS VALUES (5004, 104, DATE '2023-10-06', 300.00, NULL, NULL); -- No discount, Not shipped
INSERT INTO ORDERS VALUES (5005, 105, DATE '2023-10-07', 50.00, 0.00, DATE '2023-10-08');
INSERT INTO ORDERS VALUES (5006, NULL, DATE '2023-10-08', 20.00, NULL, DATE '2023-10-09'); -- Orphan order

--SELECT * FROM ORDERS;

1. (Inner Join) Retrieve a list of customers who have placed at least one order. Display Name and Order ID. Note: This excludes customers with no orders and orders with NULL Customer IDs.

SELECT C.FIRST_NAME, C.LAST_NAME, O.ORDER_ID
FROM CUSTOMERS C
INNER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

2. (Left Join) List all customers and their Order IDs. Include customers who have not placed any orders. Note: Returns NULL in the Order column for customers like 'Robert' or 'Emily'.

SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

3. (Left Join - Finding Non-Matches) Find customers who have NEVER placed an order. Note: We join, then filter for where the "Right" table is NULL.

SELECT C.FIRST_NAME, C.LAST_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.ORDER_ID IS NULL;

4. (Right Join) List all orders and the associated customer name. Include orders that do not have a linked Customer ID. Note: This will show Order 5006, which has a NULL Customer_ID.

SELECT C.FIRST_NAME, O.ORDER_ID, O.TOTAL_AMOUNT
FROM CUSTOMERS C
RIGHT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

5. (Full Outer Join) List ALL customers and ALL orders. If a customer has no order, show NULLs for order info. If an order has no customer, show NULLs for customer info.

SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

6. (Left Join with NVL) Calculate the total amount spent by each customer. If they have notbought anything, display 0 instead of NULL.

SELECT C.FIRST_NAME, NVL(SUM(O.TOTAL_AMOUNT), 0) AS TOTAL_SPENT
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME;

7. (Self Join) Find pairs of customers who live in the same City. Note: We must exclude NULL cities and ensure we do not match a customer to themselves.

SELECT A.FIRST_NAME AS CUST_1, B.FIRST_NAME AS CUST_2, A.CITY
FROM CUSTOMERS A
JOIN CUSTOMERS B ON A.CITY = B.CITY
WHERE A.CUSTOMER_ID < B.CUSTOMER_ID;

8. (Cross Join) Generate a theoretical list of every customer buying every order (Cartesian Product).

SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
CROSS JOIN ORDERS O;

9. (Natural Join) Join Customers and Orders automatically based on the common column (CUSTOMER_ID). Note: Oracle does not require table aliases on the common column in a Natural Join.

SELECT FIRST_NAME, ORDER_ID
FROM CUSTOMERS
NATURAL JOIN ORDERS;

10. (Left Join & Filtering) List all Customers and their Order Dates, but only for orders placed after October 5th. Keep customers with NO orders in the list. Note: The condition must be in the ON clause, not WHERE, to preserve the Left Join behavior for non-matching rows.

SELECT C.FIRST_NAME, O.ORDER_DATE
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID AND O.ORDER_DATE > DATE '2023-10-05';

11. (Full Join - Exclusive) Find records that are EITHER a Customer without an order OR an Order without a Customer (The "Anti-Join" of both sides).

SELECT C.CUSTOMER_ID AS C_ID, O.ORDER_ID
FROM CUSTOMERS C
FULL OUTER JOIN ORDERS O
 ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CUSTOMER_ID IS NULL OR O.CUSTOMER_ID IS NULL;

12. (Inner Join with Aggregates) Find the average loyalty points of customers who have actually placed an order. Note: Distinct ensures we do not double count points if a customer ordered twice.

SELECT AVG(DISTINCT C.LOYALTY_POINTS)
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

13. (Left Join with Coalesce) Display a report: "Customer Name - Order ID". If there is no order, display "Customer Name - No Order".

SELECT C.FIRST_NAME || ' - ' || COALESCE(TO_CHAR(O.ORDER_ID), 'No Order') AS REPORT_LOG
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

14. (Self Join on Inequality) Find pairs of orders where the first order has a higher amount than the second order.

SELECT O1.ORDER_ID AS HIGH_VAL_ORDER, O2.ORDER_ID AS LOW_VAL_ORDER
FROM ORDERS O1
JOIN ORDERS O2 ON O1.TOTAL_AMOUNT > O2.TOTAL_AMOUNT;

15. (Left Join) Count how many orders each customer has made. Note: COUNT(O.ORDER_ID) is safer than COUNT(*) because it returns 0 for NULLs.

SELECT C.FIRST_NAME, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.FIRST_NAME;

16. (Right Join with Date Logic) List all orders and the Customer City. If the Customer is NULL (orphan order), display 'Unknown City'.

SELECT O.ORDER_ID, NVL(C.CITY, 'Unknown City')
FROM CUSTOMERS C
RIGHT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

17. (Non-Equi Join) Find customers whose Loyalty Points are greater than the Total Amount of any single order. Note: Joining based on value comparison rather than ID equality.

SELECT DISTINCT C.FIRST_NAME, C.LOYALTY_POINTS, O.TOTAL_AMOUNT
FROM CUSTOMERS C
JOIN ORDERS O ON C.LOYALTY_POINTS > O.TOTAL_AMOUNT;

18. (Left Join) List Customers and their "Shipping Status". If the order exists but Shipping Date is NULL, show 'Pending'. If no order exists, show 'N/A'.

SELECT C.FIRST_NAME,
       CASE
           WHEN O.ORDER_ID IS NULL THEN 'N/A'
           WHEN O.SHIPPING_DATE IS NULL THEN 'Pending'
           ELSE 'Shipped'
       END AS STATUS
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

19. (Using USING) Perform an Inner Join using the USING clause instead of ON. Note: This works because both tables share the column name CUSTOMER_ID.

SELECT FIRST_NAME, ORDER_ID
FROM CUSTOMERS
JOIN ORDERS USING (CUSTOMER_ID);

20. (Multiple Join Conditions) Join Customers and Orders where the Customer ID matches AND the Customer has a valid City (City is not null).

SELECT C.FIRST_NAME, O.ORDER_ID
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE C.CITY IS NOT NULL;

HARD QUESTIONS

1 .(Inner Join) List the FIRST_NAME of the customer and the TOTAL_AMOUNT for all orders that have a Discount (DISCOUNT_AMT is not null).

select c.first_name,
       o.total_amount 
FROM customers C
 INNER JOIN orders O
 ON c.customer_id = o.order_id
 where DISCOUNT_AMT is not null;

 2 .(Left Join) List all Customers. If they have an order, display the ORDER_DATE. If not, ensure the row still appears with a NULL date.


SELECT c.FIRST_NAME, o.ORDER_DATE
FROM customers c
LEFT JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID;

3 .(Right Join) Display ORDER_ID and FIRST_NAME. We want to see all orders, including the one with CUSTOMER_ID NULL (Order 5006).

select o.order_id,
       c.first_name
FROM customers C
RIGHT JOIN orders o
ON c.customer_id = o.order_id;

4 .(Full Outer Join) Find the count of rows returned when you Full Outer Join Customers and Orders. (Try to predict the number before running it).

SELECT COUNT(*) 
FROM customers c
FULL OUTER JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID;

5 . (Left Join - Anti Join) Find the CUSTOMER_IDs that exist in the CUSTOMERS table but do NOT exist in the ORDERS table.

SELECT c.CUSTOMER_ID
FROM customers c
LEFT JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE o.CUSTOMER_ID IS NULL;
      

6 . (Self Join) Find pairs of Orders (O1, O2) that were placed on the exact same ORDER_DATE.
 
   SELECT o1.ORDER_ID AS Order1, o2.ORDER_ID AS Order2, o1.ORDER_DATE
FROM orders o1
JOIN orders o2
ON o1.ORDER_DATE = o2.ORDER_DATE
AND o1.ORDER_ID < o2.ORDER_ID;

7 . (Cross Join) Create a list showing every Customer paired with every unique CITY found in the Customer table.

SELECT c.FIRST_NAME, c.CITY
FROM customers c
CROSS JOIN (SELECT DISTINCT CITY FROM customers) c;

8 . (Inner Join + Aggregates) Calculate the total DISCOUNT_AMT given to customers living in 'New York'.

SELECT SUM(o.DISCOUNT_AMT) AS TOTAL_DISCOUNT
FROM customers c
INNER JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE c.CITY = 'New York';


9 . (Left Join + NVL) Select FIRST_NAME and the SHIPPING_DATE. If the shipping date is NULL (either because the order is NOT shipped OR the customer has no order), display 'Not Shipped'.

SELECT c.FIRST_NAME,
NVL(TO_CHAR(o.SHIPPING_DATE), 'Not Shipped') AS SHIPPING_STATUS
FROM customers c
LEFT JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID;

10 .(Right Join) Find the sum of TOTAL_AMOUNT for orders that do not have a linked Customer (Orphan orders).


SELECT SUM(o.TOTAL_AMOUNT) AS TOTAL_ORPHAN_AMOUNT
       FROM customers c
        RIGHT JOIN orders o
       ON c.CUSTOMER_ID = o.CUSTOMER_ID
       WHERE c.CUSTOMER_ID IS NULL;

11. (Natural Join) Use a Natural Join to display LAST_NAME and TOTAL_AMOUNT. (Be careful: does LOYALTY_POINTS exist in both tables? No? Then it uses CUSTOMER_ID).
    
    
    SELECT LAST_NAME, TOTAL_AMOUNT
FROM customers
NATURAL JOIN orders;


12 .Left Join with Multiple Conditions) Join Customers to Orders, but ONLY link orders where the TOTAL_AMOUNT is greater than 100. Customers with small orders should look like they have NULL orders.


SELECT c.FIRST_NAME,
       o.ORDER_ID,
       o.TOTAL_AMOUNT
FROM customers c
LEFT JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID
AND o.TOTAL_AMOUNT > 100;


13 . (Inner Join) List FIRST_NAME and ORDER_ID for customers who have a Phone Number (IS NOT NULL).

SELECT  C.FIRST_NAME,
        C.PHONE_NUMBER,
        O.ORDER_ID
FROM CUSTOMERS c
INNER JOIN ORDERS o
ON C.CUSTOMER_ID = O.ORDER_ID;

14 . (Full Join + Coalesce) Display a list of IDs. If it IS  a Customer without an order, show Customer ID. If it IS  an Order without a Customer, show Order ID. Use COALESCE.

SELECT COALESCE(c.CUSTOMER_ID, o.ORDER_ID) AS ID
FROM customers c
FULL OUTER JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID;

15 . Self Join) Find customers who have the same LOYALTY_POINTS value as another customer.

SELECT c1.CUSTOMER_ID, c1.LAST_NAME, c1.LOYALTY_POINTS
FROM customers c1
JOIN customers c2
ON c1.LOYALTY_POINTS = c2.LOYALTY_POINTS
AND c1.CUSTOMER_ID <> c2.CUSTOMER_ID;

16 .(Inner Join) Display FIRST_NAME, CITY, and ORDER_DATE for orders that have actually been shipped (SHIPPING_DATE is not null).

SELECT C.FIRST_NAME,
       C.CITY,
       O.ORDER_DATE
       FROM CUSTOMERS C
       INNER JOIN ORDERS O
       ON C.CUSTOMER_ID = O.ORDER_ID;

17 . (Left Join) Calculate the Average TOTAL_AMOUNT per Customer. Ensure customers with no orders show up (likely as NULL or 0 depending on how you write the Average).


SELECT c.CUSTOMER_ID,
       c.FIRST_NAME,
       AVG(o.TOTAL_AMOUNT) AS AVG_TOTAL_AMOUNT
FROM customers c
LEFT JOIN orders o
ON c.CUSTOMER_ID = o.CUSTOMER_ID
GROUP BY c.CUSTOMER_ID, c.FIRST_NAME;

18 .(Cartesian/Cross) Count how many rows are generated if you Cross Join CUSTOMERS (5 rows) and ORDERS (6 rows).

SELECT COUNT(*)
FROM CUSTOMERS
CROSS JOIN ORDERS;

19 . (Join with Date Comparison) Find Customers who placed an order on the same day their account was created? (Wait, we do NOT have account creation date. Instead: Find Orders placed after the shipping date? This checks for data errors).

SELECT o.order_id,
       o.customer_id,
       o.order_date,
       o.shipping_date
FROM orders o
WHERE o.order_date > o.shipping_date;


20 .(Three-way Simulation) Advanced Challenge: Perform a Left Join from Customers to Orders, and then Self Join that result to find Customers who have placed more than one order.


SELECT DISTINCT c.customer_id,
       c.first_name
FROM customers c
LEFT JOIN orders o1
ON c.customer_id = o1.customer_id
LEFT JOIN orders o2
ON c.customer_id = o2.customer_id
AND o1.order_id <> o2.order_id;