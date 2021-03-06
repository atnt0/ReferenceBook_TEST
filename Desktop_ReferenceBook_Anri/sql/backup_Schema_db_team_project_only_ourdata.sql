USE [DB_A69E5E_refbook]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [uniqueidentifier] NOT NULL,
	[ZipCodeId] [int] NULL,
	[CityId] [uniqueidentifier] NULL,
	[StreetId] [uniqueidentifier] NULL,
	[House] [nvarchar](12) NOT NULL,
	[Block] [nvarchar](12) NULL,
	[Apartment] [nvarchar](12) NULL,
	[Latitude] [decimal](22, 18) NULL,
	[Longitude] [decimal](22, 18) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07.11.2020 3:50:03 ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 07.11.2020 3:50:03 ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyName] [nvarchar](256) NOT NULL,
	[ParentCompanyId] [uniqueidentifier] NULL,
	[Director] [nvarchar](256) NOT NULL,
	[DescriptionShort] [nvarchar](200) NULL,
	[DescriptionFull] [nvarchar](2000) NULL,
	[WebSite] [nvarchar](256) NULL,
	[AddressId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompaniesCategories]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesCategories](
	[CompanyCategoryId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompaniesSubcategories]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniesSubcategories](
	[CompanySubcategoryId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[SubcategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanySubcategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[Email] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logos]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logos](
	[PhotoId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[PhoneId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[PhoneNumber] [nvarchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[PhotoId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[FileName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialNets]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialNets](
	[SocialNetId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[SocialNetName] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[SocialNetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 07.11.2020 3:50:03 ******/
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
/****** Object:  Table [dbo].[Subcategories]    Script Date: 07.11.2020 3:50:03 ******/
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
/****** Object:  Table [dbo].[UsersCompanies]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersCompanies](
	[UserCompanyId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[CompanyId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCodes]    Script Date: 07.11.2020 3:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCodes](
	[ZipCodeId] [int] NOT NULL,
	[CityId] [uniqueidentifier] NULL,
	[ZipCode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([StreetId])
REFERENCES [dbo].[Streets] ([StreetId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD FOREIGN KEY([ZipCodeId])
REFERENCES [dbo].[ZipCodes] ([ZipCodeId])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([ParentCompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[CompaniesCategories]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CompaniesCategories]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CompaniesSubcategories]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CompaniesSubcategories]  WITH CHECK ADD FOREIGN KEY([SubcategoryId])
REFERENCES [dbo].[Subcategories] ([SubcategoryId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Logos]  WITH CHECK ADD FOREIGN KEY([PhotoId])
REFERENCES [dbo].[Photos] ([PhotoId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SocialNets]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UsersCompanies]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ZipCodes]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
