USE [RestaurantReservationProject]
GO
-- Adding all indexes here

-- Order
CREATE INDEX Order_OrderDate ON Orders(OrderDate);

-- OrderItems
CREATE INDEX OrderItems_Quantity ON OrderItems(Quantity);

-- Reservations
CREATE INDEX Reservations_ReservationDate ON Reservations(ReservationDate);