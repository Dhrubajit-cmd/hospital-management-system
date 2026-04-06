DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

SOURCE /docker-entrypoint-initdb.d/init.sql;

-- Insert Hospital
INSERT INTO Hospital (Hospital_Name, Address, City) 
VALUES ('City General', '123 Main St', 'Metropolis');

-- Insert Doctors
INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES 
(1, 'Dr. Smith', 'Cardiology', '1234567890', 'smith@doctor.com', 'password123'),
(1, 'Dr. Jones', 'Neurology', '0987654321', 'jones@doctor.com', 'password123');

-- Insert Staff
INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES 
(1, 'Nurse Joy', 'Nurse', '5556667777', 'joy@staff.com', 'password123');

-- Insert Patients
INSERT INTO Patient (Patient_Name, Gender, DOB, Phone, Email, Password) VALUES 
('Alice Doe', 'F', '1990-01-01', '1112223333', 'alice@patient.com', 'password123'),
('Bob Smith', 'M', '1985-05-05', '4445556666', 'bob@patient.com', 'password123');

-- Insert Ambulances
INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Status) VALUES 
(1, 'AMB-01', 'John M.', 'Available'),
(1, 'AMB-02', 'Sarah V.', 'Available'),
(1, 'AMB-03', 'Mike P.', 'In Use');

-- Insert Blood Bank & Inventory
INSERT INTO Bloodbank (Hospital_ID, BB_Name) VALUES (1, 'City Central Blood Bank');
INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES 
(1, 'O+', 50, '2024-12-31'),
(1, 'O-', 10, '2024-12-31'),
(1, 'A+', 30, '2024-12-31'),
(1, 'A-', 5, '2024-12-31'),
(1, 'B+', 20, '2024-12-31'),
(1, 'AB+', 15, '2024-12-31');

-- Insert Medicines & Stock
INSERT INTO Medicine (Medicine_Name, Category, Unit_Price) VALUES 
('Paracetamol', 'Painkiller', 10.00),
('Amoxicillin', 'Antibiotic', 25.50),
('Ibuprofen', 'Painkiller', 15.00);

INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES 
(1, 1, 500),
(1, 2, 200),
(1, 3, 300);

-- Existing Medical Records & Treatments logic
INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES 
(1, 1, 'Flu', 'Rest and hydration', '2023-10-01', '2023-10-05'),
(2, 1, 'Broken Leg', 'Cast applied', '2023-11-01', '2023-11-03');

INSERT INTO Treatment (Doctor_ID, Patient_ID, Record_ID, Treatment_Date) VALUES 
(1, 1, 1, '2023-10-02'),
(2, 2, 2, '2023-11-01');

INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES 
(1, 1, 150.00, 'Paid'),
(2, 1, 2000.00, 'Pending');
