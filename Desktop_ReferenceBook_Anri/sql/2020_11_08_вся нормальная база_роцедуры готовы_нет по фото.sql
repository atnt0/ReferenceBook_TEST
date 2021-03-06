USE [DB_A69E5E_refbook]
GO
/****** Object:  UserDefinedTableType [dbo].[EmailList]    Script Date: 08.11.2020 10:29:31 ******/
CREATE TYPE [dbo].[EmailList] AS TABLE(
	[Email] [nvarchar](256) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PhoneList]    Script Date: 08.11.2020 10:29:31 ******/
CREATE TYPE [dbo].[PhoneList] AS TABLE(
	[Phone] [nvarchar](13) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SocialNetList]    Script Date: 08.11.2020 10:29:31 ******/
CREATE TYPE [dbo].[SocialNetList] AS TABLE(
	[SocialNetNameId] [int] NULL,
	[SocialNetURL] [nvarchar](2000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[t_List_Text_256]    Script Date: 08.11.2020 10:29:31 ******/
CREATE TYPE [dbo].[t_List_Text_256] AS TABLE(
	[Content] [nvarchar](256) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_NewGuid]    Script Date: 08.11.2020 10:29:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_NewGuid]()
	RETURNS UNIQUEIDENTIFIER
	AS BEGIN
	RETURN (SELECT TOP 1 ID FROM GetNEWID)
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_CreateEmail]    Script Date: 08.11.2020 10:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[ufn_CreateEmail]
(
	@Name nvarchar(256)
	, @CompanyId uniqueidentifier
)
returns uniqueidentifier
as
begin
	declare @resultId uniqueidentifier;

	declare @countRows int = 0;
	(select @countRows = COUNT(em.EmailId) from dbo.Emails as em where em.Email = @Name)
	
	--if( @countRows != 0 )
	--	begin
	--		set @resultId = (select top 1 em.EmailId from dbo.Emails as em where em.Email = @Name)
	--		return @resultId
	--	end
	--else
	--	begin
			--set @resultId = '5fabd00a-365c-4385-86e6-26bac3345230';
			--declare @CompanyId uniqueidentifier = null;
			--declare @Name nvarchar(500) = N'kjhakjwrg@aergvaerg.com';
			--declare @resultId uniqueidentifier;
			--declare @InsertedIdResults table (ID uniqueidentifier);
			--declare @NewGuid uniqueidentifier = NEWID();
			--declare @DateNow Datetime = GETDATE()

			--insert into dbo.Emails(EmailId, Email, CompanyId, CreatedOn) 
				
			--	output Inserted.EmailId into @InsertedIdResults 
			--	values (@NewGuid, @Name, @CompanyId, @DateNow)

			--insert into dbo.Emails(EmailId)  --, CompanyId, Email, CreatedOn
				--output Inserted.EmailId into @InsertedIdResults 
				--values (@NewGuid) -- , @CompanyId, @Name, @dateTime

			--set @resultId = (select top 1 ID from @InsertedIdResults)
			--set @resultId = @NewGuid
			--set @resultId = @NewGuid
			--select @resultId
	--		return @resultId
	---	end
	return '5fabd00a-365c-4385-86e6-26bac3345230';
end
GO
/****** Object:  View [dbo].[GetNEWID]    Script Date: 08.11.2020 10:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetNEWID] AS
	SELECT NEWID() ID
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08.11.2020 10:29:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [uniqueidentifier] NOT NULL,
	[ZipCodeId] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 08.11.2020 10:29:33 ******/
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
	[Popularity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompaniesCategories]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[CompaniesSubcategories]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Emails]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Logos]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Phones]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Photos]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[SocialNetNames]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialNetNames](
	[SocialNetNameId] [int] IDENTITY(1,1) NOT NULL,
	[SocialNetName] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[SocialNetNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialNets]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialNets](
	[SocialNetId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CompanyId] [uniqueidentifier] NULL,
	[SocialNetURL] [nvarchar](500) NULL,
	[SocialNetNameId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SocialNetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[Subcategories]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[UsersCompanies]    Script Date: 08.11.2020 10:29:33 ******/
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
/****** Object:  Table [dbo].[ZipCodes]    Script Date: 08.11.2020 10:29:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCodes](
	[ZipCodeId] [uniqueidentifier] NOT NULL,
	[CityId] [uniqueidentifier] NULL,
	[ZipCode] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'3.1.9')
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'04f2ae1d-c234-4e0b-8aff-0301a1926c1e', N'c7c17e8e-6da5-43f0-bb6c-c117c1bc08ba', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'17', N'', N'', CAST(67.000000000000000000 AS Decimal(22, 18)), CAST(45.000000000000000000 AS Decimal(22, 18)))
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'1e2daf83-5be1-4e09-a77a-2d239c5776f6', NULL, N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'99b2149a-d459-491b-aeeb-56e6977546d5', N'2/1', N'', N'41', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'bf8fc5ec-e926-48df-a281-697707c9cf87', N'121c57a2-bcae-487a-a1f4-a4bd0484014f', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'13', N'', N'', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'd5ddc663-f766-4171-9853-6dd2af0b7c7c', N'53b4cc95-4a41-41f4-ab53-5a3be78a96ec', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'15', N'', N'', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'8dd7f782-825e-4392-8d59-777e1c491a00', N'e0fcdcc8-a96b-4cb6-8c98-8c350f91b8d1', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'14', N'', N'', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'ed2392ab-e62e-404b-aa1d-8581681c2f5a', NULL, N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'2fb7ae3c-6471-424f-b9ee-51f5b7e06de3', N'40', N'', N'408', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'05c365bf-9132-4801-a89a-bb60614f5e95', NULL, N'4d1d03a1-6fa0-42d5-9aa7-c2d432794d5b', N'476b272f-abdc-41d6-adfb-c196344bcd25', N'21', N'Г', N'', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'b4ee7155-36c5-46d6-990c-be24c4ad7854', NULL, N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'9ec23e4a-7ee2-442f-9836-7711d5fe88c5', N'28/2', N'', N'43', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'd4059465-eaad-4d1b-8bc7-c06d8c041e41', NULL, N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'11', N'', N'', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'4108e244-3052-4de4-8e02-da2c5408243f', NULL, N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'12', N'', N'', NULL, NULL)
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'46343260-c8c1-4310-853a-de62e563a7df', N'c443bebb-d927-4264-a902-f62186f779a4', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'16', N'', N'', CAST(67.000000000000000000 AS Decimal(22, 18)), CAST(45.000000000000000000 AS Decimal(22, 18)))
INSERT [dbo].[Addresses] ([AddressId], [ZipCodeId], [CityId], [StreetId], [House], [Block], [Apartment], [Latitude], [Longitude]) VALUES (N'608fb2e0-21dc-4365-89bd-ea57b789af8d', N'b9a38fe8-512a-4734-bcea-f090ac6de5e3', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'6c31603c-7955-4b21-a322-d0ed468861fd', N'147', N'3567', N'45', CAST(67.000000000000000000 AS Decimal(22, 18)), CAST(45.000000000000000000 AS Decimal(22, 18)))
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1fd4c7c5-0a46-4644-ae01-f82814564eca', N'Admin', N'ADMIN', N'574a0095-24d4-4aa9-af9c-deb42d4f4ddc')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'223bcceb-847a-4f48-9bcf-73cb11dfdbff', N'Editor', N'EDITOR', N'2d5d9415-f377-4afe-95e4-13db37ea5a7f')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'574fbea2-1313-4ecc-a826-4aca5bb8ec61', N'Client', N'CLIENT', N'0b11c4bb-cffd-4230-b728-cba9513c8812')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5CB92508-2C05-4E5A-804B-35D2EA431690', N'User', N'USER', N'A7CA47EB-69C3-4F18-B04C-FC990F508FC0')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a784fe3c-e73c-41cc-bef4-17f67dc2492b', N'ClientCompany', N'CLIENTCOMPANY', N'ab9549b0-2210-450a-b7bb-afc8a41d674e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2222ea45-2949-4bf1-8970-cd1cad69eede', N'1fd4c7c5-0a46-4644-ae01-f82814564eca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'87bc3de5-4fa4-479c-905e-c6ad9e6c19fa', N'1fd4c7c5-0a46-4644-ae01-f82814564eca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2e61012a-f021-41af-833a-0f3ed72990a1', N'5CB92508-2C05-4E5A-804B-35D2EA431690')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c095c9cf-042c-4c7e-95a0-3f73eb88e17b', N'5CB92508-2C05-4E5A-804B-35D2EA431690')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e78a25d0-6977-47a5-a4b5-63d8c17f4418', N'5CB92508-2C05-4E5A-804B-35D2EA431690')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2222ea45-2949-4bf1-8970-cd1cad69eede', N'rrrrrr5@gmail.com', N'RRRRRR5@GMAIL.COM', N'rrrrrr5@gmail.com', N'RRRRRR5@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEK1cEscSzrl4LNzGiU1w/8eV0QqxXohVmPBmTF+gXXPNZBNu8MM6Xlbn9ld6Q/8RkA==', N'BZMWNQLHCEZVAWBKYJKDL5PMI352EOBY', N'32164ff7-206f-40d9-a5f5-723f1cff6865', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2e61012a-f021-41af-833a-0f3ed72990a1', N'vvvvvvvv5@gmail.com', N'VVVVVVVV5@GMAIL.COM', N'vvvvvvvv5@gmail.com', N'VVVVVVVV5@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGez/QrxaOPvaPQLKS2MsD//MhweQ2myVvIdu3erLJfVIKmdV5DSsnWt3JI7tbq4Bg==', N'WKG2OZ5BQ4A5H2V5ZLSEKMKNJMJABFUD', N'961accc2-2cc7-4105-9a6d-aca82a82037c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'87bc3de5-4fa4-479c-905e-c6ad9e6c19fa', N'vasyaxhd5@gmail.com', N'VASYAXHD5@GMAIL.COM', N'vasyaxhd5@gmail.com', N'VASYAXHD5@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAshHtB+5ERxszCRn03AkaA3Kz1923L+hGiS6oKU8j4Q9SP7Qm6UmFSEmoDjWObGNg==', N'ZE6UJLGTG6IGGPKQCTGYZC2BIA2IUCU4', N'acc6a2b8-c485-44f9-b884-7d0269e0579d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c095c9cf-042c-4c7e-95a0-3f73eb88e17b', N'weqweq@gmail.com', N'WEQWEQ@GMAIL.COM', N'weqweq@gmail.com', N'WEQWEQ@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEXAtznCrkIgWkznVRThJ92A3EnbwvKi43v2NT5hqEEHb2GhaZf7NJbxnKWvHkpsRg==', N'UMPGXBVGN3NLEFZWWW7QRBM6LUH26WOB', N'53855531-8aef-49ac-8d05-0e902d381cc1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e78a25d0-6977-47a5-a4b5-63d8c17f4418', N'weqqweq@gmail.com', N'WEQQWEQ@GMAIL.COM', N'weqqweq@gmail.com', N'WEQQWEQ@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDfBsxz5yw1QdS4YWhQDOYua5yXEt6ROmtXZS9yiwpsLowkAQv+F5Ui8RVbBMjTSew==', N'2W3QJ2XDQNHXNH4GGK4DJ25XKYWWHOEO', N'63945221-8efa-40cb-a847-bff955a18645', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Производители полиграфической продукции')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Производители и поставщики оборудования для полиграфии')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Производители и поставщики расходных материалов')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Производители и поставщики бумаги и картона')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Производители и поставщики маркеров для выделения текста')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Производители и поставщики молочной продукции')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Производители и поставщики фабрик')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'Киев')
INSERT [dbo].[Cities] ([CityId], [CityName]) VALUES (N'4d1d03a1-6fa0-42d5-9aa7-c2d432794d5b', N'Киевфффfff')
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'da19e73e-3648-434a-8bcf-3e98fcec1250', CAST(N'2020-11-07T17:34:58.803' AS DateTime), N'Е-Консалтинг, ДП', NULL, N'Виктор Иванович Козак', N'', N'', N'', NULL, 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'382458e5-88ba-4d74-897f-49750b2dbe8b', CAST(N'2020-11-07T11:14:19.423' AS DateTime), N'Баленко, ЧП', NULL, N'Борис Федорович Баленко', N'', N'', N'', NULL, 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'a73fe10f-45a1-48d2-beee-69cd1d760838', CAST(N'2020-11-07T11:14:19.533' AS DateTime), N'Босфор-центр, ООО', NULL, N'Ляман Али-заде', N'', N'', N'', N'ed2392ab-e62e-404b-aa1d-8581681c2f5a', 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'76d84457-61ab-4323-99ce-853b9c8eb288', CAST(N'2020-11-07T11:14:19.577' AS DateTime), N'Брен Фишка, СПД', NULL, N'Дмитрий Владимирович Шечук', N'', N'', N'', NULL, 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'ded04e10-c8a6-4001-aa61-9df1925c60d9', CAST(N'2020-11-07T11:14:19.610' AS DateTime), N'Бюро Графических Технологий, ООО', NULL, N'Игорь Иванович Сыромятников', N'', N'', N'', N'b4ee7155-36c5-46d6-990c-be24c4ad7854', 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'6d2e1118-568e-4e67-8527-a7e34db977ca', CAST(N'2020-11-07T22:56:40.687' AS DateTime), N'Е-Консалтинг, ДП++1', NULL, N'Виктор Иванович Козак ++1', N'Короткое описание для компании', N'Полное описание компании', N'https://e-consulting.com.ua/', N'05c365bf-9132-4801-a89a-bb60614f5e95', 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', CAST(N'2020-11-07T11:14:19.597' AS DateTime), N'Бьютхер Юкрайн, ООО', NULL, N'Юрий Романович Гураль', N'', N'', N'', NULL, 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'096cb008-b96f-406a-b993-e0d612233d05', CAST(N'2020-11-07T23:41:35.587' AS DateTime), N'ЗИКО Укр, ООО', NULL, N'Юлия Юрьевна Калашникова', N'Короткое описание для компании', N'Полное описание компании', N'https://e-consulting.com.ua/', N'608fb2e0-21dc-4365-89bd-ea57b789af8d', 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'ce7475d4-2301-407e-ac6c-ed8258387f85', CAST(N'2020-11-07T11:14:19.503' AS DateTime), N'Бест Принт, ЧП', NULL, N'Сергей Николаевич Таленко', N'', N'', N'', N'1e2daf83-5be1-4e09-a77a-2d239c5776f6', 0)
INSERT [dbo].[Companies] ([CompanyId], [CreatedOn], [CompanyName], [ParentCompanyId], [Director], [DescriptionShort], [DescriptionFull], [WebSite], [AddressId], [Popularity]) VALUES (N'd9fd6aed-bafb-4a5f-904e-f04c43246374', CAST(N'2020-11-07T11:14:19.590' AS DateTime), N'Булат Флеско, ЧП', NULL, N'Леонид Семенович Колеенко', N'', N'', N'', NULL, 0)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'b612b8a8-58f6-4fa5-bf7e-1b38ede8f64b', N'd9fd6aed-bafb-4a5f-904e-f04c43246374', 7)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'7392d1b4-8d5d-4a0f-97dd-2a173968c7d8', N'382458e5-88ba-4d74-897f-49750b2dbe8b', 3)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'5314693e-e721-45fb-80c3-2c29426de987', N'096cb008-b96f-406a-b993-e0d612233d05', 2)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'b999cd40-2ba4-4ec7-a14d-31262b602856', N'da19e73e-3648-434a-8bcf-3e98fcec1250', 2)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'f4ae536a-1e03-4c52-8a3b-4b734211f51b', N'ded04e10-c8a6-4001-aa61-9df1925c60d9', 2)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'a107f1b0-a3a3-4bc4-8e19-67419e137c65', N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', 7)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'e9e4677f-9a41-470e-acec-82d2de5d2f79', N'a73fe10f-45a1-48d2-beee-69cd1d760838', 1)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'bce5767e-eea6-4971-a85c-96d8d0488e5e', N'76d84457-61ab-4323-99ce-853b9c8eb288', 1)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'afda0a15-f5b5-4df0-9a51-c28cdefd3c00', N'6d2e1118-568e-4e67-8527-a7e34db977ca', 2)
INSERT [dbo].[CompaniesCategories] ([CompanyCategoryId], [CompanyId], [CategoryId]) VALUES (N'6ef83622-7ab3-40dd-81d7-ecc8c9b92bbd', N'ce7475d4-2301-407e-ac6c-ed8258387f85', 5)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'2385e331-52c0-47d9-9027-06ccde0c1634', N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', 3)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'a5343731-fb59-48d9-b5c4-06df72ee9fc1', N'382458e5-88ba-4d74-897f-49750b2dbe8b', 1)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'2a34b979-f0f1-4287-a8cf-274b1dcc81b6', N'096cb008-b96f-406a-b993-e0d612233d05', 11)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'47719abc-6598-4bc8-ac9f-373e31a78204', N'ce7475d4-2301-407e-ac6c-ed8258387f85', 6)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'5aafe3c5-bf29-4a02-b8ba-66e09a5c075f', N'a73fe10f-45a1-48d2-beee-69cd1d760838', 2)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'1c055a85-bc3d-49d5-8d90-75986f5c09d1', N'76d84457-61ab-4323-99ce-853b9c8eb288', 3)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'e5aa0991-f652-4aed-9c43-97ca77ca586d', N'd9fd6aed-bafb-4a5f-904e-f04c43246374', 5)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'863f5c4d-e364-4969-b3d5-b1288cecf196', N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', 5)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'e19c7ee6-a3cf-4b4a-8785-b36be0db80b4', N'382458e5-88ba-4d74-897f-49750b2dbe8b', 8)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'a6a02da8-5ed6-4119-893c-be3c347fe707', N'6d2e1118-568e-4e67-8527-a7e34db977ca', 11)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'880f84e1-ac79-4a11-99a4-dc77e95d7302', N'ded04e10-c8a6-4001-aa61-9df1925c60d9', 5)
INSERT [dbo].[CompaniesSubcategories] ([CompanySubcategoryId], [CompanyId], [SubcategoryId]) VALUES (N'0a313bbf-61e9-4c57-bb64-e7e7c883d6d4', N'76d84457-61ab-4323-99ce-853b9c8eb288', 1)
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'b63c463b-59bf-4d5f-b781-0668045561d3', CAST(N'2020-11-07T22:48:09.983' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'62eaa51f-732b-4997-8432-067c3c05f3a5', CAST(N'2020-11-07T23:46:13.170' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'3d205deb-0efc-45db-ad69-0c8d6953bda8', CAST(N'2020-11-07T13:55:14.213' AS DateTime), NULL, N'kjhakjwrg@aergvaerg.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'd5d7aaac-729f-472b-a976-103ee2d1fd44', CAST(N'2020-11-07T23:38:45.350' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'636b323d-990a-494b-8bba-181fc2552252', CAST(N'2020-11-07T23:27:24.633' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'b2a42cab-d4e1-4247-ba6e-1820a74bbe74', CAST(N'2020-11-07T11:14:19.447' AS DateTime), N'382458e5-88ba-4d74-897f-49750b2dbe8b', N'pack@balenko.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'7dc689c8-cddd-4a4b-bed8-2ce6b92ea52b', CAST(N'2020-11-07T23:50:59.420' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'f39bf45c-8666-49a2-8fc9-3d65214b45fb', CAST(N'2020-11-07T23:50:10.800' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'58e6b19c-2e2f-4d6a-a7b0-407efc27f9d3', CAST(N'2020-11-07T22:04:59.213' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'c02ff13f-cb5f-4574-989c-4ad189304684', CAST(N'2020-11-07T23:22:12.007' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'd97dea83-d315-4829-96ab-555a062140ea', CAST(N'2020-11-07T23:49:37.483' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'04c39d11-79bc-49c4-83ad-59003012966e', CAST(N'2020-11-07T23:32:47.737' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'016f021a-14a0-4006-a1e5-6301c4eef0e4', CAST(N'2020-11-07T11:14:19.507' AS DateTime), N'ce7475d4-2301-407e-ac6c-ed8258387f85', N'5013198@urk.net')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'05cd95db-ce65-469e-94ad-68241b0007ca', CAST(N'2020-11-07T23:26:40.500' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'1c12277e-f2e1-4da9-97d6-6b83983c7cc2', CAST(N'2020-11-07T13:40:18.230' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'1MegaMail@gmail.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'f6317e08-251c-4db1-bd11-6e0bd0c7616b', CAST(N'2020-11-07T13:55:10.213' AS DateTime), NULL, N'kjhakjwrg@aergvaerg.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'290ec675-9c10-4d99-9603-6f92c8d5dc30', CAST(N'2020-11-07T23:36:41.423' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'aca80aa8-6afc-4428-b33b-7a5c0f987e52', NULL, NULL, N'MegaMail@gmail.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'aca80aa8-6afc-4428-b33b-7a5c0f987e53', CAST(N'2020-11-07T13:37:06.953' AS DateTime), NULL, N'1MegaMail@gmail.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'd1ac2280-fc6c-4fe9-9142-7d8b94b95d99', CAST(N'2020-11-07T11:14:19.617' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'inf@bgt.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'46f13642-5c53-4083-9639-826c6a3f221b', CAST(N'2020-11-07T13:55:12.887' AS DateTime), NULL, N'kjhakjwrg@aergvaerg.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'eb917e73-ce6b-4c27-8435-862b9cc1d02a', CAST(N'2020-11-08T00:05:13.837' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'f716aebd-c6a4-4039-868e-8d1b6c9aa23e', CAST(N'2020-11-07T11:14:19.580' AS DateTime), N'76d84457-61ab-4323-99ce-853b9c8eb288', N'fishka@ukr.net')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'5318be6e-2dc0-4631-8b16-994a8ab071e9', CAST(N'2020-11-07T23:41:35.600' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'db2238bb-1b06-41da-9d57-9c688d2413ea', CAST(N'2020-11-07T23:39:48.270' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'5ea62897-c83f-402f-a629-a05d41603f0d', CAST(N'2020-11-07T23:27:35.130' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'76229e05-49ed-4a23-a19d-a1fe20975ed8', CAST(N'2020-11-07T13:40:15.113' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'1MegaMail@gmail.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'ba7d5cd3-3fbf-4c53-b294-a243dce37530', CAST(N'2020-11-08T00:21:37.973' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'579ec941-5690-426e-bfdc-a4ca4f07e985', CAST(N'2020-11-07T23:50:29.737' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'd01400fd-08f4-4af1-ad63-a7b4537e878b', CAST(N'2020-11-07T23:46:38.787' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'37bca7f6-6a68-44c6-b139-aa2662af765b', CAST(N'2020-11-08T00:01:55.463' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'f17e2aae-0c41-4b5a-893b-ac6dc82174ed', CAST(N'2020-11-07T11:14:19.533' AS DateTime), N'a73fe10f-45a1-48d2-beee-69cd1d760838', N'info@bosphorus-center.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'bb589bc4-7f65-4408-9409-b70e3ff23897', CAST(N'2020-11-07T22:48:11.483' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'b7663b89-d220-404b-a204-b9044123e768', CAST(N'2020-11-08T00:19:45.623' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'e816daf3-3b37-4e1e-ae01-b9f44670cce2', CAST(N'2020-11-08T00:19:33.083' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'd525233b-c3dd-497a-9074-bb15a6fef1f9', CAST(N'2020-11-07T23:51:24.770' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'aec93624-2655-4c50-832d-bc62fe23151b', CAST(N'2020-11-07T13:40:16.350' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'1MegaMail@gmail.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'eac506a8-143f-49c0-a4e5-c392404c6ebe', CAST(N'2020-11-07T13:55:11.493' AS DateTime), NULL, N'kjhakjwrg@aergvaerg.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'e72961b3-57f3-4774-8a04-c4dc9dcf5ac4', CAST(N'2020-11-07T23:24:48.080' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'47cd0034-65c0-465c-bbf7-ce62439db9e2', CAST(N'2020-11-07T21:56:56.813' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'17eb3805-3615-4b4a-b1d5-cebd958e0178', CAST(N'2020-11-07T23:30:49.080' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'e64a3acc-3614-4657-a9c2-cee0a363b109', CAST(N'2020-11-07T21:57:35.997' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'2360b205-0bc7-45c5-a7fd-d2eec62be9ee', CAST(N'2020-11-07T23:23:18.633' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'576251c0-16de-4978-a149-e4dd3f41a964', CAST(N'2020-11-07T22:56:40.703' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'083fd190-0baa-4bf6-acab-e89b7c27ad83', CAST(N'2020-11-07T13:55:08.683' AS DateTime), NULL, N'kjhakjwrg@aergvaerg.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'85db3941-9560-4bf2-ac1b-e8ae5bd444b0', CAST(N'2020-11-07T13:40:17.347' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'1MegaMail@gmail.com')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'f7a9689d-a5ee-4371-95a5-ed20a1558a01', CAST(N'2020-11-07T23:40:30.023' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'10d967a2-0154-4cc7-8274-f0ad782148c3', CAST(N'2020-11-07T11:14:19.597' AS DateTime), N'd9fd6aed-bafb-4a5f-904e-f04c43246374', N'bulat_flex@ukr.net')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'4d2e93f2-683c-465e-ac63-f168299aed33', CAST(N'2020-11-07T11:14:19.603' AS DateTime), N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', N'office@bottcher.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'6911b30d-d6b8-47d0-9562-f4b603ae9556', CAST(N'2020-11-07T21:56:55.247' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'a2048c82-f1ec-492a-9c89-f51b9c2dac73', CAST(N'2020-11-07T23:11:14.593' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Emails] ([EmailId], [CreatedOn], [CompanyId], [Email]) VALUES (N'23f6658d-3723-4990-a2f9-f65e08583c99', CAST(N'2020-11-07T22:48:35.207' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'e-consulting@e-consulting.com.ua')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'd8081f3f-cc7f-469e-94bf-00a95ef179f4', CAST(N'2020-11-07T23:50:29.733' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'b8f2f5b1-8d69-4ead-86b9-059eb92d14af', CAST(N'2020-11-07T21:56:56.813' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'd80902de-d166-44b4-9ae2-1050a071deb9', CAST(N'2020-11-07T12:32:57.303' AS DateTime), N'382458e5-88ba-4d74-897f-49750b2dbe8b', N'+380445010802')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'c26eeb6f-a85a-484f-9d4e-1134794a2bc0', CAST(N'2020-11-07T12:32:57.320' AS DateTime), N'a73fe10f-45a1-48d2-beee-69cd1d760838', N'+380443901190')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'2e02e6f0-95ae-4c64-9274-14310adcb06d', CAST(N'2020-11-07T23:49:37.483' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'0025ee33-fab6-4871-b263-184aa9513959', CAST(N'2020-11-07T23:36:41.423' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'84a4ead2-693f-4ac7-b848-1bb9ff291141', CAST(N'2020-11-07T21:56:55.243' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'd22939bd-aade-4f54-8f19-1c3135a75b4f', CAST(N'2020-11-07T12:52:36.623' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'+380445924790')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'b76bc6ea-84a5-4120-a51b-1cfac97f41dc', CAST(N'2020-11-07T23:50:10.800' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'a3bb0eb6-8ed3-42f8-902a-254128cdcce9', CAST(N'2020-11-08T00:05:13.837' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'6bfaa503-c6b9-487b-adcf-38165231a5b4', CAST(N'2020-11-07T23:27:35.130' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'2d6a9af5-c8fd-47d7-ba8f-3b4721f6dd94', CAST(N'2020-11-07T12:52:36.617' AS DateTime), N'a73fe10f-45a1-48d2-beee-69cd1d760838', N'+380443901190')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'a50db6da-8f9e-4c70-a5ca-403b30d09925', CAST(N'2020-11-07T23:38:45.350' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'8afe6789-a060-45f8-a159-4e64c4e62ca7', CAST(N'2020-11-07T23:24:48.080' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'2c393b45-5edb-41e9-aded-531f4e2cf26b', CAST(N'2020-11-07T11:14:19.620' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'+380445924790')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'3ce08b22-4918-4b1b-afe2-576afa85a56c', CAST(N'2020-11-07T11:14:19.463' AS DateTime), N'382458e5-88ba-4d74-897f-49750b2dbe8b', N'+380445010802')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'559de58a-95e5-49f3-9eb7-613eaff9e005', CAST(N'2020-11-07T23:46:13.167' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'71f9c806-b078-496e-bb72-627e3ec736de', CAST(N'2020-11-07T12:32:57.317' AS DateTime), N'ce7475d4-2301-407e-ac6c-ed8258387f85', N'+380445013198')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'ace145cb-b83b-423a-bbca-654684070f0c', CAST(N'2020-11-07T12:32:57.323' AS DateTime), N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', N'+380445138009')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'52e57214-a606-4eec-8fbe-6953c5f16d89', CAST(N'2020-11-07T23:50:59.420' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'df2162a6-fc11-4493-a7c2-7ba338fdf09b', CAST(N'2020-11-07T11:14:19.597' AS DateTime), N'd9fd6aed-bafb-4a5f-904e-f04c43246374', N'+380673920790')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'3512874f-0d4f-41f4-b80e-7e706e8dcd59', CAST(N'2020-11-07T22:48:11.483' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'9ad35d26-2bde-4736-b94f-7eb0c8ddde0b', CAST(N'2020-11-07T12:32:57.320' AS DateTime), N'76d84457-61ab-4323-99ce-853b9c8eb288', N'+380679300054')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'b62a2ada-3c29-4565-9fad-899079df9744', CAST(N'2020-11-07T23:51:24.770' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'3763ec0f-471f-4331-8dd3-8e795ad2df79', CAST(N'2020-11-07T23:30:49.080' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'd52232db-0388-45ab-b567-90c6172b186e', CAST(N'2020-11-07T22:04:59.213' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'ee037f8e-bd75-4fb2-b0d6-9220fdb7772b', CAST(N'2020-11-08T00:19:33.080' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'880e0d00-3b0e-4c87-be0e-9327ac5e7500', CAST(N'2020-11-07T23:39:48.270' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'f46cf7bd-c04b-4eec-9bc8-958813db533c', CAST(N'2020-11-08T00:19:45.620' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'653f086f-a763-47be-8d6e-95fbda7d9218', CAST(N'2020-11-07T23:41:35.600' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'1fae1b28-354c-497e-830e-97adbe882a0c', CAST(N'2020-11-07T22:48:35.207' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'00e6f8cc-c72a-4969-ac1e-989c58351243', CAST(N'2020-11-07T12:52:36.613' AS DateTime), N'ce7475d4-2301-407e-ac6c-ed8258387f85', N'+380445013198')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'50d24965-f217-4857-9103-99a4acf77816', CAST(N'2020-11-07T12:52:36.620' AS DateTime), N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', N'+380445138009')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'583fb153-b298-43df-b867-9ae40c26d011', CAST(N'2020-11-08T00:21:37.970' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'00f1126f-2d10-44f4-bc1d-a0b0c15cd2dd', CAST(N'2020-11-07T23:40:30.023' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'8424f1c1-691c-4c5e-965c-a16c2f217c51', CAST(N'2020-11-07T12:52:36.620' AS DateTime), N'd9fd6aed-bafb-4a5f-904e-f04c43246374', N'+380673920790')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'0a02506f-7e6d-46c2-8352-a4841df32163', CAST(N'2020-11-07T11:14:19.607' AS DateTime), N'd5093a3c-831d-4b4b-ad21-aca1efa5cd60', N'+380445138009')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'95be1b9e-23bb-4431-b427-a4a949b1e3d2', CAST(N'2020-11-07T23:23:18.630' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'dcf603be-ef11-4cba-a3b7-a7b57a5734b7', CAST(N'2020-11-07T23:11:14.590' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'5e87ccad-14e0-402f-8c6d-a88dd6211dda', CAST(N'2020-11-07T11:14:19.510' AS DateTime), N'ce7475d4-2301-407e-ac6c-ed8258387f85', N'+380445013198')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'966c533a-1501-486a-9b94-add9167198e7', CAST(N'2020-11-07T12:52:36.617' AS DateTime), N'76d84457-61ab-4323-99ce-853b9c8eb288', N'+380679300054')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'6b8feefd-f1a3-4446-b87e-af4c62c1cb6b', CAST(N'2020-11-07T23:46:38.783' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'd6a22fd6-a6d5-43cf-8134-b309f197fede', CAST(N'2020-11-07T23:32:47.737' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'71e24504-1d2c-4457-9d34-b51aab9db94f', CAST(N'2020-11-08T00:01:55.460' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'6e8bc74e-7c87-4a81-ae6c-bfe95fe4c67f', CAST(N'2020-11-07T21:57:35.993' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'9e108c9a-462c-47d1-9ae6-d600ce136388', CAST(N'2020-11-07T23:22:12.003' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'6214c588-5129-4faf-8d6d-d603e17249ca', CAST(N'2020-11-07T12:32:57.323' AS DateTime), N'd9fd6aed-bafb-4a5f-904e-f04c43246374', N'+380673920790')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'e70bd1f0-8a95-4e5a-8186-d617af60138a', CAST(N'2020-11-07T11:14:19.533' AS DateTime), N'a73fe10f-45a1-48d2-beee-69cd1d760838', N'+380443901190')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'0071e579-7d3e-4fc6-8b00-d6f6fd5ad601', CAST(N'2020-11-07T12:32:57.327' AS DateTime), N'ded04e10-c8a6-4001-aa61-9df1925c60d9', N'+380445924790')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'0f2ba129-02fc-4290-ba82-e9af0dc7d555', CAST(N'2020-11-07T23:27:24.633' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'f1a628b0-4f60-487b-b7be-ecbd62beeb84', CAST(N'2020-11-07T12:52:36.607' AS DateTime), N'382458e5-88ba-4d74-897f-49750b2dbe8b', N'+380445010802')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'45a44819-528d-4b54-a581-efdc9fd3330d', CAST(N'2020-11-07T22:56:40.703' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'5a1ab5a7-6cff-463a-9de8-f7a08be6c91f', CAST(N'2020-11-07T22:48:09.983' AS DateTime), N'da19e73e-3648-434a-8bcf-3e98fcec1250', N'+380445027777')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'3151b25b-887e-426a-ac0a-f819cb75aaac', CAST(N'2020-11-07T11:14:19.587' AS DateTime), N'76d84457-61ab-4323-99ce-853b9c8eb288', N'+380679300054')
INSERT [dbo].[Phones] ([PhoneId], [CreatedOn], [CompanyId], [PhoneNumber]) VALUES (N'3d9c8606-b015-445d-83f1-fc4317c22d68', CAST(N'2020-11-07T23:26:40.493' AS DateTime), N'6d2e1118-568e-4e67-8527-a7e34db977ca', N'+380445027777')
SET IDENTITY_INSERT [dbo].[SocialNetNames] ON 

INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (1, N'YouTube')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (2, N'ВКонтакте')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (3, N'Одноклассники')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (4, N'Telegram')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (5, N'Facebook')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (6, N'Twitter')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (7, N'Instagram')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (8, N'Ask.fm')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (9, N'LinkedIn')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (10, N'LiveJournal')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (11, N'MySpace')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (12, N'Pinterest')
INSERT [dbo].[SocialNetNames] ([SocialNetNameId], [SocialNetName]) VALUES (13, N'Reddit')
SET IDENTITY_INSERT [dbo].[SocialNetNames] OFF
INSERT [dbo].[SocialNets] ([SocialNetId], [CreatedOn], [CompanyId], [SocialNetURL], [SocialNetNameId]) VALUES (N'fe29d695-a0ed-43e7-b017-29ff02c7bc4b', CAST(N'2020-11-08T00:21:37.973' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'https://vk.com/e-consulting', 1)
INSERT [dbo].[SocialNets] ([SocialNetId], [CreatedOn], [CompanyId], [SocialNetURL], [SocialNetNameId]) VALUES (N'274231f9-e930-47bc-9d13-56ca760ced7e', CAST(N'2020-11-08T00:19:33.087' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'https://vk.com/e-consulting', 1)
INSERT [dbo].[SocialNets] ([SocialNetId], [CreatedOn], [CompanyId], [SocialNetURL], [SocialNetNameId]) VALUES (N'b18c51d4-ba3e-4a4b-9f7e-9e2cf658842c', CAST(N'2020-11-08T00:19:45.623' AS DateTime), N'096cb008-b96f-406a-b993-e0d612233d05', N'https://vk.com/e-consulting', 1)
INSERT [dbo].[Streets] ([StreetId], [StreetName]) VALUES (N'2fb7ae3c-6471-424f-b9ee-51f5b7e06de3', N'ул. Ушинского')
INSERT [dbo].[Streets] ([StreetId], [StreetName]) VALUES (N'99b2149a-d459-491b-aeeb-56e6977546d5', N'ул. Алма-Антинская')
INSERT [dbo].[Streets] ([StreetId], [StreetName]) VALUES (N'9ec23e4a-7ee2-442f-9836-7711d5fe88c5', N'ул. Гружевского')
INSERT [dbo].[Streets] ([StreetId], [StreetName]) VALUES (N'476b272f-abdc-41d6-adfb-c196344bcd25', N'ул. Дегтяревская')
INSERT [dbo].[Streets] ([StreetId], [StreetName]) VALUES (N'6c31603c-7955-4b21-a322-d0ed468861fd', N'ул. Е. Сверстюка')
SET IDENTITY_INSERT [dbo].[Subcategories] ON 

INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (1, N'Допечатные услуги и услуги по печати')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (2, N'Послепечатные услуги')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (3, N'Полиграфическая продукция')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (4, N'Допечатное оборудование')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (5, N'Программное обеспечение и медийная обработка')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (6, N'Печатное оборудование')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (7, N'Послепечатное оборудование')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (8, N'Оборудование для обеспечения инфраструктуры типографий')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (9, N'Расходные материалы')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (10, N'Бумага')
INSERT [dbo].[Subcategories] ([SubcategoryId], [SubcategoryName]) VALUES (11, N'Разработка програмного обеспечения.')
SET IDENTITY_INSERT [dbo].[Subcategories] OFF
INSERT [dbo].[ZipCodes] ([ZipCodeId], [CityId], [ZipCode]) VALUES (N'53b4cc95-4a41-41f4-ab53-5a3be78a96ec', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'02006')
INSERT [dbo].[ZipCodes] ([ZipCodeId], [CityId], [ZipCode]) VALUES (N'e0fcdcc8-a96b-4cb6-8c98-8c350f91b8d1', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'2005')
INSERT [dbo].[ZipCodes] ([ZipCodeId], [CityId], [ZipCode]) VALUES (N'121c57a2-bcae-487a-a1f4-a4bd0484014f', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'2004')
INSERT [dbo].[ZipCodes] ([ZipCodeId], [CityId], [ZipCode]) VALUES (N'c7c17e8e-6da5-43f0-bb6c-c117c1bc08ba', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'02008')
INSERT [dbo].[ZipCodes] ([ZipCodeId], [CityId], [ZipCode]) VALUES (N'b9a38fe8-512a-4734-bcea-f090ac6de5e3', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'02009')
INSERT [dbo].[ZipCodes] ([ZipCodeId], [CityId], [ZipCode]) VALUES (N'c443bebb-d927-4264-a902-f62186f779a4', N'f07714c4-187a-4382-8e5b-47c33f0917b2', N'02007')
ALTER TABLE [dbo].[Companies] ADD  DEFAULT ((0)) FOR [Popularity]
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
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD FOREIGN KEY([ParentCompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_To_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_To_Addresses]
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
ALTER TABLE [dbo].[SocialNets]  WITH CHECK ADD FOREIGN KEY([SocialNetNameId])
REFERENCES [dbo].[SocialNetNames] ([SocialNetNameId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UsersCompanies]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ZipCodes]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
/****** Object:  StoredProcedure [dbo].[CreareAllSocialNets]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreareAllSocialNets]
(
	@CompanyId uniqueidentifier
	, @SocialNetsList SocialNetList readonly
)
as
begin
	declare @NewGuid uniqueidentifier = NEWID()
	declare @DateCreatedOn Datetime = GETDATE()
	
	INSERT INTO dbo.SocialNets
		SELECT @NewGuid, @DateCreatedOn, @CompanyId, SocialNetURL, sn.SocialNetNameId FROM @SocialNetsList as sn
			join dbo.SocialNetNames as snn on sn.SocialNetNameId = snn.SocialNetNameId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateAddress]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateAddress]
(
	@ZipCodeNumber nvarchar(15) --ZipCodeNumber
	, @CityName nvarchar(150)			-- 
	, @StreetName nvarchar(150)		-- 
	, @HouseNumber nvarchar(12)		-- 
	, @BlockNumber nvarchar(12)		-- можно пустое
	, @ApartmentNumber nvarchar(12)	-- можно пустое
	, @Latitude decimal(22, 18)		-- можно пустое
	, @Longitude decimal(22, 18)	-- можно пустое

	, @resultStatus int output
	, @resultId uniqueidentifier output
)
as
begin
	--select @ZipCodeNumber as ZipCodeNumber, @CityName as CityName, 
	--	@StreetName as StreetName, @HouseNumber as HouseNumber, @BlockNumber as BlockNumber, 
	--	@ApartmentNumber as ApartmentNumber, @Latitude as Latitude, @Longitude as Longitude -- test print
	

	if( @CityName is null or @CityName = '' or @ZipCodeNumber is null or @ZipCodeNumber = '' or 
		@StreetName is null or @StreetName = '' or @HouseNumber is null or @HouseNumber = '' )
		begin
			set @resultStatus = -1
		end
	else
		begin
			declare @countRows int = 0;
			set @countRows = (
				select COUNT(ad.AddressId) from dbo.Addresses as ad 
					join Cities as ct on ad.CityId = ct.CityId 
					join Streets as st on ad.StreetId = st.StreetId 
				where ct.CityName = @CityName and st.StreetName = @StreetName 
					and ad.House = @HouseNumber and ad.Apartment = @ApartmentNumber
			)

			if( @countRows != 0 )
				begin
					set @resultId = (
						select top 1 ad.AddressId from dbo.Addresses as ad 
							join Cities as ct on ad.CityId = ct.CityId 
							join Streets as st on ad.StreetId = st.StreetId 
						where ct.CityName = @CityName and st.StreetName = @StreetName 
							and ad.House = @HouseNumber and ad.Apartment = @ApartmentNumber
					)
					set @resultStatus = 0
				end
			else
				begin
					declare @Result_ZipCodeId uniqueidentifier;

					-- город
					declare @Result_CityId uniqueidentifier;
					declare @Result_CityIdStatus int = 0;
					exec dbo.sp_CreateCity @CityName, @Result_CityIdStatus output, @Result_CityId output
					-- delete from dbo.Cities - очистить таблицу


					 -- почтовый индекс - Zip Code
					if( @Result_CityIdStatus >= 0 and @Result_CityId is not null ) -- уже есть в базе или было добавлено, то есть в @CityId точно есть id записи
						begin
							declare @Result_ZipCodeStatus int = 0;
							exec dbo.sp_CreateZipCode @ZipCodeNumber, @Result_CityId, @Result_ZipCodeStatus output, @Result_ZipCodeId output
							-- delete from dbo.ZipCodes -- очистить таблицу
							
							--select @Result_ZipCodeStatus as Result_ZipCodeStatus, @Result_ZipCodeId as Result_ZipCodeId
						end


					-- улица
					declare @Result_StreetId uniqueidentifier;
					declare @Result_StreetIdStatus int = 0;
					exec dbo.sp_CreateStreet @StreetName, @Result_StreetIdStatus output, @Result_StreetId output
					-- delete from dbo.Cities - очистить таблицу
					
					-- создать адрес
					declare @InsertedIdResults table (ID uniqueidentifier)
					declare @NewGuid uniqueidentifier = NEWID();
					insert into dbo.Addresses (AddressId, CityId, ZipCodeId, StreetId, House, [Block], Apartment, Latitude, Longitude) 
						output Inserted.AddressId into @InsertedIdResults 
						values (@NewGuid, @Result_CityId, @Result_ZipCodeId, @Result_StreetId, @HouseNumber, @BlockNumber, @ApartmentNumber, @Latitude, @Longitude)

					set @resultId = (select top 1 ID from @InsertedIdResults)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateAllEmails]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateAllEmails]
(
	@CompanyId uniqueidentifier
	, @EmailNamesList EmailList readonly
)
as begin
	declare @NewGuid uniqueidentifier = NEWID()
	declare @DateCreatedOn Datetime = GETDATE()
	
	INSERT INTO dbo.Emails
		SELECT @NewGuid, @DateCreatedOn, @CompanyId, Email FROM @EmailNamesList;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateAllPhones]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateAllPhones]
(
	@CompanyId uniqueidentifier
	, @PhonesList PhoneList readonly
)
as begin
	declare @NewGuid uniqueidentifier = NEWID()
	declare @DateCreatedOn Datetime = GETDATE()
	
	INSERT INTO dbo.Phones
		SELECT @NewGuid, @DateCreatedOn, @CompanyId, Phone FROM @PhonesList;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBindCompanyCategory]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateBindCompanyCategory]
(
	@CompanyId uniqueidentifier
	, @CategoryId int
	, @resultStatus int output
)
as
begin
	if( @CompanyId is null or @CategoryId is null )
		begin
			set @resultStatus = -1
		end
	else
		begin
			-- есть ли связь между компанией и категорией
			if( ( select COUNT(1) from dbo.CompaniesCategories as cc 
					left join dbo.Categories as c on cc.CategoryId = c.CategoryId
					where cc.CompanyId = @CompanyId and c.CategoryId = @CategoryId ) != 0 
				)
				begin
					set @resultStatus = 0
				end
			else
				begin
					declare @NewGuid uniqueidentifier = NEWID();
					insert into dbo.CompaniesCategories(CompanyCategoryId, CompanyId, CategoryId)
						values (@NewGuid, @CompanyId, @CategoryId)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBindCompanySubCategory]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateBindCompanySubCategory]
(
	@CompanyId uniqueidentifier
	, @SubCategoryId int
	, @resultStatus int output
)
as
begin
	if( @CompanyId is null or @SubCategoryId is null )
		begin
			set @resultStatus = -1
		end
	else
		begin
			-- есть ли связь между компанией и категорией
			if( ( select COUNT(1) from dbo.CompaniesSubcategories as csc 
					left join dbo.Subcategories as sc on csc.SubcategoryId = sc.SubcategoryId
					where csc.CompanyId = @CompanyId and sc.SubcategoryId = @SubCategoryId ) != 0 
				)
				begin
					set @resultStatus = 0
				end
			else
				begin
					declare @NewGuid uniqueidentifier = NEWID();
					insert into dbo.CompaniesSubcategories(CompanySubcategoryId, CompanyId, SubcategoryId)
						values (@NewGuid, @CompanyId, @SubCategoryId)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCategory]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateCategory]
(
	@Name nvarchar(256)
	, @resultStatus int output
	, @resultId int output
)
as
begin
	if( @Name is null or @Name = '' )
		begin
			set @resultStatus = -1
		end
	else
		begin
			if( (select COUNT(c.CategoryId) from dbo.Categories as c where c.CategoryName = @Name) != 0 )
				begin
					set @resultId = (select top 1 c.CategoryId from dbo.Categories as c where c.CategoryName = @Name)
					set @resultStatus = 0
				end
			else
				begin
					declare @InsertedIdResults table (ID int)
					insert into dbo.Categories(CategoryName) 
						output Inserted.CategoryId into @InsertedIdResults 
						values (@Name)
					set @resultId = (select top 1 ID from @InsertedIdResults)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCity]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateCity]
(
	@Name nvarchar(150)
	, @resultStatus int output
	, @resultId uniqueidentifier output
)
as
begin
	if( @Name is null or @Name = '' )
		begin
			set @resultStatus = -1
			return
		end
	else
		begin
			if( (select COUNT(ct.CityId) from dbo.Cities as ct where ct.CityName = @Name) != 0 )
				begin
					set @resultId = (select top 1 ct.CityId from dbo.Cities as ct where ct.CityName = @Name)
					set @resultStatus = 0
					return
				end
			else
				begin
					declare @InsertedIdResults table (ID uniqueidentifier)
					declare @NewGuid uniqueidentifier = NEWID();
					insert into dbo.Cities(CityId, CityName) 
						output Inserted.CityId into @InsertedIdResults 
						values (@NewGuid, @Name)
					set @resultId = (select top 1 ID from @InsertedIdResults)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCompany]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateCompany]
(
	@CompanyName nvarchar(256)	
	, @DirectorName nvarchar(256)	-- 
	, @DescriptionShort nvarchar(200)
	, @DescriptionFull nvarchar(2000)
	, @WebSite nvarchar(256)
	, @resultStatus int output
	, @resultId uniqueidentifier output
)
as
begin
	if( @CompanyName is null or @CompanyName = '' )
		begin
			set @resultStatus = -1
		end
	else
		begin
			if( (select COUNT(com.CompanyId) from dbo.Companies as com where com.CompanyName = @CompanyName) != 0 )
				begin
					set @resultId = (select top 1 com.CompanyId from dbo.Companies as com where com.CompanyName = @CompanyName)
					set @resultStatus = 0
				end
			else
				begin
					declare @InsertedIdResults table (ID uniqueidentifier)
					declare @NewGuid uniqueidentifier = NEWID();
					insert into dbo.Companies(CompanyId, CompanyName, Director, DescriptionShort, DescriptionFull, WebSite, CreatedOn) 
						output Inserted.CompanyId into @InsertedIdResults 
						values (@NewGuid, @CompanyName, @DirectorName, @DescriptionShort, @DescriptionFull, @WebSite, GETDATE())
					set @resultId = (select top 1 ID from @InsertedIdResults)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCompanyFull]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateCompanyFull]
(
	@CompanyName nvarchar(256)					-- 
	, @DirectorName nvarchar(256)				-- 

	, @ZipCodeNumber nvarchar(15)				-- 
	, @CityName nvarchar(150)					-- 
	, @StreetName nvarchar(150)					-- 
	, @HouseNumber nvarchar(12)					-- 
	, @BlockNumber nvarchar(12)					-- 
	, @ApartmentNumber nvarchar(12)				-- 
	, @Latitude decimal(22, 18)					-- 
	, @Longitude decimal(22, 18)				-- 

	, @CategoryName nvarchar(256)				-- 
	, @SubcategoryName nvarchar(256)			-- 

	, @DescriptionShort nvarchar(200)			-- 
	, @DescriptionFull nvarchar(2000)			-- 
	, @WebSite nvarchar(256)					-- 

	, @PhoneNumbersList PhoneList readonly		-- 
	, @EmailNamesList EmailList readonly		-- 
	, @SocialNetsList SocialNetList readonly	-- 

	--, @resultStatus int output
	--, @resultId uniqueidentifier output
)
as
begin
	-- компания
	declare @Result_CompanyIdStatus int = 0;
	declare @Result_CompanyId uniqueidentifier;
	exec dbo.sp_CreateCompany @CompanyName, @DirectorName, @DescriptionShort, @DescriptionFull, @WebSite, @Result_CompanyIdStatus output, @Result_CompanyId output
	-- delete from dbo.Cities - очистить таблицу
	

	if( @Result_CompanyIdStatus >= 0 and @Result_CompanyId is not null ) -- запись компании успешно выполнена
	begin
		-- категория
		declare @Result_CategoryStatus int = 0;
		declare @Result_CategoryId int = 0;
		exec dbo.sp_CreateCategory @CategoryName, @Result_CategoryStatus output, @Result_CategoryId output
		-- delete from dbo.Categories - очистить таблицу
		-- dbcc checkident('dbo.Categories', RESEED, 0) -- сброс интового автоинкремента у таблицы
		
		if( @Result_CategoryStatus >= 0 and @Result_CategoryId is not null )
		begin
			-- связь компания-категория
			declare @Result_CompanyCategoryStatus int = 0;
			exec sp_CreateBindCompanyCategory @Result_CompanyId, @Result_CategoryId, @Result_CompanyCategoryStatus output
		end


		-- под-категория
		declare @Result_SubCategoryStatus int = 0;
		declare @Result_SubCategoryId int = 0;
		exec dbo.sp_CreateSubCategory @SubCategoryName, @Result_SubCategoryStatus output, @Result_SubCategoryId output
		-- delete from dbo.Subcategories - очистить таблицу
		-- dbcc checkident('dbo.Categories', RESEED, 0) -- сброс интового автоинкремента у таблицы
		
		if( @Result_SubCategoryStatus >= 0 and @Result_SubCategoryId is not null )
		begin
			-- связь компания-категория
			declare @Result_CompanySubCategoryStatus int = 0;
			exec sp_CreateBindCompanySubCategory @Result_CompanyId, @Result_SubCategoryId, @Result_CompanySubCategoryStatus output
		end

		

		-- адрес
		declare @Result_AddresseStatus int = 0;
		declare @Result_AddresseId uniqueidentifier;
		exec dbo.sp_CreateAddress @ZipCodeNumber, @CityName, @StreetName, @HouseNumber, @BlockNumber, @ApartmentNumber, @Latitude, @Longitude, @Result_AddresseStatus output, @Result_AddresseId output
		
		--select @Result_CompanyIdStatus,  @Result_CompanyId, @Result_AddresseStatus, @Result_AddresseId -- test print



		if( @Result_CompanyIdStatus >= 0 and @Result_CompanyId is not null and @Result_AddresseStatus >= 0 and @Result_AddresseId is not null )
		begin
			update dbo.Companies set AddressId = @Result_AddresseId where CompanyId = @Result_CompanyId
		end

		

		-- принимаем список телефонов
		exec dbo.sp_CreateAllPhones @Result_CompanyId, @PhoneNumbersList
		
		-- принимаем список почт
		exec dbo.sp_CreateAllEmails @Result_CompanyId, @EmailNamesList

		
		-- принимаем список ссылок соц-сетей
		exec dbo.CreareAllSocialNets @Result_CompanyId, @SocialNetsList
		

	end


	--select 1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateStreet]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateStreet]
(
	@Name nvarchar(150)
	, @resultStatus int output
	, @resultId uniqueidentifier output
)
as
begin
	if( @Name is null or @Name = '' )
		begin
			set @resultStatus = -1
		end
	else
		begin
			if( (select COUNT(st.StreetId) from dbo.Streets as st where st.StreetName = @Name) != 0 )
				begin
					set @resultId = (select top 1 st.StreetId from dbo.Streets as st where st.StreetName = @Name)
					set @resultStatus = 0
				end
			else
				begin
					declare @InsertedIdResults table (ID uniqueidentifier)
					declare @NewGuid uniqueidentifier = NEWID();
					insert into dbo.Streets(StreetId, StreetName) 
						output Inserted.StreetId into @InsertedIdResults 
						values (@NewGuid, @Name)
					set @resultId = (select top 1 ID from @InsertedIdResults)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateSubCategory]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateSubCategory]
(
	@Name nvarchar(256)
	, @resultStatus int output
	, @resultId int output
)
as
begin
	if( @Name is null or @Name = '' )
		begin
			set @resultStatus = -1
		end
	else
		begin
			if( (select COUNT(sc.SubcategoryId) from dbo.Subcategories as sc where sc.SubcategoryName = @Name) != 0 )
				begin
					set @resultId = (select top 1 sc.SubcategoryId from dbo.Subcategories as sc where sc.SubcategoryName = @Name)
					set @resultStatus = 0
				end
			else
				begin
					declare @InsertedIdResults table (ID int)
					insert into dbo.Subcategories(SubcategoryName) 
						output Inserted.SubcategoryId 
						into @InsertedIdResults values (@Name)
					set @resultId = (select top 1 ID from @InsertedIdResults)
					set @resultStatus = 1
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateZipCode]    Script Date: 08.11.2020 10:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreateZipCode]
(
	@Number nvarchar(15) -- ZipCodeNumber
	, @CityId uniqueidentifier
	, @resultStatus int output
	, @resultId uniqueidentifier output
)
as
begin
	--select 
	
	if( @Number is null or @Number = 0 )
		begin
			set @resultStatus = -1
		end
	else
		begin
			if( (select COUNT(zc.ZipCodeId) from dbo.ZipCodes as zc where zc.ZipCode = @Number and zc.CityId = @CityId) != 0 )
				begin
					set @resultId = (select top 1 zc.ZipCodeId from dbo.ZipCodes as zc where zc.ZipCode = @Number and zc.CityId = @CityId)
					set @resultStatus = 0
				end
			else
				begin
					begin try
						declare @InsertedIdResults table (ID uniqueidentifier)
						declare @NewGuid uniqueidentifier = NEWID();
						insert into dbo.ZipCodes(ZipCodeId, ZipCode, CityId) 
							output Inserted.ZipCodeId into @InsertedIdResults 
							values (@NewGuid, @Number, @CityId)
						set @resultId = (select top 1 zc.ID from @InsertedIdResults as zc)
						set @resultStatus = 1
					
					end try
					begin catch
						IF @@TRANCOUNT > 0
						ROLLBACK TRANSACTION;
	
						DECLARE @ErrorNumber INT = ERROR_NUMBER();
						DECLARE @ErrorLine INT = ERROR_LINE();
						DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
						DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
						DECLARE @ErrorState INT = ERROR_STATE();
	
						PRINT 'Actual error number: ' + CAST(@ErrorNumber AS nvarchar(10));
						PRINT 'Actual line number: ' + CAST(@ErrorLine AS nvarchar(10));
	
						RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
					end catch
				end
		end
end
GO
