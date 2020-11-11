

-- Название
-- Категория
-- ПодКатегории (список)
-- Телефоны (список)
-- Электронные Почты (список)
-- Логотип/фотография
-- Фотографии (список) офиса, филиала, с конференций, презентаций
-- Описание
-- Расписание/график для добавления информации о открытости филиала, если есть
-- Веб-сайт
-- Соц-сети (список)



-- заполним категории
--insert into Categories(CategoryId, CategoryName)
--	(1, "")







--IF OBJECT_ID('CompanyCategories','U') IS NOT NULL DROP TABLE CompanyCategories;
--IF OBJECT_ID('CompanySubcategories','U') IS NOT NULL DROP TABLE CompanySubcategories;
--IF OBJECT_ID('Photos','U') IS NOT NULL DROP TABLE Photos;
--IF OBJECT_ID('Emails','U') IS NOT NULL DROP TABLE Emails;
--IF OBJECT_ID('Phones','U') IS NOT NULL DROP TABLE Phones;
--IF OBJECT_ID('SocialNets','U') IS NOT NULL DROP TABLE SocialNets;
--IF OBJECT_ID('UserCompanies','U') IS NOT NULL DROP TABLE UserCompanies;
--GO
--IF OBJECT_ID('Companies','U') IS NOT NULL DROP TABLE Companies;
--GO
--IF OBJECT_ID('Categories','U') IS NOT NULL DROP TABLE Categories;
--IF OBJECT_ID('Subcategories','U') IS NOT NULL DROP TABLE Subcategories;
--GO
--CREATE TABLE Categories(
--	CategoryId INT IDENTITY PRIMARY KEY
--	,CategoryName NVARCHAR(256) NOT NULL
--);
--CREATE TABLE Subcategories(
--	SubcategoryId INT IDENTITY PRIMARY KEY
--	,SubcategoryName NVARCHAR(256) NOT NULL
--);
--GO
--CREATE TABLE Companies(
--	CompanyId UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyName NVARCHAR(256) NOT NULL
--	--,CategoryId INT NOT NULL
--	--	FOREIGN KEY REFERENCES Categories(CategoryId)
--	--,SubcategoryId INT
--	--	FOREIGN KEY REFERENCES Subcategories(SubcategoryId)
--	,ParentCompanyId UNIQUEIDENTIFIER NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,DescriptionShort NVARCHAR(200)
--	,DescriptionFull NVARCHAR(2000)
--	,WebSite NVARCHAR(256)
--);
--GO
--CREATE TABLE CompanyCategories(
--	CompanyCategories UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyId UNIQUEIDENTIFIER NOT NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,CategoryId INT NOT NULL
--		FOREIGN KEY REFERENCES Categories(CategoryId)
--);
--CREATE TABLE CompanySubcategories(
--	CompanySubcategories UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyId UNIQUEIDENTIFIER NOT NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,SubcategoryId INT NOT NULL
--		FOREIGN KEY REFERENCES Subcategories(SubcategoryId)
--);
--CREATE TABLE Photos(
--	PhotoId UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyId UNIQUEIDENTIFIER NOT NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,Photo NVARCHAR(100) NOT NULL
--);
--CREATE TABLE Emails(
--	EmailsId UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyId UNIQUEIDENTIFIER NOT NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,Email NVARCHAR(256) NOT NULL
--);
--CREATE TABLE Phones(
--	PhonesId UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyId UNIQUEIDENTIFIER NOT NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,PhoneNumber NVARCHAR(13) NOT NULL
--);
--CREATE TABLE SocialNets(
--	SocialNetId UNIQUEIDENTIFIER PRIMARY KEY
--	,CompanyId UNIQUEIDENTIFIER NOT NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--	,SocialNetName NVARCHAR(2000)
--);
--CREATE TABLE UserCompanies(
--	UserCompaniesId UNIQUEIDENTIFIER PRIMARY KEY
--	,UserId UNIQUEIDENTIFIER NOT NULL
--	,CompanyId UNIQUEIDENTIFIER NULL
--		FOREIGN KEY REFERENCES Companies(CompanyId)
--);
--GO
--DECLARE @guid UNIQUEIDENTIFIER = NEWID();
INSERT INTO Categories(CategoryName) VALUES (N'Полиграфия');
INSERT INTO Subcategories(SubcategoryName) VALUES (N'Запчасти'),(N'Ремонт оборудования');
DECLARE @guid UNIQUEIDENTIFIER = NEWID();
INSERT INTO Companies(CompanyId,CompanyName,DescriptionShort,DescriptionFull,ParentCompanyId,WebSite) VALUES 
	(@guid,N'ShopPM',N'Стоковый магазин расходных материалов',N'Витратні матеріали та запчастини XEROX. Цифрова друкарська техніка XEROX з пробігом.',NULL,N'shop-pm.com.ua')



