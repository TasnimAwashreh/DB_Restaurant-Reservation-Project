USE [RestaurantReservationProject]
GO

CREATE PROCEDURE AddNewOrder
    @reservationId INT,
    @employeeId INT,
    @orderDate DATETIME,
    @totalAmount INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT [EmployeeId] 
        FROM Employees 
        WHERE EmployeeId = @employeeId
    )
    BEGIN
        RAISERROR('This employee does not exist. Please choose another', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (
        SELECT [ReservationId] 
        FROM Reservations 
        WHERE ReservationId = @reservationId
    )
    BEGIN
        RAISERROR('This reservation does not exist. Please choose another', 16, 2);
        RETURN;
    END

    INSERT INTO [dbo].[Orders]
               ([ReservationId]
               ,[EmployeeId]
               ,[OrderDate]
               ,[TotalAmount])
         VALUES
               (@reservationId, @employeeId, @orderDate, @totalAmount);
    SELECT SCOPE_IDENTITY() AS NewBorrowerID;
END
GO

