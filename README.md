# Tax Filer Management System

A web-based application for managing tax filer records using JSP, Servlets, and JDBC Template.

## Features

- View all tax filer records
- Add new tax filer records
- Update existing tax filer records
- Delete tax filer records

## Technologies Used

- Java Servlets
- JSP (JavaServer Pages)
- JDBC Template
- MySQL Database
- Bootstrap for responsive UI

## Project Structure

```
tax-filer-management/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── taxfiling/
│       │           ├── config/
│       │           │   └── DBConfig.java
│       │           ├── controller/
│       │           │   └── TaxFilerServlet.java
│       │           ├── dao/
│       │           │   └── TaxFilerDAO.java
│       │           └── model/
│       │               └── TaxFiler.java
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── view-filers.jsp
│           │   ├── update-filer.jsp
│           │   └── web.xml
│           ├── add-filer.jsp
│           └── index.jsp
└── database_setup.sql
```

## Setup Instructions

### 1. Database Setup

1. Install MySQL if you haven't already
2. Run the `database_setup.sql` script to create the database and sample data:
   ```
   mysql -u root -p < database_setup.sql
   ```

### 2. Project Setup

1. Import the project into Eclipse or your preferred IDE
2. Configure the project as a Dynamic Web Project
3. Add the required libraries to your project:
   - MySQL Connector JAR
   - Spring JDBC JAR
   - Servlet API JAR
4. Update the database connection details in `DBConfig.java` if needed

### 3. Run the Application

1. Deploy the application to a servlet container like Tomcat
2. Access the application at `http://localhost:8080/tax-filer-management/`

## Application Workflow

1. **Homepage**: Navigate to view all tax filers or add a new filer
2. **View Tax Filers**: See all tax filers in a table with options to edit or delete
3. **Add New Filer**: Fill out the form to add a new tax filer to the system
4. **Update Filer**: Modify existing tax filer information 
5. **Delete Filer**: Remove a tax filer from the system

## Database Schema

The application uses a single table named `TaxFilers` with the following structure:

- `FilerID`: INT (Primary Key, Auto Increment)
- `Name`: VARCHAR(100)
- `Contact`: VARCHAR(100)
- `AnnualIncome`: DECIMAL(12,2)
- `Expenses`: DECIMAL(12,2)
- `TaxYear`: INT