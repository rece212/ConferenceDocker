USE master;
GO

-- Create the Conference database only if it does not already exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Conference')
BEGIN
    CREATE DATABASE Conference;
END
GO

-- Switch to the Conference database
USE Conference;
GO

-- Create Attendees table
CREATE TABLE Attendees (
    AttendeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);
GO
-- Create Sessions table
CREATE TABLE Sessions (
    SessionID INT PRIMARY KEY IDENTITY(101,1),
    SessionTitle VARCHAR(100) NOT NULL,
    SessionDateTime DATETIME NOT NULL,
    Speaker VARCHAR(50)
);
GO

-- Create Registrations table
CREATE TABLE Registrations (
    RegistrationID INT PRIMARY KEY IDENTITY(1,1),
    AttendeeID INT NOT NULL,
    SessionID INT NOT NULL,
    RegistrationDate DATE NOT NULL,
    FOREIGN KEY (AttendeeID) REFERENCES Attendees(AttendeeID),
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID)
);
GO

-- Insert data into Attendees table
INSERT INTO Attendees (FirstName, LastName, Email)
VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Emily', 'Jones', 'emily.jones@example.com');
GO

-- Insert data into Sessions table
INSERT INTO Sessions (SessionTitle, SessionDateTime, Speaker)
VALUES 
('Introduction to C#', '2025-04-01 09:00:00', 'Dr. Alan Turing'),
('Advanced SQL Queries', '2025-04-01 11:00:00', 'Prof. Grace Hopper'),
('IoT: The Future of Tech', '2025-04-01 14:00:00', 'Mr. Elon Mask');
GO
-- Insert data into Registrations table
INSERT INTO Registrations (AttendeeID, SessionID, RegistrationDate)
VALUES 
(1, 101, '2025-03-15'),
(2, 102, '2025-03-20'),
(3, 103, '2025-03-25');
GO 