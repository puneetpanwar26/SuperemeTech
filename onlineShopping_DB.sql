USE [master]
GO
/****** Object:  Database [online_shopping]    Script Date: 1/28/2024 1:35:29 PM ******/
CREATE DATABASE [online_shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'online_shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\online_shopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'online_shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\online_shopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [online_shopping] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [online_shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [online_shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [online_shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [online_shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [online_shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [online_shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [online_shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [online_shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [online_shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [online_shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [online_shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [online_shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [online_shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [online_shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [online_shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [online_shopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [online_shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [online_shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [online_shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [online_shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [online_shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [online_shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [online_shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [online_shopping] SET RECOVERY FULL 
GO
ALTER DATABASE [online_shopping] SET  MULTI_USER 
GO
ALTER DATABASE [online_shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [online_shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [online_shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [online_shopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [online_shopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [online_shopping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'online_shopping', N'ON'
GO
ALTER DATABASE [online_shopping] SET QUERY_STORE = ON
GO
ALTER DATABASE [online_shopping] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [online_shopping]
GO
/****** Object:  Table [dbo].[address]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[line1] [varchar](50) NULL,
	[line2] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[state_name] [varchar](50) NULL,
	[mobile_no] [varchar](50) NULL,
	[user_id] [bigint] NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[prod_id] [bigint] NULL,
	[qty] [int] NULL,
	[price] [float] NULL,
	[total] [float] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cat_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](50) NULL,
	[parent_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[address_id] [bigint] NULL,
	[sub_total] [float] NULL,
	[discount] [float] NULL,
	[total] [float] NULL,
	[grand_total] [float] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderItem]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderItem](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[prod_id] [bigint] NULL,
	[qty] [int] NULL,
	[price] [float] NULL,
	[amount] [float] NULL,
	[discount] [float] NULL,
	[total_amount] [float] NULL,
 CONSTRAINT [PK_orderItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[Prod_id] [bigint] IDENTITY(1,1) NOT NULL,
	[prod_name] [varchar](500) NULL,
	[sku] [varchar](50) NULL,
	[description] [varchar](500) NULL,
	[qty] [int] NULL,
	[price] [float] NULL,
	[discount] [float] NULL,
	[created_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[is_active] [bit] NULL,
	[user_id] [bigint] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[Prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productCategory]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productCategory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[prod_id] [bigint] NULL,
	[cat_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[is_active] [bigint] NULL,
 CONSTRAINT [PK_productCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[moblie_no] [varchar](50) NULL,
	[email_id] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[user_type_id] [bigint] NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userType]    Script Date: 1/28/2024 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userType](
	[user_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_type_name] [varchar](50) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_userType] PRIMARY KEY CLUSTERED 
(
	[user_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([address_id], [first_name], [last_name], [line1], [line2], [country_name], [state_name], [mobile_no], [user_id]) VALUES (1, N'Ram', N'lal', N'Line1', N'Line2', N'INDIA', N'HARYANA', N'8053240332', 1)
INSERT [dbo].[address] ([address_id], [first_name], [last_name], [line1], [line2], [country_name], [state_name], [mobile_no], [user_id]) VALUES (2, N'Ram1', N'lal', N'Line1', N'Line2', N'india', N'haryana', N'8053240332', 1)
INSERT [dbo].[address] ([address_id], [first_name], [last_name], [line1], [line2], [country_name], [state_name], [mobile_no], [user_id]) VALUES (3, N'Sham', N'Lal', N'line1', N'line2', N'INDIA', N'HAryana', N'8053240332', 2)
INSERT [dbo].[address] ([address_id], [first_name], [last_name], [line1], [line2], [country_name], [state_name], [mobile_no], [user_id]) VALUES (4, N'Sham2', N'Lal', N'line1', N'line2', N'INDIA', N'HARYANA', N'8053240331', 2)
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([cat_id], [cat_name], [parent_id], [created_date], [updated_date], [is_active]) VALUES (1, N'Grocery', 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[category] ([cat_id], [cat_name], [parent_id], [created_date], [updated_date], [is_active]) VALUES (2, N'Mobiles', 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[category] ([cat_id], [cat_name], [parent_id], [created_date], [updated_date], [is_active]) VALUES (3, N'Fashion', 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[category] ([cat_id], [cat_name], [parent_id], [created_date], [updated_date], [is_active]) VALUES (4, N'Electronics', 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[category] ([cat_id], [cat_name], [parent_id], [created_date], [updated_date], [is_active]) VALUES (5, N'Furniture', 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [user_id], [address_id], [sub_total], [discount], [total], [grand_total], [created_date], [updated_date], [is_active]) VALUES (1, 2, 3, 492, 0, 492, 492, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[order] ([order_id], [user_id], [address_id], [sub_total], [discount], [total], [grand_total], [created_date], [updated_date], [is_active]) VALUES (2, 2, 3, 565, 0, 565, 565, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[order] ([order_id], [user_id], [address_id], [sub_total], [discount], [total], [grand_total], [created_date], [updated_date], [is_active]) VALUES (3, 2, 3, 1450, 0, 1450, 1450, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[order] ([order_id], [user_id], [address_id], [sub_total], [discount], [total], [grand_total], [created_date], [updated_date], [is_active]) VALUES (10002, 2, 3, 5750, 0, 5750, 5750, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[order] ([order_id], [user_id], [address_id], [sub_total], [discount], [total], [grand_total], [created_date], [updated_date], [is_active]) VALUES (10003, 2, 3, 2330, 0, 2330, 2330, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderItem] ON 

INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (1, 1, 1, 4, 123, 492, 0, 492)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (2, 2, 7, 1, 565, 565, 0, 565)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (3, 3, 9, 1, 400, 400, 0, 400)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (4, 3, 10, 2, 350, 700, 0, 700)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (5, 3, 11, 1, 350, 350, 0, 350)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (10002, 10002, 12, 3, 1800, 1800, 0, 1800)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (10003, 10002, 13, 4, 2600, 2600, 0, 2600)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (10004, 10002, 14, 5, 1350, 1350, 0, 1350)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (10005, 10003, 7, 2, 1130, 1130, 0, 1130)
INSERT [dbo].[orderItem] ([id], [order_id], [prod_id], [qty], [price], [amount], [discount], [total_amount]) VALUES (10006, 10003, 9, 3, 1200, 1200, 0, 1200)
SET IDENTITY_INSERT [dbo].[orderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (1, N'Mustard Oil Pouch (Sarson Tel)
', N'MUST', N'Mustard Oil Pouch (Sarson Tel)
', 1, 123, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (7, N'AASHIRVAAD Atta with Multigrains ', N'AASHIRVAAD', N'AASHIRVAAD Atta with Multigrains (Mix anaaj ka atta)
', 1, 565, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (8, N'Samsung Galaxy S21 FE 5G with Snapdragon 888 ', N'SMS', N'Samsung Galaxy S21 FE 5G ', 1, 31000, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (9, N'Grey Track Pants', N'PANT', N'Grey Track Pants', 1, 400, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (10, N'Dark Green T-Shirt', N'TSHIRT', N'Dark Green T-Shirt', 1, 350, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (11, N'Round Neck Polyester Pink', N'TSHIRT', N'Round Neck Polyester Pink', 1, 350, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (12, N'60 L Strolley Duffel Bag', N'BAG', N'60 L Strolley Duffel Bag', 1, 600, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (13, N'Sling Back Clogs For Boys & Girls ', N'FOOT', N'Sling Back Clogs For Boys & Girls ', 1, 650, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (14, N'Kemei Kmeii KM721 TRIMMER t1 Runtime', N'TRM', N'Kemei Kmeii KM721 TRIMMER t1 Runtime', 1, 450, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (15, N'BeeDuck Electric Nose', N'BDEN', N'BeeDuck Electric Nose', 1, 250, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (16, N'NOVA NHP 8100 Hair Dryer', N'NNHD', N'NOVA NHP 8100 Hair Dryer', 1, 490, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (17, N'NEUDOT Roman Sectional RHS Fabric 6 Seater Sofa', N'NRSR', N'NEUDOT Roman Sectional RHS Fabric 6 Seater Sofa', 1, 17899, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[product] ([Prod_id], [prod_name], [sku], [description], [qty], [price], [discount], [created_date], [update_date], [is_active], [user_id]) VALUES (18, N'The Grow More Spice Set Plastic', N'GMSSS', N'The Grow More Spice Set Plastic', 1, 280, 0, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[productCategory] ON 

INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (1, 1, 1, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (2, 7, 1, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (3, 8, 2, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (4, 9, 3, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (5, 10, 3, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (12, 11, 3, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (13, 12, 3, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (14, 13, 3, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (15, 14, 4, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (16, 15, 4, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (17, 16, 4, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (18, 17, 5, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[productCategory] ([id], [prod_id], [cat_id], [created_date], [updated_date], [is_active]) VALUES (19, 18, 5, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[productCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [first_name], [last_name], [moblie_no], [email_id], [pwd], [user_type_id], [create_date], [update_date], [is_active]) VALUES (1, N'Ram', N'Lal', N'8053240332', N'ramlal@gmail.com', N'123', 1, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user] ([user_id], [first_name], [last_name], [moblie_no], [email_id], [pwd], [user_type_id], [create_date], [update_date], [is_active]) VALUES (2, N'Sham', N'Lal', N'8053240332', N'shamlal@gmail.com', N'123', 2, CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user] ([user_id], [first_name], [last_name], [moblie_no], [email_id], [pwd], [user_type_id], [create_date], [update_date], [is_active]) VALUES (5, N'Mohan', N'Lal', N'1234567890', N'mohan@gmail.com', N'mohan123#', 2, CAST(N'2024-01-27T13:54:29.397' AS DateTime), CAST(N'2024-01-27T13:54:29.397' AS DateTime), 1)
INSERT [dbo].[user] ([user_id], [first_name], [last_name], [moblie_no], [email_id], [pwd], [user_type_id], [create_date], [update_date], [is_active]) VALUES (7, N'bhulllar', N'singh', N'54545', N'puneet12c@gmail.com', N'stud1', 2, CAST(N'2024-01-28T05:34:45.803' AS DateTime), CAST(N'2024-01-28T05:34:45.803' AS DateTime), 1)
INSERT [dbo].[user] ([user_id], [first_name], [last_name], [moblie_no], [email_id], [pwd], [user_type_id], [create_date], [update_date], [is_active]) VALUES (8, N'bhulllar update', N'singh', N'54545', N'puneet12c@gmail.com', N'stud1', 2, CAST(N'2024-01-28T05:34:45.803' AS DateTime), CAST(N'2024-01-28T05:34:45.803' AS DateTime), 1)
INSERT [dbo].[user] ([user_id], [first_name], [last_name], [moblie_no], [email_id], [pwd], [user_type_id], [create_date], [update_date], [is_active]) VALUES (10, N'Raman Update', N'Saini', N'45789562', N'raman@gmail.com', N'raman', 2, CAST(N'2024-01-28T05:41:28.597' AS DateTime), CAST(N'2024-01-28T05:41:28.597' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[userType] ON 

INSERT [dbo].[userType] ([user_type_id], [user_type_name], [created_date], [updated_date], [is_active]) VALUES (1, N'Admin', CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[userType] ([user_type_id], [user_type_name], [created_date], [updated_date], [is_active]) VALUES (2, N'Customer', CAST(N'2024-01-26T00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[userType] OFF
GO
/****** Object:  Index [IX_user]    Script Date: 1/28/2024 1:35:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_user] ON [dbo].[user]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_user]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_cart] FOREIGN KEY([prod_id])
REFERENCES [dbo].[product] ([Prod_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_cart]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_address]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[orderItem]  WITH CHECK ADD  CONSTRAINT [FK_orderItem_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[orderItem] CHECK CONSTRAINT [FK_orderItem_order]
GO
ALTER TABLE [dbo].[orderItem]  WITH CHECK ADD  CONSTRAINT [FK_orderItem_product] FOREIGN KEY([prod_id])
REFERENCES [dbo].[product] ([Prod_id])
GO
ALTER TABLE [dbo].[orderItem] CHECK CONSTRAINT [FK_orderItem_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_user]
GO
ALTER TABLE [dbo].[productCategory]  WITH CHECK ADD  CONSTRAINT [FK_productCategory_category1] FOREIGN KEY([cat_id])
REFERENCES [dbo].[category] ([cat_id])
GO
ALTER TABLE [dbo].[productCategory] CHECK CONSTRAINT [FK_productCategory_category1]
GO
ALTER TABLE [dbo].[productCategory]  WITH CHECK ADD  CONSTRAINT [FK_productCategory_product] FOREIGN KEY([prod_id])
REFERENCES [dbo].[product] ([Prod_id])
GO
ALTER TABLE [dbo].[productCategory] CHECK CONSTRAINT [FK_productCategory_product]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_usertype] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[userType] ([user_type_id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_usertype]
GO
USE [master]
GO
ALTER DATABASE [online_shopping] SET  READ_WRITE 
GO
