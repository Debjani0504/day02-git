USE healthcare_db;
SELECT * FROM appointments;
SET SQL_SAFE_UPDATES=0;
START TRANSACTION;
UPDATE appointments
SET fee = fee+500;
SELECT * FROM appointments;
ROLLBACK;
SELECT * FROM appointments;
ROLLBACK;
SELECT * FROM appointments;
ROLLBACK;
SELECT * FROM appointments;
SELECT * FROM appointments ORDER BY fee asc;
START TRANSACTION;
UPDATE appointments
SET fee=fee + 500
WHERE appointment_id=4;
SELECT * FROM appointments;
ROLLBACK;
SELECT * FROM appointments;
START TRANSACTION;
UPDATE appointments
SET fee=fee+500
WHERE appointment_id=4;
SELECT * 
FROM appointments
WHERE appointment_id =4;
commit;
SELECT * FROM appointments;
SELECT * 
FROM appointments
LIMIT 2;
START TRANSACTION;
UPDATE appointments
SET fee=CASE
WHEN appointment_id=1 THEN 500
WHEN appointment_id=2 THEN 600
END
 where appointment_id IN(1,2);
commit;
SELECT * FROM appointments;
SELECT * 
FROM appointments
LIMIT 2;
START TRANSACTION;
UPDATE appointments 
SET fee = fee-100
WHERE appointment_id=1;
SELECT * 
FROM appointments
WHERE appointment_id IN(1,2);
commit;
SELECT * 
FROM appointments
WHERE appointment_id IN (1,2);
UPDATE appointments
SET fee=fee+100
WHERE appointment_id=2;
SELECT * 
FROM appointments
WHERE appointment_id IN (1,2);