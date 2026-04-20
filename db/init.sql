Create table Hospital(
    Hospital_ID int primary key auto_increment, 
    Hospital_Name varchar(255) not null,
    Address varchar(225), 
    City varchar(50), 
    Email varchar(225), 
    Phone varchar(15), 
    Latitude decimal(9,6), 
    Longitude decimal(9,6)
); 

Create table Resource (
    Resource_ID int primary key auto_increment,
    Hospital_ID int, 
    Resource_Type varchar(50), 
    Total_Count int, 
    Available_Count int, 
    Last_Updated timestamp default current_timestamp, 
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Ambulance(
   Ambulance_ID int primary key auto_increment, 
   Hospital_ID int,
   Vehicle_Number varchar(20), 
   Driver_Name varchar(100), 
   Driver_Contact varchar(15), 
   Status varchar(10), 
   Current_Latitude decimal(9,6), 
   Current_Longitude decimal(9,6),
   Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Bloodbank(
    Bloodbank_ID int primary key auto_increment, 
    Hospital_ID int, 
    BB_Name varchar(225), 
    Contact varchar(15), 
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table BloodInventory(
    Inventory_ID int primary key auto_increment, 
    Bloodbank_ID int, 
    Blood_Type varchar(3), 
    Units_Available int,
    Expiry_Date date, 
    Foreign key (Bloodbank_ID) references Bloodbank(Bloodbank_ID) 
);

Create table Patient(
    Patient_ID int primary key auto_increment, 
    Patient_Name varchar(225), 
    Gender char(1),
    DOB date, 
    Blood_Group char(3), 
    Phone varchar(15), 
    Email varchar(225) unique,
    Password varchar(255),
    Address varchar(355) 
);

Create table Patient_Contact(
    Patient_ID int,
    Contact_No varchar(15),
    Foreign key (Patient_ID) references Patient(Patient_ID) ON DELETE CASCADE
);

Create table Medical_Record(
    Record_ID int primary key auto_increment, 
    Patient_ID int, 
    Hospital_ID int, 
    Diagnosis text, 
    Treatment text, 
    Admission_Date date, 
    Discharge_Date date, 
    Foreign key (Patient_ID) references Patient(Patient_ID), 
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Doctor(
    Doctor_ID int primary key auto_increment, 
    Hospital_ID int,
    Doctor_Name varchar(225), 
    Specilization varchar(300),
    Phone varchar(15), 
    Email varchar(225) unique,
    Password varchar(255),
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Staff(
    Staff_ID int primary key auto_increment, 
    Hospital_ID int,
    Staff_Name varchar(225), 
    Role varchar(100),
    Phone varchar(15), 
    Email varchar(225) unique,
    Password varchar(255),
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Treatment(
    Treatment_ID int primary key auto_increment, 
    Record_ID int, 
    Treatment_Date date, 
    Foreign key (Record_ID) references Medical_Record(Record_ID)
);

Create table Doctor_Treatment(
    Treatment_ID int,
    Doctor_ID int,
    Foreign key (Treatment_ID) references Treatment(Treatment_ID) ON DELETE CASCADE,
    Foreign key (Doctor_ID) references Doctor(Doctor_ID) ON DELETE CASCADE
);

Create table Medicine(
    Medicine_ID int primary key auto_increment, 
    Medicine_Name varchar(255), 
    Description text, 
    Category varchar(50), 
    Unit_Price decimal(8,2),
    Manufacturer varchar(255)
);

Create table Medicine_Content(
    Medicine_ID int,
    Content_Name text,
    Foreign key (Medicine_ID) references Medicine(Medicine_ID) ON DELETE CASCADE
);

Create table Medicine_Stock(
    Stock_ID int primary key auto_increment, 
    Hospital_ID int, 
    Medicine_ID int, 
    Quantity int, 
    Last_Updated timestamp default current_timestamp, 
    Foreign key (Hospital_ID) references Hospital(Hospital_ID), 
    Foreign key (Medicine_ID) references Medicine(Medicine_ID)
);

Create table Emergency_Request(
    Request_ID int primary key auto_increment, 
    Patient_ID int, 
    Hospital_ID int, 
    Request_Type varchar(50), 
    Priority_Level int, 
    Request_Time timestamp default current_timestamp, 
    Req_Status varchar(20), 
    Foreign key (Patient_ID) references Patient(Patient_ID), 
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Dispatch(
    Dispatch_ID int primary key auto_increment, 
    Request_ID int, 
    Dispatch_Time timestamp default current_timestamp, 
    Arrival_Time timestamp, 
    Dispatch_Status varchar(20), 
    Foreign key (Request_ID) references Emergency_Request(Request_ID) 
);

Create table Dispatch_Ambulance(
    Dispatch_ID int,
    Ambulance_ID int,
    Foreign key (Dispatch_ID) references Dispatch(Dispatch_ID) ON DELETE CASCADE,
    Foreign key (Ambulance_ID) references Ambulance(Ambulance_ID) ON DELETE CASCADE
);

Create table Dispatch_Doctor(
    Dispatch_ID int,
    Doctor_ID int,
    Foreign key (Dispatch_ID) references Dispatch(Dispatch_ID) ON DELETE CASCADE,
    Foreign key (Doctor_ID) references Doctor(Doctor_ID) ON DELETE CASCADE
);

Create table Billing(
    Bill_ID int primary key auto_increment,
    Patient_ID int,
    Hospital_ID int,
    Amount decimal(10,2),
    Status varchar(20) default 'Pending',
    Date_Issued timestamp default current_timestamp,
    Foreign key (Patient_ID) references Patient(Patient_ID),
    Foreign key (Hospital_ID) references Hospital(Hospital_ID)
);

Create table Prescription(
    Prescription_ID int primary key auto_increment,
    Treatment_ID int,
    Medicine_ID int,
    Quantity int,
    Prescription_Date timestamp default current_timestamp,
    Foreign key (Treatment_ID) references Treatment(Treatment_ID),
    Foreign key (Medicine_ID) references Medicine(Medicine_ID)
);
