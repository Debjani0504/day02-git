USE healthcare_db; 
 -- REPORT 1 Monthly revenuem+ Performance Flag
-- Starts with basic data
SELECT * 
FROM appointments; 
-- Filter the completed  appointments
SELECT * 
FROM appointments 
WHERE status ='Completed'; 
-- Extract the month
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month
FROM appointments
WHERE status= 'Completed'; 
-- Group by month 
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month 
FROM appointments
WHERE STATUS ='Completed'
GROUP BY month; 
-- Count appointments
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month,
COUNT(*) AS appointment_Count
FROM appointments 
WHERE status ='Completed'
GROUP BY month; 
-- Calculate the revenue
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month,
COUNT(*) AS appointment_count,
SUM(fee) AS Revenue
FROM appointments
WHERE status='Completed'
GROUP BY month; 
--  Add the CASE WHEN
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month, 
COUNT(*) AS appointments, 
SUM(fee) AS revenue, 
CASE 
WHEN SUM(fee) >= 1000 THEN 'Okay-ish'
ELSE 'normal' 
END AS flag 
FROM appointments
WHERE status='Completed' 
GROUP BY month;
-- Add HAVING
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month,
COUNT(*) AS appointment_count,
SUM(fee) AS revenue,
CASE 
WHEN SUM(fee) > 1000 THEN 'Strong'
ELSE 'Normal'
END AS Flag
FROM appointments
WHERE status='Completed'
GROUP BY month
HAVING COUNT(*) >= 3;
-- SORT Highest revenue first
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS month,
COUNT(*) AS appointment_count,
SUM(fee) AS revenue, 
CASE 
WHEN SUM(fee)>= 1000 THEN 'Strong'
ELSE 'Normal'
END AS FLAG
FROM appointments
WHERE status= 'Completed'
GROUP BY month
HAVING COUNT(*) >= 3
ORDER BY revenue DESC;
 
 -- REPORT 2_ Per-doctor Completed VS. Cancelled
 SELECT doctor_id,
 SUM( CASE
 WHEN status='Completed'THEN 1
 ELSE 0 
 END ) AS COMPLETED,
 SUM(
 CASE 
 WHEN status='Cancelled' THEN 1 
 ELSE 0 
 END) AS CANCELLED
 FROM appointments
 GROUP BY doctor_id
 ORDER BY Completed DESC; 
 -- REPORT 3-Patient Age Groups 
 -- Step-1 
 SELECT 
 patient_id,
 CONCAT(first_name, ' ', last_name) AS patient_name,
 TIMESTAMPDIFF( YEAR, date_of_birth, CURDATE()) AS age
 FROM patients;
 -- Create age groups with CASE
 SELECT 
 patient_id, 
 COUNT(*) AS patient_count,
 CONCAT(first_name, ' ', last_name) AS patient_name, 
 TIMESTAMPDIFF ( YEAR,  date_of_birth, CURDATE()) AS age,
 CASE 
 WHEN TIMESTAMPDIFF ( YEAR,  date_of_birth, CURDATE())<30 THEN '<30' 
 WHEN TIMESTAMPDIFF ( YEAR,  date_of_birth, CURDATE())<= 60 THEN '30-60' 
 ELSE '>60'
 END AS age_Group
 FROM patients;
 -- Step-3- Group the age groups
 SELECT 
 patient_id,
 COUNT(*) AS patient_count,
 CONCAT(first_name, ' ', last_name) AS patient_name, 
 TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age,
 CASE 
 WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) <30 THEN '<30'
 WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) <=60 THEN '30-60'
 ELSE '>60'
 END AS age_group 
 FROM patients
GROUP BY patient_id, first_name, ' ', last_name 
ORDER BY patient_count;
  

 