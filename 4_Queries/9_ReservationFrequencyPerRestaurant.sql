USE [RestaurantReservationProject]
GO

WITH ReservationCountPerDate AS (
    SELECT 
        [RestaurantId], 
        COUNT(DISTINCT [ReservationDate]) AS TotalDaysReserved,
        COUNT(RestaurantId) AS TotalRestaurantReservations
    FROM [dbo].[Reservations]
    GROUP BY [RestaurantId]
)
SELECT
   DENSE_RANK() OVER (ORDER BY TotalRestaurantReservations * 1.0/TotalDaysReserved DESC) AS HighestFrequency,
   [RestaurantId],
   TotalDaysReserved,
   TotalRestaurantReservations
FROM ReservationCountPerDate
ORDER BY HighestFrequency;

GO


