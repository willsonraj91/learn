
CREATE TRIGGER AfterVehicleInsert
ON Vehicle
AFTER INSERT
AS
BEGIN
    DECLARE @Make VARCHAR(50);
    DECLARE @Model VARCHAR(50);
    DECLARE @Year INT;
    DECLARE @Color VARCHAR(20);

    -- Get the details of the newly inserted vehicle
    SELECT @Make = Make,
           @Model = Model,
           @Year = Year,
           @Color = Color
    FROM inserted;

    -- Print a message indicating that a new vehicle has been added
    PRINT 'A new vehicle has been added:';
    PRINT 'Make: ' + @Make +
          ', Model: ' + @Model +
          ', Year: ' + CAST(@Year AS VARCHAR(10)) +
          ', Color: ' + @Color;
END;
