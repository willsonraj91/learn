-- Joins

-- Create the first table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT
);

-- Create the second table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);


-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(1, 'John', 'Doe', 10),
(2, 'Jane', 'Smith', 20),
(3, 'Jim', 'Brown', 10),
(4, 'Jake', 'White', NULL);

-- Insert data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(10, 'HR'),
(20, 'Engineering'),
(30, 'Finance');

--INNER JOIN

SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--LEFT JOIN

SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--RIGHT JOIN

SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--Full OUTER JOIN

SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;



--User-Defined Table

CREATE TYPE EmployeeType AS TABLE (
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT
);

-- User-Defined Table Type in a Stored Procedure

CREATE PROCEDURE GetEmployeesInDepartments
    @Employees EmployeeType READONLY
AS
BEGIN
    SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
    FROM @Employees e
    LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;
END


--Execute the Stored Procedure

-- Declare a variable of the user-defined table type
DECLARE @EmployeeTable EmployeeType;

-- Insert data into the table variable
INSERT INTO @EmployeeTable (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(1, 'John', 'Doe', 10),
(2, 'Jane', 'Smith', 20),
(3, 'Jim', 'Brown', 10),
(4, 'Jake', 'White', NULL);

-- Execute the stored procedure with the table variable
EXEC GetEmployeesInDepartments @Employees = @EmployeeTable;

