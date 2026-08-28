Use healthcare_db;  
--- Top 3 months by revenue from completed appointments. 
SELECT 
DATE_FORMAT(appointment_date, '%y-%m') AS date,
SUM(fee) AS revenue 
FROM appointments 
WHERE status ='Completed' 
GROUP BY DATE_FORMAT(appointment_date, '%y-%m')
ORDER BY date  DESC 
LIMIT 3;  

-- Doctors with avg fee > 2000 and at least 5 appointments. 
SELECT d.doctor_id, 
COUNT(*) AS appointment_count,
CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
Avg(a.fee) AS average_fee 
FROM doctors d 
JOIN appointments a 
On d.doctor_id= a.doctor_id 
GROUP BY d.doctor_id, d.first_name, d.last_name 
HAVING average_fee>2000 AND COUNT(*)>= 5;
-- Per-doctor pivot of completed vs cancelled counts.
SELECT 
d.doctor_id, 
CONCAT(d.first_name, ' ', d.last_name) As doctor_name, 
SUM(CASE WHEN
a.status= 'Cpmpleted' THEN 1 ELSE 0 
END) AS COMPLETED, 
SUM(CASE WHEN 
a.status='Cancelled' THEN 1 ELSE 0 
END) AS Cancelled 
FROM doctors d 
JOIN appointments a 
On d.doctor_id = a.doctor_id 
GROUP BY d.doctor_id, d.first_name, d.last_name 
ORDER BY d.doctor_id ASC;
-- Active patients over 60, full name and age, oldest first.
SELECT patient_id,
CONCAT(first_name, ' ' , last_name) AS patient_name,
TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age 
FROM patients 
WHERE is_active= 1 and TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE())>60
ORDER BY age DESC;
/*  Explain WHERE vs HAVING using one of the above. 
ans--> In Q2, status filters (if added) would be WHERE (row-level, before grouping); 
AVG(fee)>2000 and COUNT(*)>=5 are HAVING (group-level aggregates, after grouping). */ 

🚪
