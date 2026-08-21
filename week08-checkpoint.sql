USE healthcare_db;
SELECT * FROM appointments;
SHOW TABLES;
-- Revenue and appointment count per status, busiest first
DESCRIBE appointments;
DESCRIBE patients;
DESCRIBE doctors;
SELECT status,
COUNT(*) AS appointment_count,
SUM(fee) AS revenue_count
FROM appointments
GROUP BY status
ORDER BY appointment_count DESC;
-- Doctors with more than 10 completed appointments, with their counts.
SELECT d.doctor_id,
d.first_name,
d.last_name,
COUNT(a.appointment_id) AS Completed_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id=a.doctor_id
WHERE a.status='Completed'
GROUP BY d.doctor_id,
d.first_name,
d.last_name
HAVING COUNT(a.appointment_id)>10;
-- Average fee per city, only cities with at least 3 patients, highest first.
SELECT p.city,
AVG(a.fee) AS average_fee
FROM patients p
JOIN appointments a
ON p.patient_id=a.patient_id
GROUP BY p.city
HAVING COUNT(DISTINCT p.patient_id)>=3
ORDER BY average_fee DESC;
 -- The top 3 doctors by total revenue
 SELECT d.doctor_id,
 d.first_name,
 d.last_name,
 SUM(a.fee) as total_revenue
 FROM doctors d
 JOIN appointments a
 ON d.doctor_id=a.doctor_id
 GROUP BY d.doctor_id,
 d.first_name,
 d.last_name
 ORDER BY total_revenue DESC
 LIMIT 3;
 -- Count of active vs inactive patients in one query
 DESCRIBE patients;
 SELECT is_active,
COUNT(*) AS active_patients
FROM patients
GROUP BY is_active;
-- Number of distinct cities patients come from
SELECT city,
COUNT(DISTINCT city) As distinct_city
FROM patients
GROUP BY city; 
-- For each doctor (by doctor_id), show their number of bills, total billing, and average bill amount. Highest total first
DESCRIBE billing;
SELECT * FROM billing;
SELECT doctor_id,
COUNT(*) AS number_of_bills,
SUM(amount) AS total_billing,
AVG(amount) AS average_bill_amount
FROM billing
GROUP BY doctor_id
ORDER BY total_billing DESC;
--  Which appointment statuses appear more than 3 times? Show the status and its count.
SELECT status,
COUNT(*) as status_count
FROM appointments
GROUP BY status
HAVING COUNT(*) > 3;
-- For each department_id in the doctors table, show how many doctors it has and their average salary. Only departments with 2+ doctors.
SELECT department_id,
COUNT(*) AS number_of_doctors,
AVG(salary) AS average_salary
FROM doctors
GROUP BY department_id
HAVING COUNT(*)>=2;
-- Use COALESCE to show patient phone numbers, replacing NULLs with 'No phone on file'.
SELECT * FROM patients;
SELECT 
COALESCE(phone,'No phone on file') AS new_phone
FROM patients
GROUP BY COALESCE(phone,'NO phone on file');

SELECT * FROM doctors;
 
