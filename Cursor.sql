
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Color VARCHAR(20)
);

INSERT INTO Vehicle (VehicleID, Make, Model, Year, Color)
VALUES
    (1, 'Toyota', 'Camry', 2018, 'Red'),
    (2, 'Honda', 'Civic', 2020, 'Blue'),
    (3, 'Ford', 'Fusion', 2019, 'Black'),
    (4, 'Chevrolet', 'Malibu', 2021, 'Silver');

DECLARE @VehicleID INT;
DECLARE @Make VARCHAR(50);
DECLARE @Model VARCHAR(50);
DECLARE @Year INT;
DECLARE @Color VARCHAR(20);

-- Declare the cursor
DECLARE vehicleCursor CURSOR FOR
SELECT VehicleID, Make, Model, Year, Color
FROM Vehicle;

-- Open the cursor
OPEN vehicleCursor;

-- Fetch the first row from the cursor into variables
FETCH NEXT FROM vehicleCursor INTO @VehicleID, @Make, @Model, @Year, @Color;

-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Output or process the current row
    PRINT 'Vehicle ID: ' + CAST(@VehicleID AS VARCHAR(10)) +
          ', Make: ' + @Make +
          ', Model: ' + @Model +
          ', Year: ' + CAST(@Year AS VARCHAR(10)) +
          ', Color: ' + @Color;

    -- Fetch the next row from the cursor into variables
    FETCH NEXT FROM vehicleCursor INTO @VehicleID, @Make, @Model, @Year, @Color;
END

-- Close the cursor
CLOSE vehicleCursor;

-- Deallocate the cursor
DEALLOCATE vehicleCursor;
