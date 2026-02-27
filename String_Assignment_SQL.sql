1 . Write a query to convert all customer names to uppercase.


 SELECT UPPER(customer_name) AS customer_name_upper FROM Orders;

2 . Extract the first 5 characters from Product_Name.

SELECT SUBSTRING(Product_Name, 1, 5) AS short_name FROM Orders;

3 . Find the length of each Customer_Name.

SELECT Customer_Name, LEN(Customer_Name) AS name_length FROM Orders;

4 . Replace the word "Rice" with "Premium Rice" in Product_Name.

SELECT REPLACE(Product_Name, 'Rice', 'Premium Rice') AS updated_name FROM Orders;

5 . Remove leading and trailing spaces from Customer_Name.

SELECT TRIM(Customer_Name) AS clean_name FROM Orders;

6 . Concatenate First_Name and Last_Name as Full_Name.

select First_Name ||' ' || Last_Name  as Full_Name from Orders;

7 . Find customers whose names start with 'A'.

SELECT * FROM Orders  WHERE Customer_Name LIKE 'A%';

8 . Extract the domain name from Email_ID.

SELECT SUBSTRING(Email_ID, CHARINDEX('@', Email_ID) + 1, LEN(Email_ID)) AS domain_name FROM Orders;

9 . Find the position of '@' in Email_ID.

SELECT INSTR(Email_ID, '@') AS at_position FROM Orders;

10 . Reverse the Product_Name.

SELECT REVERSE(Product_Name) AS reversed_name FROM Orders;

11 . Convert the first letter of each word in Product_Name to uppercase.

SELECT INITCAP(Product_Name) AS formatted_name FROM Oredrs;

12 . Extract the last 3 characters from Order_ID.
 
SELECT SUBSTR(Order_ID, -3) AS last_3_chars FROM orders;

13 . Count how many times letter 'a' appears in Customer_Name.

SELECT Customer_Name, LENGTH(Customer_Name) - LENGTH(REPLACE(LOWER(Customer_Name), 'a', '')) AS a_count FROM Orders;

14 . Mask the last 4 digits of a phone number.

SELECT SUBSTR(phone_number, 1, LENGTH(phone_number) - 4) || '****' AS masked_phone FROM Orders;

15 . Split Full_Name into First_Name and Last_Name.

SELECT 
       SUBSTR(Full_Name, 1, INSTR(Full_Name, ' ') - 1) AS First_Name,
       SUBSTR(Full_Name, INSTR(Full_Name, ' ') + 1) AS Last_Name
FROM Orders;
 
16 . Remove all special characters from Product_Code

SELECT REPLACE(REPLACE(REPLACE(Product_Code,'-',''),'@',''),'#','') AS clean_code FROM Orders;

17 . Compare two columns ignoring case sensitivity.

SELECT * FROM Orders WHERE UPPER(column1) = UPPER(column2);

18 . Find customers whose name contains 'kumar'


SELECT * FROM Orders WHERE Customer_Name LIKE '%kumar%';

19 . Pad Order_ID with leading zeros to make it 6 digits.

SELECT LPAD(Order_ID, 6, '0') AS padded_order_id FROM orders;

20 . Extract substring between two characters

SELECT SUBSTR(column_name,
              INSTR(column_name, '(') + 1,
              INSTR(column_name, ')') - INSTR(column_name, '(') - 1) AS extracted_text FROM Orders;