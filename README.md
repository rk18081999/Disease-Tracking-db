# 🏥 Disease Tracking Database System

A comprehensive structured data management project aimed at designing and implementing a disease tracking and healthcare database using SQL, dimensional modeling, NoSQL alternatives, and cloud architecture.

## 📌 Project Overview

The healthcare industry faces significant challenges in managing, tracing, and analyzing disease data. This project proposes a relational database model that captures critical entities like patients, diseases, diagnoses, treatments, medications, lab tests, and healthcare providers. Additionally, we explore dimensional modeling for analytics, NoSQL adaptations using MongoDB and Neo4j, and deployment using AWS architecture.

## 🧠 Key Features

- **Relational Schema Design:** Normalized schema with defined primary and foreign keys.
- **Dimensional Modeling:** Star schema for analytical queries using fact and dimension tables.
- **SQL Implementation:** Complete DDL and DML SQL scripts for schema and sample data.
- **NoSQL Modeling:** MongoDB and Neo4j design strategies with sample JSON insertions.
- **Cloud Deployment:** Scalable AWS-based Lambda Architecture using S3, Lambda, Kinesis, Redshift, RDS.
- **Data Retrieval:** Indexed queries for efficient diagnosis and treatment lookup.
- **Security Considerations:** IAM roles, VPC, encryption, and audit compliance on AWS.

## 🗂️ Entity-Relationship Schema

Entities:
- `Disease`
- `Patient`
- `Diagnosis`
- `Treatment`
- `Healthcare_Provider`
- `Visit`
- `Medication`
- `Lab_Test`

Relationships include one-to-many, many-to-many (via junction tables), and embedded documents for NoSQL.

## 💾 Technologies Used

- **Languages:** SQL, Python, MongoDB Query Language (JSON)
- **Database:** PostgreSQL, MongoDB, Neo4j
- **Cloud Services:** AWS EC2, RDS, S3, Lambda, Redshift, Kinesis, IAM, CloudWatch
- **Data Modeling:** Dimensional Modeling, ER Modeling
- **NoSQL Alternatives:** Document Store (MongoDB), Graph DB (Neo4j)

## 🧪 Sample SQL Snippets

```sql
CREATE TABLE Disease (
    Disease_ID SERIAL PRIMARY KEY,
    Disease_Name VARCHAR(100),
    Type VARCHAR(50),
    Severity VARCHAR(50),
    Symptoms TEXT,
    Description TEXT
);
```

```sql
INSERT INTO Patient (Name, Date_of_Birth, Gender, Contact, Address, Medical_History)
VALUES ('John Doe', '1985-05-10', 'Male', '1234567890', '123 Main St', 'No significant history');
```

## 🌐 AWS Architecture Highlights

- **Batch Layer:** AWS Glue & S3 for ETL and raw data archiving
- **Speed Layer:** AWS Kinesis + Lambda for real-time analytics
- **Serving Layer:** Redshift for OLAP queries, dashboards
- **Monitoring:** CloudWatch & IAM for security, alerts, and observability

## 📊 Dimensional Model

Fact Table:
- `Visit_Fact`: Tracks patient visits and linked provider IDs

Dimension Tables:
- `Patient_Dimension`
- `Disease_Dimension`
- `Diagnosis_Dimension`
- `Treatment_Dimension`
- `Healthcare_Provider_Dimension`
- `Medication_Dimension`
- `Lab_Test_Dimension`

## 📁 Repository Structure

```
📦Disease-Tracking-DB
 ┣ 📄 README.md
 ┣ 📄 disease_schema.sql
 ┣ 📄 sample_data.sql
 ┣ 📄 mongo_nosql_model.json
 ┣ 📄 aws_architecture.md
 ┗ 📄 ER_Diagram.png
```

## 👨‍💻 Authors

- Mahanth Dasari  
- Chundu Deepak Choudary  
- Rahul Kanth Panganamamula

---

## 📬 Contact

If you'd like to connect or discuss further:
- 💼 [LinkedIn – Rahul Kanth P.](https://www.linkedin.com/in/rahulkanth/)
- 📧 rahulkanth.inspire@gmail.com
