USE healthcare_db;
-- Total revenue and appointment count per status
SELECT 
status,
COUNT(*) As appointment_count,
SUM(fee) As total_revenue
FROM appointments
GROUP BY status
ORDER BY total_revenue DESC;
-- 3 busiest doctors by completed appointments
SELECT doctor_id,
status,
COUNT(*) total_appointments
FROM appointments
WHERE status='Completed'
GROUP BY doctor_id,status
ORDER BY total_appointments DESC
LIMIT 3;
-- Average appointments fee per city-only cities with 2+ patients
SELECT p.city,
AVG(a.fee) AS average_fee,
COUNT(*) AS total_patients
FROM appointments AS a 
JOIN patients AS p
ON a.patient_id=p.patient_id
GROUP BY p.city
HAVING COUNT(DISTINCT p.patient_id)>=2
ORDER BY average_fee DESC;
-- The single highest-revenue status
SELECT status,
SUM(fee) AS Total_revenue
FROM appointments
GROUP BY status
ORDER BY Total_revenue DESC
LIMIT 1;
-- Count of active vs. inactive patients
DESCRIBE patients;
SELECT is_active,
COUNT(is_active=1) AS active_patient,
COUNT(is_active =0) AS inactive_paatients
FROM patients
GROUP BY is_active;

SELECT is_active,
COUNT(*) AS patient_count
FROM patients
GROUP BY is_active
ORDER BY is_active DESC;


