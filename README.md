Student Web Portal: Yuvi’s Edition 💻👑

A modern and enhanced college portal website, designed and developed to provide students, teachers, and administrators with seamless access to academic resources and management tools.

Overview

This project is a full-stack web application that improves the usability and functionality of a typical college portal. Unlike conventional portals, this version offers:

Dedicated logins for students, teachers, and admins.

User-friendly interface for academic and administrative tasks.

Interactive dashboard with quick access to relevant resources.

Responsive design that works across devices.

Technologies Used

The project is built using the following technologies:

Frontend:

HTML5 & CSS3

JavaScript

JSP (JavaServer Pages)

Backend:

Java Servlets

Database:

MySQL / any relational database supported by Java JDBC

Deployment:

Local server (Apache Tomcat, or any Java servlet container)

Features

Student login to access personalized course information, attendance, and grades.

Teacher login to manage courses, assignments, and student performance.

Admin login for managing users and maintaining the portal database.

Secure session management using Java servlets.

Folder Structure
student-web-portal/
│
├── src/                  # Java source files (Servlets, utilities)
├── WebContent/           # JSP files, HTML templates, CSS, images
├── WEB-INF/              # Deployment descriptor (web.xml), libraries
├── README.md             # Project overview
└── database/             # Optional SQL scripts for initial setup

How to Run Locally

Install Java JDK and Apache Tomcat.

Clone the repository:

git clone https://github.com/YOUR_USERNAME/student-web-portal.git


Import the project into NetBeans or Eclipse as a Web Application.

Configure your database connection in the servlets or utility classes.

Build and deploy on Tomcat server.

Access the portal at:

http://localhost:8080/student-web-portal/
