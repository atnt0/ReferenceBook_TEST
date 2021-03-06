USE [DB_A69E5E_refbook]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 06.11.2020 23:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [uniqueidentifier] NOT NULL,
	[ZipCode] [int] NULL,
	[CityId] [uniqueidentifier] NULL,
	[StreetId] [uniqueidentifier] NULL,
	[House] [nvarchar](12) NOT NULL,
	[Block] [nvarchar](12) NULL,
	[Apartment] [nvarchar](12) NULL,
	[Latitude] [decimal](22, 18) NULL,
	[Longitude] [decimal](22, 18) NULL,
 CONSTRAINT [PK__Addresse__091C2AFB1B8378E1] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [uniqueidentifier] NOT NULL,
	[CityName] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](256) NOT NULL,
	[ParentCompanyId] [uniqueidentifier] NULL,
	[Director] [nvarchar](256) NULL,
	[DescriptionShort] [nvarchar](200) NULL,
	[DescriptionFull] [nvarchar](2000) NULL,
	[WebSite] [nvarchar](256) NULL,
	[AddressId] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Companie__2D971CAC402D0216] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyCategories]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyCategories](
	[CompanyCategories] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK__CompanyC__394F207D981C4B60] PRIMARY KEY CLUSTERED 
(
	[CompanyCategories] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanySubcategories]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanySubcategories](
	[CompanySubcategories] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[SubcategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanySubcategories] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailsId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[PhonesId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [nvarchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhonesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[PhotoId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[Photo] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialNets]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialNets](
	[SocialNetId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[SocialNetName] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[SocialNetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[StreetId] [uniqueidentifier] NOT NULL,
	[StreetName] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategories]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategories](
	[SubcategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubcategoryName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubcategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCompanies]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCompanies](
	[UserCompaniesId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserCompaniesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCodes]    Script Date: 06.11.2020 23:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCodes](
	[ZipCodeId] [int] NOT NULL,
	[CityId] [uniqueidentifier] NOT NULL,
	[ZipCode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Производители полиграфической продукции')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Производители и поставщики оборудования для полиграфии')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Производители и поставщики расходных материалов')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (9, N'Производители и поставщики бумаги и картона')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId]) VALUES (N'1ab81ad2-193b-46b4-a378-6137a432296e', N'ShopPM', NULL, NULL, N'Стоковый магазин расходных материалов', N'Витратні матеріали та запчастини XEROX. Цифрова друкарська техніка XEROX з пробігом.', N'shop-pm.com.ua', NULL)
INSERT [dbo].[CompanySubcategories] ([CompanySubcategories], [CompanyId], [SubcategoryId]) VALUES (N'9080c6f2-dadf-4726-be99-cd51a0981340', N'1ab81ad2-193b-46b4-a378-6137a432296e', 1)
INSERT [dbo].[CompanySubcategories] ([CompanySubcategories], [CompanyId], [SubcategoryId]) VALUES (N'b08a9177-e309-4daf-a198-e8a839de6a24', N'1ab81ad2-193b-46b4-a378-6137a432296e', 2)
INSERT [dbo].[Emails] ([EmailsId], [CompanyId], [Email]) VALUES (N'144f4bd7-a045-4478-b697-01320f00ba24', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'admin@shop-pm.com.ua')
INSERT [dbo].[Emails] ([EmailsId], [CompanyId], [Email]) VALUES (N'975a1274-a536-43ca-bdd2-ba3aa4197626', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'spm.xerox@gmail.com')
INSERT [dbo].[Phones] ([PhonesId], [CompanyId], [PhoneNumber]) VALUES (N'740c10c5-07d4-4c7b-bdb9-66f4cdca2ea9', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'+380980267963')
INSERT [dbo].[Phones] ([PhonesId], [CompanyId], [PhoneNumber]) VALUES (N'15a6d618-6441-4116-bcff-82815d3bee6a', N'1ab81ad2-193b-46b4-a378-6137a432296e', N'+380980267963')
SET IDENTITY_INSERT [dbo].[Subcategories] ON 

INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (1, N'Запчасти')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (2, N'Ремонт оборудования')
SET IDENTITY_INSERT [dbo].[Subcategories] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK__Addresses__CityI__3C34F16F] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK__Addresses__CityI__3C34F16F]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK__Addresses__Stree__3D2915A8] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Streets] ([StreetId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK__Addresses__Stree__3D2915A8]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK__Addresses__ZipCo__3B40CD36] FOREIGN KEY([ZipCode])
REFERENCES [dbo].[ZipCodes] ([ZipCodeId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK__Addresses__ZipCo__3B40CD36]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK__Companies__Addre__3E1D39E1] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK__Companies__Addre__3E1D39E1]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK__Companies__Paren__03F0984C] FOREIGN KEY([ParentCompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK__Companies__Paren__03F0984C]
GO
ALTER TABLE [dbo].[CompanyCategories]  WITH CHECK ADD  CONSTRAINT [FK__CompanyCa__Categ__07C12930] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[CompanyCategories] CHECK CONSTRAINT [FK__CompanyCa__Categ__07C12930]
GO
ALTER TABLE [dbo].[CompanyCategories]  WITH CHECK ADD  CONSTRAINT [FK__CompanyCa__Compa__06CD04F7] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanyCategories] CHECK CONSTRAINT [FK__CompanyCa__Compa__06CD04F7]
GO
ALTER TABLE [dbo].[CompanySubcategories]  WITH CHECK ADD  CONSTRAINT [FK__CompanySu__Compa__0A9D95DB] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompanySubcategories] CHECK CONSTRAINT [FK__CompanySu__Compa__0A9D95DB]
GO
ALTER TABLE [dbo].[CompanySubcategories]  WITH CHECK ADD FOREIGN KEY([SubcategoryId])
REFERENCES [dbo].[Subcategories] ([SubcategoryId])
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK__Emails__CompanyI__114A936A] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK__Emails__CompanyI__114A936A]
GO
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK__Phones__CompanyI__14270015] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK__Phones__CompanyI__14270015]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK__Photos__CompanyI__0E6E26BF] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK__Photos__CompanyI__0E6E26BF]
GO
ALTER TABLE [dbo].[SocialNets]  WITH CHECK ADD  CONSTRAINT [FK__SocialNet__Compa__17036CC0] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[SocialNets] CHECK CONSTRAINT [FK__SocialNet__Compa__17036CC0]
GO
ALTER TABLE [dbo].[UserCompanies]  WITH CHECK ADD  CONSTRAINT [FK__UserCompa__Compa__19DFD96B] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[UserCompanies] CHECK CONSTRAINT [FK__UserCompa__Compa__19DFD96B]
GO
ALTER TABLE [dbo].[ZipCodes]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
