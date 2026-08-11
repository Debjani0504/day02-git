USE healthcare_db;
SELECT * FROM patients;
DESCRIBE patients;
DESCRIBE appointments;
SELECT * FROM appointments;
INSERT INTO appointments
(appointment_id,patient_id,doctor_id,appointment_date,fee,status,notes)
VALUES(57,1, 1, '2026-08-15 10:30:00', 500, 'Scheduled', 'Routine check-up');
SELECT * FROM appointments WHERE appointment_id=57;
INSERT INTO appointments
(appointment_id,patient_id,doctor_id,appointment_date,fee,status,notes)
VALUES(58,1, 1, '2026-08-12 10:00:00', 500, 'Scheduled', 'Follow-up'),
(59,2, 2, '2026-08-15 14:30:00', 700, 'Scheduled', 'Consultation'),
(60,3, 1, '2026-08-20 11:15:00', 600, 'Scheduled', 'Regular check-up');
SELECT * FROM appointments WHERE appointment_id IN (57,58,59,60);
SELECT * FROM appointments;
SELECT * FROM appointments WHERE appointment_id BETWEEN 57 and 60;
SELECT appointment_id, DATE (appointment_date) AS appointment_day 
FROM appointments
WHERE appointment_id BETWEEN 57 AND 60 
ORDER BY appointment_id; 
SELECT appointment_id, TIME (appointment_date) AS appointment_time
FROM appointments
WHERE appointment_id BETWEEN 57 AND 60 
ORDER BY appointment_id;
SELECT CURRENT_DATE AS today, CURRENT_TIMESTAMP AS current_datetime;
SELECT appointment_date FROM appointments;
SELECT * FROM appointments
WHERE appointment_date BETWEEN '2026-08-10' AND '2026-08-20 23:59:59'
ORDER BY appointment_date;
SELECT appointment_id, appointment_date, status
FROM appointments
WHERE appointment_date>= '2026-08-15'
ORDER BY appointment_date;