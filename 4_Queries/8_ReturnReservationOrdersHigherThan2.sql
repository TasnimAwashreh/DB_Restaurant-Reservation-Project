USE [RestaurantReservationProject]
GO

WITH GetOrderCountPerReservation AS(
    SELECT [ReservationId], 
            COUNT([OrderId]) AS OrderCount
    FROM [dbo].[Orders]
    GROUP BY [ReservationId]
  )
  SELECT * FROM GetOrderCountPerReservation
  WHERE OrderCount >= 2
  ORDER BY OrderCount DESC;

GO