USE [RestaurantReservationProject]
GO

DROP PROCEDURE IF EXISTS dbo.sp_ReservedTablesReport;
GO

CREATE PROCEDURE sp_ReservedTablesReport
    @DateFrom DATETIME,
    @DateTo DATETIME
AS
BEGIN
    SELECT [ReservationId]
          ,[CustomerId]
          ,[ReservationDate]
          ,[PartySize]
          , t.TableId
          , rs.Name
          , rs.OpeningHours
          , rs.PhoneNumber
      FROM [dbo].[Reservations] AS rv
      JOIN Tables AS t
      ON rv.TableId = t.TableId
      JOIN Restaurant AS rs
      ON rv.RestaurantId = rs.RestaurantId
      WHERE [ReservationDate] BETWEEN @DateFrom AND @DateTo;
END
GO


