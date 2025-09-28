USE [RestaurantReservationProject]
GO

CREATE PROCEDURE ListMenuItemsByReservation
    @ReservationId INT
AS
BEGIN

SELECT [ReservationId],
       mi.Name
FROM [dbo].[Orders] AS o
JOIN OrderItems oi
    ON o.OrderId = oi.OrderId
JOIN MenuItems mi
    ON oi.ItemId = mi.ItemId
WHERE o.ReservationId = @ReservationId;
END
GO