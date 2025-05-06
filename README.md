
---

# **Hospital Management System**

**A Java-based Hospital Management System built using JSP, Servlets, MySQL, and JDBC.**
This project helps hospitals manage patients, doctors, appointments, and users with a role-based system.

---

## ✨ **Features**

### 👥 **User Roles**

* **Admin**

  * Login
  * Add / Edit / View Doctors
  * View Patients
  * View Appointments

* **Doctor**

  * Login
  * View Patients
  * View Appointments

* **User (Patient)**

  * Login / Sign Up
  * Book Appointments
  * View Appointments

---

## 🛠️ **Technologies Used**

* **Frontend:** JSP, Servlets, Bootstrap
* **Backend:** Java, JDBC
* **Database:** MySQL
* **Build Tool:** Apache Maven
* **IDE:** Eclipse

---

## 📦 **Installation**

### 1. Clone the Repository

To clone the repository, run the following command in your terminal:

```bash
git clone https://github.com/harshavardhan-upputuri/Hospital-Management-System.git
```

### 2. Open the Project in Eclipse

* Open Eclipse IDE and select `File` -> `Import`.
* Choose `Maven` -> `Existing Maven Projects`.
* Select the project directory and click `Finish`.

### 3. Setup MySQL Database

1. **Create Database:**

   ```sql
   CREATE DATABASE hospital_db;
   ```

2. **Create Tables:**
   Run the following SQL queries to create the necessary tables.

   ```sql
   -- Create the 'user_dtls' table to store user details
   CREATE TABLE `user_dtls` (
     `id` int NOT NULL AUTO_INCREMENT,
     `full_name` varchar(45) DEFAULT NULL,
     `email` varchar(45) DEFAULT NULL,
     `password` varchar(45) DEFAULT NULL,
     PRIMARY KEY (`id`)
   ) 

   -- Create the 'doctor' table to store doctor details
   CREATE TABLE `doctor` (
     `id` int NOT NULL AUTO_INCREMENT,
     `full_name` varchar(45) NOT NULL,
     `dob` varchar(45) NOT NULL,
     `qualification` varchar(45) NOT NULL,
     `specialist` varchar(45) NOT NULL,
     `email` varchar(45) NOT NULL,
     `mobno` varchar(45) NOT NULL,
     `password` varchar(45) NOT NULL,
     PRIMARY KEY (`id`)
   ) 

   -- Create the 'specialist' table to store doctor specialties
   CREATE TABLE `specialist` (
     `id` int NOT NULL AUTO_INCREMENT,
     `spec_name` varchar(45) NOT NULL,
     PRIMARY KEY (`id`)
   ) 

   -- Create the 'appointment' table to store patient appointment details
   CREATE TABLE `appointment` (
     `id` int NOT NULL AUTO_INCREMENT,
     `user_id` int NOT NULL,
     `fullname` varchar(45) NOT NULL,
     `gender` varchar(45) NOT NULL,
     `age` varchar(45) NOT NULL,
     `appoint_date` varchar(45) NOT NULL,
     `email` varchar(45) NOT NULL,
     `phno` varchar(45) NOT NULL,
     `diseases` varchar(45) NOT NULL,
     `doctor_id` int NOT NULL,
     `address` varchar(500) NOT NULL,
     `status` varchar(500) NOT NULL,
     PRIMARY KEY (`id`),
     KEY `uid_idx` (`user_id`),
     KEY `did_idx` (`doctor_id`),
     CONSTRAINT `did` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT `uid` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
   ) 
   ```

3. **Update Your Database Connection in the Code:**
   In your project, open the database connection code and update the connection string:

   ```java
   String url = "jdbc:mysql://localhost:3306/hospital_db";
   String user = "root";  // Your MySQL username
   String password = "your_mysql_password";  // Your MySQL password
   ```

### 4. Run the Project

* Right-click the project in Eclipse.
* Select `Run on Server` to deploy it to a local server (Tomcat 11.0 or another server).
* Access the application in your browser:

  ```url
  http://localhost:8080/Hospital-Management-System/
  ```

---

## 📊 **Database Schema**

The following tables are created in the **hospital\_db** database:

1. **user\_dtls**: Stores user details (patients).
2. **doctor**: Stores doctor details.
3. **specialist**: Stores doctor specialties.
4. **appointment**: Stores appointment details between users (patients) and doctors.

---



## 🛠 **Contribute to the Project**

To contribute to this project, follow these steps:

1. Fork the repository.
2. Clone your fork:

   ```bash
   git clone https://github.com/your_username/Hospital-Management-System.git
   ```
3. Create a new branch:

   ```bash
   git checkout -b feature-branch
   ```
4. Make your changes and commit them:

   ```bash
   git add .
   git commit -m "Describe your changes"
   ```
5. Push to your fork:

   ```bash
   git push origin feature-branch
   ```
6. Submit a pull request.

---

## 🎯 **Future Enhancements**

* Implement an advanced doctor-patient matching system.
* Add patient feedback and reviews for doctors.
* Integrate a notification system for upcoming appointments.
* Enable multi-hospital management for scalability.

---


