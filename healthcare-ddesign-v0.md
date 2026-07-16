# Healthcare system design (version 0)
## Patients
- Patient_ID|INT|PRIMARY KEY|
-Name|VARCHAR(100)|
-Age|INT|
-Gender|CHAR(3)|
-Phone Number|VARCHAR(15)|
-Address|VARCHR(50)|
## Doctors
-Doctor_ID|INT|PRIMARY KEY|
-Patient_ID|INT|Foreign KEY|
-Name|VARCHAR(150)|
-Department|VARCHAR(150)|
-Specialization|VARCHAR(200)
-Phone Number|VARCHAR(15)
-Email|VARCHAR(50)
## Department
-Appointment_ID|INT|PRIMARY KEY|
-Patient_Name|VARCHAR(100)|
-Doctor_ID|INT|FOREIGN KEY|
-Appointment_Date|DATE|
-Appointment_Time|TIME|
-Status|VARCHAR(200)|
## Appoinments
-Appointment_ID|INT|PRIMARY KEY|
-Patient_ID|INT|FOREIGN KEY|
-Appointment_Date|DATE|
-Appointment_Time|TIME|
-Status|VARCHAR(200)|
## Billing
-Billing_ID|INT|PRIMARY KEY|
-Patient_ID|INT|FORGEIN KEY|
-Total_Ammount|DECIMAL|
-Payment_Method|CHAR(6)|
-Payment_Status|TINYINT|
-Billing_Date|DATESTAMP|



#THE RELATIONSHIP BETWEEN KEYS
Patients.Patient_ID(PK)------> Appointment.Patient_ID(FK)
Doctors.Doctor_ID(PK)--------->Appointment.Doctor_ID(FK)
Doctors.Doctor_ID(PK)--------->Department.Doctor_ID(FK)
Patients.Patient_ID(PK)------> Billing.Patient_ID(FK)