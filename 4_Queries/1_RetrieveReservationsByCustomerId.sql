USE [RestaurantReservationProject]
GO

CREATE PROCEDURE GetReservationByCustomerId
    @CustomerId INT
AS
BEGIN

SELECT [ReservationId]
      ,[CustomerId]
      ,[RestaurantId]
      ,[TableId]
      ,[ReservationDate]
      ,[PartySize]
  FROM [dbo].[Reservations]
  WHERE CustomerId = @CustomerId;
END
GO
