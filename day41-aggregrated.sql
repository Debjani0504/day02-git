USE healthcare_db;
SELECT * FROM patients; 
-- Total Number of patients,
SELECT COUNT(*) AS total_patients
FROM patients; 
SELECT COUNT(DISTINCT first_name) AS patients
FROM patients; 
-- Total appointments revenue
SELECT * 
FROM appointments;
SELECT SUM(fee)AS total_revenue
FROM appointments;
-- Average appointment fee
SELECT AVG(fee) AS avg_fee
FROM appointments; 
-- Highest appointment fee
SELECT MAX(fee) AS highest_fee
FROM appointments; 
-- Lowest appointment fee
SELECT MIN(fee) AS lowest_fee 
FROM appointments; 
-- Number of patients who have recorded cities
SELECT * FROM patients; 
SELECT COUNT(city) AS patients_with_city
FROM patients;
-- Number of different cities
SELECT COUNT(DISTINCT city) AS distinct_cities
FROM patients; 
-- Count total patients
SELECT COUNT(*) AS total_patients
FROM patients;