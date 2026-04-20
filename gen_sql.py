import random

def generate_sql():
    sql = """
DROP DATABASE IF EXISTS hospital_management;
CREATE DATABASE hospital_management;
USE hospital_management;

SOURCE /docker-entrypoint-initdb.d/init.sql;

-- REALISTIC MOCK DATA INSERTS --

"""

    # 1. Hospital
    hospitals = [
        "St. Luke's Medical Center", "Mercy General Hospital", "Grace Care Clinic", "City Central Hospital",
        "Sunrise Health Institute", "Crestview General", "Silver Oak Medical", "Pine Crest Regional",
        "Maplewood Community Hospital", "Oceanview Medical Center", "Pioneer Health Clinic", "Summit Medical Center",
        "Evergreen Health", "Grand Hope Hospital", "Blue Ridge Care Facility"
    ]
    cities = ["New York", "Chicago", "Los Angeles", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose", "Austin", "Jacksonville", "Fort Worth", "Columbus", "Charlotte"]
    addresses = ["101 Main St", "205 Oak Dr", "304 Pine Rd", "493 Cedar Blvd", "501 Elm St", "620 Birch Ave", "711 Maple Ter", "804 Spruce Way", "901 Ash Ct", "1024 Walnut St", "1152 Cherry Ln", "1240 Willow Rd", "1308 Sycamore Dr", "1430 Poplar St", "1500 Hickory Blvd"]
    
    sql += "-- Hospital\n"
    for i in range(15):
        lat = str(round(random.uniform(30.0, 45.0), 6))
        lon = str(round(random.uniform(-120.0, -70.0), 6))
        phone = f"{random.randint(200, 999)}{random.randint(100, 999)}{random.randint(1000, 9999)}"
        clean_name = hospitals[i].replace(' ', '').replace("'", "").lower()
        email = f"contact@{clean_name}.com"
        sql += f"INSERT INTO Hospital (Hospital_Name, Address, City, Email, Phone, Latitude, Longitude) VALUES ('{hospitals[i]}', '{addresses[i]}', '{cities[i]}', '{email}', '{phone}', {lat}, {lon});\n"
    
    # 2. Resource
    sql += "\n-- Resource\n"
    rt = ["Ventilators", "ICU Beds", "Oxygen Cylinders", "Wheelchairs", "Defibrillators"]
    for i in range(1, 16):
        tot = random.randint(20, 100)
        avl = random.randint(0, tot)
        sql += f"INSERT INTO Resource (Hospital_ID, Resource_Type, Total_Count, Available_Count) VALUES ({random.randint(1, 15)}, '{random.choice(rt)}', {tot}, {avl});\n"
    
    # 3. Ambulance
    sql += "\n-- Ambulance\n"
    drivers = ["Robert Blake", "Michael Chen", "Sarah Miller", "David Smith", "James Johnson", "Emily Davis", "John Garcia", "William Rodriguez", "Mary Martinez", "Charles Hernandez", "Richard Lopez", "Joseph Gonzalez", "Thomas Wilson", "Daniel Anderson", "Matthew Thomas"]
    for i in range(1, 16):
        lat = str(round(random.uniform(30.0, 45.0), 6))
        lon = str(round(random.uniform(-120.0, -70.0), 6))
        phone = f"555{random.randint(1000000, 9999999)}"
        stat = random.choice(["Available", "Available", "In Use", "Repair"])
        sql += f"INSERT INTO Ambulance (Hospital_ID, Vehicle_Number, Driver_Name, Driver_Contact, Status, Current_Latitude, Current_Longitude) VALUES ({random.randint(1, 15)}, 'AMB-10{i:02d}', '{drivers[i-1]}', '{phone}', '{stat}', {lat}, {lon});\n"
        
    # 4. Bloodbank
    sql += "\n-- Bloodbank\n"
    for i in range(1, 16):
        phone = f"800{random.randint(1000000, 9999999)}"
        sql += f"INSERT INTO Bloodbank (Hospital_ID, BB_Name, Contact) VALUES ({i}, '{cities[i-1]} Lifeblood Center', '{phone}');\n"
        
    # 5. BloodInventory
    sql += "\n-- BloodInventory\n"
    btypes = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    for i in range(1, 16):
        units = random.randint(5, 50)
        sql += f"INSERT INTO BloodInventory (Bloodbank_ID, Blood_Type, Units_Available, Expiry_Date) VALUES ({random.randint(1, 15)}, '{random.choice(btypes)}', {units}, '2026-08-{random.randint(10,28)}');\n"
        
    # 6. Patient & 7. Patient_Contact
    sql += "\n-- Patient and Patient_Contact\n"
    patients = ["Amanda Brown", "Christopher Moore", "Daniel Taylor", "Jessica Anderson", "Joshua Thomas", "Ashley Jackson", "Brian White", "Megan Harris", "Kevin Martin", "Courtney Thompson", "Ryan Garcia", "Melissa Martinez", "Jacob Robinson", "Lauren Clark", "Justin Rodriguez"]
    pgenders = ["F", "M", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M"]
    for i in range(1, 16):
        phone = f"602{random.randint(1000000, 9999999)}"
        email = f"{patients[i-1].replace(' ', '.').lower()}@gmail.com"
        adr = f"{random.randint(100, 9999)} Residential St, {random.choice(cities)}"
        sql += f"INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES ('{patients[i-1]}', '{pgenders[i-1]}', '19{random.randint(50, 99)}-0{random.randint(1,9)}-1{random.randint(0,9)}', '{random.choice(btypes)}', '{phone}', '{email}', 'securepass{i}', '{adr}');\n"
        cphone = f"917{random.randint(1000000, 9999999)}"
        sql += f"INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES ({i}, '{cphone}');\n"

    # 8. Medical_Record
    sql += "\n-- Medical_Record\n"
    diagnoses = ["Acute Bronchitis", "Type 2 Diabetes", "Hypertension", "Asthma", "High Cholesterol", "Migraine", "Gastroesophageal Reflux", "Osteoarthritis", "Depression", "Anxiety Disorder", "Hypothyroidism", "Chronic Kidney Disease", "Heart Failure", "Coronary Artery Disease", "Pneumonia"]
    treatments = ["Antibiotics and rest", "Insulin therapy", "Beta blockers", "Inhaler usage", "Statins prescription", "Pain relievers", "Antacids", "Physical therapy", "Antidepressants", "Cognitive behavioral therapy", "Hormone replacement", "Dialysis planning", "ACE inhibitors", "Bypass surgery eval", "Hospitalization and IV antibiotics"]
    for i in range(1, 16):
        sql += f"INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date) VALUES ({i}, {random.randint(1,15)}, '{diagnoses[i-1]}', '{treatments[i-1]}', '2026-03-{random.randint(10,20)}', '2026-04-{random.randint(1,15)}');\n"

    # 9. Doctor
    sql += "\n-- Doctor\n"
    doctors = ["Dr. Gregory House", "Dr. Meredith Grey", "Dr. John Watson", "Dr. Stephen Strange", "Dr. Leonard McCoy", "Dr. Michaela Quinn", "Dr. Jack Shephard", "Dr. Perry Cox", "Dr. Julius Hibbert", "Dr. Nick Riviera", "Dr. Hannibal Lecter", "Dr. Albert Robbins", "Dr. Beverly Crusher", "Dr. Allison Cameron", "Dr. Robert Chase"]
    specs = ["Diagnostics", "General Surgery", "Internal Medicine", "Neurosurgery", "Cardiothoracic Surgery", "Family Medicine", "Spinal Surgery", "Internal Medicine", "Family Medicine", "Dermatology", "Psychiatry", "Pathology", "General Medicine", "Immunology", "Intensive Care"]
    for i in range(1, 16):
        phone = f"310{random.randint(1000000, 9999999)}"
        email = f"dr.{doctors[i-1].split()[-1].lower()}@hospital.com"
        sql += f"INSERT INTO Doctor (Hospital_ID, Doctor_Name, Specilization, Phone, Email, Password) VALUES ({random.randint(1,15)}, '{doctors[i-1]}', '{specs[i-1]}', '{phone}', '{email}', 'drpass{i}');\n"

    # 10. Staff
    sql += "\n-- Staff\n"
    staffs = ["Alice Green", "Bob Black", "Charlie Brown", "Diana White", "Eva Blue", "Frank Red", "Grace Yellow", "Henry Silver", "Ivy Gold", "Jack Bronze", "Karen Copper", "Liam Iron", "Mia Steel", "Noah Lead", "Olivia Zinc"]
    roles = ["Nurse", "Receptionist", "Janitor", "Technician", "Admin"]
    for i in range(1, 16):
        phone = f"415{random.randint(1000000, 9999999)}"
        email = f"{staffs[i-1].split()[0].lower()}@staff.com"
        sql += f"INSERT INTO Staff (Hospital_ID, Staff_Name, Role, Phone, Email, Password) VALUES ({random.randint(1,15)}, '{staffs[i-1]}', '{random.choice(roles)}', '{phone}', '{email}', 'stfpass{i}');\n"

    # 11. Treatment & 12. Doctor_Treatment
    sql += "\n-- Treatment and Doctor_Treatment\n"
    for i in range(1, 16):
        sql += f"INSERT INTO Treatment (Record_ID, Treatment_Date) VALUES ({i}, '2026-03-{random.randint(10,25)}');\n"
        sql += f"INSERT INTO Doctor_Treatment (Treatment_ID, Doctor_ID) VALUES ({i}, {random.randint(1,15)});\n"

    # 13. Medicine & 14. Medicine_Content
    sql += "\n-- Medicine and Medicine_Content\n"
    meds = ["Lisinopril", "Levothyroxine", "Atorvastatin", "Metformin", "Amlodipine", "Metoprolol", "Omeprazole", "Simvastatin", "Losartan", "Albuterol", "Gabapentin", "Hydrochlorothiazide", "Sertraline", "Fluticasone", "Montelukast"]
    contents = ["ACE inhibitor", "Thyroid hormone", "HMG-CoA reductase inhibitor", "Biguanide", "Calcium channel blocker", "Beta blocker", "Proton pump inhibitor", "HMG-CoA reductase inhibitor", "Receptor blocker", "Bronchodilator", "Anticonvulsant", "Diuretic", "SSRI", "Corticosteroid", "Leukotriene receptor antagonist"]
    for i in range(1, 16):
        price = round(random.uniform(5.0, 150.0), 2)
        sql += f"INSERT INTO Medicine (Medicine_Name, Description, Category, Unit_Price, Manufacturer) VALUES ('{meds[i-1]}', 'Used to treat various conditions', 'Prescription', {price}, 'PharmaCorp {i}');\n"
        sql += f"INSERT INTO Medicine_Content (Medicine_ID, Content_Name) VALUES ({i}, '{contents[i-1]}');\n"

    # 15. Medicine_Stock
    sql += "\n-- Medicine_Stock\n"
    for i in range(1, 16):
        sql += f"INSERT INTO Medicine_Stock (Hospital_ID, Medicine_ID, Quantity) VALUES ({random.randint(1,15)}, {random.randint(1,15)}, {random.randint(50, 500)});\n"

    # 16. Emergency_Request
    sql += "\n-- Emergency_Request\n"
    req_types = ["Heart Attack", "Car Accident", "Stroke", "Fire Injury", "Severe Fall"]
    for i in range(1, 16):
        sql += f"INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES ({i}, {random.randint(1,15)}, '{random.choice(req_types)}', {random.randint(3,5)}, 'Pending');\n"

    # 17. Dispatch & 18. Dispatch_Ambulance & 19. Dispatch_Doctor
    sql += "\n-- Dispatch, Dispatch_Ambulance, Dispatch_Doctor\n"
    statuses = ["Dispatched", "Arrived", "Completed"]
    for i in range(1, 16):
        sql += f"INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES ({i}, '{random.choice(statuses)}');\n"
        sql += f"INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES ({i}, {random.randint(1,15)});\n"
        sql += f"INSERT INTO Dispatch_Doctor (Dispatch_ID, Doctor_ID) VALUES ({i}, {random.randint(1,15)});\n"

    # 20. Billing
    sql += "\n-- Billing\n"
    b_statuses = ["Pending", "Paid", "Cancelled"]
    for i in range(1, 16):
        amt = round(random.uniform(100.0, 5000.0), 2)
        sql += f"INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES ({i}, {random.randint(1,15)}, {amt}, '{random.choice(b_statuses)}');\n"

    # 21. Prescription
    sql += "\n-- Prescription\n"
    for i in range(1, 16):
        sql += f"INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES ({i}, {random.randint(1,15)}, {random.randint(1,5)});\n"

    with open('/Users/dhrubajitchakravarty/Documents/Project/HospitalManagementSystem/db/setup_db.sql', 'w') as f:
        f.write(sql)

if __name__ == "__main__":
    generate_sql()
