--CONSTRAINS:


--NOT NULL Constraint:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT
);

--UNIQUE Constraint: 

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) UNIQUE,
    Price DECIMAL(10, 2)
);

--PRIMARY KEY Constraint:

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

--FOREIGN KEY Constraint: 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--CHECK Constraint: 

CREATE TABLE Employee1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    CONSTRAINT CHK_Age CHECK (Age >= 18)
);

--DEFAULT Constraint:

CREATE TABLE Order1 (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT DEFAULT 1
);


-------------------------------------------------

--VIEWS


-- Create StudentDetails table

CREATE TABLE StudentDetails (
    S_ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    ADDRESS VARCHAR(255)
);

INSERT INTO StudentDetails (S_ID, NAME, ADDRESS)
VALUES
    (1, 'Harsh', 'Kolkata'),
    (2, 'Ashish', 'Durgapur'),
    (3, 'Pratik', 'Delhi'),
    (4, 'Dhanraj', 'Bihar'),
    (5, 'Ram', 'Rajasthan');


-- Create StudentMarks table

CREATE TABLE StudentMarks (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    Marks INT,
    Age INT
);

INSERT INTO StudentMarks (ID, NAME, Marks, Age)
VALUES
    (1, 'Harsh', 90, 19),
    (2, 'Suresh', 50, 20),
    (3, 'Pratik', 80, 19),
    (4, 'Dhanraj', 95, 21),
    (5, 'Ram', 85, 18);


	--CREATE VIEWS in SQL:

--	CREATE VIEW view_name AS
--SELECT column1, column2.....
--FROM table_name
--WHERE condition;



--Creating View from a single table

CREATE VIEW DetailsView AS
SELECT NAME, ADDRESS
FROM StudentDetails
WHERE S_ID < 5;

SELECT * FROM DetailsView;



--Creating View from multiple tables

CREATE VIEW MarksView AS
SELECT StudentDetails.NAME, StudentDetails.ADDRESS, StudentMarks.MARKS
FROM StudentDetails, StudentMarks
WHERE StudentDetails.NAME = StudentMarks.NAME;

SELECT * FROM MarksView;


--DELETE VIEWS in SQL
DROP VIEW view_name;

---------------------------------------------------------------------------

--INDEXING

-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Employee (EmployeeID, FirstName, LastName, Department, Salary)
VALUES 
    (1, 'John', 'Doe', 'IT', 50000.00),
    (2, 'Jane', 'Smith', 'HR', 55000.00),
    (3, 'Alice', 'Johnson', 'IT', 60000.00),
    (4, 'Bob', 'Williams', 'Finance', 65000.00);

-- Create an index on the Department column
CREATE INDEX idx_Department ON Employee(Department);

-- Create a clustered index on the EmployeeID column
CREATE CLUSTERED INDEX idx_EmployeeID ON Employee(EmployeeID);








