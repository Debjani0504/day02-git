# Day09- Normalization
## Bad Appiontment table
|Appointment_id|Patient_name|doctor_name|department|fee|Phone_number|
|1| Anita|Dr.Sharma|Cardiologist|1000|2789920,789933
|2|Priya|Dr. Roy|Nurologist|1500|987621343, 86539
|3|Anita|Dr.Sharma|Cardiologist|1000|2789920,789933
## problems
-Repeated patient name
-Repeated doctors name
-Repeated department
-Multiple phone number

## 1NF
Appointment
|Appointment_id|Patient_name|doctor_name|department|fee|
|1| Anita|Dr.Sharma|Cardiologist|1000|
|2|Priya|Dr. Roy|Nurologist|1500|
|3|Anita|Dr.Sharma|Cardiologist|1000|

Patient_Phones
|Patient_name|phone|
|Anita|98674|
|Anita|91452778
|Priya|654356

## 2NF
Patient
|Patient_id|Patient_name|
|1|Anita|
|2|Rahul|

Doctors
|Doctor_id|Doctor_name|department|fee|
|101|Dr.Sharma|Cardiologist|1000
|102|Dr.Roy|Nurologist|1500

Appointments
|appointment_id|patient_id|doctor_id|
|1|1|101|
|2|1|101|
|3|2|102|

## why 1NF?
-One value per cell
-Phone numbers separated
## why 2NF?
-Remove repeated patient and doctor informations.
-Stored data in separated tables.
