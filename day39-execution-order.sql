USE healthcare_db;
-- intentionally creating alias error
SELECT fee * 1.18 AS gst
FROM appointments
WHERE gst> 1000;
-- Fixing it by repeating the expression
SELECT fee* 1.18 AS gst
FROM appointments
WHERE fee* 1.18>1000; 
-- Fixing it using a subquery 
SELECT gst
FROM (
SELECT fee* 1.18 AS gst
FROM appointments
) AS x
WHERE gst>1000;