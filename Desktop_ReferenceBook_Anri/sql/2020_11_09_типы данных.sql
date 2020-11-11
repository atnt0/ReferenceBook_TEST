/****** Object:  UserDefinedTableType [dbo].[EmailList]    Script Date: 09.11.2020 7:28:39 ******/
CREATE TYPE [dbo].[EmailList] AS TABLE(
	[Email] [nvarchar](256) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PhoneList]    Script Date: 09.11.2020 7:28:39 ******/
CREATE TYPE [dbo].[PhoneList] AS TABLE(
	[Phone] [nvarchar](13) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SocialNetList]    Script Date: 09.11.2020 7:28:39 ******/
CREATE TYPE [dbo].[SocialNetList] AS TABLE(
	[SocialNetNameId] [int] NULL,
	[SocialNetURL] [nvarchar](2000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[t_List_Text_256]    Script Date: 09.11.2020 7:28:39 ******/
CREATE TYPE [dbo].[t_List_Text_256] AS TABLE(
	[Content] [nvarchar](256) NULL
)
GO