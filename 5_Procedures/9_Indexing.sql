USE [RestaurantReservationProject]
GO
-- Adding all indexes here

-- Restaurant
CREATE INDEX Restaurant_RestaurantId ON Restaurant(RestaurantId);

-- Order
CREATE INDEX Order_OrderId ON Orders(OrderId);
CREATE INDEX Order_OrderDate ON Orders(OrderDate);

-- OrderItems
CREATE INDEX OrderItems_ItemId ON OrderItems(ItemId);
CREATE INDEX OrderItems_Quantity ON OrderItems(Quantity);

-- MenuItems
CREATE INDEX MenuItems_ItemId ON MenuItems(ItemId);

-- Reservations
CREATE INDEX Reservations_ReservationId ON Reservations(ReservationId);
CREATE INDEX Reservations_ReservationDate ON Reservations(ReservationDate);

-- Employees
CREATE INDEX Employees_EmployeeId ON Employees(EmployeeId);

-- Customers
CREATE INDEX Customers_CustomerId ON Customers(CustomerId);

-- Tables
CREATE INDEX Tables_TableId ON Tables(TableId);
