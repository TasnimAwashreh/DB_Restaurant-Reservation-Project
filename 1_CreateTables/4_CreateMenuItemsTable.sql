USE [RestaurantReservationProject]
GO

/****** Object:  Table [dbo].[MenuItems]    Script Date: 9/23/2025 4:05:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MenuItems](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantId] [int] NULL,
	[Name] [nchar](64) NOT NULL,
	[Description] [nchar](120) NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Restaurant] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurant] ([RestaurantId])
GO

ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Restaurant]
GO


