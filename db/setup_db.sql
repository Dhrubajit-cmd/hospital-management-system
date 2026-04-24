USE hospital_management;


-- REALISTIC MOCK DATA INSERTS --

-- Hospital
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('St. Lukes Medical Center', '101 Main St', 'New York', 'contact@st.lukesmedicalcenter.com', '9664689830', 37.225464, -119.320358);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Mercy General Hospital', '205 Oak Dr', 'Chicago', 'contact@mercygeneralhospital.com', '4875462723', 39.262745, -115.916792);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Grace Care Clinic', '304 Pine Rd', 'Los Angeles', 'contact@gracecareclinic.com', '7558176364', 37.41484, -109.231905);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('City Central Hospital', '493 Cedar Blvd', 'Houston', 'contact@citycentralhospital.com', '4762714511', 43.238183, -90.359861);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Sunrise Health Institute', '501 Elm St', 'Phoenix', 'contact@sunrisehealthinstitute.com', '5008207421', 39.39031, -107.095165);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Crestview General', '620 Birch Ave', 'Philadelphia', 'contact@crestviewgeneral.com', '5259503800', 40.009157, -77.25875);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Silver Oak Medical', '711 Maple Ter', 'San Antonio', 'contact@silveroakmedical.com', '6765796485', 30.213803, -97.804227);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Pine Crest Regional', '804 Spruce Way', 'San Diego', 'contact@pinecrestregional.com', '8503723455', 34.520459, -113.374428);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Maplewood Community Hospital', '901 Ash Ct', 'Dallas', 'contact@maplewoodcommunityhospital.com', '5312334249', 31.545025, -99.896864);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Oceanview Medical Center', '1024 Walnut St', 'San Jose', 'contact@oceanviewmedicalcenter.com', '6556964551', 30.22537, -91.158262);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Pioneer Health Clinic', '1152 Cherry Ln', 'Austin', 'contact@pioneerhealthclinic.com', '9468634471', 30.368385, -117.975437);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Summit Medical Center', '1240 Willow Rd', 'Jacksonville', 'contact@summitmedicalcenter.com', '8332041285', 42.100391, -79.959799);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Evergreen Health', '1308 Sycamore Dr', 'Fort Worth', 'contact@evergreenhealth.com', '8104422131', 40.778881, -94.82149);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Grand Hope Hospital', '1430 Poplar St', 'Columbus', 'contact@grandhopehospital.com', '8248666900', 40.055958, -87.218962);
INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('Blue Ridge Care Facility', '1500 Hickory Blvd', 'Charlotte', 'contact@blueridgecarefacility.com', '5194793308', 40.502966, -72.110149);

-- Resource
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (11, 'Ventilators', 69, 58);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (13, 'Wheelchairs', 74, 5);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (9, 'Ventilators', 71, 57);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (14, 'Ventilators', 55, 49);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (4, 'ICU Beds', 66, 12);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (3, 'Wheelchairs', 71, 44);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (14, 'ICU Beds', 23, 10);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (9, 'Oxygen Cylinders', 97, 32);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (11, 'Ventilators', 91, 83);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (2, 'Ventilators', 71, 8);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (9, 'Wheelchairs', 48, 28);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (15, 'Defibrillators', 37, 25);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (4, 'Oxygen Cylinders', 74, 37);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (2, 'ICU Beds', 90, 85);
INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES (14, 'Ventilators', 94, 28);

-- Ambulance
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (8, 'AMB-1001', 'Robert Blake', '5551225584', 'Repair', 34.742666, -99.290488);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (14, 'AMB-1002', 'Michael Chen', '5559071394', 'Repair', 44.25585, -117.754145);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (3, 'AMB-1003', 'Sarah Miller', '5554623025', 'Repair', 37.380522, -92.240368);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (12, 'AMB-1004', 'David Smith', '5556485486', 'Repair', 40.471016, -76.226192);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (6, 'AMB-1005', 'James Johnson', '5556439817', 'Repair', 30.99115, -106.444851);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (1, 'AMB-1006', 'Emily Davis', '5558490131', 'Available', 43.959811, -113.93986);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (13, 'AMB-1007', 'John Garcia', '5556320585', 'Available', 31.432945, -104.759582);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (5, 'AMB-1008', 'William Rodriguez', '5559261245', 'Repair', 30.200296, -110.929082);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (2, 'AMB-1009', 'Mary Martinez', '5559910700', 'Repair', 41.067779, -100.139514);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (5, 'AMB-1010', 'Charles Hernandez', '5552772761', 'Available', 32.338547, -86.439931);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (12, 'AMB-1011', 'Richard Lopez', '5557286044', 'In Use', 36.609974, -101.752613);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (8, 'AMB-1012', 'Joseph Gonzalez', '5552592823', 'Repair', 31.819032, -102.409565);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (12, 'AMB-1013', 'Thomas Wilson', '5555642370', 'Available', 42.043709, -80.161556);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (1, 'AMB-1014', 'Daniel Anderson', '5554229156', 'Repair', 37.240319, -74.297745);
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES (3, 'AMB-1015', 'Matthew Thomas', '5551983863', 'Repair', 42.723467, -110.064779);

-- Bloodbank
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (1, 'New York Lifeblood Center', '8003543227');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (2, 'Chicago Lifeblood Center', '8003478259');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (3, 'Los Angeles Lifeblood Center', '8008542259');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (4, 'Houston Lifeblood Center', '8009869805');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (5, 'Phoenix Lifeblood Center', '8008635571');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (6, 'Philadelphia Lifeblood Center', '8004627201');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (7, 'San Antonio Lifeblood Center', '8009468391');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (8, 'San Diego Lifeblood Center', '8005869595');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (9, 'Dallas Lifeblood Center', '8002073448');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (10, 'San Jose Lifeblood Center', '8008680996');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (11, 'Austin Lifeblood Center', '8001433849');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (12, 'Jacksonville Lifeblood Center', '8008380129');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (13, 'Fort Worth Lifeblood Center', '8003134618');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (14, 'Columbus Lifeblood Center', '8002450607');
INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES (15, 'Charlotte Lifeblood Center', '8004953271');

-- BloodInventory
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (6, 'AB+', 9, '2026-08-17');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (14, 'B-', 47, '2026-08-14');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (12, 'AB+', 25, '2026-08-12');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (1, 'O+', 39, '2026-08-13');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (6, 'O-', 28, '2026-08-22');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (14, 'AB-', 47, '2026-08-18');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (11, 'O-', 40, '2026-08-12');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (3, 'AB-', 30, '2026-08-22');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (11, 'O+', 50, '2026-08-16');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (4, 'B+', 39, '2026-08-22');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (15, 'B-', 15, '2026-08-28');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (4, 'O+', 35, '2026-08-28');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (5, 'B-', 7, '2026-08-16');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (4, 'A+', 14, '2026-08-13');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES (1, 'AB+', 10, '2026-08-20');

-- Patient and Patient_Contact
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Amanda Brown', 'F', '1966-07-16', 'B-', '6021228169', 'amanda.brown@gmail.com', 'securepass1', '1014 Residential St, Austin');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (1, '9176108681');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Christopher Moore', 'M', '1990-08-14', 'A-', '6028214425', 'christopher.moore@gmail.com', 'securepass2', '7508 Residential St, Chicago');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (2, '9177192202');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Daniel Taylor', 'M', '1964-05-11', 'A-', '6023997655', 'daniel.taylor@gmail.com', 'securepass3', '7624 Residential St, Dallas');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (3, '9173678906');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Jessica Anderson', 'F', '1960-09-13', 'B-', '6027717421', 'jessica.anderson@gmail.com', 'securepass4', '5853 Residential St, Houston');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (4, '9172586892');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Joshua Thomas', 'M', '1986-05-14', 'A+', '6028708440', 'joshua.thomas@gmail.com', 'securepass5', '4805 Residential St, Chicago');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (5, '9176423730');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Ashley Jackson', 'F', '1965-01-14', 'B+', '6025453789', 'ashley.jackson@gmail.com', 'securepass6', '4879 Residential St, Austin');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (6, '9172114445');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Brian White', 'M', '1960-02-12', 'AB-', '6021132485', 'brian.white@gmail.com', 'securepass7', '4813 Residential St, Fort Worth');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (7, '9171374129');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Megan Harris', 'F', '1981-06-18', 'O-', '6024396536', 'megan.harris@gmail.com', 'securepass8', '6104 Residential St, Houston');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (8, '9174246050');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Kevin Martin', 'M', '1998-06-13', 'O-', '6028334983', 'kevin.martin@gmail.com', 'securepass9', '8297 Residential St, San Antonio');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (9, '9179379950');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Courtney Thompson', 'F', '1980-07-15', 'AB-', '6027899201', 'courtney.thompson@gmail.com', 'securepass10', '3649 Residential St, Dallas');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (10, '9178253554');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Ryan Garcia', 'M', '1973-03-11', 'A-', '6026139945', 'ryan.garcia@gmail.com', 'securepass11', '9738 Residential St, Columbus');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (11, '9175305033');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Melissa Martinez', 'F', '1996-07-13', 'B-', '6024588080', 'melissa.martinez@gmail.com', 'securepass12', '601 Residential St, San Diego');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (12, '9171910811');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Jacob Robinson', 'M', '1955-09-12', 'O+', '6024312575', 'jacob.robinson@gmail.com', 'securepass13', '9920 Residential St, Philadelphia');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (13, '9178451844');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Lauren Clark', 'F', '1977-05-18', 'B-', '6021623448', 'lauren.clark@gmail.com', 'securepass14', '1129 Residential St, San Antonio');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (14, '9171232016');
INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('Justin Rodriguez', 'M', '1978-06-16', 'A+', '6026479740', 'justin.rodriguez@gmail.com', 'securepass15', '1057 Residential St, San Diego');
INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (15, '9172540392');

-- Medical_Record
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (1, 13, 'Acute Bronchitis', 'Antibiotics and rest', '2026-03-16', '2026-04-5');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (2, 15, 'Type 2 Diabetes', 'Insulin therapy', '2026-03-14', '2026-04-3');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (3, 5, 'Hypertension', 'Beta blockers', '2026-03-12', '2026-04-13');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (4, 9, 'Asthma', 'Inhaler usage', '2026-03-13', '2026-04-4');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (5, 11, 'High Cholesterol', 'Statins prescription', '2026-03-14', '2026-04-8');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (6, 12, 'Migraine', 'Pain relievers', '2026-03-20', '2026-04-4');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (7, 3, 'Gastroesophageal Reflux', 'Antacids', '2026-03-20', '2026-04-10');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (8, 3, 'Osteoarthritis', 'Physical therapy', '2026-03-11', '2026-04-12');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (9, 15, 'Depression', 'Antidepressants', '2026-03-14', '2026-04-8');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (10, 7, 'Anxiety Disorder', 'Cognitive behavioral therapy', '2026-03-12', '2026-04-7');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (11, 13, 'Hypothyroidism', 'Hormone replacement', '2026-03-10', '2026-04-12');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (12, 10, 'Chronic Kidney Disease', 'Dialysis planning', '2026-03-16', '2026-04-14');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (13, 10, 'Heart Failure', 'ACE inhibitors', '2026-03-10', '2026-04-1');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (14, 9, 'Coronary Artery Disease', 'Bypass surgery eval', '2026-03-15', '2026-04-13');
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES (15, 14, 'Pneumonia', 'Hospitalization and IV antibiotics', '2026-03-12', '2026-04-14');

-- Doctor
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (12, 'Dr. Gregory House', 'Diagnostics', '3109439425', 'dr.house@hospital.com', 'drpass1');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (14, 'Dr. Meredith Grey', 'General Surgery', '3109119198', 'dr.grey@hospital.com', 'drpass2');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (1, 'Dr. John Watson', 'Internal Medicine', '3106973551', 'dr.watson@hospital.com', 'drpass3');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (10, 'Dr. Stephen Strange', 'Neurosurgery', '3102661709', 'dr.strange@hospital.com', 'drpass4');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (10, 'Dr. Leonard McCoy', 'Cardiothoracic Surgery', '3105779542', 'dr.mccoy@hospital.com', 'drpass5');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (6, 'Dr. Michaela Quinn', 'Family Medicine', '3103190570', 'dr.quinn@hospital.com', 'drpass6');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (13, 'Dr. Jack Shephard', 'Spinal Surgery', '3107329241', 'dr.shephard@hospital.com', 'drpass7');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (14, 'Dr. Perry Cox', 'Internal Medicine', '3102377397', 'dr.cox@hospital.com', 'drpass8');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (3, 'Dr. Julius Hibbert', 'Family Medicine', '3108868827', 'dr.hibbert@hospital.com', 'drpass9');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (7, 'Dr. Nick Riviera', 'Dermatology', '3105737774', 'dr.riviera@hospital.com', 'drpass10');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (9, 'Dr. Hannibal Lecter', 'Psychiatry', '3105956164', 'dr.lecter@hospital.com', 'drpass11');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (5, 'Dr. Albert Robbins', 'Pathology', '3102238670', 'dr.robbins@hospital.com', 'drpass12');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (15, 'Dr. Beverly Crusher', 'General Medicine', '3103861951', 'dr.crusher@hospital.com', 'drpass13');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (1, 'Dr. Allison Cameron', 'Immunology', '3103959276', 'dr.cameron@hospital.com', 'drpass14');
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES (1, 'Dr. Robert Chase', 'Intensive Care', '3106617302', 'dr.chase@hospital.com', 'drpass15');

-- Staff
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (9, 'Alice Green', 'Janitor', '4156443961', 'alice@staff.com', 'stfpass1');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (2, 'Bob Black', 'Receptionist', '4159616839', 'bob@staff.com', 'stfpass2');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (5, 'Charlie Brown', 'Janitor', '4153099100', 'charlie@staff.com', 'stfpass3');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (8, 'Diana White', 'Nurse', '4153039650', 'diana@staff.com', 'stfpass4');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (9, 'Eva Blue', 'Receptionist', '4157934828', 'eva@staff.com', 'stfpass5');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (14, 'Frank Red', 'Receptionist', '4157189752', 'frank@staff.com', 'stfpass6');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (3, 'Grace Yellow', 'Technician', '4155384732', 'grace@staff.com', 'stfpass7');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (9, 'Henry Silver', 'Admin', '4156128343', 'henry@staff.com', 'stfpass8');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (9, 'Ivy Gold', 'Receptionist', '4152264520', 'ivy@staff.com', 'stfpass9');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (7, 'Jack Bronze', 'Receptionist', '4159459770', 'jack@staff.com', 'stfpass10');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (2, 'Karen Copper', 'Technician', '4158514814', 'karen@staff.com', 'stfpass11');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (7, 'Liam Iron', 'Admin', '4155472737', 'liam@staff.com', 'stfpass12');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (7, 'Mia Steel', 'Admin', '4152978910', 'mia@staff.com', 'stfpass13');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (3, 'Noah Lead', 'Janitor', '4153718561', 'noah@staff.com', 'stfpass14');
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES (3, 'Olivia Zinc', 'Technician', '4152911447', 'olivia@staff.com', 'stfpass15');

-- Treatment and Doctor_Treatment
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (1, '2026-03-15');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (1, 7);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (2, '2026-03-21');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (2, 6);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (3, '2026-03-24');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (3, 3);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (4, '2026-03-20');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (4, 12);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (5, '2026-03-11');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (5, 10);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (6, '2026-03-10');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (6, 8);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (7, '2026-03-10');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (7, 8);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (8, '2026-03-10');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (8, 6);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (9, '2026-03-15');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (9, 10);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (10, '2026-03-20');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (10, 10);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (11, '2026-03-21');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (11, 12);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (12, '2026-03-11');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (12, 7);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (13, '2026-03-14');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (13, 1);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (14, '2026-03-10');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (14, 3);
INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES (15, '2026-03-25');
INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES (15, 13);

-- Medicine and Medicine_Content
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Lisinopril', 'Used to treat various conditions', 'Prescription', 103.03, 'PharmaCorp 1');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (1, 'ACE inhibitor');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Levothyroxine', 'Used to treat various conditions', 'Prescription', 48.5, 'PharmaCorp 2');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (2, 'Thyroid hormone');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Atorvastatin', 'Used to treat various conditions', 'Prescription', 113.23, 'PharmaCorp 3');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (3, 'HMG-CoA reductase inhibitor');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Metformin', 'Used to treat various conditions', 'Prescription', 76.66, 'PharmaCorp 4');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (4, 'Biguanide');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Amlodipine', 'Used to treat various conditions', 'Prescription', 130.31, 'PharmaCorp 5');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (5, 'Calcium channel blocker');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Metoprolol', 'Used to treat various conditions', 'Prescription', 73.15, 'PharmaCorp 6');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (6, 'Beta blocker');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Omeprazole', 'Used to treat various conditions', 'Prescription', 97.5, 'PharmaCorp 7');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (7, 'Proton pump inhibitor');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Simvastatin', 'Used to treat various conditions', 'Prescription', 21.68, 'PharmaCorp 8');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (8, 'HMG-CoA reductase inhibitor');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Losartan', 'Used to treat various conditions', 'Prescription', 112.68, 'PharmaCorp 9');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (9, 'Receptor blocker');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Albuterol', 'Used to treat various conditions', 'Prescription', 113.93, 'PharmaCorp 10');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (10, 'Bronchodilator');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Gabapentin', 'Used to treat various conditions', 'Prescription', 77.64, 'PharmaCorp 11');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (11, 'Anticonvulsant');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Hydrochlorothiazide', 'Used to treat various conditions', 'Prescription', 38.02, 'PharmaCorp 12');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (12, 'Diuretic');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Sertraline', 'Used to treat various conditions', 'Prescription', 82.42, 'PharmaCorp 13');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (13, 'SSRI');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Fluticasone', 'Used to treat various conditions', 'Prescription', 90.2, 'PharmaCorp 14');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (14, 'Corticosteroid');
INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('Montelukast', 'Used to treat various conditions', 'Prescription', 41.06, 'PharmaCorp 15');
INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES (15, 'Leukotriene receptor antagonist');

-- Medicine_Stock
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (2, 5, 93);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (8, 4, 78);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (10, 4, 193);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (1, 13, 412);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (2, 13, 325);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (10, 3, 427);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (2, 12, 231);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (8, 9, 148);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (12, 1, 142);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (13, 5, 179);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (8, 14, 500);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (1, 8, 380);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (11, 5, 312);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (2, 2, 154);
INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES (12, 3, 87);

-- Emergency_Request
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (1, 7, 'Heart Attack', 5, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (2, 6, 'Car Accident', 3, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (3, 6, 'Stroke', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (4, 12, 'Stroke', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (5, 3, 'Heart Attack', 3, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (6, 3, 'Car Accident', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (7, 12, 'Fire Injury', 3, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (8, 7, 'Severe Fall', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (9, 2, 'Fire Injury', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (10, 13, 'Heart Attack', 3, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (11, 7, 'Stroke', 5, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (12, 11, 'Car Accident', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (13, 14, 'Car Accident', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (14, 15, 'Fire Injury', 4, 'Pending');
INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (15, 5, 'Car Accident', 3, 'Pending');

-- Dispatch, Dispatch_Ambulance, Dispatch_Doctor
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (1, 'Dispatched');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (1, 4);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (1, 12);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (2, 'Dispatched');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (2, 10);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (2, 8);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (3, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (3, 6);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (3, 8);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (4, 'Dispatched');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (4, 13);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (4, 8);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (5, 'Arrived');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (5, 13);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (5, 5);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (6, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (6, 3);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (6, 14);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (7, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (7, 7);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (7, 8);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (8, 'Arrived');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (8, 13);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (8, 7);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (9, 'Arrived');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (9, 9);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (9, 15);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (10, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (10, 3);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (10, 14);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (11, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (11, 5);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (11, 6);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (12, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (12, 5);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (12, 9);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (13, 'Completed');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (13, 8);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (13, 10);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (14, 'Arrived');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (14, 15);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (14, 9);
INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (15, 'Dispatched');
INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (15, 5);
INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES (15, 5);

-- Billing
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (1, 12, 2218.79, 'Paid');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (2, 14, 649.74, 'Pending');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (3, 5, 2669.27, 'Pending');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (4, 1, 1523.23, 'Cancelled');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (5, 15, 1369.92, 'Pending');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (6, 11, 3074.45, 'Paid');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (7, 5, 4677.94, 'Paid');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (8, 1, 1464.22, 'Paid');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (9, 11, 3497.88, 'Pending');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (10, 3, 4403.61, 'Cancelled');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (11, 4, 4629.09, 'Pending');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (12, 10, 2828.6, 'Pending');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (13, 1, 2722.97, 'Paid');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (14, 3, 3103.41, 'Paid');
INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (15, 9, 4343.41, 'Pending');

-- Prescription
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (1, 4, 1);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (2, 14, 5);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (3, 10, 5);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (4, 2, 3);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (5, 1, 5);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (6, 5, 2);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (7, 5, 3);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (8, 1, 4);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (9, 6, 4);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (10, 9, 5);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (11, 14, 3);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (12, 11, 5);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (13, 2, 2);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (14, 10, 4);
INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (15, 6, 5);
