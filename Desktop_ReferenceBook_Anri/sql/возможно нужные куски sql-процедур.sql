

----- список интов
--DROP TYPE IF EXISTS dbo.IDListINT;
--create type dbo.IDListINT as table ( Id int );
--go


------- список гуидов
--DROP TYPE IF EXISTS dbo.IDListGUID;
--create type dbo.IDListGUID as table ( Id uniqueidentifier );
--go


----- список компаний для наполнения базы данных
--DROP TYPE IF EXISTS dbo.ListCompanies;
--create type dbo.ListCompanies as table ( 
--	CompanyName nvarchar(256)		-- +
--	, CategoryName nvarchar(256)	-- +
--	, SubcategoryName nvarchar(256)	-- +
--	, DirectorName nvarchar(256)	-- +
--	, ZipCodeNumber int			-- **** проблема
--	, CityName nvarchar(150)		-- +
--	, StreetName nvarchar(150)		-- +
--	, HouseNumber nvarchar(12)		-- 
--	, BlockNumber nvarchar(12)		-- 
--	, ApartmentNumber nvarchar(12)	-- 
--	, PhoneNumber nvarchar(13)		-- 
--	, EmailName nvarchar(256)		-- +
--);
--go



-- создание новой электройнной почты
--drop procedure if exists dbo.up_CreateEmail
--go
--create procedure dbo.up_CreateEmail
--(
--	@Name nvarchar(256)
--	, @CompanyId uniqueidentifier
--	, @resultStatus int output
--	, @resultId uniqueidentifier output
--)
--as
--begin
--	if( @Name is null or @Name = '' )
--		begin
--			set @resultStatus = -1
--			return
--		end
--	else
--		begin
--			declare @countRows int = 0;
--			(select @countRows = COUNT(em.EmailId) from dbo.Emails as em where em.Email = @Name)

--			if( @countRows != 0 )
--				begin
--					set @resultId = (select top 1 em.EmailId from dbo.Emails as em where em.Email = @Name)
--					set @resultStatus = 0
--					return
--				end
--			else
--				begin
--					declare @InsertedIdResults table (ID uniqueidentifier)
--					declare @NewGuid uniqueidentifier = NEWID();
--					insert into dbo.Emails(EmailId, CompanyId, Email, CreatedOn) 
--						output Inserted.EmailId into @InsertedIdResults 
--						values (@NewGuid, @CompanyId, @Name, GETDATE())
--					set @resultId = (select top 1 ID from @InsertedIdResults)
--					set @resultStatus = 1
--				end
--		end
--end
--go







--drop function if exists dbo.ufn_CreateEmail
--go
--cREATE FUNCTION dbo.ufn_CreateEmail (@Name nvarchar(256), @CompanyId uniqueidentifier)         
--RETURNS  uniqueidentifier
--as
--BEGIN 
	
--	RETURN NEWID(); 
--END 
--go

--drop function if exists dbo.ufn_CreateEmail
--go

--if OBJECT_ID('dbo.ufn_CreateEmail', 'FN') is not null
--	drop function dbo.ufn_CreateEmail
--go



-- создание новой почты
--create function dbo.ufn_CreateEmail
--(
--	@Name nvarchar(256)
--	, @CompanyId uniqueidentifier
--)
--returns uniqueidentifier
--as
--begin
--	declare @resultId uniqueidentifier;

--	declare @countRows int = 0;
--	(select @countRows = COUNT(em.EmailId) from dbo.Emails as em where em.Email = @Name)
	
--	--if( @countRows != 0 )
--	--	begin
--	--		set @resultId = (select top 1 em.EmailId from dbo.Emails as em where em.Email = @Name)
--	--		return @resultId
--	--	end
--	--else
--	--	begin
--			--set @resultId = '5fabd00a-365c-4385-86e6-26bac3345230';
--			--declare @CompanyId uniqueidentifier = null;
--			--declare @Name nvarchar(500) = N'kjhakjwrg@aergvaerg.com';
--			--declare @resultId uniqueidentifier;
--			--declare @InsertedIdResults table (ID uniqueidentifier);
--			--declare @NewGuid uniqueidentifier = NEWID();
--			--declare @DateNow Datetime = GETDATE()

--			--insert into dbo.Emails(EmailId, Email, CompanyId, CreatedOn) 
				
--			--	output Inserted.EmailId into @InsertedIdResults 
--			--	values (@NewGuid, @Name, @CompanyId, @DateNow)

--			--insert into dbo.Emails(EmailId)  --, CompanyId, Email, CreatedOn
--				--output Inserted.EmailId into @InsertedIdResults 
--				--values (@NewGuid) -- , @CompanyId, @Name, @dateTime

--			--set @resultId = (select top 1 ID from @InsertedIdResults)
--			--set @resultId = @NewGuid
--			--set @resultId = @NewGuid
--			--select @resultId
--	--		return @resultId
--	---	end
--	return '5fabd00a-365c-4385-86e6-26bac3345230';
--end
--go


-- создание нового номера телефона
--drop procedure if exists dbo.up_CreatePhone
--go
--create procedure dbo.up_CreatePhone
--(
--	@Name nvarchar(256)
--	, @CompanyId uniqueidentifier
--	, @resultStatus int output
--	, @resultId uniqueidentifier output
--)
--as
--begin
--	if( @Name is null or @Name = '' )
--		begin
--			set @resultStatus = -1
--			return
--		end
--	else
--		begin
--			--declare @countRows int = 0;
--			--(select @countRows = COUNT(ph.PhoneId) from dbo.Phones as ph where ph.PhoneNumber = @Name)

--			--if( @countRows != 0 )
--			--	begin
--			--		set @resultId = (select top 1 ph.PhoneId from dbo.Phones as ph where ph.PhoneNumber = @Name)
--			--		set @resultStatus = 0
--			--		return
--			--	end
--			--else
--				--begin
--					declare @InsertedIdResults table (ID uniqueidentifier)
--					declare @NewGuid uniqueidentifier = NEWID();
--					insert into dbo.Phones(PhoneId, CompanyId, PhoneNumber, CreatedOn) 
--						output Inserted.PhoneId into @InsertedIdResults 
--						values (@NewGuid, @CompanyId, @Name, GETDATE())
--					set @resultId = (select top 1 ID from @InsertedIdResults)
--					set @resultStatus = 1
--				--end
--		end
--end
--go



-- создание нового новой социальной сети
--drop procedure if exists dbo.up_CreateSocialNetName
--go
--create procedure dbo.up_CreateSocialNetName
--(
--	@Name nvarchar(2000) -- NOT URL !
--	, @resultStatus int output
--	, @resultId int output
--)
--as
--begin
--	if( @Name is null or @Name = '' )
--		begin
--			set @resultStatus = -1
--			return
--		end
--	else
--		begin
--			declare @countRows int = 0;
--			(select @countRows = COUNT(snw.SocialNetNameId) from dbo.SocialNetNames as snw where snw.SocialNetName = @Name)

--			if( @countRows != 0 )
--				begin
--					set @resultId = (select top 1 snw.SocialNetNameId from dbo.SocialNetNames as snw where snw.SocialNetName = @Name)
--					set @resultStatus = 0
--					return
--				end
--			else
--				begin
--					declare @InsertedIdResults table (ID int)
--					--declare @NewGuid uniqueidentifier = NEWID();
--					insert into dbo.SocialNetNames(SocialNetName) 
--						output Inserted.SocialNetNameId into @InsertedIdResults 
--						values (@Name)
--					set @resultId = (select top 1 ID from @InsertedIdResults)
--					set @resultStatus = 1
--				end
--		end
--end
--go





--N'Е-Консалтинг, ДП', 
--N'Виктор Иванович Козак', 
--N'Производители и поставщики оборудования для полиграфии', 
--N'Разработка програмного обеспечения.', 
--N'04119', 
--N'Киев', 
--N'ул. Дегтяревская', 
--N'21-Г',
--N'', 
--N'', 
--@PhoneList, 
--@EmailList, 
--@SocialNetList





--declare @infoData table (CategoryId int, Countsint nvarchar(256) );
----set @infoData = ( select top 2 * from dbo.Categories as c ) --  where c.CategoryName = @Name

--insert into @infoData
--	select top 1 c.CategoryId, c.CategoryName from dbo.Categories as c


--select * from @infoData



-- =====================================================================
----- печать компаний с полными данными
--drop procedure if exists dbo.up_PrintCompanies
--go
--create procedure dbo.up_PrintCompanies
--as
--begin
--	--select com.CompanyId, com.CompanyName, com.Director, com.DescriptionShort, com.DescriptionFull, com.WebSite
--	select 
--		com.CompanyId, com.CompanyName, com.Director,
--		ph.PhoneNumber, 
--		em.Email, 
--		com.DescriptionShort, com.DescriptionFull, com.WebSite, *
--	from dbo.Companies as com
--		--left join dbo.Addresses as ad on com.AddressId = ad.AddressId
--		left join dbo.Phones as ph on com.CompanyId = ph.CompanyId
--		left join dbo.Emails as em on com.CompanyId = em.CompanyId
--	--(select @countRows = COUNT(ct.CityId) from dbo.Cities as ct where ct.CityName = @Name)
--end
--go


--exec up_PrintCompanies 
--go





		-- принимаем и перебираем списки
		--INSERT INTO dbo.Emails
		--   SELECT NEWID(),@createdOn,@compId,Email FROM @emails;
		--INSERT INTO dbo.Phones
		--	SELECT NEWID(),@createdOn,@compId,Phone FROM @phones;
		--INSERT INTO dbo.SocialNets
		--	SELECT NEWID(),@createdOn,@compId,SocialNetURL,SocialNetNameId
		--		FROM @socials;


	---- один номер телефона
	--if( @Result_CompanyIdStatus >= 0 and @Result_CompanyId is not null )
	--begin
	--	declare @Result_PhoneId uniqueidentifier;
	--	declare @Result_PhoneIdStatus int = 0;
	--	exec dbo.up_CreatePhone @Result_CompanyId, @PhoneNumbersList, @Result_EmailIdStatus output, @Result_PhoneId output
	----	select @Result_PhoneId as Result_PhoneId, @PhoneNumber as PhoneNumber
	--	-- delete from dbo.Cities - очистить таблицу
	--end











