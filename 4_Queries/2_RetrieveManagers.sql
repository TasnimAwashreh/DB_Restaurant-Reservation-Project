USE [RestaurantReservationProject]
GO

SELECT [EmployeeId]
      ,[RestaurantId]
      ,[FirstName]
      ,[LastName]
      ,[Position]
  FROM [dbo].[Employees]
  WHERE Position = 'Manager';
GO


