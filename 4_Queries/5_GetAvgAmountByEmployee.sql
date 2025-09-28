USE [RestaurantReservationProject]
GO

CREATE PROCEDURE GetAvgOrderAmountByEmployee
    @EmployeeId INT
AS
BEGIN

SELECT o.EmployeeId, AVG(oi.Quantity * mi.Price) AS AverageAmount
FROM [dbo].[Orders] AS o
JOIN OrderItems oi
    ON o.OrderId = oi.OrderId
JOIN MenuItems mi
    ON oi.ItemId = mi.ItemId
WHERE o.EmployeeId = @EmployeeId
GROUP BY o.EmployeeId;

END
GO
