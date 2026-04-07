# Hospital Management System: ER Diagram

This document provides a comprehensive Entity-Relationship (ER) representation of the backend MySQL database schema! You can embed this or show this diagram directly to demonstrate your schema planning (CO4 Requirement).

```mermaid
erDiagram
    HOSPITAL {
        int Hospital_ID PK
        string Hospital_Name
        string Address
    }
    PATIENT {
        int Patient_ID PK
        string Patient_Name
        string Gender
        string Blood_Group
    }
    DOCTOR {
        int Doctor_ID PK
        int Hospital_ID FK
        string Doctor_Name
        string Specilization
    }
    STAFF {
        int Staff_ID PK
        int Hospital_ID FK
        string Staff_Name
        string Role
    }
    AMBULANCE {
        int Ambulance_ID PK
        int Hospital_ID FK
        string Vehicle_Number
        string Status
    }
    MEDICAL_RECORD {
        int Record_ID PK
        int Patient_ID FK
        int Hospital_ID FK
        string Diagnosis
        string Treatment
    }
    TREATMENT {
        int Treatment_ID PK
        int Doctor_ID FK
        int Patient_ID FK
        int Record_ID FK
        date Treatment_Date
    }
    MEDICINE {
        int Medicine_ID PK
        string Medicine_Name
        decimal Unit_Price
    }
    PRESCRIPTION {
        int Prescription_ID PK
        int Treatment_ID FK
        int Medicine_ID FK
        int Quantity
    }
    EMERGENCY_REQUEST {
        int Request_ID PK
        int Patient_ID FK
        int Hospital_ID FK
        string Req_Status
    }
    DISPATCH {
        int Dispatch_ID PK
        int Request_ID FK
        int Ambulance_ID FK
    }
    BILLING {
        int Bill_ID PK
        int Patient_ID FK
        decimal Amount
        string Status
    }
    BLOODBANK {
        int Bloodbank_ID PK
        int Hospital_ID FK
        string BB_Name
    }
    BLOODINVENTORY {
        int Inventory_ID PK
        int Bloodbank_ID FK
        string Blood_Type
        int Units_Available
    }

    HOSPITAL ||--o{ DOCTOR : employs
    HOSPITAL ||--o{ STAFF : employs
    HOSPITAL ||--o{ AMBULANCE : owns
    HOSPITAL ||--o{ BLOODBANK : hosts

    PATIENT ||--o{ MEDICAL_RECORD : has
    PATIENT ||--o{ EMERGENCY_REQUEST : raises
    PATIENT ||--o{ BILLING : pays

    DOCTOR ||--o{ TREATMENT : conducts

    MEDICAL_RECORD ||--o{ TREATMENT : results_in
    TREATMENT ||--o{ PRESCRIPTION : issues
    
    MEDICINE ||--o{ PRESCRIPTION : dictates
    
    EMERGENCY_REQUEST ||--o| DISPATCH : causes
    AMBULANCE ||--o{ DISPATCH : executes
    
    BLOODBANK ||--o{ BLOODINVENTORY : stores
```
