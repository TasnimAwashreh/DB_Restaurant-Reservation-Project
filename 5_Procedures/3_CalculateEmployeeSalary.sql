USE [RestaurantReservationProject]
GO

CREATE OR ALTER FUNCTION fn_CalculateEmployeeSalary (@employeeId INT)
RETURNS INT
AS
BEGIN
    DECLARE @salary INT;
    DECLARE @position INT;

    SELECT 
        @salary =
            (
                CASE e.Position
                    WHEN 'VIPOrdersWaiter' THEN 5
                    WHEN 'StandardWaiter'  THEN 4
                    WHEN 'AssistantWaiter' THEN 3
                    ELSE 0
                END
                *SUM([TotalAmount])
            )
    FROM dbo.Employees AS e
    JOIN Orders as o
    ON o.EmployeeId = e.EmployeeId
    WHERE e.EmployeeId = @employeeId
    GROUP BY e.Position;
    
    RETURN ISNULL(@salary, 0);
END
GO