USE [RestaurantReservationProject]
GO

CREATE FUNCTION fn_CalculateEmployeeSalary (@employeeId INT)
RETURNS INT
AS
BEGIN
    DECLARE @baseSalary INT;
    DECLARE @position INT;

    SELECT @baseSalary = SUM([TotalAmount])
    FROM [dbo].[Orders]
    WHERE [EmployeeId] = @employeeId

    SELECT @position =
        CASE Position
            WHEN 'VIPOrdersWaiter' THEN 5
            WHEN 'StandardWaiter'  THEN 4
            WHEN 'AssistantWaiter' THEN 3
            ELSE 0
        END
    FROM dbo.Employees
    WHERE EmployeeId = @employeeId;
    
    RETURN ISNULL(@baseSalary * @position, 0);
END
GO