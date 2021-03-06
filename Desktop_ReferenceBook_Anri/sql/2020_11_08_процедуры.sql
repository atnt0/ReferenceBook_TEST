USE [DB_A69E5E_refbook]
GO
/****** Object:  UserDefinedTableType [dbo].[EmailList]    Script Date: 09.11.2020 1:57:07 ******/
CREATE TYPE [dbo].[EmailList] AS TABLE(
	[Email] [nvarchar](256) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PhoneList]    Script Date: 09.11.2020 1:57:08 ******/
CREATE TYPE [dbo].[PhoneList] AS TABLE(
	[Phone] [nvarchar](13) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SocialNetList]    Script Date: 09.11.2020 1:57:08 ******/
CREATE TYPE [dbo].[SocialNetList] AS TABLE(
	[SocialNetNameId] [int] NULL,
	[SocialNetURL] [nvarchar](2000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[t_List_Text_256]    Script Date: 09.11.2020 1:57:08 ******/
CREATE TYPE [dbo].[t_List_Text_256] AS TABLE(
	[Content] [nvarchar](256) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_NewGuid]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  UserDefinedFunction [dbo].[ufn_CreateEmail]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  View [dbo].[GetNEWID]    Script Date: 09.11.2020 1:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetNEWID] AS
	SELECT NEWID() ID
GO
/****** Object:  StoredProcedure [dbo].[sp_CreareAllSocialNets]    Script Date: 09.11.2020 1:57:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_CreareAllSocialNets]
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
/****** Object:  StoredProcedure [dbo].[sp_CreateAddress]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateAllEmails]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateAllPhones]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateBindCompanyCategory]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateBindCompanySubCategory]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCategory]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCity]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCompany]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCompanyFull]    Script Date: 09.11.2020 1:57:08 ******/
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
		exec dbo.sp_CreareAllSocialNets @Result_CompanyId, @SocialNetsList
		

	end


	--select 1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateStreet]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateSubCategory]    Script Date: 09.11.2020 1:57:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateZipCode]    Script Date: 09.11.2020 1:57:08 ******/
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
