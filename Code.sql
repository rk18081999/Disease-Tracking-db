
-- RELATIONAL SCHEMA CREATION

-- Disease Table
CREATE TABLE Disease (
    Disease_ID SERIAL PRIMARY KEY,
    Disease_Name VARCHAR(100),
    Type VARCHAR(50),
    Severity VARCHAR(50),
    Symptoms TEXT,
    Description TEXT
);

-- Patient Table
CREATE TABLE Patient (
    Patient_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Date_of_Birth DATE,
    Gender VARCHAR(10),
    Contact VARCHAR(20),
    Address VARCHAR(200),
    Medical_History TEXT
);

-- Diagnosis Table
CREATE TABLE Diagnosis (
    Diagnosis_ID SERIAL PRIMARY KEY,
    Patient_ID INTEGER REFERENCES Patient(Patient_ID),
    Disease_ID INTEGER REFERENCES Disease(Disease_ID),
    Date_of_Diagnosis DATE
);

-- Treatment Table
CREATE TABLE Treatment (
    Treatment_ID SERIAL PRIMARY KEY,
    Disease_ID INTEGER REFERENCES Disease(Disease_ID),
    Treatment_Name VARCHAR(100),
    Treatment_Method VARCHAR(100),
    Side_Effects TEXT
);

-- Healthcare_Provider Table
CREATE TABLE Healthcare_Provider (
    Provider_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    Contact VARCHAR(20),
    Address VARCHAR(200)
);

-- Visit Table
CREATE TABLE Visit (
    Visit_ID SERIAL PRIMARY KEY,
    Patient_ID INTEGER REFERENCES Patient(Patient_ID),
    Provider_ID INTEGER REFERENCES Healthcare_Provider(Provider_ID),
    Date_of_Visit DATE,
    Purpose_of_Visit TEXT
);

-- Medication Table
CREATE TABLE Medication (
    Medication_ID SERIAL PRIMARY KEY,
    Treatment_ID INTEGER REFERENCES Treatment(Treatment_ID),
    Medication_Name VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50)
);

-- Lab_Test Table
CREATE TABLE Lab_Test (
    Test_ID SERIAL PRIMARY KEY,
    Disease_ID INTEGER REFERENCES Disease(Disease_ID),
    Test_Name VARCHAR(100),
    Test_Results TEXT,
    Normal_Range TEXT
);

-- DIMENSIONAL SCHEMA CREATION

-- Dimension and Fact Tables
CREATE TABLE Patient_Dimension (
    Patient_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Date_of_Birth DATE,
    Gender VARCHAR(10),
    Contact VARCHAR(20),
    Address VARCHAR(200),
    Medical_History TEXT
);

CREATE TABLE Disease_Dimension (
    Disease_ID SERIAL PRIMARY KEY,
    Disease_Name VARCHAR(100),
    Type VARCHAR(50),
    Severity VARCHAR(50),
    Symptoms TEXT,
    Description TEXT
);

CREATE TABLE Diagnosis_Dimension (
    Diagnosis_ID SERIAL PRIMARY KEY,
    Patient_ID INTEGER REFERENCES Patient_Dimension(Patient_ID),
    Disease_ID INTEGER REFERENCES Disease_Dimension(Disease_ID),
    Date_of_Diagnosis DATE
);

CREATE TABLE Treatment_Dimension (
    Treatment_ID SERIAL PRIMARY KEY,
    Disease_ID INTEGER REFERENCES Disease_Dimension(Disease_ID),
    Treatment_Name VARCHAR(100),
    Treatment_Method VARCHAR(100),
    Side_Effects TEXT
);

CREATE TABLE Healthcare_Provider_Dimension (
    Provider_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    Contact VARCHAR(20),
    Address VARCHAR(200)
);

CREATE TABLE Medication_Dimension (
    Medication_ID SERIAL PRIMARY KEY,
    Treatment_ID INTEGER REFERENCES Treatment_Dimension(Treatment_ID),
    Medication_Name VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50)
);

CREATE TABLE Lab_Test_Dimension (
    Test_ID SERIAL PRIMARY KEY,
    Disease_ID INTEGER REFERENCES Disease_Dimension(Disease_ID),
    Test_Name VARCHAR(100),
    Test_Results TEXT,
    Normal_Range TEXT
);

CREATE TABLE Visit_Fact (
    Visit_ID SERIAL PRIMARY KEY,
    Patient_ID INTEGER REFERENCES Patient_Dimension(Patient_ID),
    Provider_ID INTEGER REFERENCES Healthcare_Provider_Dimension(Provider_ID),
    Date_of_Visit DATE,
    Purpose_of_Visit TEXT
);

-- MongoDB Insert Example (JSON)
-- For NoSQL insertion logic, typically run via mongo shell or drivers

// MongoDB Insert
db.patients.insertMany([
  {
    _id: ObjectId(),
    name: "John Doe",
    date_of_birth: new Date('1985-05-10'),
    gender: "Male",
    contact: "1234567890",
    address: "123 Main St, City",
    medical_history: "No significant medical history.",
    diagnoses: [
      {
        disease: {
          _id: ObjectId(),
          name: "Influenza",
          type: "Viral",
          severity: "Moderate",
          symptoms: "Fever, cough, sore throat",
          description: "A common viral infection."
        },
        date_of_diagnosis: new Date('2022-01-15')
      }
    ],
    visits: [
      {
        provider: {
          _id: ObjectId(),
          name: "Dr. Smith",
          specialty: "Internal Medicine",
          contact: "5551112222",
          address: "789 Oak St, City"
        },
        date_of_visit: new Date('2022-02-01'),
        purpose_of_visit: "Follow-up appointment"
      }
    ]
  }
]);

