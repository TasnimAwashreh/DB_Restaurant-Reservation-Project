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
CREATE TRIGGER update_totalAmount_trigger
ON OrderItems
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Only recalc totals for affected orders
    UPDATE o
    SET TotalAmount = (
        SELECT SUM(oi.Quantity * mi.Price)
        FROM OrderItems oi
        INNER JOIN MenuItems mi
            ON oi.ItemId = mi.ItemId
        WHERE oi.OrderId = o.OrderId
    )
    FROM Orders o
    INNER JOIN (
        -- Collect affected OrderIds from inserted and deleted
        SELECT DISTINCT OrderId FROM inserted
        UNION
        SELECT DISTINCT OrderId FROM deleted
    ) AS affected
    ON o.OrderId = affected.OrderId;
END;
GO
