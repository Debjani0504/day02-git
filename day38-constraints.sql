USE healthcare_db;
DESCRIBE appointments;
START TRANSACTION;
ALTER TABLE appointments
MODIFY COLUMN fee decimal(10,2) CHECK(fee>=0);
DESCRIBE appointments;
INSERT INTO appointments(fee)
VALUE(-60);
DESCRIBE appointments;
DESCRIBE billing;
UPDATE appointments
SET status= 'Pending'
WHERE appointment_id=1;
SHOW CREATE TABLE appointments;
UPDATE appointments
SET fee='-60'
WHERE appointment_id=1;
