-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE TABLE [dbo].[AuditLog] (
    LogId INT PRIMARY KEY,
    RestaurantId INT NOT NULL,
    TableId INT NOT NULL,
    ReservationDate DATETIME NOT NULL,
    ChangeDate DATETIME NOT NULL
);
GO

CREATE TRIGGER LogOnChange
   ON [dbo].[Reservations]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
    INSERT INTO [dbo].[AuditLog] 
                (RestaurantId, 
                TableId, 
                ReservationDate, 
                ChangeDate)
    SELECT 
        rev.RestaurantId,
        rev.TableId,
        rev.ReservationDate,
        GETDATE()
    FROM inserted rev;
END
GO

