USE healthcare_db;
SELECT MONTH( appointment_date) AS MONTH,
COUNT(*) AS num
FROM appointments
GROUP BY MONTH (appointment_date);
-- Appointments per doctor per status
SELECT doctor_id, status,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id,status 
ORDER BY doctor_id ASC; 
-- Revenue per status
DESCRIBE appointments;
SELECT doctor_id, status,
SUM(fee) As total_revenue
FROM appointments
GROUP BY doctor_id, status
ORDER BY doctor_id ASC;

-- For Revenue per status, we need two columns so we need joins
SELECT p.city,
a.status,
SUM(a.fee) AS total_revenue
FROM appointments a
JOIN patients p 
ON a.patient_id=p.patient_id
GROUP BY p.city,a.status 
ORDER BY city ASC;
-- Appointments per year using
SELECT YEAR(appointment_date),
COUNT(*) AS YEARS
FROM appointments
GROUP BY YEAR(appointment_date);
