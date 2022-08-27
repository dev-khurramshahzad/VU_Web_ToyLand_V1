Create Database [db_ToyLand]
USE [db_ToyLand]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 08/27/2022 4:52:09 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 08/27/2022 4:52:09 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 08/27/2022 4:52:09 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 08/27/2022 4:52:09 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 08/27/2022 4:52:09 PM ******/
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
/****** Object:  Table [dbo].[Toys]    Script Date: 08/27/2022 4:52:09 PM ******/
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
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (4, N'Cars Toys  ', N'product2-copyright-630x630.jpg', N'Kids Male Toys  ', N'Active')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (5, N'Doll Toys', N'product4-copyright-630x630.jpg', N'Kids Female Toys', N'Active')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (6, N'3D Puzzles', N'3D-Stereo-Puzzle-Children--013.jpg', N'Puzzles Toys', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (7, N'Blocks Toys', N'product8-copyright-630x630.jpg', N'Block Toy', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (9, N'Baby teether', N'Baby Teether toys.jpg', N'Teether toy', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (10, N'Baby Crib toy', N'download (1).jpg', N'Crib toy', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (11, N'Push Toy', N'push toy.jpg', N'Push Toy', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (12, N'Baby Rattles Toy', N'Baby Rattles Toys.jpg', N'Rattels', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (14, N'Musical Toys', N'518qIzB-Z8L_500x.jpg', N'Musical Toy', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (16, N'Stuffed Toys', N'Stuss Toy.jpg', N'Stuff Toy', N'Available')
GO
INSERT [dbo].[Categories] ([CatID], [Name], [Image], [Details], [Status]) VALUES (17, N'Learning Toy', N'download.jpg', N'Learning Toy', N'Available')
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
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email], [Password], [Phone], [Address], [Image], [Status]) VALUES (7, N'tayyab', N'tayyab@gmail.com', N'1234', N'03234567878', N'gujranwala', NULL, NULL)
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
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (11, 11, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (12, 12, 1015, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailsID], [OrderFID], [ToyFID], [Quantity]) VALUES (13, 13, 1010, 1)
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
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (11, 7, CAST(N'2022-08-24' AS Date), CAST(N'23:53:38.8009816' AS Time), NULL, NULL, NULL, N'Pending')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (12, 7, CAST(N'2022-08-27' AS Date), CAST(N'16:48:58.7434019' AS Time), NULL, NULL, NULL, N'Pending')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerFID], [OrderDate], [OrderTime], [DeliveryDate], [PaymentMethod], [Details], [Status]) VALUES (13, 6, CAST(N'2022-08-27' AS Date), CAST(N'16:50:41.7835842' AS Time), NULL, NULL, NULL, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Toys] ON 
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (2, N'Electric Crane', 4, 88, 300, 450, N'product2-copyright-630x630.jpg', NULL, N'N/A', N'Electric Crane', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (3, N'Female Doll', 5, 99, 350, 500, N'product4-copyright-630x630.jpg', NULL, N'N/A', N'Female Doll', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1010, N'Tractor', 4, 99, 500, 650, N'product12-copyright-630x630.jpg', NULL, NULL, N'Tractor for Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1011, N'Green car', 4, 100, 400, 500, N'product13-copyright-630x630.jpg', NULL, NULL, N'Green Rescue car', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1013, N'Baby doll', 5, 100, 600, 800, N'7.jpg', NULL, NULL, N'Baby doll set for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1014, N'Angel Doll', 5, 100, 700, 900, N'8.jpg', NULL, NULL, N'Angel doll for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1015, N'Barbie doll set', 5, 99, 1000, 1500, N'product3-copyright-630x630.jpg', NULL, NULL, N'Barbie Doll set for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1016, N'Stuff Doll', 5, 100, 200, 300, N'product6-copyright-630x630.jpg', NULL, NULL, N'Stuff doll for girls', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1017, N'Mermaid Doll', 5, 100, 400, 500, N'product11-copyright-630x630.jpg', NULL, NULL, N'Mermaid Doll for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1018, N'Doll', 5, 100, 500, 700, N'product14-copyright-630x630.jpg', NULL, NULL, N'Doll for baby girls', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1019, N'Doll Set', 5, 100, 600, 800, N'product16-copyright-630x630.jpg', NULL, NULL, N'set of 2 dolls for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1020, N'3D House Puzzle', 6, 100, 800, 1000, N'3D-Stereo-Puzzle-Children--013.jpg', NULL, NULL, N'3D House Puzzle for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1021, N'3d Car Puzzle ', 6, 100, 700, 900, N'bat car.jpg', NULL, NULL, N'3D Car puzzle for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1022, N'Camera Puzzle', 6, 100, 800, 1000, N'camera.jpg', NULL, NULL, N'3D Camera puzzle', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1023, N'Eiffel Tower Puzzle', 6, 100, 800, 1000, N'eiffel tower.jpg', NULL, NULL, N'3D Eiffel Tower  puzzle', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1024, N'Pisa Tower Puzzle', 6, 100, 800, 1000, N'pisa tower.jpg', NULL, NULL, N'3D Pisa Tower  puzzle', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1025, N'3D House Puzzles', 6, 100, 1000, 1200, N'house.jpg', NULL, NULL, N'3D House Puzzle for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1026, N'Sea Animal Puzzle', 6, 100, 1000, 1300, N'sea animal.jpg', NULL, NULL, N'Set of 6 Sea Animal 3D puzzle', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1029, N'Blocks Set', 7, 50, 800, 1000, N'3.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1030, N'Blocks Set', 7, 60, 900, 1100, N'4.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1032, N'Baby teether', 9, 100, 200, 300, N'1.jpg', NULL, NULL, N'baby Teether Banana Shape', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1033, N'Baby Key Teether', 9, 100, 500, 700, N'2.jpg', NULL, NULL, N'Key shape Baby Teether', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1034, N'Set of 5 Baby teether ', 9, 50, 600, 800, N'5.jpg', NULL, NULL, N'5 Different Shape baby Teether ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1035, N'Baby Hand teether', 9, 70, 600, 800, N'6.jpg', NULL, NULL, N'Baby Hand Teether', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1036, N'Animal Shape Baby Teether', 9, 80, 1000, 1200, N'Baby Teether toys.jpg', NULL, NULL, N'5 Different Animal Shape baby Teether ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1037, N'Remote car', 4, 100, 800, 1000, N'car1.jpg', NULL, NULL, N'Remote control car for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1038, N'Remote car', 4, 100, 800, 1000, N'car6.jpg', NULL, NULL, N'Remote control car for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1039, N'Robot car', 4, 100, 1000, 1200, N'car2.jpg', NULL, NULL, N'Robot car for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1040, N'Remote car', 4, 80, 800, 1000, N'car4.jpg', NULL, NULL, N'Remote control car for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1041, N'Car set', 4, 90, 600, 800, N'car3.jpg', NULL, NULL, N'6 metal car set for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1042, N'Blocks Set', 7, 100, 800, 1000, N'block1.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1043, N'Blocks Toys', 7, 50, 600, 800, N'block2.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1044, N'Blocks Set', 7, 60, 800, 1000, N'block5.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1045, N'Blocks box', 7, 80, 1000, 1200, N'product8-copyright-630x630.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1046, N'Blocks cup', 7, 70, 400, 500, N'product9-copyright-630x630.jpg', NULL, NULL, N'Blocks For Kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1047, N'Baby Crib toy', 10, 50, 800, 1000, N'cribe1.jpg', NULL, NULL, N'Baby crib toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1048, N'Baby Crib toy', 10, 60, 600, 800, N'cribe2.jpg', NULL, NULL, N'Baby crib toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1049, N'Baby Crib toy', 10, 80, 800, 1000, N'cribe3.jpg', NULL, NULL, N'Fancy Baby crib toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1050, N'Baby Crib toy', 10, 60, 600, 800, N'cribe4.jpg', NULL, NULL, N'Star shape Baby crib toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1051, N'Baby Crib toy', 10, 40, 1000, 1200, N'cribe5.jpg', NULL, NULL, N'Alien Baby crib toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1052, N'Baby Crib toy', 10, 80, 800, 1000, N'cribe6.jpg', NULL, NULL, N'Baby crib toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1053, N'Baby Push Toy', 11, 50, 1000, 1200, N'puch1.jpg', NULL, NULL, N'Baby Push Toy with learning ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1054, N'Baby Push Toy', 11, 50, 1000, 1500, N'puch2.jpg', NULL, NULL, N'Push Toy with Carey ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1055, N'Baby Push Toy', 11, 40, 600, 800, N'puch3.jpg', NULL, NULL, N'Baby Push Toy one wheel', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1056, N'Baby Push Toy', 11, 50, 1000, 1500, N'puch4.jpg', NULL, NULL, N'Baby Push Toy car shape ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1057, N'Baby Push Toy', 11, 50, 1000, 1200, N'puch5.jpg', NULL, NULL, N'Baby Push Toy with bobbles', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1058, N'Baby Push Toy', 11, 50, 800, 1000, N'puch6.jpg', NULL, NULL, N'Baby Push Toy ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1059, N'Baby Rattles Toy', 12, 100, 200, 300, N'rattle2.jpg', NULL, NULL, N'Set of 4 Baby rattles toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1060, N'Baby Rattles Toy', 12, 60, 800, 1000, N'rattle1.jpg', NULL, NULL, N'Baby wood rattle toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1061, N'Baby Rattles Toy', 12, 80, 600, 800, N'rattle3.jpg', NULL, NULL, N'Baby rattle set', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1062, N'Baby Rattles Toy', 12, 60, 400, 500, N'rattle4.jpg', NULL, NULL, N'Baby rattle pack', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1063, N'Baby Rattles Toy', 12, 90, 400, 500, N'rattle7.jpg', NULL, NULL, N'Baby rattle pack', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1064, N'Baby Rattles Toy', 12, 80, 600, 800, N'rattle5.jpg', NULL, NULL, N'12 piece Baby rattle set', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1065, N'Baby Rattles Toy', 12, 90, 400, 500, N'rattle6.jpg', NULL, NULL, N'6.piece Baby rattle set', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1066, N'Drum for Kids ', 14, 50, 800, 1000, N'musical1.jpg', NULL, NULL, N'Drum for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1067, N'Piano for Kids ', 14, 60, 1000, 1200, N'musical4.jpg', NULL, NULL, N'Piano for Kids ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1068, N'Drum set for Kids ', 14, 50, 1500, 2000, N'musical6.jpg', NULL, NULL, N'Drum set for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1069, N'Piano with mic for Kids ', 14, 50, 1000, 1500, N'musical5.jpg', NULL, NULL, N'Piano with mic for Kids ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1070, N'Musical Toys', 14, 80, 800, 1000, N'musical2.jpg', NULL, NULL, N'Musical Toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1071, N'Piano with drum for Kids ', 14, 40, 1500, 2000, N'musical7.jpg', NULL, NULL, N'Piano with drum for Kids ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1072, N'Musical Toys', 14, 70, 800, 1000, N'musical3.jpg', NULL, NULL, N'Musical Toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1073, N'Teddy bear', 16, 100, 200, 300, N'product10-copyright-630x630.jpg', NULL, NULL, N'teddy 🐻 ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1074, N'Teddy bear', 16, 100, 200, 300, N'stuff4.jpg', NULL, NULL, N'teddy 🐻 ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1075, N'Teddy bear', 16, 80, 500, 650, N'stuff5.jpg', NULL, NULL, N'Big teddy 🐻 ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1076, N'Rabbit 🐰 ', 16, 100, 200, 300, N'stuff6.jpg', NULL, NULL, N'Rabbit 🐰 ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1077, N'Giraffe 🦒 ', 16, 100, 200, 300, N'stuff7.jpg', NULL, NULL, N'Giraffe 🦒 ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1078, N'Twitty', 16, 100, 400, 650, N'stuff8.jpg', NULL, NULL, N'set of 3 twitty for kids', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1079, N'Tom and Jerry ', 16, 80, 400, 500, N'stuff9.jpg', NULL, NULL, N'Tom and Jerry ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1080, N'Rings ', 17, 80, 400, 650, N'learning1.jpg', NULL, NULL, N'Rings learning toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1081, N'Clock ', 17, 50, 600, 800, N'learning2.jpg', NULL, NULL, N'wood clock learning toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1082, N'Alphabet''s ', 17, 50, 600, 800, N'learning3.jpg', NULL, NULL, N'English alphabet for Kids ', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1083, N'Chart with touch sensor ', 17, 80, 800, 1000, N'learning4.jpg', NULL, NULL, N'Learning chart with touch sensor Toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1084, N'Learning table Toy', 17, 80, 1000, 1500, N'learning5.jpg', NULL, NULL, N'Learning table Toy', 5, N'Available ')
GO
INSERT [dbo].[Toys] ([ToyID], [Name], [CatFID], [Quantity], [CostPrice], [SalePrice], [Image1], [Image2], [DemoVideo], [Details], [Rating], [Status]) VALUES (1085, N'Numbers ', 17, 80, 400, 650, N'learning6.jpg', NULL, NULL, N'Number''s ', 5, N'Available ')
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
