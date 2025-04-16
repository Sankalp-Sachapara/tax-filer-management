-- Create the database
CREATE DATABASE IF NOT EXISTS FilersRecord;
USE FilersRecord;

-- Create the TaxFilers table
CREATE TABLE IF NOT EXISTS TaxFilers (
    FilerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(100) NOT NULL,
    AnnualIncome DECIMAL(12, 2) NOT NULL,
    Expenses DECIMAL(12, 2) NOT NULL,
    TaxYear INT NOT NULL
);

-- Insert sample data
INSERT INTO TaxFilers (Name, Contact, AnnualIncome, Expenses, TaxYear) VALUES
('John Smith', 'john.smith@email.com', 75000.00, 25000.00, 2024),
('Sarah Johnson', '555-123-4567', 92000.00, 32500.00, 2024),
('Michael Williams', 'michael.w@example.com', 62500.00, 18750.00, 2024),
('Jessica Brown', '555-987-6543', 120000.00, 45000.00, 2024),
('David Miller', 'david.miller@company.com', 85000.00, 30000.00, 2023),
('Emily Davis', '555-456-7890', 68000.00, 22750.00, 2023);

-- Display the inserted records
SELECT * FROM TaxFilers;