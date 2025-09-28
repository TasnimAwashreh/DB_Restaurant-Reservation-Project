USE [RestaurantReservationProject]
GO

CREATE VIEW ReservationExtendedDetails AS
SELECT [ReservationId]
      ,[TableId]
      ,[ReservationDate]
      ,[PartySize]
      , rs.RestaurantId
      , rs.name AS RestaurantName
      , rs.PhoneNumber AS RestaurantPhone
      , rs.OpeningHours
      , c.CustomerId
      , c.FirstName
      , c.LastName
      , c.Email
      , c.PhoneNumber AS CustomerPhone
      
  FROM [dbo].[Reservations] AS rv
  JOIN Restaurant rs
  ON rv.RestaurantId = rs.RestaurantId
  JOIN Customers c
  ON rv.CustomerId = c.CustomerId
GO


