USE healthcare_db;
-- How many patients are there in the city?
SELECT city,
COUNT(*) AS patient_count
FROM patients
GROUP BY city
ORDER BY patient_count DESC;
-- How many appointments are there for each status?
SELECT status,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY status
ORDER BY total_appointments DESC; 
-- How many appointments did each doctor handle? 
SELECT doctor_id,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id
ORDER BY doctor_id ASC; 
-- What is the average appointment fee for each status?
SELECT status,
COUNT(*) AS total_appointments,
 AVG(fee) AS avrg_fee
FROM appointments
GROUP BY status
ORDER BY avrg_fee DESC;
-- Deliberately trigger the golden rule violation
SELECT doctor_id,
patient_id,
COUNT(*) AS appointment_count
FROM appointments
GROUP BY doctor_id, patient_id 
ORDER BY doctor_id ASC;
SELECT doctor_id,
COUNT(*) AS appointment_count
FROM appointments
GROUP BY doctor_id; 