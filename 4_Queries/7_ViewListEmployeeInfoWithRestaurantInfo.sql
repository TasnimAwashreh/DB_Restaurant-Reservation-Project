USE [RestaurantReservationProject]
GO

CREATE VIEW ListEmployeeInfoWithRestaurantInfo AS
SELECT [EmployeeId]
      ,[FirstName]
      ,[LastName]
      ,[Position]
      ,r.Name
      ,r.OpeningHours
      ,r.PhoneNumber
  FROM [dbo].[Employees] AS e
  LEFT JOIN Restaurant r
  ON e.RestaurantId = r.RestaurantId
GO


