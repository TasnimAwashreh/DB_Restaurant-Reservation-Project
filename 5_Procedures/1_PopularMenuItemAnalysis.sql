USE [RestaurantReservationProject]
GO

WITH OrdersByMonth AS (
    SELECT [OrderId]
          ,[ReservationId]
          ,[EmployeeId]
          ,[OrderDate]
          ,[TotalAmount]
      FROM [dbo].[Orders]
      WHERE MONTH([OrderDate]) = '1'
),
x AS (
    SELECT DISTINCT
        oi.ItemId,
        SUM(oi.Quantity) AS ItemQuantity,
        mi.RestaurantId,
        mi.Name
    FROM OrdersByMonth AS o
    JOIN OrderItems oi
        ON oi.OrderId = o.OrderId
    JOIN MenuItems mi
        ON oi.ItemId = mi.ItemId
    GROUP BY oi.ItemId, mi.RestaurantId, mi.Name
),
rankItemsPerRestaurant AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY x.RestaurantId
            ORDER BY x.ItemQuantity DESC
        ) AS itemRank
    FROM x
)
SELECT 
    r.RestaurantId, 
    r.ItemId, 
    r.Name AS TopSellingItem
FROM rankItemsPerRestaurant AS r
WHERE itemRank = 1;

GO


