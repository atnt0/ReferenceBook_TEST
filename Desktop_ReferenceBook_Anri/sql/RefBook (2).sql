IF OBJECT_ID('CompaniesCategories','U') IS NOT NULL DROP TABLE CompaniesCategories;
IF OBJECT_ID('CompaniesSubcategories','U') IS NOT NULL DROP TABLE CompaniesSubcategories;
IF OBJECT_ID('Logos','U') IS NOT NULL DROP TABLE Logos;
GO
IF OBJECT_ID('Photos','U') IS NOT NULL DROP TABLE Photos;
IF OBJECT_ID('Emails','U') IS NOT NULL DROP TABLE Emails;
IF OBJECT_ID('Phones','U') IS NOT NULL DROP TABLE Phones;
IF OBJECT_ID('SocialNets','U') IS NOT NULL DROP TABLE SocialNets;
IF OBJECT_ID('UsersCompanies','U') IS NOT NULL DROP TABLE UsersCompanies;
GO
IF OBJECT_ID('Companies','U') IS NOT NULL DROP TABLE Companies;
GO
IF OBJECT_ID('Addresses','U') IS NOT NULL DROP TABLE Addresses;
GO
IF OBJECT_ID('ZipCodes','U') IS NOT NULL DROP TABLE ZipCodes;
GO
IF OBJECT_ID('SocialNetNames','U') IS NOT NULL DROP TABLE SocialNetNames;
IF OBJECT_ID('Streets','U') IS NOT NULL DROP TABLE Streets;
IF OBJECT_ID('Cities','U') IS NOT NULL DROP TABLE Cities;
IF OBJECT_ID('Categories','U') IS NOT NULL DROP TABLE Categories;
IF OBJECT_ID('Subcategories','U') IS NOT NULL DROP TABLE Subcategories;
GO
CREATE TABLE Categories(
	CategoryId INT IDENTITY PRIMARY KEY
	,CategoryName NVARCHAR(256) NOT NULL
);
CREATE TABLE Subcategories(
	SubcategoryId INT IDENTITY PRIMARY KEY
	,SubcategoryName NVARCHAR(256) NOT NULL
);
CREATE TABLE Cities(
	CityId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY 
	,CityName NVARCHAR(150) NOT NULL
);
CREATE TABLE Streets(
	StreetId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY 
	,StreetName NVARCHAR(150) NOT NULL
);
CREATE TABLE SocialNetNames(
	SocialNetNameId INT IDENTITY PRIMARY KEY
	,SocialNetName NVARCHAR(256)
);
GO
CREATE TABLE ZipCodes(
	ZipCodeId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY 
	,CityId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Cities(CityId)
		ON DELETE NO ACTION
	,ZipCode NVARCHAR(15) NOT NULL
);
GO
CREATE TABLE Addresses(
	AddressId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY
	,ZipCodeId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES ZipCodes(ZipCodeId)
		ON DELETE NO ACTION
	,CityId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Cities(CityId)
		ON DELETE SET NULL
	,StreetId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Streets(StreetId)
		ON DELETE SET NULL
	,House NVARCHAR(12) NOT NULL
	,[Block] NVARCHAR(12) NULL
	,Apartment NVARCHAR(12) NULL
	,Latitude DECIMAL(22,18) NULL
	,Longitude DECIMAL(22,18) NULL
);
GO
CREATE TABLE Companies(
	CompanyId UNIQUEIDENTIFIER PRIMARY KEY
	,CreatedOn DATETIME
	,CompanyName NVARCHAR(256) NOT NULL
	,ParentCompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE NO ACTION
	,Director NVARCHAR(256) NOT NULL
	,DescriptionShort NVARCHAR(200) NULL
	,DescriptionFull NVARCHAR(2000) NULL
	,WebSite NVARCHAR(256) NULL
	,AddressId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Addresses(AddressId)
		ON DELETE SET NULL
);
GO
CREATE TABLE CompaniesCategories(
	CompanyCategoryId UNIQUEIDENTIFIER PRIMARY KEY
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
	,CategoryId INT NULL
		FOREIGN KEY REFERENCES Categories(CategoryId)
		ON DELETE SET NULL
);
CREATE TABLE CompaniesSubcategories(
	CompanySubcategoryId UNIQUEIDENTIFIER PRIMARY KEY
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
	,SubcategoryId INT NULL
		FOREIGN KEY REFERENCES Subcategories(SubcategoryId)
		ON DELETE SET NULL
);
CREATE TABLE Photos(
	PhotoId UNIQUEIDENTIFIER PRIMARY KEY
	,CreatedOn DATETIME
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
	,[FileName] NVARCHAR(100) NOT NULL
);
CREATE TABLE Logos(
	PhotoId UNIQUEIDENTIFIER PRIMARY KEY
		FOREIGN KEY REFERENCES Photos(PhotoId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
CREATE TABLE Emails(
	EmailId UNIQUEIDENTIFIER PRIMARY KEY
	,CreatedOn DATETIME
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
	,Email NVARCHAR(256) NOT NULL
);
CREATE TABLE Phones(
	PhoneId UNIQUEIDENTIFIER PRIMARY KEY
	,CreatedOn DATETIME
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
	,PhoneNumber NVARCHAR(13) NOT NULL
);
CREATE TABLE SocialNets(
	SocialNetId UNIQUEIDENTIFIER PRIMARY KEY
	,CreatedOn DATETIME
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
	,SocialNetURL NVARCHAR(500)
	,SocialNetNameId INT NULL
		FOREIGN KEY REFERENCES SocialNetNames(SocialNetNameId)
		ON DELETE SET NULL
);
CREATE TABLE UsersCompanies(
	UserCompanyId UNIQUEIDENTIFIER PRIMARY KEY
	,UserId UNIQUEIDENTIFIER NULL
	,CompanyId UNIQUEIDENTIFIER NULL
		FOREIGN KEY REFERENCES Companies(CompanyId)
		ON DELETE SET NULL
);
GO















--DECLARE @guid UNIQUEIDENTIFIER = NEWID();
--INSERT INTO Categories(CategoryName) VALUES (N'����������');
--INSERT INTO Subcategories(SubcategoryName) VALUES (N'��������'),(N'������ ������������');
--DECLARE @guid UNIQUEIDENTIFIER = NEWID();
--SELECT @guid;--1AB81AD2-193B-46B4-A378-6137A432296E
--INSERT INTO Companies(CompanyId,CompanyName,DescriptionShort,DescriptionFull,ParentCompanyId,WebSite) VALUES (@guid,N'ShopPM',N'�������� ������� ��������� ����������',N'�������� �������� �� ���������� XEROX. ������� ���������� ������� XEROX � �������.',NULL,N'shop-pm.com.ua')
--INSERT INTO Phones(PhonesId,CompanyId,PhoneNumber) VALUES 
--	('740C10C5-07D4-4C7B-BDB9-66F4CDCA2EA9','1AB81AD2-193B-46B4-A378-6137A432296E','+380980267963')
--	,('15A6D618-6441-4116-BCFF-82815D3BEE6A','1AB81AD2-193B-46B4-A378-6137A432296E','+380980267963');
--INSERT INTO Emails(EmailsId,CompanyId,Email) VALUES 
--	('144F4BD7-A045-4478-B697-01320F00BA24','1AB81AD2-193B-46B4-A378-6137A432296E','admin@shop-pm.com.ua')
--	,('975A1274-A536-43CA-BDD2-BA3AA4197626','1AB81AD2-193B-46B4-A378-6137A432296E','spm.xerox@gmail.com');
--INSERT INTO CompanyCategories(CompanyCategories,CompanyId,CategoryId) VALUES 
--	('74A00E84-E607-4730-87DD-9777813455DC','1AB81AD2-193B-46B4-A378-6137A432296E',1);
--INSERT INTO CompanySubcategories(CompanySubcategories,CompanyId,SubcategoryId) VALUES 
--	('9080C6F2-DADF-4726-BE99-CD51A0981340','1AB81AD2-193B-46B4-A378-6137A432296E',1)
--	,('B08A9177-E309-4DAF-A198-E8A839DE6A24','1AB81AD2-193B-46B4-A378-6137A432296E',2);
