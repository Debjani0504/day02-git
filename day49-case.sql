USE healthcare_db;
-- Create a fee-band Column using CASE
SELECT appointment_id,
fee, 
CASE 
WHEN fee IS NULL THEN 'No FEE'
WHEN fee<1000 THEN 'Low'
WHEN fee< 2000 THEN 'Medium'
ELSE 'High'
END AS fee_band
FROM appointments 
ORDER BY fee; 

-- Or another option of excluding Null values is
SELECT appointment_id,
fee, 
CASE 
WHEN fee<1000 THEN 'Low'
WHEN fee< 2000 THEN 'Medium'
ELSE 'High'
END AS fee_band
FROM appointments 
WHERE fee IS NOT NULL
ORDER BY fee; 
-- Create an age-group label
SELECT patient_id,
CONCAT(first_name, ' ', last_name) AS patient_name,
date_of_birth,
TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS Age,
CASE
WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Minor'
WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 60 THEN 'Adult'
ELSE 'Senior'
END AS age_group
FROM patients;
DESCRIBE appointments;
DESCRIBE doctors;
-- Pivot appointment statuses per doctor
SELECT d.doctor_id,
CONCAT(first_name, ' ', last_name) As doctor_name,
SUM(
CASE WHEN a.status='completed' THEN 1 ELSE 0 END) AS Completed,
SUM(
CASE WHEN a.status= 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled,
SUM( 
CASE WHEN a.Status= 'Scheduled' THEN 1 ELSE 0 END) AS Scheduled
FROM appointments a
JOIN doctors d 
ON a.doctor_id=d.doctor_id
GROUP BY d.doctor_id,
d.first_name,
d.last_name
ORDER BY d.doctor_id;

-- Custom sorting using ORDER BY CASE 
SELECT 
appointment_id,
status
FROM appointments
ORDER BY 
CASE
 WHEN status= 'scheduled' THEN 1
 WHEN status= 'Completed' THEN 2
 WHEN status= 'Cancelled' THEN 3
 WHEN status= 'no-show' THEN 4 
 ELSE 5
 END;
-- Label appointments 'expensive' fee>2000 else 'Standard'
SELECT appointment_id,
fee,
CASE WHEN fee>2000 THEN 'Expensive'
ELSE 'Standard'
END AS appointment_lebel
FROM appointments; 
-- Count active and inactive patients in one row using CASE
SELECT patient_id,
SUM( 
CASE WHEN is_active=1 THEN 1
ELSE 0
END) AS active_patient,
SUM( 
CASE WHEN is_active= 0 THEN 1 
ELSE 0
END) AS inactive_patient
FROM patients 
GROUP BY patient_id; 






