USE healthcare_db;
-- Appoinment per month
SELECT DATE_FORMAT(appointment_date, '%Y-m%') AS  month,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY month 
ORDER BY month;  
-- Revenue per month
SELECT DATE_FORMAT(appointment_date, '%y-m%') AS month,
COUNT(*) AS total_appointments,
SUM(fee) AS revenue
FROM appointments
GROUP BY month
ORDER BY month; 
-- Checking total appointments by month
SELECT MONTH(appointment_date) AS month,
COUNT(*) AS Total_appointments
FROM appointments
GROUP BY month
ORDER BY month;
-- Patient age by date_of_birth
SELECT first_name,
TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM patients
ORDER BY age DESC;
-- Appointment in the last 30 days
SELECT *
FROM appointments
WHERE appointment_date>= DATE_SUB(CURDATE(), INTERVAL 30 DAY);
-- COUNT appointments by weekdays
SELECT DAYTNAME(appointment_date) AS WEEKDAY,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY weekday
ORDER BY total_appointments; 
-- DAYTIME does not exist in the database.

