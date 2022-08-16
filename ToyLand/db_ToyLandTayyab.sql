USE [db_ToyLand]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 08/16/2022 5:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08/16/2022 5:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 08/16/2022 5:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 08/16/2022 5:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderFID] [int] NULL,
	[ToyFID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[DetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08/16/2022 5:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFID] [int] NULL,
	[OrderDate] [date] NOT NULL,
	[OrderTime] [time](7) NULL,
	[DeliveryDate] [date] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toys]    Script Date: 08/16/2022 5:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toys](
	[ToyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CatFID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CostPrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Image1] [nvarchar](500) NULL,
	[Image2] [nvarchar](500) NULL,
	[DemoVideo] [nvarchar](500) NULL,
	[Details] [nvarchar](50) NULL,
	[Rating] [int] NULL,
	[Status] [nchar](10) NULL,
 CONSTRAINT [PK_Toys] PRIMARY KEY CLUSTERED 
(
	[ToyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 
GO
INSERT [dbo].[Admins] ([AdminID], [Name], [Email], [Password], [Status]) VALUES (1, N'Admin1', N'admin@admin.com', N'admin', N'Active')
GO
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (4, N'Kids Male Toys  ', N'product2-copyright-630x630.jpg', N'Kids Male Toys  ', N'Active')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (5, N'Kids Female Toys', N'product4-copyright-630x630.jpg', N'Kids Female Toys', N'Active')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email], [Password], [Phone], [Address], [Image], [Status]) VALUES (1, N'Khurram Shahzad', N'khurramshahzadbilal786@gmail.com', N'124', N'03484086662', N'Gujranwala', NULL, NULL)
GO
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email], [Password], [Phone], [Address], [Image], [Status]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email], [Password], [Phone], [Address], [Image], [Status]) VALUES (6, N'Khurram Shahzad', N'developer.khurramshahzad@gmail.com', N'123', N'3484086662', N'Gujranwala', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (3, 3, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (4, 4, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (5, 5, 2, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (6, 6, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (7, 7, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (8, 8, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (9, 9, 2, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (10, 10, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (3, 1, CAST(N'2022-04-26' AS Date), CAST(N'09:41:42.1986618' AS Time), NULL, NULL, NULL, N'Cancelled')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (4, 1, CAST(N'2022-06-06' AS Date), CAST(N'21:39:36.5688921' AS Time), NULL, NULL, NULL, N'Pending')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (5, 1, CAST(N'2022-06-28' AS Date), CAST(N'12:51:16.0858334' AS Time), NULL, NULL, NULL, N'Delivered')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (6, 1, CAST(N'2022-06-28' AS Date), CAST(N'13:06:19.6306650' AS Time), NULL, NULL, NULL, N'Pending')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (7, 6, CAST(N'2022-07-31' AS Date), CAST(N'18:25:01.5287371' AS Time), NULL, NULL, NULL, N'Ready')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (8, 1, CAST(N'2022-08-06' AS Date), CAST(N'12:47:18.4248544' AS Time), NULL, NULL, NULL, N'Delivered')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (9, 1, CAST(N'2022-08-06' AS Date), CAST(N'12:50:27.9695047' AS Time), NULL, NULL, NULL, N'Pending')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (10, 6, CAST(N'2022-08-16' AS Date), CAST(N'16:53:52.2553735' AS Time), NULL, NULL, NULL, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Toys] ON 
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (2, N'Electric Crane', 4, 89, 300, 450, N'product2-copyright-630x630.jpg', NULL, N'N/A', N'Electric Crane', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (3, N'Female Doll', 5, 99, 350, 500, N'product4-copyright-630x630.jpg', NULL, N'N/A', N'Female Doll', 5, N'Available ')
GO
SET IDENTITY_INSERT [dbo].[Toys] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderFID])
REFERENCES [dbo].[Orders] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Toys] FOREIGN KEY([ToyFID])
REFERENCES [dbo].[Toys] ([ToyID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Toys]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Customers] FOREIGN KEY([CustomerFID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Table_1_Customers]
GO
ALTER TABLE [dbo].[Toys]  WITH CHECK ADD  CONSTRAINT [FK_Toys_Categories] FOREIGN KEY([CatFID])
REFERENCES [dbo].[Categories] ([CatID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Toys] CHECK CONSTRAINT [FK_Toys_Categories]
GO
