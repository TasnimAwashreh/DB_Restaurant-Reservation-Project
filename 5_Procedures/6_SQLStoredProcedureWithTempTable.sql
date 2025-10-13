USE [RestaurantReservationProject]
GO

CREATE OR ALTER PROCEDURE retrieveTablesWithFutureReservations
    @reservationDate DATETIME
AS 
BEGIN
    CREATE TABLE #TempTables (
        TableId INT,
        RestaurantId INT
    );

    INSERT INTO #TempTables (TableId, RestaurantId)
    SELECT rev.TableId, rev.RestaurantId
    FROM Reservations rev
    WHERE rev.ReservationDate > @reservationDate;

    SELECT t.TableId,
           res.RestaurantId,
           res.Name,
           res.OpeningHours
    FROM [dbo].[Restaurant] AS res
    JOIN #TempTables t
    ON res.RestaurantId = t.RestaurantId
END
GO