USE [shop_quan_ao]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 24/02/2025 6:44:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[fullname] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[photo] [varchar](255) NULL,
	[activated] [bit] NULL,
	[admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 24/02/2025 6:44:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderdetails]    Script Date: 24/02/2025 6:44:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderdetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[Productid] [int] NULL,
	[Orderid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24/02/2025 6:44:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[Createdate] [datetime] NULL,
	[Username] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24/02/2025 6:44:45 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[image] [varchar](255) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[Createdate] [datetime] NULL,
	[available] [bit] NULL,
	[Categoryid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated], [admin]) VALUES (N'admin', N'yen290325', N'Administrator', N'admin@example.com', N'admin.jpg', 1, 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated], [admin]) VALUES (N'user1', N'user1password', N'Nguy?n Van A', N'user1@example.com', N'user1.jpg', 1, 0)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated], [admin]) VALUES (N'user2', N'user2password', N'Tr?n Th? B', N'user2@example.com', N'user2.jpg', 1, 0)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated], [admin]) VALUES (N'user3', N'user3password', N'Lê Minh C', N'user3@example.com', N'user3.jpg', 1, 0)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated], [admin]) VALUES (N'user4', N'user4password', N'Ph?m Ng?c D', N'user4@example.com', N'user4.jpg', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Áo Dài')
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Áo Hoodie')
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Áo Khoác')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Áo So Mi')
INSERT [dbo].[Categories] ([id], [name]) VALUES (6, N'Chân Váy Midi')
INSERT [dbo].[Categories] ([id], [name]) VALUES (7, N'Váy Ôm Body')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (1, N'Áo Hoodie Ðen', N'hoodie_black.jpg', CAST(350000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (2, N'Áo Hoodie Tr?ng', N'hoodie_white.jpg', CAST(370000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (3, N'Áo Hoodie Xám', N'hoodie_gray.jpg', CAST(360000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (4, N'Áo Hoodie Xanh', N'hoodie_blue.jpg', CAST(380000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (5, N'Áo Hoodie Ð?', N'hoodie_red.jpg', CAST(390000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (6, N'Áo Hoodie Cam', N'hoodie_orange.jpg', CAST(400000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 1)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (7, N'Áo So Mi Nam Tr?ng', N'shirt_white_men.jpg', CAST(250000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 2)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (8, N'Áo So Mi N? H?a Ti?t', N'shirt_pattern_women.jpg', CAST(270000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 2)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (9, N'Áo So Mi Nam Xanh', N'shirt_blue_men.jpg', CAST(280000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 2)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (10, N'Áo So Mi N? Ðen', N'shirt_black_women.jpg', CAST(290000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 2)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (11, N'Áo So Mi C? L?', N'shirt_collared.jpg', CAST(300000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 2)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (12, N'Áo So Mi Cánh Doi', N'shirt_drape.jpg', CAST(310000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 2)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (13, N'Áo Dài Tr?ng', N'ao_dai_white.jpg', CAST(500000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 3)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (14, N'Áo Dài H?ng', N'ao_dai_pink.jpg', CAST(510000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 3)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (15, N'Áo Dài Ð?', N'ao_dai_red.jpg', CAST(520000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 3)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (16, N'Áo Dài Xanh', N'ao_dai_blue.jpg', CAST(530000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 3)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (17, N'Áo Dài Vàng', N'ao_dai_yellow.jpg', CAST(540000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 3)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (18, N'Áo Dài Tím', N'ao_dai_purple.jpg', CAST(550000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 3)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (19, N'Áo Khoác Bomber', N'jacket_bomber.jpg', CAST(600000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 4)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (20, N'Áo Khoác D?', N'jacket_coat.jpg', CAST(700000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 4)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (21, N'Áo Khoác Da', N'jacket_leather.jpg', CAST(750000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 4)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (22, N'Áo Khoác M?ng', N'jacket_thin.jpg', CAST(650000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 4)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (23, N'Áo Khoác Dài', N'jacket_long.jpg', CAST(800000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 4)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (24, N'Áo Khoác Vest', N'jacket_vest.jpg', CAST(850000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 4)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (25, N'Chân Váy Mixi Ðen', N'skirt_mixi_black.jpg', CAST(200000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (26, N'Chân Váy Mixi Tr?ng', N'skirt_mixi_white.jpg', CAST(210000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (27, N'Chân Váy Mixi Ð?', N'skirt_mixi_red.jpg', CAST(220000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (28, N'Chân Váy Mixi H?ng', N'skirt_mixi_pink.jpg', CAST(230000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (29, N'Chân Váy Mixi Vàng', N'skirt_mixi_yellow.jpg', CAST(240000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (30, N'Chân Váy Mixi Xanh', N'skirt_mixi_blue.jpg', CAST(250000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, NULL)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (31, N'Chân Váy Midi Ðen', N'skirt_midi_black.jpg', CAST(300000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 6)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (32, N'Chân Váy Midi Tr?ng', N'skirt_midi_white.jpg', CAST(310000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 6)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (33, N'Chân Váy Midi Xanh', N'skirt_midi_blue.jpg', CAST(320000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 6)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (34, N'Chân Váy Midi Ð?', N'skirt_midi_red.jpg', CAST(330000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 6)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (35, N'Chân Váy Midi H?ng', N'skirt_midi_pink.jpg', CAST(340000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 6)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (36, N'Chân Váy Midi Vàng', N'skirt_midi_yellow.jpg', CAST(350000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 6)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (37, N'Váy Ôm Body Ðen', N'dress_body_black.jpg', CAST(400000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 7)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (38, N'Váy Ôm Body Tr?ng', N'dress_body_white.jpg', CAST(410000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 7)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (39, N'Váy Ôm Body Ð?', N'dress_body_red.jpg', CAST(420000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 7)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (40, N'Váy Ôm Body Xanh', N'dress_body_blue.jpg', CAST(430000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 7)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (41, N'Váy Ôm Body H?ng', N'dress_body_pink.jpg', CAST(440000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 7)
INSERT [dbo].[Products] ([id], [name], [image], [price], [Createdate], [available], [Categoryid]) VALUES (42, N'Váy Ôm Body Vàng', N'dress_body_yellow.jpg', CAST(450000.00 AS Decimal(10, 2)), CAST(N'2025-02-24T01:21:48.070' AS DateTime), 1, 7)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E6164223BC638]    Script Date: 24/02/2025 6:44:45 CH ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__72E12F1BAD494A02]    Script Date: 24/02/2025 6:44:45 CH ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [activated]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Createdate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [Createdate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[Orderdetails]  WITH CHECK ADD FOREIGN KEY([Orderid])
REFERENCES [dbo].[Orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orderdetails]  WITH CHECK ADD FOREIGN KEY([Productid])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[Categories] ([id])
ON DELETE SET NULL
GO
