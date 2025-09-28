USE [RestaurantReservationProject]
GO

DROP FUNCTION IF EXISTS fn_CalculateRevenue;
GO

CREATE FUNCTION fn_CalculateRevenue (@restaurantId INT)
RETURNS INT
AS
BEGIN
    DECLARE @revenue INT;
    SELECT @revenue = SUM([TotalAmount])
          FROM [dbo].[Reservations] AS r
          JOIN Orders AS o
          ON o.ReservationId = r.ReservationId
          WHERE [RestaurantId] = @restaurantId
    RETURN ISNULL(@revenue, 0);
END
GO