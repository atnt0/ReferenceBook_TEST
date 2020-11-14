DECLARE @e EmailList,@p PhoneList,@s SocialNetList,@comapyId UNIQUEIDENTIFIER;
INSERT INTO @e VALUES ('email'),('email');
INSERT INTO @p VALUES ('+380...'),('+380...');
INSERT INTO @s VALUES (5,'url'),(1,'url');
EXEC sp_CreateCompany
		'compName'
		,'parentCompId'
		,catId
		,subcatId
		,'director'
		,'descShort'
		,'descFull'
		,'webSite'
		,'zipCodeId'
		,'cityId'
		,'streetId'
		,'house'
		,'block'
		,'apartment'
		,latitude
		,longitude
		,@e
		,@p
		,@s
		,'logoPhotoId'
		,@comapyId;

--CREATE TYPE EmailList AS TABLE(Email NVARCHAR(256));
--CREATE TYPE PhoneList AS TABLE(Phone NVARCHAR(13));
--CREATE TYPE SocialNetList AS TABLE(SocialNetNameId INT,SocialNetURL NVARCHAR(2000));

--IF OBJECT_ID('sp_CreateCompany','P') IS NOT NULL DROP PROCEDURE sp_CreateCompany
--GO
--CREATE PROCEDURE sp_CreateCompany
--		@compName NVARCHAR(256)
--		,@parentCompId UNIQUEIDENTIFIER
--		,@catId INT
--		,@subcatId INT
--		,@director NVARCHAR(256)
--		,@descShort NVARCHAR(200)
--		,@descFull NVARCHAR(2000)
--		,@webSite NVARCHAR(256)
--		,@zipCodeId UNIQUEIDENTIFIER
--		,@cityId UNIQUEIDENTIFIER
--		,@streetId UNIQUEIDENTIFIER
--		,@house NVARCHAR(12)
--		,@block NVARCHAR(12)
--		,@apartment NVARCHAR(12)
--		,@latitude DECIMAL(22,18)
--		,@longitude DECIMAL(22,18)
--		,@emails EmailList READONLY
--		,@phones PhoneList READONLY
--		,@socials SocialNetList READONLY
--		,@logoPhotoId UNIQUEIDENTIFIER
--		,@compId UNIQUEIDENTIFIER OUTPUT
--	AS BEGIN
--		SET @compId = NEWID();
--		DECLARE @createdOn DATETIME = GETDATE();
--		INSERT INTO Emails
--			SELECT NEWID(),@createdOn,@compId,Email
--				FROM @emails;
--		INSERT INTO Phones
--			SELECT NEWID(),@createdOn,@compId,Phone
--				FROM @phones;
--		INSERT INTO SocialNets
--			SELECT NEWID(),@createdOn,@compId,SocialNetURL,SocialNetNameId
--				FROM @socials;
--		DECLARE @addrId UNIQUEIDENTIFIER = NEWID();
--		IF(@logoPhotoId IS NOT NULL)
--			INSERT INTO Logos VALUES (@logoPhotoId);
--		INSERT INTO Addresses(AddressId,ZipCodeId,CityId,StreetId,House,[Block],Apartment,Latitude,Longitude) VALUES
--			(@addrId,@zipCodeId,@cityId,@streetId,@house,@block,@apartment,@latitude,@longitude);
--		INSERT INTO Companies(CompanyId,CompanyName,ParentCompanyId,Director,DescriptionShort,DescriptionFull,WebSite,AddressId) VALUES
--			(@compId,@compName,@parentCompId,@director,@descShort,@descFull,@webSite,@addrId);
--	END;
--GO

