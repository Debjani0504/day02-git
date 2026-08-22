USE healthcare_db;
-- Create a Full name
SELECT CONCAT(first_name, ' ', last_name) AS FULL_NAME
FROM patients;
-- Display Cities in Uppercase
SELECT CONCAT( first_name, ' ' , last_name) AS patient_name,
city,
UPPER(city) AS city_upper
FROM patients;
-- Display Names in Lowercase
SELECT first_name,
LOWER(first_name) AS lower_name
FROM patients;

SELECT first_name, last_name,
 CONCAT(LOWER(first_name), ' ', LOWER(last_name)) AS lower_case_name
FROM patients;
-- Find names Longer than 5 Characters
SELECT first_name, CHAR_LENGTH(first_name) AS name_length
FROM patients
WHERE CHAR_LENGTH(first_name)>5;
-- Clean EXtra Spaces with TRIM()
SELECT first_name,
TRIM(first_name) AS cleaned_name
FROM patients;
-- Clean the Phone numbes with replace()
SELECT phone,
REPLACE(phone,  '-', ' ') AS cleaned_phone
FROM patients;
SELECT * FROM doctors;
-- EXtract the first 3 letters
SELECT first_name,
LEFT(first_name,3) AS first_three_letters
FROM patients; 
-- another way of extraction
SELECT first_name,
SUBSTRING(first_name, 1,3) AS first_three_letter
FROM patients; 
-- EXTRACT the last three letters
SELECT first_name,
RIGHT(first_name,3) AS last_three_letters
FROM patients; 
-- Find a character inside the name
SELECT first_name,
LOCATE('a', first_name) AS position_of_a
FROM patients;
-- Find a name Containing particular text with LOCATE 
SELECT first_name
FROM patients
WHERE LOCATE('an',first_name)>0; 
-- Find a name Containing particular text with LIKE Operator
SELECT first_name
FROM patients
WHERE first_name LIKE '%an%' >0;
-- Create an email-style string
SELECT CONCAT(first_name, ' ', last_name) AS patient_name,
 LOWER(CONCAT(first_name,'.',last_name, '@gmail.com'))
AS email_name
FROM patients;
SELECT * FROM appointments;
SELECT * FROM doctors; 
SHOW TABLES; 
DESCRIBE departments;
 -- Show each patient's name in "LAST, First" format.
 SELECT first_name, 
 last_name, 
 CONCAT(last_name, ' ', first_name) AS asking_format
 FROM patients;
-- Remove spaces and uppercase a city value. 
SELECT city, UPPER(TRIM(city))
FROM patients; 



