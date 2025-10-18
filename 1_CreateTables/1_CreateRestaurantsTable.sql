USE [RestaurantReservationProject]
GO

/****** Object:  Table [dbo].[Restaurant]    Script Date: 9/23/2025 4:03:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Restaurant](
	[RestaurantId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](25) NOT NULL,
	[PhoneNumber] [nchar](10) NULL,
	[OpeningHours] [nchar](20) NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[RestaurantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


