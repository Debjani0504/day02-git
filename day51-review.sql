USE healthcare_db; 
SELECT COUNT(appointment_id) 
FROM appointments; 
SELECT AVG(fee) 
FROM appointments; 
SELECT CONCAT(
UPPER(LEFT(first_name,1)), LOWER(SUBSTRING(first_name,2)))
from patients; 
SELECT SUBSTRING(first_name,1)
FROM patients; 
-- Q1> Find all the female patients
SELECT
DISTINCT(CONCAT(first_name, ' ', last_name)) AS patient_id
FROM patients
WHERE gender='F' AND city ='Kolkata';
-- Q2> Show the highest paying doctors 
SELECT doctor_id, 
CONCAT(first_name, ' ' , last_name),
salary 
FROM doctors 
ORDER BY salary DESC
LIMIT 5; 
-- Q3> Find the doctors whose salary is between two values. 
SELECT 
doctor_id,
 CONCAT(first_name, ' ', last_name) AS doctor_name, 
 salary 
 FROM doctors
 WHERE salary BETWEEN 150000 AND 170000;
-- Q4> Show the Unique cities.
SELECT DISTINCT(city)
FROM patients; 
DESCRIBE appointments;
-- Count doctors in each department
SELECT d1.doctor_id, 
COUNT(*) AS total_count,
 d2.department_id, 
 d2.department_name
FROM doctors d1 
JOIN departments d2 
ON d1.department_id= d2.department_id
GROUP BY d2.department_id, d1.doctor_id
ORDER BY d1.doctor_id; 
-- Q6> Show departments having at least 2 doctors 
SELECT d1.department_id,
COUNT(d2.doctor_id) AS doctor_count,
 d1.department_name
 FROM departments d1
 JOIN doctors d2 
 ON d1.department_id= d2.department_id 
 GROUP BY d1.department_id, d1.department_name 
 HAVING COUNT(d2.doctor_id)>=2; 
 DESCRIBE patients; 
-- Q7> Display patients whose phone number is missing 
SELECT patient_id, 
CONCAT(first_name, ' ', last_name)AS patient_name
FROM patients 
WHERE phone IS NULL;
-- Q8> Replace missing phone numbers with 'No phone number' 
SELECT patient_id,
CONCAT(first_name, ' ', last_name) AS patient_name,
COALESCE(phone, 'NO phone number') AS update_phone
FROM patients;
-- Q9> Categorise the doctors based on salary
SELECT doctor_id,
CONCAT(first_name, ' ', last_name) AS doctor_name,
SUM(salary) AS salary, 
CASE
WHEN Salary>150000 THEN 'Strong'
WHEN salary>120000 THEN 'Medium'
ELSE 'Low' 
END AS catagories
FROM doctors
GROUP BY doctor_id; 
  
  -- Mixed Hands on lab 
  -- 
  -- Q10. Display the first_name, last_name and city of all patients who lives in Kolkata. 
  SELECT first_name, 
  last_name, 
  city 
  FROM patients 
  WHERE city= 'Kolkata';
  -- Q11. Display the 5 doctors with the highest salary,showing doctor_id, first_name, last_name and salary 
  SELECT doctor_id,
  first_name, 
  last_name, 
  salary 
  FROM doctors 
  ORDER BY salary DESC 
  LIMIT 5; 
  -- Q12. Display all unique cities from patient table 
  SELECT DISTINCT(city) 
  FROM patients; 
  -- Q13. Display the number of appointments for each status. 
  SELECT  status, 
  COUNT(*) AS appointment_count
  FROM appointments 
  GROUP BY status; 
  -- Q14. Find the appointment statuses that occur more than 3 times 
  SELECT status, 
  COUNT(*) AS appointment_count 
  FROM appointments 
  GROUP BY status 
  HAVING COUNT(*)>=3; 
  -- Q15. Display all patients whose first_name starts with A or S. 
  SELECT * 
  FROM patients
WHERE first_name LIKE 'A%' OR first_name LIKE 'S%'; 
/* Q16. Display each doctor's:
docctor_id,  
doctor_name,  
Salary,
Annual_Salary 
Only show doctors whose annual salary is greater than 600,000.
*/ 
DESCRIBE doctors; 
SELECT 
doctor_id, 
CONCAT(first_name, ' ', last_name) AS doctor_name, 
Salary,
Salary*12 AS Annual_Salary 
FROM doctors 
WHERE Salary * 12 >600000; 
/* Q17. Display the following for every patient: 
patient-id, patient_name, city, registered_date,contact 
Requirements:
i. Format the name in little case. 
ii. Format the registered_date as DD-MM-YYYY. 
iii. If phone is Null, show No. phone number. 
iv. show the 10 most recently registered patients first. 
*/
DESCRIBE patients;
SELECT patient_id, 
LOWER(CONCAT(first_name, ' ', last_name)) As patient_name,
city,
DATE_FORMAT(registered_date, '%d-%m-%y') AS registered_date,
COALESCE(phone, 'NO phone number') AS contact
FROM patients 
ORDER BY registered_date DESC 
LIMIT 10; 